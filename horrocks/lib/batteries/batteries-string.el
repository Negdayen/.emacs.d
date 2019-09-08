(defun A_STRING->a-string (str)
  (apply #'string
         (mapcar (lambda (char) (if (char-equal ?_ char) ?- char))
                 (string-to-list (downcase str)))))

(defun string-empty-p (obj)
  (equalp "" obj))

(provide 'batteries-string)
