(require 'cl)

;;;

(define-minor-mode shells-minor-mode
  "Toggle keybindings for manipulating multiple shells."
  :keymap (list
           (cons (kbd "M-RET") 'shells-send-input)
           (cons (kbd "M-c") 'shells-copy-input)
           (cons (kbd "M-j") 'shells-send-input)
           (cons (kbd "M-l") 'shells-clear))
  :lighter " Shells")

(defun shells-clear ()
  (interactive)
  (save-selected-window
    (shells-for-each
     (lambda (window)
       (select-window window)
       (end-of-buffer)
       (recenter 0)))))

(defun shells-copy-input ()
  (interactive)
  (kill-ring-save (comint-line-beginning-position) (buffer-end 1))
  (shells-for-each
   (lambda (_)
     (end-of-buffer)
     (delete-region (comint-line-beginning-position) (buffer-end 1))
     (yank))))

(defun shells-send-input ()
  (interactive)
  (shells-for-each (lambda (_) (comint-send-input))))

;;;

(defun shells-for-each (for-each-func)
  (filter-map-windows
   (lambda (window)
     (with-current-buffer (window-buffer window)
       (eq 'shell-mode major-mode)))
   (lambda (window)
     (with-current-buffer (window-buffer window)
       (funcall for-each-func window)))))

;;;

(defun filter-map-windows (window-pred window-func)
  (mapcar (lambda (window) (funcall window-func window))
          (cl-remove-if-not window-pred (window-list))))

(defmacro save-selected-window (&rest body)
  "Save the selected window; execute BODY; select the saved window."
  (let ((window-gs (gensym "window")))
    `(let ((,window-gs (selected-window)))
       ,@body
       (select-window ,window-gs))))

(provide 'shells-minor-mode)
