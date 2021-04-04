(defun ivy-insert-filepath-with-quotes (filepath)
  (with-ivy-window
    (insert "\"" filepath "\"")))

(defun ivy-insert-relative-filepath (filepath)
  (with-ivy-window
    (insert "./" (relative-filepath filepath))))

(defun ivy-insert-relative-filepath-with-quotes (filepath)
  (with-ivy-window
    (insert "\"./" (relative-filepath filepath) "\"")))

(defun ivy-toggle-mark ()
  "Toggle mark for current candidate and move forwards."
  (interactive)
  (if (ivy--marked-p)
      (ivy-unmark)
    (ivy-mark)))

(with-eval-after-load 'ivy

  (ivy-set-actions
   'counsel-find-file
   '(("I" ivy-insert-filepath-with-quotes "insert with quotes")
     ("r" ivy-insert-relative-filepath "insert relatively")
     ("R" ivy-insert-relative-filepath-with-quotes "insert relatively with quotes")))

  (dolist (switch-buffer '(counsel-switch-buffer
                           ivy-switch-buffer
                           persp-counsel-switch-buffer))
    (ivy-set-actions
     switch-buffer
     '(("*" switch-scratch-to-buffer "switch *scratch*")
       ("k" kill-buffer "kill-buffer")))))
