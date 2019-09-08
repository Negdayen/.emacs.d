(defun shell-command-to-list (command)
  ""
  (split-string-and-unquote (shell-command-to-string command) "\n"))

(provide 'half-shell)
