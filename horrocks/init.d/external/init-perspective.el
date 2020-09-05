(use-package perspective
  :bind (("C-x b" . persp-counsel-switch-buffer)
         ("C-x k" . persp-kill-buffer*))

  :init
  (persp-mode)

  :config
  (require 'ibuffer) ;; needed for persp-ibuffer
  (define-key persp-mode-map (kbd "C-x x") 'hydra-perspective/body))
