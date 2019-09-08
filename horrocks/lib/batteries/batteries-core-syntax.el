(defmacro comment (&rest body)
  "Comment out one or more s-expressions."
  nil)

(defmacro fbind (vars expr &rest body)
  `(apply (lambda ,vars ,@body) ,expr))

(provide 'batteries-core-syntax)
