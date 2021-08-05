(use-package rebox2)

;; TODO should I install filladapt as recommended?

(with-eval-after-load 'rebox2
  (require 'bind-key)
  (bind-key "M-c" nil rebox-mode-map))
