(defmacro customize-setq (&rest args)
  "Multiple form of customize-set-variable."
  (unless (null args)
    (let ((var (car args))
          (val (cadr args))
          (rest (cddr args)))
      `(progn (customize-set-variable ,(list 'quote var) ,val)
              (customize-setq ,@rest)))))

(defun dired-async-command-at-point ()
  "In Dired, take the absolute filepath of the filename at point,
and execute it asynchronously."
  (interactive)
  (async-shell-command (dired-get-filename)))

(defun for-each-apply (func seq)
  (dolist (args seq) (apply func args)))

(defun local-set-minor-mode-key (mode key def)
  "Overrides a minor mode keybinding for the local
   buffer, by creating or altering keymaps stored in buffer-local
   `minor-mode-overriding-map-alist'."
  (let* ((oldmap (cdr (assoc mode minor-mode-map-alist)))
         (newmap (or (cdr (assoc mode minor-mode-overriding-map-alist))
                     (let ((map (make-sparse-keymap)))
                       (set-keymap-parent map oldmap)
                       (push `(,mode . ,map) minor-mode-overriding-map-alist)
                       map))))
    (define-key newmap key def)))

(defun map-apply (func seq)             ; TODO identifier clash with cl.el map-apply
  "Applies FUNC to each element argument list of SEQ."
  (mapcar (lambda (args) (apply func args)) seq))

;; (numeric-string-sequence 0 2) => ("0" "1" "2")
(defun numeric-string-sequence (from to)
  "Return a list of numeric strings from integer FROM to integer
TO inclusively."
  (mapcar #'number-to-string (number-sequence from to)))

(defun other-window/back ()
  (interactive)
  (other-window -1))

(defun recover-and-diff ()
  (interactive)
  (recover-this-file)
  (let ((diff-switches "-u")) ;; unified diff
    (diff-buffer-with-file (current-buffer))))

(defun region-string ()
  (buffer-substring-no-properties (region-beginning) (region-end)))

;; (take-modulo '(1 2 3 4 5 6 7) 2) => '(2 4 6)
(defun take-modulo (list modulus)
  "Take every nth element from LIST. "
  (letrec ((recur
            (lambda (list modulus count accum)
              (if (null list)
                  (nreverse accum)
                (funcall recur
                         (cdr list)
                         modulus (+ 1 count)
                         (if (= 0 (mod count modulus))
                             (cons (car list) accum)
                           accum))))))
    (funcall recur list modulus 1 '())))

(provide 'batteries-core)
