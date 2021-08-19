(defun dired-tp ()
  ""
  (interactive)
  (require 'half-shell)
  (dired
   (completing-read
    "Dired-jump to directory:"
    (shell-command-to-list "env | grep -i DIR= | awk -F= '{ print $2 }'"))))

(defun dired-kill-buffer-and-jump ()
  "Kill the current buffer and jump to Dired."
  (interactive)
  (let ((buffer (current-buffer)))
    (dired-jump)
    (kill-buffer buffer)))

(provide 'dired-tp)
