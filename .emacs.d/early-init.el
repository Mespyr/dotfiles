;; Set Garbage Collection threshold to 1GB during startup
(setq gc-cons-threshold 1073741824
      gc-cons-percentage 0.6)

;; Speed up startup time by inhibiting Emacs from resizing
;; the frame with fonts larger than the system default.
(setq frame-inhibit-implied-resize t
      frame-resize-pixelwise t)

;; Give the frame a color other than white
;; to not blind me when it first opens
(set-face-attribute
 'default nil
 :background "#100f0f"
 :foreground "#fffcf0")

;; set the modeline thickness
(custom-set-faces
 '(mode-line ((t(
    :background "#1C1B1A"
	:box (:line-width 5 :color "#1C1B1A")))))
;; set company colors
 '(company-tooltip ((t (
    :background "#1c1b1A"
    :foreground "#fffcf0"))))
 '(company-tooltip-selection ((t (
    :background "#6f6e69"
    :foreground "1c1b1A")))))

;; some other theme/ui settings to set before opening emacs
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 0)
(menu-bar-mode -1)
(global-visual-line-mode 1)
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq initial-scratch-message ";; Don't Complain!\n\n")
(advice-add #'x-apply-session-resources :override #'ignore)

;; smooth-ish scrolling settings
(setq redisplay-dont-pause t
	  scroll-margin 8
	  scroll-step 1
	  mouse-wheel-follow-mouse t
      scroll-preserve-screen-position nil
	  pixel-scroll-precision-large-scroll-height 10.0
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

;; Unset `file-name-handler-alist' too (temporarily). Every file opened and
;; loaded by Emacs will run through this list to check for a proper handler for
;; the file, but during startup, it won’t need any of them.
(defvar file-name-handler-alist-old file-name-handler-alist)
(setq file-name-handler-alist nil)
(add-hook 'emacs-startup-hook
  (lambda () (setq file-name-handler-alist file-name-handler-alist-old)))

;; setup package manager
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
