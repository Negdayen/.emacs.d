(defun relative-filepath (filepath)
  "Return filepath relative to default-directory."
  (shell-command-to-string
   (format "printf '%%s' \"$(realpath --relative-to . \"%s\")\"" filepath)))

(provide 'file-utils)
