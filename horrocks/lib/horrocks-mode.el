(define-prefix-command 'help)
(define-key help [?a] 'hydra-apropos/body)

(define-prefix-command 'windows/workspace)
(define-key windows/workspace [?r] 'resize-mode)
(define-key windows/workspace [?w] 'hydra-window/body)
(define-key windows/workspace [?4] 'workspace/4!)

(define-minor-mode horrocks-minor-mode
  "Toggle Horrocks's global keybindings."
  :global t
  :keymap (list ;; (cons (kbd "C-r") 'hydra-repeat)
                ;; (windmove-default-keybindings 'meta) TODO
                (cons (kbd "C-c h") 'help)
                (cons (kbd "C-c o") 'hydra-outline/body)
                (cons (kbd "C-c p") 'hydra-projectile/body)
                (cons (kbd "C-c w") 'windows/workspace)
                (cons (kbd "C-x O") 'other-window/back)
                (cons (kbd "C-x C-b") 'buffer-menu)
                (cons (kbd "C-z") nil)
                ;; (cons (kbd "M-F") 'hydra-find/body)
                ;; (cons (kbd "M-G") 'hydra-goto/body)
                ;; (cons (kbd "M-S") 'hydra-sexp/body)
                ;; (cons (kbd "M-y") 'forward-symbol)
                ;; (cons (kbd "M-Y") 'backward-symbol)
                ;; (cons (kbd "C-M-y") 'counsel-yank-pop)
                (cons (kbd "<C-M-backspace>") 'sp-backward-kill-sexp))
  :lighter " Horrocks")

(provide 'horrocks-mode)
