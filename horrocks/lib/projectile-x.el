(defun projectile-copy-buffer-filename ()
  "Get the filename of the current buffer relative the current projectile
project root."
  (interactive)
  (kill-new (file-relative-name (buffer-file-name) (projectile-project-root))))
