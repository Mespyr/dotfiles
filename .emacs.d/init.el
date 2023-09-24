(add-hook 'emacs-startup-hook (lambda ()
  (message "Emacs loaded in %s with %d garbage collections."
    (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time))) gcs-done)))

;; *===============* PACKAGE SETUP *==============================*
(require 'package)
(setq package-archives '(
  ("melpa" . "https://melpa.org/packages/")
  ("org" . "https://orgmode.org/elpa/")
  ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(folding highlight-indent-guides window-end-visible lsp-icons tree-sitter-langs tree-sitter company-box company company-mode lsp-ui c++-mode counsel ivy-rich all-the-icons lsp-mode projectile evil doom-themes doom-modeline ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; *===============* END PACKAGE SETUP *==========================*


;; *===============* SETTINGS *===================================*
(setq inhibit-startup-message t)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq-default c-basic-offset tab-width)
(global-so-long-mode 1)
(setq backup-directory-alist '((".*" . "~/.BACKUP")))
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(setq redisplay-dont-pause t
  scroll-margin 8
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)
;; *===============* END SETTINGS *===============================*


;; *===============* THEME/UI *===================================*
(set-face-attribute 'default nil :font "Cartograph CF Nerd Font Mono" :height 105)
(column-number-mode)
(global-display-line-numbers-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 0)
(menu-bar-mode -1)

(use-package doom-themes
  :init (load-theme 'doom-tomorrow-night t))
(use-package all-the-icons)
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 45)
  (doom-modeline-bar-width 6)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-persp-name nil))

(use-package highlight-indent-guides
  :hook prog-mode
  :custom
  (highlight-indent-guides-method 'character)
  (highlight-indent-guides-character-face '▏))
(use-package folding)
;; *===============* END THEME/UI *===============================*


;; *===============* COMMANDS/NAVIGATION *========================*
(use-package counsel
  :bind (
    ("M-x" . counsel-M-x)
    ("M-e" . counsel-find-file)))

(use-package ivy
  :init (ivy-mode 1)
  :bind (
    :map ivy-minibuffer-map
      ("TAB" . ivy-alt-done)
      ("C-j" . ivy-next-line)
      ("C-k" . ivy-previous-line)
    :map ivy-switch-buffer-map
      ("C-k" . ivy-previous-line)
      ("C-l" . ivy-done)
      ("C-d" . ivy-switch-buffer-kill)
    :map ivy-reverse-i-search-map
      ("C-k" . ivy-previous-line)
      ("C-d" . ivy-reverse-i-search-kill)))

(use-package ivy-rich
  :after ivy
  :init (ivy-rich-mode t))

(use-package projectile
  :init (projectile-mode)
  :custom
  (projectile-completion-system 'ivy)
  (projectile-switch-project-action #'projectile-dired)
  (projectile-project-search-path '("~/git"))
  :bind (("M-d" . projectile-find-file)))

(use-package evil
  :demand
  :hook (evil-mode . rune/evil-hook)
  :init (evil-mode 1))
;; *===============* END COMMANDS/NAVIGATION *====================*


;; *===============* LANGUAGE SERVER *============================*
(use-package lsp-mode
  :commands (lsp lsp-deffered)
  :custom
  (lsp-keymap-prefix "M-w")
  (lsp-headerline-breadcrumb-enable t)
  (lsp-headerline-breadcrumb-segments
   '(project file symbols))
  (lsp-enable-on-type-formatting nil)
  :config
  (setq lsp-headerline-arrow " "))

(use-package lsp-ui
  :after lsp-mode)

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (
    :map company-active-map
      ("<tab>" . company-select-next)
      ("<backtab>" . company-select-previous)
	  ("<Enter>" . company-complete))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))
(use-package company-box
  :after company
  :hook (company-mode . company-box-mode))

(use-package tree-sitter
  :after lsp-mode)
(use-package tree-sitter-langs
  :after tree-sitter)

(defun dev-mode ()
  (lsp t)
  (tree-sitter-mode t)
  (tree-sitter-hl-mode t))

(add-hook 'c++-mode-hook 'dev-mode)
;; *===============* END LANGUAGE SERVER *========================*
