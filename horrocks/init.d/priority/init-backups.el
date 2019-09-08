;; should be true by default, but just in case:
(setq make-backup-files t)

;; redirect creation of all backup files to a single location
(setq backup-directory-alist (list (cons "." (concat user-emacs-directory "/backup"))))

;; simple and straightforward method for creating backup files
(setq backup-by-copying t)

;; keep multiple, numbered versions
(setq version-control t)

;; silently and automatically delete excess backups
(setq delete-old-versions t)
(setq kept-new-versions 10)
(setq kept-old-versions 10)

;; use Emacs's backup system even in the prescence of version control.
(setq vc-make-backup-files t)

;; Emacs by default only creates a backup on the *first* save of an opened file.
;; Not good! If I want that large kind of granularity, I use an actual version
;; control system. What I really want is an insurance policy for when I have yet
;; to make a commit.
;; This tricks Emacs into believing it hasn't made its commit yet, thus making
;; a backup after every save.
;; (add-hook 'before-save-hook (lambda () (setq buffer-backed-up nil)))
