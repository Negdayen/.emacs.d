(defun counsel-find ()
  (interactive)
  (ivy-read "Find file: " (shell-command-to-list "find") :action 'find-file))
