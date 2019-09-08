(require 'dash)

(defmacro defenv (id var)
  `(defconst ,id (getenv ,var)))

(defun directory-directories (dir)
  (-filter (lambda (path)
             (and (file-directory-p path)
                  (not (equalp "." path))
                  (not (equalp ".." path))))
           (directory-files dir)))

(defun find-path (filename dir)
  (cond
   ((member filename (directory-files dir))
    (concat dir "/" filename))
   ((directory-directories dir)
    (-first-item
     (-keep (lambda (dir) (find-path filename dir))
            (directory-directories dir))))
   (t nil)))

(provide 'batteries-os)
