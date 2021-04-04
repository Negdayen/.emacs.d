(dolist (hook '(conf-colon-mode-hook
                conf-desktop-mode-hook
                conf-javaprop-mode-hook
                conf-ppd-mode-hook
                conf-space-mode-hook
                conf-toml-mode-hook
                conf-unix-mode-hook
                conf-windows-mode-hook
                conf-xdefaults-mode-hook))
  (add-hook hook 'whitespace-mode))
