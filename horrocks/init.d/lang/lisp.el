(dolist (hook '(emacs-lisp-mode-hook
                eval-expression-minibuffer-setup-hook
                inferior-scheme-mode-hook
                lisp-mode-hook
                scheme-mode-hook))
  (add-hook hook 'prettify-symbols-mode)
  (add-hook hook 'smartparens-strict-mode)
  (add-hook
   hook
   (lambda ()
     (setq-local
      sp-local-pairs
      '((:open "\\\"" :close "\\\"" :actions (insert wrap autoskip navigate))
        (:open "\"" :close "\""
         :actions
         (insert wrap autoskip navigate escape)
         :unless
         (sp-in-string-quotes-p)
         :post-handlers
         (sp-escape-wrapped-region sp-escape-quotes-after-insert))
        (:open "(" :close ")" :actions (insert wrap autoskip navigate))
        (:open "[" :close "]" :actions (insert wrap autoskip navigate))
        (:open "{" :close "}" :actions (insert wrap autoskip navigate)))))))

(bind-key "C-c SPC" 'kebab-region lisp-mode-shared-map)
