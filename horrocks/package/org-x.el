(define-skeleton org-skeleton-header
  "Insert a typical org-mode document header."
  nil
  "#+TITLE: " _ \n
  > "#+AUTHOR: Jacob Horrocks" \n
  > "#+DATE: "(shell-command-to-string "date -I | tr -d '\\n'") \n
  > "#+OPTIONS: ^:nil" \n
  > "#+OPTIONS: \\n:t" \n)

(define-skeleton org-skeleton-src-block
  "Insert an org-mode source block."
  nil
  "#+BEGIN_SRC " _ \n
  > \n
  > "#+END_SRC" \n)

(define-skeleton org-skeleton-quote-block
  "Insert an org-mode quote block."
  nil
  "#+BEGIN_QUOTE" \n
  >  _ \n
  > "#+END_QUOTE" \n)

(provide 'org-x)
