(customize-setq
 inhibit-default-init t
 ;; inhibit-startup-buffer-menu nil
 ;; inhibit-startup-echo-area-message
 inhibit-startup-screen t
 initial-buffer-choice nil
 ;; initial-major-mode
 initial-scratch-message nil
 ;; site-run-file
 ;; user-emacs-directory-warning
 )

(fset 'yes-or-no-p 'y-or-n-p)

;; TODO maybe one day have a fancy splash screen
;; (customize-setq
;;  fancy-about-text
;;  fancy-splash-image
;;  fancy-startup-text
;;  )
