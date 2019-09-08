(defun toggle-hydra-is-helpful ()
  "Toggle whether hydras display their docstrings."
  (interactive)
  (setq hydra-is-helpful (not hydra-is-helpful)))

(provide 'hydra-x)
