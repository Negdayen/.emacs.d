(customize-setq
 org-babel-load-languages '((emacs-lisp  . t)
                            (python . t)
                            (shell . t)
                            (sql . t)
                            (sqlite . t))

 ;; by default org wants to add additional indentation for code, no thanks.
 org-edit-src-content-indentation 0

 org-src-fontify-natively t

 ;; Enable code block indenting by its mode
 org-src-tab-acts-natively t)
