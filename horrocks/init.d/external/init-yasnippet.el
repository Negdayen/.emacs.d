(use-package yasnippet
  :commands (yas-activate-extra-mode
             yas-describe-tables
             yas-expand
             yas-global-mode
             yas-insert-snippet
             yas-load-directory
             yas-load-snippet-buffer
             yas-minor-mode
             yas-new-snippet
             yas-tryout-snippet
             yas-visit-snippet-file)
  :init
  (setq
   yas-snippet-dirs (list (concat user-emacs-directory "yasnippets")
                          (concat user-emacs-directory "horrocks/yasnippets")))
  :config
  (yas-reload-all))
