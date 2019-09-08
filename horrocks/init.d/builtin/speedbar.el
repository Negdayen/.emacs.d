(customize-setq
 ;; rmail-speedbar-match-folder-regexp
 ;; semantic-sb-autoexpand-length
 ;; semantic-sb-button-format-tag-function
 ;; semantic-sb-info-format-tag-function
 ;; speedbar-after-create-hook
 ;; speedbar-before-delete-hook
 ;; speedbar-before-popup-hook
 ;; speedbar-before-visiting-file-hook
 ;; speedbar-before-visiting-tag-hook
 ;; speedbar-default-position
 ;; speedbar-directory-button-trim-method
 ;; speedbar-directory-unshown-regexp
 ;; speedbar-fetch-etags-arguments
 ;; speedbar-fetch-etags-command
 ;; speedbar-file-unshown-regexp
 ;; speedbar-frame-parameters
 ;; speedbar-frame-plist
 ;; speedbar-hide-button-brackets-flag
 ;; speedbar-ignored-directory-expressions
 ;; speedbar-ignored-modes
 ;; speedbar-indentation-width
 ;; speedbar-load-hook
 ;; speedbar-mode-hook
 ;; speedbar-mode-specific-contents-flag
 ;; speedbar-query-confirmation-method
 ;; speedbar-reconfigure-keymaps-hook
 ;; speedbar-scanner-reset-hook
 ;; speedbar-select-frame-method
 ;; speedbar-show-unknown-files
 ;; speedbar-smart-directory-expand-flag
 ;; speedbar-sort-tags
 ;; speedbar-supported-extension-expressions
 ;; speedbar-tag-group-name-minimum-length
 ;; speedbar-tag-hierarchy-method
 ;; speedbar-tag-regroup-maximum-length
 ;; speedbar-tag-split-minimum-length
 ;; speedbar-timer-hook
 ;; speedbar-track-mouse-flag
 ;; speedbar-update-flag
 ;; speedbar-use-images
 ;; use-imenu-for-tags
 ;; speedbar-use-tool-tips-flag
 ;; speedbar-verbosity-level
 ;; speedbar-visiting-file-hook
 ;; speedbar-visiting-tag-hook
 )

(use-package speedbar
  :bind (:map speedbar-mode-map
              ("1" . digit-argument)
              ("2" . digit-argument)
              ("3" . digit-argument)
              ("4" . digit-argument)
              ("5" . digit-argument)
              ("6" . digit-argument)
              ("7" . digit-argument)
              ("8" . digit-argument)
              ("9" . digit-argument)
              ("j" . speedbar-next)
              ("k" . speedbar-prev)
              ("o" . speedbar-toggle-line-expansion)
              ("^" . speedbar-up-directory)
              ("+" . speedbar-create-directory)))
