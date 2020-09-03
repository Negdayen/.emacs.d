(customize-setq
 ;; backward-delete-char-untabify-method
 delete-active-region 'kill
 ;; kill-append-merge-undo
 kill-do-not-save-duplicates t
 kill-read-only-ok t
 kill-ring-max 100
 ;; kill-whole-line
 ;; save-interprogram-paste-before-kill
 ;; select-active-regions
 ;; select-enable-clipboard
 ;; select-enable-primary
 ;; x-select-enable-clipboard-manager
 ;; x-select-request-type
 ;; yank-excluded-properties
 ;; yank-handled-properties
 ;; yank-pop-change-selection
 )

;;; Clipboard
(setq
 ;; clipboard-kill-region
 ;; clipboard-kill-ring-save
 ;; clipboard-yank
 )

;; MSYS2 /dev/clipboard integration
(when (and (eq system-type 'cygwin) (file-exists-p "/dev/clipboard"))
  (advice-add 'kill-new
              :before
              (lambda (string &optional replace)
                (with-temp-file "/dev/clipboard" (insert string)))))
