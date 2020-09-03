(defhydra hydra-outline (:foreign-keys warn
                         :hint nil
                         :inherit (hydra-mixin-quit/heads))
  "
  Navigation: [_j_ next] [_k_ previous]]
  Visibility: [_TAB_ cycle] [_h_ide all] [_s_how all]
Manipulation: [_H_ drag backward] [_L_ drag forward] [_<_ demote] [_>_ promote]

"
  ;; Navigation
  ("k" outline-previous-visible-heading)
  ("j" outline-next-visible-heading)

  ;; Visibility
  ("TAB" outline-cycle)
  ("h" outline-hide-body)
  ("s" outline-show-all)

  ("H" outline-move-subtree-up)
  ("L" outline-move-subtree-down)
  ("<" outline-demote)
  (">" outline-promote))
