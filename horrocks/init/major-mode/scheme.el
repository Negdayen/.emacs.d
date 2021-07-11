;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My Customize Additions ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(customize-setq scheme-mit-dialect nil)
(defcustom scheme-implementation 'gambit
  "Specialize scheme-mode based on the value of this variable."
  :group 'scheme
  :safe (function symbolp)
  :type 'symbol)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General Scheme Configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'bind-key)

(add-to-list 'font-lock-maximum-decoration '(scheme-mode . 1))

(use-package scheme-complete
  :commands (scheme-complete-or-indent
             scheme-get-current-symbol-info
             scheme-smart-complete
             scheme-smart-indent-function))

(add-to-list 'auto-mode-alist '("\\.sld$" . scheme-mode))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Gambit Scheme Polymodes ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-hostmode poly-scheme-hostmode
  :mode 'scheme-mode)

(define-innermode poly-scheme-c-innermode
  :mode 'c-mode
  :head-matcher "^[^;]*#<<c$"
  :tail-matcher "^c$"
  :head-mode 'scheme-mode
  :tail-mode 'scheme-mode)

(define-innermode poly-scheme-c++-innermode
  :mode 'c++-mode
  :head-matcher "^[^;]*#<<c\\+\\+$"
  :tail-matcher "^c\\+\\+$"
  :head-mode 'scheme-mode
  :tail-mode 'scheme-mode)

(define-innermode poly-scheme-glsl-innermode
  :mode 'glsl-mode
  :head-matcher "^[^;]*#<<glsl$"
  :tail-matcher "^glsl$"
  :head-mode 'scheme-mode
  :tail-mode 'scheme-mode)

(define-innermode poly-scheme-js-innermode
  :mode 'js-mode
  :head-matcher "^[^;]*#<<js$"
  :tail-matcher "^js$"
  :head-mode 'scheme-mode
  :tail-mode 'scheme-mode)

(define-innermode poly-scheme-org-innermode
  :mode 'org-mode
  :head-matcher "^[^;]*#<<org$"
  :tail-matcher "^org$"
  :head-mode 'scheme-mode
  :tail-mode 'scheme-mode)

(define-innermode poly-scheme-python-innermode
  :mode 'python-mode
  :head-matcher "^[^;]*#<<python$"
  :tail-matcher "^python$"
  :head-mode 'scheme-mode
  :tail-mode 'scheme-mode)

(define-polymode poly-scheme-mode
  :hostmode 'poly-scheme-hostmode
  :innermodes '(poly-scheme-c-innermode
                poly-scheme-c++-innermode
                poly-scheme-glsl-innermode
                poly-scheme-js-innermode
                poly-scheme-org-innermode
                poly-scheme-python-innermode))
