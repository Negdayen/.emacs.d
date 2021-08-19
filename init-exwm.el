(require 'package)
(add-to-list 'package-selected-packages 'exwm)
(package-refresh-contents)
(package-install-selected-packages)
(require 'exwm)



(customize-setq exwm-workspace-number 10)

(customize-setq exwm-manage-force-tiling t)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global Key Bindings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; These key bindings are always available.

(customize-setq
 exwm-input-global-keys
 `(([print] . (lambda ()
                "Screenshot a selected rectangle and store it in ~/screenshots/"
                (interactive)
                (shell-command
                 "sh -c 'mkdir -p ~/screenshots && scrot -f -s -z ~/screenshots/$(date -Iseconds).png'"
                 nil
                 nil)))
   ([s-print] . (lambda ()
                  "Screenshot the entire screen and store it in ~/screenshots/"
                  (interactive)
                  (shell-command
                   "sh -c 'mkdir -p ~/screenshots && scrot -z ~/screenshots/$(date -Iseconds).png'"
                   nil
                   nil)))

   ([s-return] . (lambda ()
                   (interactive)
                   (start-process-shell-command "st" nil "st")))

   ([?\s-K] . kill-buffer-and-window)

   ([?\s-r] . exwm-reset)

   ([?\s-w] . exwm-workspace-switch)

   ([?\s-x] . (lambda () (interactive) (shell-command "dmenu_run")))

   ([?\s-d ?\s-i] . (lambda ()
                      "Display inverted colors."
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
