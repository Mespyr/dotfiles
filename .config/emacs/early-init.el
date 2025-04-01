;; Set Garbage Collection threshold high during startup
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.8)
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 16 1024 1024))))

;; Use PLISTS for LSP performance boost
(setenv "LSP_USE_PLISTS" "true")

;; Prevent unnecessary UI elements from loading early
(setq inhibit-startup-message t
      inhibit-startup-screen t
      initial-scratch-message nil
      use-dialog-box nil
      native-comp-async-report-warnings-errors 'silent)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode -1)
(menu-bar-mode -1)
(global-visual-line-mode 1)
(advice-add #'x-apply-session-resources :override #'ignore)

;; Speed up frame rendering
(setq frame-inhibit-implied-resize t
      frame-resize-pixelwise t)

;; Suppress certain common warnings
(setq command-error-function
      (lambda (data _ _)
        (unless (memq (car data)
                      '(buffer-read-only beginning-of-buffer
                        end-of-buffer beginning-of-line end-of-line quit))
          (command-error-default-function data context caller))))

;; Temporary disable file name handlers for faster startup
(defvar default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(add-hook 'emacs-startup-hook
          (lambda () (setq file-name-handler-alist default-file-name-handler-alist)))

;; Store custom settings in a temporary file to keep init.el clean
(setq custom-file (make-temp-file "/tmp/emacs-custom-")
      custom-safe-themes t)

;; Set background and foreground color early to avoid flashing white screen
(set-face-attribute 'default nil :background "#100f0f" :foreground "#fffcf0")

;; Customize modeline thickness
(custom-set-faces
 '(mode-line ((t (:background "#1C1B1A" :box (:line-width 5 :color "#1C1B1A")))))
 '(mode-line-inactive ((t (:background "#1C1B1A" :box (:line-width 5 :color "#1C1B1A")))))
 '(vertical-border ((t (:foreground "#575653")))))
