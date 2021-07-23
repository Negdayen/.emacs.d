(defhydra hydra-sp (:foreign-keys run
                    :hint nil
                    :inherit (hydra-mixin-quit/heads))
  "
Shape       Slurp  Barf   Move
─────────── ────── ────── ─────────────
\[_,@_ splice\] \[_Sf_ →\] \[_Bf_ →\] \[_T_ transpose\]
\[_|_ split\]   \[_Sb_ ←\] \[_Bb_ ←\]
\[_A_ absorb\]
\[_E_ emit\]
\[_J_ join\]
\[_R_ raise\]

Kill
─────────────
\[_Ka_ all\] \[_Kca_ contents all\] _Kch_ contents ←\] \[_Kcl_ contents →\] \[_Kh_ ←\] \[_Kl_ →\]
\[_w_ copy\]
------------------------------------------------------------------------------
"
  ;; Navigate
  ("a" sp-beginning-of-sexp)
  ("bb" sp-backward-sexp)
  ("bd" sp-backward-down-sexp)
  ("bt" sp-backwards-top-level)
  ("bu" sp-backward-up-sexp)
  ("e" sp-end-of-sexp)
  ("fd" sp-down-sexp)
  ("ff" sp-forward-sexp)
  ("ft" sp-forwards-top-level)
  ("fu" sp-up-sexp)
  ("h" sp-backward-sexp)
  ("j" sp-down-sexp)
  ("k" sp-backward-up-sexp)
  ("l" sp-forward-sexp)
  ("n" sp-next-sexp)
  ("p" sp-previous-sexp)

  ;; Shape
  (",@" sp-splice-sexp)
  ("|" sp-split-sexp)
  ("A" sp-absorb-sexp)
  ("Cj" sp-change-inner :exit t)
  ("E" sp-emit-sexp)
  ("J" sp-join-sexp)
  ("R" sp-raise-sexp)
  ("V" sp-convolute-sexp)

  ;; Slurp
  ("Sb" sp-backward-slurp-sexp)
  ("Sf" sp-forward-slurp-sexp)

  ;; Barf
  ("Bb" sp-backward-barf-sexp)
  ("Bf" sp-forward-barf-sexp)

  ;; Move
  ("T" sp-transpose-sexp)

  ;; Kill
  ("Ka" (let ((current-prefix-arg '(16))) (call-interactively 'sp-kill-sexp)))
  ("Kca" (sp-kill-sexp 0))
  ("Kch" (let ((current-prefix-arg '(-4))) (call-interactively 'sp-kill-sexp)))
  ("Kcl" (let ((current-prefix-arg '(4))) (call-interactively 'sp-kill-sexp)))
  ("Kh" sp-kill-sexp-backward)
  ("Kl" sp-kill-sexp)
  ("w" sp-copy-sexp))
