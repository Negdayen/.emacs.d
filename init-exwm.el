(require 'package)
(add-to-list 'package-selected-packages 'exwm)
(package-refresh-contents)
(package-install-selected-packages)



(customize-setq exwm-workspace-number 10)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global Key Bindings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; These key bindings are always available.

(customize-setq
 exwm-input-global-keys
 `(([?\s-r] . exwm-reset) ;super-r to exit char-mode and fullscreen-mode.
   ([?\s-w] . exwm-workspace-switch)
   ([?\s-x] . (lambda () (interactive) (shell-command "dmenu_run")))

   ([s-return] . (lambda ()
                   (interactive)
                   (start-process-shell-command "st" nil "st")))

   ([?\s-Z] . (lambda () (interactive) (shell-command "sudo ZZZ")))


   ([?\s-d ?\s-i] . (lambda ()
                      "Invert X display's colors"
                      (interactive)
                      (shell-command "xcalib -i -a")))
   ([?\s-d ?\s-t] . (lambda ()
                      "Display current time and date."
                      (interactive)
                      (shell-command "date +'%T %Z %A %B %-d %Y' | dmenu")))

   ;;super-0 to super-9 to switch to a workspace by its index.
   ,@(mapcar (lambda (i)
               `(,(kbd (format "s-%d" i)) .
                 (lambda ()
                   (interactive)
                   (exwm-workspace-switch-create ,i))))
             (number-sequence 0 9))

   ;;super-& launches runs programs without an async shell command buffer
   ([?\s-&] . (lambda (command)
                (interactive (list (read-shell-command "$ ")))
                (start-process-shell-command command nil command)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Line-mode Key Bindings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; These key bindings are only available in line-mode.

(define-key exwm-mode-map [?\s-q] #'exwm-input-send-next-key)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Window/Buffer Integration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; EXWM names buffers *EXWM* by default.
;; This modifies that behavior.

(add-hook 'exwm-update-class-hook
          (lambda ()
            (unless (or (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                        (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-class-name))))
(add-hook 'exwm-update-title-hook
          (lambda ()
            (when (or (not exwm-instance-name)
                      (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                      (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-title))))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Remapping key events ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Global simulation keys
;; (customize-setq exwm-input-simulation-keys '())
;;
;; Per-application simulation keys
;; (add-hook 'exwm-manage-finish-hook
;;           (lambda ()
;;             (when (and exwm-class-name
;;                        (string= exwm-class-name "Firefox"))
;;               (exwm-input-set-local-simulation-keys nil))))



(exwm-enable)
