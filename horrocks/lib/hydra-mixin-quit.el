(require 'hydra)
(require 'hydra-x)

(defhydra hydra-mixin-quit (:hint nil)
  ("C-g" nil "Quit" :exit t)
  ("?"   toggle-hydra-is-helpful "Toggle hints")
  ("q"   nil "Quit" :exit t))

(provide 'hydra-mixin-quit)
