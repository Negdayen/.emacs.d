(require 'bind-key)

(use-package scheme-complete
  :commands (scheme-complete-or-indent
             scheme-get-current-symbol-info
             scheme-smart-complete
             scheme-smart-indent-function))

(with-eval-after-load 'scheme

  (bind-key "C-c c" 'kebab-region scheme-mode-map)

  ;; scheme-complete is broken in Emacs 26 and some versions of Emacs 25
  (unless (or (= 26 emacs-major-version)
              (= 25 emacs-major-version))
    (bind-key "TAB" 'scheme-complete-or-indent scheme-mode-map)
    (add-hook
     'scheme-mode-hook
     (lambda ()
       (make-local-variable 'eldoc-documentation-function)
       (setq eldoc-documentation-function 'scheme-get-current-symbol-info)
       (eldoc-mode)))
    (add-hook
     'scheme-mode-hook
     (lambda ()
       (make-local-variable 'lisp-indent-function)
       (setq lisp-indent-function 'scheme-smart-indent-function))))

  (add-hook
   'scheme-mode-hook
   (lambda ()
     (setq-local outline-regexp (rx ";; " (+ "*"))))))
