(require 'hydra)
(require 'hydra-mixin-quit)

(defhydra hydra-perspective (:foreign-keys warn
                             :hint nil
                             :inherit (hydra-mixin-quit/heads))
  "
     Buffer: [_+_ add] [_-_ remove] [set_!_] [_b_uffer list]
Perspective: [_j_ump] [_n_ext] [_p_revious] [_l_ast]
             [_r_ename] [_s_witch] [_K_ill]
     Window: [_o_ther]

"
  ("+" persp-add-buffer)
  ("-" persp-remove-buffer)
  ("!" persp-set-buffer)

  ("b" persp-ibuffer nil :exit t)
  ("i" persp-import)
  ("j" persp-switch-quick)
  ("l" persp-switch-last)
  ("n" persp-next)
  ("o" other-window)
  ("p" persp-prev)
  ("r" persp-rename)
  ("s" persp-switch)

  ("K" persp-kill))
