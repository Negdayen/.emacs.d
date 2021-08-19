(define-skeleton org-skeleton-header
  "Insert a typical org-mode document header."
  nil
  "#+TITLE: " _ \n
  > "#+AUTHOR: Jacob Horrocks" \n
  > "#+DATE: "(shell-command-to-string "date -I | tr -d '\\n'") \n
  > "#+OPTIONS: ^:nil" \n
  > "#+OPTIONS: \\n:t" \n)

;;;;;;;;;;;;;;;;;;;;;;;
;; Custom Link Types ;;
;;;;;;;;;;;;;;;;;;;;;;;

(org-link-set-parameters
 "man"
 :follow
 (lambda (link)
   (let ((tokens (s-split "::" link)))
     (woman (car tokens))
     (when (> (length tokens) 1)
       (re-search-forward (cadr tokens))
       (recenter-top-bottom)))))

(provide 'org-x)
