(add-hook
 'sh-mode-hook
 (lambda ()
   (setq-local outline-regexp (rx "# " (+ "*")))))
