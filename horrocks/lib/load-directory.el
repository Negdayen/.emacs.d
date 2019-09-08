
(defun load-directory (dir)
  "`load' all elisp libraries in directory DIR which are not already loaded."
  (interactive "D")
  (when (file-directory-p dir)
    (let ((libraries-loaded (mapcar #'file-name-sans-extension
                                    (delq nil (mapcar #'car load-history)))))
      (dolist (file (directory-files dir t ".+\\.elc?$"))
        (let ((library (file-name-sans-extension file)))
          (unless (member library libraries-loaded)
            (load library)
            (push library libraries-loaded)))))))
