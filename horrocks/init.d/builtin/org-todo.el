(defface org-waiting
  '((t .  (:foreground "lightyellow" :weight bold))) "org-todo WAITING keyword")

(customize-setq
 org-todo-keywords '((sequence "TODO" "WAITING" "|" "DONE"))
 org-todo-keyword-faces '(("TODO" . org-todo)
                          ("WAITING" . org-waiting)
                          ("DONE" . org-done)))
