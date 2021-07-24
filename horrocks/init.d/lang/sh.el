(add-hook
 'sh-mode-hook
 (lambda ()
   (setq-local outline-regexp (rx "# " (+ "*")))))

(with-eval-after-load 'sh-script
  (bind-key "C-c SPC" 'snake-region sh-mode-map))
