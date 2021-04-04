(defun shell-command-to-list (command)
  "Return output lines of shell COMMAND as list of strings."
  (split-string-and-unquote (shell-command-to-string command) "\n"))

(defun inline-shell-command (command &optional buffer)
  "Insert output of shell COMMAND stripped of newlines into BUFFER, defaulting
to the current buffer."
  (interactive "MShell command: \n")
  (with-current-buffer (or buffer (current-buffer))
    (insert
     (shell-command-to-string
      (format "%s | tr '\n' ' ' | sed 's| $||'" command)))))

(defun yank-shell-command (command)
  (interactive "MShell command: \n")
  (kill-new
   (shell-command-to-string
    (format "%s | tr '\n' ' ' | sed 's| $||'" command))))

(defmacro defsh (name command)
  "Define wrapper interactive function NAME executing shell COMMAND on region."
  `(defun ,name (start end)
     ,(format "Execute `%s` on region." command)
     (interactive "r")
     (let ((default-directory temporary-file-directory)) ;ignore TRAMP remote
       (shell-command-on-region start end ,command t t))
     (exchange-point-and-mark)))

(provide 'half-shell)
