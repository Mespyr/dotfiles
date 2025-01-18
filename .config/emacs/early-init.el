;; Set Garbage Collection threshold to 1GB during startup
(setq gc-cons-threshold (* 1024 1024 1024 1024)
	  gc-cons-percentage 0.6)

;; set PLISTS in env to improve lsp performance
(setenv "LSP_USE_PLISTS" "true")

;; Speed up startup time by inhibiting Emacs from resizing
;; the frame with fonts larger than the system default.
(setq frame-inhibit-implied-resize t
	  frame-resize-pixelwise t)

;; Custom will add stuff to your init file
;; which is annoying, so this removes that stuff
(setq custom-file (make-temp-name "/tmp/")
	  custom-safe-themes t)

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
 '(mode-line-inactive ((t(
	:background "#1C1B1A"
    :box (:line-width 5 :color "#1C1B1A")))))
 '(vertical-border ((t(:foreground "#575653")))))

;; change some of the default settings
(setq
  inhibit-startup-message t
  inhibit-startup-screen t
  initial-scratch-message nil
  use-dialog-box nil
  native-comp-async-report-warnings-errors 'silent)

;; disable some UI features
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode -1)
(menu-bar-mode -1)
(global-visual-line-mode 1)
(advice-add #'x-apply-session-resources :override #'ignore)

;; stop certain warnings from displaying
(setq command-error-function
  (lambda (data _ _)
	(when (not (memq (car data)
			'(buffer-read-only
			  beginning-of-buffer
			  end-of-buffer
			  beginning-of-line
			  end-of-line
			  quit)))
		(command-error-default-function data context caller))))

;; Unset `file-name-handler-alist' too (temporarily). Every file opened and
;; loaded by Emacs will run through this list to check for a proper handler for
;; the file, but during startup, it won’t need any of them.
(defvar file-name-handler-alist-old file-name-handler-alist)
(setq file-name-handler-alist nil)
(add-hook 'emacs-startup-hook
  (lambda () (setq file-name-handler-alist file-name-handler-alist-old)))
