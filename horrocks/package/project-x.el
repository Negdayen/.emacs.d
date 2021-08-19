(require 'dash)
(require 'project)

(defun project-x-get-same-major-mode-buffers ()
  "Return a list of buffers in the current project that share the same major mode as the
current buffer."
  (let ((visible-buffer-major-mode major-mode))
    (-filter (lambda (buffer)
               (equalp visible-buffer-major-mode
                       (buffer-local-value 'major-mode buffer)))
             (project--buffer-list (project-current)))))


(when (require 'ivy "ivy" t)

  (defun project-x-switch-to-same-major-mode-buffer ()
    "Switch to another buffer with the same major mode as the current buffer in the
current project."
    (interactive)
    ;; These keyword options were taken from the definition of ivy-switch-buffer.
    (ivy-read "Switch to buffer:"
              (mapcar 'buffer-name (project-x-get-same-major-mode-buffers))
              :action #'ivy--switch-buffer-action
              :caller 'ivy-switch-buffer
              :keymap ivy-switch-buffer-map
              :matcher #'ivy--switch-buffer-matcher
              :preselect (buffer-name (other-buffer (current-buffer))))))

(provide 'project-x)
