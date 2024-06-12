;;(add-hook 'emacs-startup-hook (lambda ()
;;  (message "Emacs loaded in %s with %d garbage collections."
;;    (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time))) gcs-done)))

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
;; *===============* END PACKAGE SETUP *==========================*


;; *===============* SETTINGS *===================================*
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message "mespyr")
(global-auto-revert-mode t)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq-default c-basic-offset tab-width)
(global-so-long-mode 1)
(setq backup-directory-alist '((".*" . "~/.BACKUP")))
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; scrolling
(setq redisplay-dont-pause t
	  scroll-margin 8
	  scroll-step 1
	  mouse-wheel-follow-mouse t
      scroll-preserve-screen-position nil
	  pixel-scroll-precision-large-scroll-height 50.0
	  mouse-wheel-scroll-amount '(1 ((shift) . 1))
	  mouse-wheel-progressive-speed t)
(pixel-scroll-precision-mode t)

;; disable certain warnings from displaying
(defun my-command-error-function (data context caller)
  (when (not (memq (car data) '(buffer-read-only
                                beginning-of-buffer
                                end-of-buffer)))
    (command-error-default-function data context caller)))
(setq command-error-function #'my-command-error-function)

(setq initial-scratch-message "\
;; Don't Complain!

")

;; *===============* END SETTINGS *===============================*


;; *===============* THEME/UI *===================================*
(set-face-attribute 'default nil :font "Iosevka Term NF" :height 130)
(column-number-mode)
(global-display-line-numbers-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 0)
(menu-bar-mode -1)
(global-visual-line-mode 1)

(use-package flexoki-themes
  :ensure t  ;; or :straight t if using straight.el
  :config
  (load-theme 'flexoki-themes-dark t)
  :custom
  (flexoki-themes-use-bold-keywords t)
  (flexoki-themes-use-bold-builtins t)
  (flexoki-themes-use-italic-comments t))

(use-package simple-modeline
  :hook (after-init . simple-modeline-mode)
  :custom
  (simple-modeline-segments
   '((simple-modeline-segment-modified
	  simple-modeline-segment-buffer-name
	  simple-modeline-segment-position)
	 (simple-modeline-segment-misc-info
	  simple-modeline-segment-process
	  simple-modeline-segment-major-mode
	  (lambda () " ")))))

(use-package highlight-indent-guides
  :hook prog-mode
  :custom
  (highlight-indent-guides-method 'character)
  (highlight-indent-guides-character-face '▏))
(use-package folding)
(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\\\" "://"))
  (global-ligature-mode 1))
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
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-headerline-breadcrumb-segments
   '(project symbols))
  (lsp-enable-on-type-formatting nil)
  :config
  (setq lsp-headerline-arrow " "))

(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header nil))

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
(add-hook 'c-mode-hook 'dev-mode)
;; *===============* END LANGUAGE SERVER *========================*

(load "~/git/Ochre/ochre.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("342f853c3d097d60a01a8e17559d2cc4e6ccd4c8e8c4d32cdfb5d53fdd50ca27" "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19" "571661a9d205cb32dfed5566019ad54f5bb3415d2d88f7ea1d00c7c794e70a36" "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" default))
 '(package-selected-packages
   '(ligature tree-sitter-langs projectile lsp-ui ivy-rich highlight-numbers highlight-indent-guides folding evil counsel company-box)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
