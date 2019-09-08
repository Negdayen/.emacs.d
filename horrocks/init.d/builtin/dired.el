(customize-setq
 ;; completion-ignored-extensions TODO
 ;; directory-free-space-args
 ;; directory-free-space-program
 ;; dired-after-readin-hook
 ;; dired-always-read-filesystem
 dired-auto-revert-buffer t
 ;; dired-backup-overwrite
 ;; dired-before-readin-hook
 ;; dired-chmod-program
 ;; dired-chown-program
 dired-copy-preserve-time t
 ;; dired-dnd-protocol-alist
 dired-dwim-target t
 ;; dired-garbage-files-regexp TODO
 ;; dired-hide-details-hide-information-lines TODO
 ;; dired-hide-details-hide-symlink-targets TODO
 ;; dired-initial-position-hook
 dired-isearch-filenames 'dwim
 ;; dired-kept-versions TODO
 dired-listing-switches "-alh"
 ;; dired-load-hook
 ;; dired-local-variables-file
 ;; dired-mode-hook
 ;; dired-no-confirm
 dired-recursive-copies 'top
 dired-recursive-deletes 'top
 ;; dired-subdir-switches
 ;; dired-touch-program
 ;; dired-trivial-filenames
 ;; dired-use-ls-dired
 list-directory-brief-switches "-F"
 list-directory-verbose-switches "-l"
 )

(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(defun dired-up-directory-same-buffer ()
  (interactive)
  (find-alternate-file ".."))

(define-key dired-mode-map
  (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)

(define-key dired-mode-map
  (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)

(define-key dired-mode-map
  (vector 'remap 'dired-up-directory) 'dired-up-directory-same-buffer)

;; Enable replace-navigation via 'a'
(put 'dired-find-alternate-file 'disabled nil)

;; Goes here I guess?
(setq
 ;; dired-compress-files-alist
 )
