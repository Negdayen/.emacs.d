(use-package org
  :pin org

  :init
  (setq
   ;; Enable code block fontification by its mode
   org-src-fontify-natively t
   ;; Enable code black indenting by its mode
   org-src-tab-acts-natively t)

  :config
  ;; cycle lists like headings
  (setq org-cycle-include-plain-lists 'integrate)
  (setq org-format-latex-options
        (plist-put org-format-latex-options :background "Transparent"))
  (setq org-format-latex-options
        (plist-put org-format-latex-options :scale 1.1))
  (setq org-image-actual-width '(500))
  (setq org-list-allow-alphabetical t)
  (setq org-src-window-setup 'current-window)
  (setq org-use-speed-commands t)

  ;; Toggle visibility of all code blocks by hitting C-c C-\
  (defvar org-blocks-hidden nil)
  (defun org-toggle-blocks ()
    (interactive)
    (if org-blocks-hidden (org-show-block-all) (org-hide-block-all))
    (setq-local org-blocks-hidden (not org-blocks-hidden)))
  (define-key org-mode-map (kbd "C-c C-\\") 'org-toggle-blocks))
