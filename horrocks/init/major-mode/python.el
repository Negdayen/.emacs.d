(add-to-list 'auto-mode-alist
             '("\\(^[Ss]conscript$\\|^[Ss]construct$\\|^SCsub$\\)" . python-mode))

(with-eval-after-load 'python
  (bind-key "C-c SPC" 'snake-region python-mode-map)
  (add-hook 'python-mode-hook 'subword-mode))
