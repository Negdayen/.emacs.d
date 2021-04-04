(defun magit-show-random-commit ()
  "Display a random commit from the current git repository. "
  (interactive)
  (magit-show-commit (shell-command-to-string "git random | tr -d '\\n'")))
