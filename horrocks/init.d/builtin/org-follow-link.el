(customize-setq
 ;; org-confirm-elisp-link-function
 ;; org-confirm-elisp-link-not-regexp
 ;; org-confirm-shell-link-function
 ;; org-confirm-shell-link-not-regexp
 ;; org-display-internal-link-with-indirect-buffer
 ;; org-doi-server-url
 ;; org-file-apps ;; see below
 ;; org-follow-link-hook
 ;; org-link-frame-setup
 ;; org-link-search-must-match-exact-headline
 ;; org-link-translation-function
 ;; org-mark-ring-length
 ;; org-mhe-search-all-folders
 ;; org-mouse-1-follows-link
 ;; org-open-directory-means-index-dot-org
 ;; org-open-non-existing-files
 ;; org-return-follows-link
 ;; org-tab-follows-link
 )

(defun x11-with-no-window-p ()
  (and (getenv "DISPLAY") (not (display-graphic-p))))

(with-eval-after-load 'org
  (cond
   ((x11-with-no-window-p)
    (add-to-list
     'org-file-apps
     (cons (regexp-opt '(".jpg" ".jpeg" ".png")) "pop-image %s")))))
