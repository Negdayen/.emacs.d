(defun sachachua--describe-random-interactive-function ()
  "Show the documentation for a random interactive function.
Consider only documented, non-obsolete functions."
  (interactive)
  (let (result)
    (mapatoms
     (lambda (s)
       (when (and (commandp s)
                  (documentation s t)
                  (null (get s 'byte-obsolete-info)))
         (setq result (cons s result)))))
    (describe-function (elt result (random (length result))))))
