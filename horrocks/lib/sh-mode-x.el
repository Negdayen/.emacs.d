(with-eval-after-load 'sh-script
  (defvar shell-command-local-map
    (make-composed-keymap minibuffer-local-shell-command-map sh-mode-map)
    "Give priority to default minibuffer-local-shell-command-map so we can exit
the minibuffer in the usual way."))

(add-hook
 'minibuffer-setup-hook
 (lambda ()
   (case this-command
     ;; Enable sh-mode with shell-command and async-shell-command
     ((async-shell-command shell-command)
      (sh-mode)
      (use-local-map shell-command-local-map)
      (message nil)))))
