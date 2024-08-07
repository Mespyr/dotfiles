;; display startup time when Emacs finishes init-ing
(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
    (format "%.2f seconds"
      (float-time
      (time-subtract after-init-time before-init-time)))
        gcs-done))
(add-hook 'emacs-startup-hook #'efs/display-startup-time)

;; general settings
(setq inhibit-startup-echo-area-message "mespyr")
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq-default c-basic-offset tab-width)

;; set the font
(set-face-attribute 'default nil :font "Iosevka Term NF" :height 140)

;; handle large files and backup files
(global-auto-revert-mode t)
(global-so-long-mode 1)
(setq backup-directory-alist '((".*" . "~/.BACKUP")))
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(setq make-backup-files nil)
(setq large-file-warning-threshold 200000000)

;; line numbers
(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; colorscheme
(use-package flexoki-themes
  :config
  (load-theme 'flexoki-themes-dark t)
  :custom
  (flexoki-themes-use-bold-keywords t)
  (flexoki-themes-use-bold-builtins t)
  (flexoki-themes-use-italic-comments t))

;; custom modeline
(defun evil-segment ()
  (let* ((segment-text (cond
		  ((eq evil-state 'visual) " Visual")
		  ((eq evil-state 'normal) " Normal")
		  ((eq evil-state 'insert) " Insert")))
        (segment-face 'simple-modeline-status-success))
  (propertize segment-text 'face segment-face)))
(use-package simple-modeline
  :hook (after-init . simple-modeline-mode)
  :custom
  (mode-line-compact t)
  (simple-modeline-segments '((
	  simple-modeline-segment-modified
	  simple-modeline-segment-buffer-name
	  evil-segment
	  simple-modeline-segment-position
	  simple-modeline-segment-misc-info
	  simple-modeline-segment-process
	  simple-modeline-segment-vc)
	())))

;; vim-like movement keys
(use-package evil
  :demand
  :hook (evil-mode . rune/evil-hook)
  :init (evil-mode 1)
  :config
  (setq evil-echo-state nil)
  (evil-define-key '(normal visual) 'global "o" "^")
  (evil-define-key '(visual) 'global "t" ":comment-or-uncomment-region")
  (evil-define-key '(normal) 'global "t" "v:comment-or-uncomment-region"))

;; command prompt
(use-package counsel
  :bind (
    ("M-x" . counsel-M-x)
    ("M-e" . counsel-find-file)))

;; project navigation
(use-package projectile
  :defer t
  :init (projectile-mode)
  :custom
  (projectile-completion-system 'ivy)
  (projectile-switch-project-action #'projectile-dired)
  (projectile-project-search-path '("~/git"))
  :bind (("M-d" . projectile-find-file)))

;; rich menus
(use-package ivy
  :defer t
  :init (ivy-mode 1)
  :bind (
    :map ivy-minibuffer-map
      ("TAB" . ivy-alt-done)
      ("M-j" . ivy-next-line)
      ("M-k" . ivy-previous-line)))
(use-package ivy-rich
  :after ivy
  :init (ivy-rich-mode t))

;; lsp settings
(use-package lsp-mode
  :defer t
  :commands (lsp lsp-deffered)
  :config
  (setq lsp-keymap-prefix "M-w")
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-headerline-breadcrumb-segments
   '(project symbols))
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-headerline-arrow " "))

(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header nil))

;; autocomplete
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
  (company-idle-delay 0.0)
  (company-tooltip-offset-display 'lines)
  (company-tooltip-annotation-padding 10))
(use-package company-box
  :after company
  :hook (company-mode . company-box-mode))

;; code highlighting
(use-package tree-sitter
  :after lsp-mode)
(use-package tree-sitter-langs
  :after tree-sitter)

;; activate lsp and tree-sitter on certain files
(defun dev-mode ()
  (lsp t)
  (tree-sitter-mode t)
  (tree-sitter-hl-mode t))
(add-hook 'c++-mode-hook 'dev-mode)
(add-hook 'c-mode-hook 'dev-mode)

;; ligatures
(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode '(
    "|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
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

;; custom elisp files
(load "~/git/Taro/taro.el" nil t)

;; make emacs gc faster by lowering threshold to 2mb
(setq gc-cons-threshold (* 1 1000 1000))

;; hide some messages from appearing on init
(let ((inhibit-message t))
  (message "Listen to me, you!"))
