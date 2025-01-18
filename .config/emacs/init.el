;; This is my Emacs config.
;; It typically takes around 0.25 seconds to load,
;; which I achieved by abusing the early-init.el file.

;; I like knowing how long my Emacs config takes to load.
(defun efs/display-startup-time ()
  (message "Load time: %.3f seconds"
	(float-time
	  (time-subtract after-init-time before-init-time))))
(add-hook 'emacs-startup-hook #'efs/display-startup-time)

;; We use package.el, the built-in package manager in Emacs.
(require 'package)
(setq package-archives '(
	  ("elpa" . "https://elpa.gnu.org/packages/")
	  ("melpa" . "https://melpa.org/packages/")
	  ("org" . "https://orgmode.org/elpa/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Use-package is a wrapper for package.el which gives
;; us a clean way to install and configure packages.
;; Set some reasonable defaults.
(setq use-package-always-ensure t
	  package-check-signature nil)

;; Setting our font
(set-face-attribute 'default nil :font "Iosevka Term NF" :height 160)

;; Line number settings
(setq display-line-numbers-type 'relative)
(column-number-mode)
(global-display-line-numbers-mode nil)

;; Handle large files and backup files.
(setq
  make-backup-files nil
  auto-save-default nil
  create-lockfiles nil
  large-file-warning-threshold 200000000
  backup-directory-alist '((".*" . "~/.BACKUP"))
  read-process-output-max (* 1024 1024))
(global-auto-revert-mode t)
(global-so-long-mode 1)

;; Smooth scrolling
(setq
  redisplay-dont-pause nil
  scroll-step 1
  mouse-wheel-follow-mouse t
  scroll-preserve-screen-position t
  mouse-wheel-progressive-speed t)
(pixel-scroll-precision-mode t)

;; Other small settings
(setq-default
  indent-tabs-mode t
  tab-width 4
  c-basic-offset tab-width)
(setq
  sentence-end-double-space nil
  ring-bell-function 'ignore
  confirm-kill-processes nil)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; I chose the Flexoki colorscheme because its
;; very simple and doesn't hurt my eyes.
(use-package flexoki-themes
  :config
  (load-theme 'flexoki-themes-dark)
  :custom
  (flexoki-themes-use-bold-keywords t)
  (flexoki-themes-use-bold-builtins t)
  (flexoki-themes-use-italic-comments t))

;; I use simple-modeline because it has a
;; very minimal look, and is very extensible.
(use-package simple-modeline
  :hook (after-init . simple-modeline-mode)
  :custom
  (mode-line-compact t)
  (simple-modeline-segments '((
	  simple-modeline-segment-modified
	  simple-modeline-segment-buffer-name
	  simple-modeline-segment-evil
	  simple-modeline-segment-position
	  simple-modeline-segment-misc-info
	  simple-modeline-segment-process
	  simple-modeline-segment-vc)
	())))

;; By default, it doesn't have an evil-mode
;; segment, so we create our own.
(defun simple-modeline-segment-evil ()
  (let* ((segment-text (cond
		  ((eq evil-state 'visual) " Visual")
		  ((eq evil-state 'normal) " Normal")
		  ((eq evil-state 'insert) " Insert")))
		(segment-face 'simple-modeline-status-success))
	(propertize segment-text 'face segment-face)))

;; The evil package gives us most of the Vim keybindings
(use-package evil
  :demand
  :hook (evil-mode . rune/evil-hook)
  :init (evil-mode 1)
  :config
  (setq evil-echo-state nil)
  (evil-define-key '(normal visual) 'global "o" "^")
  (evil-define-key '(visual) 'global "t" ":comment-or-uncomment-region")
  (evil-define-key '(normal) 'global "t" "v:comment-or-uncomment-region"))

;; Vertico adds a vertical completion menu for the minibuffer
(use-package vertico
  :defer t
  :init (vertico-mode)
  :custom
  (vertico-cycle t))

;; Consult provides many functions which help
;; speed up writing code and file/buffer navigation
(use-package consult
  :custom
  (completion-in-region-function (lambda (&rest args)
	(apply (if vertico-mode
		#'consult-completion-in-region
		#'completion--in-region)
		   args)))
  (find-file-run-dired nil)
  :bind (("M-x" . execute-extended-command)
		 ("M-e" . find-file)
		 ("M-d" . consult-imenu-multi)
		 ("M-f" . consult-line)))

;; Marginalia provides descriptors for many of
;; the options displayed inside the minibuffer
;; (ie. descriptions for variables, commands).
(use-package marginalia
  :after vertico
  :init (marginalia-mode))

;; Oderless provides a fast completion search for Vertico
(use-package orderless
  :custom (completion-styles '(orderless basic)))

;; I use the lsp-mode package over the built-in Eglot.
;; (I might switch)
(use-package lsp-mode
  :defer t
  :commands (lsp lsp-deferred)
  :hook ((c++-mode . lsp-deferred)
		 (c-mode . lsp-deferred))
  :bind (("M-w" . completion-at-point)) ;; lsp completion
  :custom
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-enable-on-type-formatting nil)
  (lsp-idle-delay 0.750)
  (lsp-log-io nil)
  (lsp-modeline-diagnostics-scope :workspace)
  (lsp-modeline-code-actions-segments nil))

;; The tree-sitter package makes code highlighting a lot more readable.
(use-package tree-sitter
  :hook (lsp-mode . tree-sitter-hl-mode))
(use-package tree-sitter-langs :after tree-sitter)

;; Vterm is a very fast terminal
;; which I can just toggle when I need it.
(use-package vterm
  :defer t
  :hook (vterm-mode . (lambda()
						(display-line-numbers-mode 0)
						(setq-local mode-line-format nil)))
  :bind ("M-t" . vterm-toggle)
  :custom
  (vterm-kill-buffer-on-exit t))
(use-package vterm-toggle
  :after vterm
  :custom
  (vterm-toggle-fullscreen-p nil)
  :config
  (add-to-list 'display-buffer-alist
    '((lambda (buffer-or-name _)
        (let ((buffer (get-buffer buffer-or-name)))
                     (with-current-buffer buffer
                       (or (equal major-mode 'vterm-mode)
                           (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
               (display-buffer-reuse-window display-buffer-in-side-window)
               (side . bottom)
               (dedicated . t)
               (reusable-frames . visible)
               (window-height. 0.2))))


;; These are some custom ELisp files I made.
(load "~/git/Taro/taro.el" nil t)

;; In the /early-init.el/ file,
;; I raise the garbage collector's threshold
;; to 1 GB to speed up the initialization.
;; Now that Emacs has fully started up,
;; we have to lower it back down.
(setq gc-cons-threshold (* 100 1024 1024))
