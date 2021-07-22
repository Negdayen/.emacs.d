(defun relative-filepath (filepath)
  "Return path of FILEPATH relative to DEFAULT-DIRECTORY, ignoring tramp syntax."
  (shell-command-to-string
   (format "printf '%%s' \"$(realpath --relative-to . \"%s\")\""
           (tramp-file-local-name filepath))))

(provide 'file-utils)
