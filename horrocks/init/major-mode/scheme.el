;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; customize mode map bindings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(with-eval-after-load 'scheme
  (require 'bind-key)
  (bind-key "C-c c" 'kebab-region scheme-mode-map))

;;;;;;;;;;;;;;
;; scheme-x ;;
;;;;;;;;;;;;;;

(require 'scheme-x)

(with-eval-after-load 'scheme (scheme-x-default-configuration))
