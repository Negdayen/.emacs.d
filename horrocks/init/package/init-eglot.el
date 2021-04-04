(use-package eglot
  :pin melpa)

(with-eval-after-load 'project
  (add-to-list 'project-find-functions
               (lambda (dir)
                 (let* ((root (projectile-project-root dir)))
                   (and root (cons 'transient root))))))
