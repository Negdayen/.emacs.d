(defun browse-url-edge (url &optional new-window)
  (interactive (browse-url-interactive-arg "URL: "))
  ;; TODO support opening in new window
  (shell-command (concat "powershell start microsoft-edge:" url)))

(defun browse-url-qutebrowser (url &optional new-window)
  (interactive (browse-url-interactive-arg "URL: "))
  (let* ((use-new-window (or (browse-url-maybe-new-window new-window) browse-url-new-window-flag))
         (use-new-window (if current-prefix-arg (not use-new-window) use-new-window)))
    (shell-command
     (format "qutebrowser %s %s" (if use-new-window "--target window" "") url))))

(require 'cl)
(case system-type
  ((gnu/linux)
   (customize-setq browse-url-browser-function 'browse-url-qutebrowser))
  ((cygwin windows-nt)
   (customize-setq browse-url-browser-function 'browse-url-edge)))
