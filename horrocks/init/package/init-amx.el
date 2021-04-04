;; Notes for while Amx is active:
;;   C-h f runs describe-function on the currently selected command.
;;   M-. jumps to the definition of the selected command.
;;   C-h w shows the key bindings for the selected command
;;
;; amx-show-unbound-commands shows frequently used commands that have no key
;; bindings.

(use-package amx
  :init
  (amx-mode)
  :bind
  (("M-X" . amx-major-mode-commands))
  :config
  (customize-setq
   amx-auto-update 30
;   amx-history-length
;   amx-ignored-command-matchers
;   amx-save-file
;   amx-show-key-bindings
   ))
