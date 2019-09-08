(setq auto-save-default t)

;; I rather have auto-saves be stored in a single central location rather
;; than have them littered thoughout the filesystem. Remote files will still
;; be auto-saved to Emacs default location, as we're appending this rule.
(defconst auto-save-dir (concat user-emacs-directory "/auto-save"))
(unless (file-exists-p auto-save-dir)
  (make-directory auto-save-dir))
(add-to-list 'auto-save-file-name-transforms
             (list ".*" auto-save-dir t)
             t)

;; Bump up the frequency of auto-saves.
(setq auto-save-interval 100
      auto-save-timeout 10)
