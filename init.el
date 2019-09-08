(defun relative (filepath)
  "Return filepath relative to the currently loading file."
  (concat (file-name-directory load-file-name) filepath))

(add-to-list 'load-path (relative "horrocks/lib"))

(load (relative "horrocks/lib/load-directory"))
(load-directory (relative "horrocks/init.d/priority"))
(load-theme 'horrocks t)
(load-directory (relative "horrocks/init.d/lib"))
(load-directory (relative "horrocks/lib/batteries"))
(load-directory (relative "horrocks/init.d/builtin"))
(load-directory (relative "horrocks/init.d/external"))
(load-directory (relative "horrocks/lib"))
(load-directory (relative "horrocks/init.d/internal"))
(load-directory (relative "horrocks/init.d/lang"))
