(defun switch-all-to-buffer (buffer-or-name)
  "Switch all windows to BUFFER-OR-NAME"
  (interactive "BSwitch all to buffer:")
  (dolist (window (window-list))
    (set-window-buffer window buffer-or-name)))

(defun switch-scratch-to-buffer (buffer-or-name)
  "Switch to buffer BUFFER-OR-NAME, using the first window displaying the
*scratch* buffer"
  (interactive "bBuffer: ")
  (let ((continue t)
        (windows (window-list)))
    (while continue
      (if (string-equal "*scratch*" (buffer-name (window-buffer (car windows))))
          (progn
            (setq continue nil)
            (winum--switch-to-window (car windows))
            (switch-to-buffer buffer-or-name))
        (setq windows (cdr windows))))))
