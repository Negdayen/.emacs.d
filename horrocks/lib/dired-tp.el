(defun dired-tp ()
  ""
  (interactive)
  (require 'half-shell)
  (dired
   (completing-read
    "Dired-jump to directory:"
    (shell-command-to-list "env | grep -i DIR= | awk -F= '{ print $2 }'"))))

(provide 'dired-tp)
