;;;;;;;;;;;;;;;;;;;
;; abbreviations ;;
;;;;;;;;;;;;;;;;;;;

(defun elisp-x-define-abbrevs ()
  ""
  (define-abbrev emacs-lisp-mode-abbrev-table "df" "" 'elisp-x-skeleton-defun))

;;;;;;;;;;;;;;;
;; skeletons ;;
;;;;;;;;;;;;;;;

(define-skeleton elisp-x-skeleton-defun
  ""
  nil
  > "(defun name"_" ()" \n
  > "\"\"" \n
  > ")" \n )

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; default configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun elisp-x-default-configuration ()
  ""
  (dolist (hook '(emacs-lisp-mode-hook
                  lisp-interaction-mode-hook))
    (dolist (func '(abbrev-mode
                    elisp-x-define-abbrevs))
      (add-hook hook func))))

;;

(provide 'elisp-x)
