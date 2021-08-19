(use-package org :pin org)

(with-eval-after-load 'org

  (bind-key "C-c C-v '" 'org-edit-src-code org-mode-map)

 ;; org-mode sets this to org-{backward,foward}-element, which I don't like.
  ;; Unbinding sets these to org-{backward,foward}-paragraph instead.
  (bind-key "M-{" nil org-mode-map)
  (bind-key "M-}" nil org-mode-map)

  (bind-key "C-c I h" 'org-skeleton-header org-mode-map)
  
  ;; Cycle lists like headings
  (setq org-cycle-include-plain-lists 'integrate)

  ;; Toggle visibility of all code blocks by hitting C-c C-\
  (defvar org-blocks-hidden nil)
  (defun org-toggle-blocks ()
    (interactive)
    (if org-blocks-hidden (org-show-block-all) (org-hide-block-all))
    (setq-local org-blocks-hidden (not org-blocks-hidden)))
  (define-key org-mode-map (kbd "C-c C-\\") 'org-toggle-blocks)

  ;; Unsorted configurations
  (setq org-format-latex-options
        (plist-put org-format-latex-options :background "Transparent"))
  (setq org-format-latex-options
        (plist-put org-format-latex-options :scale 1.1))
  (setq org-image-actual-width '(500))
  (setq org-list-allow-alphabetical t)
  (setq org-src-window-setup 'current-window)
  (setq org-use-speed-commands t)
)
