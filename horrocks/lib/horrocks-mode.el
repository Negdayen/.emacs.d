(define-minor-mode horrocks-minor-mode
  "Toggle Horrocks's global keybindings."
  :global t
  :keymap (list
           (cons (kbd "<C-up>")    'windmove-up)
           (cons (kbd "<C-down>")  'windmove-down)
           (cons (kbd "<C-left>")  'windmove-left)
           (cons (kbd "<C-right>") 'windmove-right)
           (cons (kbd "C-a")       'back-to-indentation*)
           (cons (kbd "C-z")       nil)

           (cons (kbd "<M-up>")    (lambda () (interactive) (scroll-down  (/ (window-height) 4))))
           (cons (kbd "<M-down>")  (lambda () (interactive) (scroll-up    (/ (window-height) 4))))
           (cons (kbd "<M-left>")  (lambda () (interactive) (scroll-right (/ (window-width)  4))))
           (cons (kbd "<M-right>") (lambda () (interactive) (scroll-left  (/ (window-width)  4))))

           (cons (kbd "<S-delete>") 'delete-region)

           (cons (kbd "<M-S-up>")    (lambda () (interactive) (scroll-down 1)))
           (cons (kbd "<M-S-down>")  (lambda () (interactive) (scroll-up 1)))
           (cons (kbd "<M-S-left>")  (lambda () (interactive) (scroll-right 1)))
           (cons (kbd "<M-S-right>") (lambda () (interactive) (scroll-left 1)))
           (cons (kbd "M-A")         (lambda () (interactive) (activate-mark)))
           ;; M-J is reserved to toggle horrocks-minor-mode

           (cons (kbd "C-c h a")   'hydra-apropos/body)
           (cons (kbd "C-c j c")   'avy-goto-char)
           (cons (kbd "C-c j i")   'avy-goto-char-in-line)
           (cons (kbd "C-c j l")   'avy-goto-line)
           (cons (kbd "C-c j w")   'avy-goto-word-0)
           (cons (kbd "C-c j y")   'avy-goto-symbol-1)
           (cons (kbd "C-c o")     'hydra-outline/body)
           (cons (kbd "C-c p")     'hydra-projectile/body)
           (cons (kbd "C-c w 0")   'winum-select-window-0)
           (cons (kbd "C-c w 1")   'winum-select-window-1)
           (cons (kbd "C-c w 2")   'winum-select-window-2)
           (cons (kbd "C-c w 3")   'winum-select-window-3)
           (cons (kbd "C-c w 4")   'winum-select-window-4)
           (cons (kbd "C-c w 5")   'winum-select-window-5)
           (cons (kbd "C-c w 6")   'winum-select-window-6)
           (cons (kbd "C-c w 7")   'winum-select-window-7)
           (cons (kbd "C-c w 8")   'winum-select-window-8)
           (cons (kbd "C-c w 9")   'winum-select-window-9)
           (cons (kbd "C-c w l f") 'layout/fork)
           (cons (kbd "C-c w l g") 'layout/grid)
           (cons (kbd "C-c w l s") 'layout/sandals)
           (cons (kbd "C-c w l t") 'layout/thong)
           (cons (kbd "C-c w l T") 'layout/inverted-thong)
           (cons (kbd "C-c w w")   'hydra-window/body)

           (cons (kbd "C-x O")     'other-window/back)
           (cons (kbd "C-x C-b")   'persp-ibuffer)

           (cons (kbd "M-m M-m") 'hydra-sp/body)
           ;; (cons (kbd "M-F") 'hydra-find/body)
           ;; (cons (kbd "M-G") 'hydra-goto/body)
           ;; (cons (kbd "M-S") 'hydra-sexp/body)
           ;; (cons (kbd "M-y") 'forward-symbol)
           ;; (cons (kbd "M-Y") 'backward-symbol)
           ;; (cons (kbd "C-M-y") 'counsel-yank-pop)
           )
  :lighter " Horrocks")

(provide 'horrocks-mode)
