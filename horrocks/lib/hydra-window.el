(require 'hydra)
(require 'hydra-mixin-quit)
(require 'windmove)

(defun hydra-move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun hydra-move-splitter-right (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun hydra-move-splitter-up (arg)
  "Move window splitter up."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (enlarge-window arg)
    (shrink-window arg)))

(defun hydra-move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))

(defhydra hydra-window (:body-pre (winner-mode)
                        :foreign-keys warn
                        :hint nil
                        :inherit (hydra-mixin-quit/heads)
                        :post (winner-mode 0))
  "
  Movement: [ _k_ up] [_j_ down] [_h_ left] [_l_ right] [_o_ther window] [inverse _O_ther window]
    Layout: [_-_ split horizontally] [_|_ split vertically] [_d_elete window] [_D_elete other windows] [_u_ndo] [_r_edo]
    Buffer: [_n_ext] [_p_revious] [switch _b_uffer] [_f_ind file]
    Resize: [_K_ up]  [_J_ down] [_H_ left] [_L_ right] [_B_alance]

"
  ("k" windmove-up)
  ("j" windmove-down)
  ("h" windmove-left)
  ("l" windmove-right)

  ("o" other-window)
  ("O" other-window/back)

  ("-" split-window-below)
  ("|" split-window-right)
  ("d" delete-window)
  ("D" delete-other-windows)
  ("u" winner-undo)
  ("r" winner-redo)

  ("n" next-buffer)
  ("p" previous-buffer)
  ("b" ido-switch-buffer)
  ("f" ido-find-file)

  ("K" hydra-move-splitter-up)
  ("J" hydra-move-splitter-down)
  ("H" hydra-move-splitter-left)
  ("L" hydra-move-splitter-right)
  ("B" balance-windows))

(provide 'hydra-window)
