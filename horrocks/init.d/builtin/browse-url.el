(cond
 ((eq system-type 'gnu/linux)
  (defun browse-url-web-browser (url &optional new-window)
    (shell-command (format "web-browser %s" url)))
  (setq browse-url-browser-function 'browse-url-web-browser))

 ((or (eq system-type 'cygwin)
      (eq system-type 'windows-nt))
  (defun browse-url-edge (url &optional new-window)
    (shell-command (concat "powershell start microsoft-edge:" url)))
  (setq browse-url-browser-function 'browse-url-edge)))
