(defun toggle-window-dedication ()
  "Toggle whether a window is dedicated to its buffer."
  (interactive)
  (if (let (window (get-buffer-window (current-buffer)))
        (set-window-dedicated-p window (not (window-dedicated-p window))))
      (message "Window is now dedicated")
    (message "Window is now undedicated")))

(provide 'window-dedication)
