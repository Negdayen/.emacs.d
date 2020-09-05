(require 'cl)

;===============================================================================
;                             Top Level
;===============================================================================

(defun counsel-tramp ()
  "`tramp-shell` into a host's home directory."
  (interactive)
  (ivy-read
   "SSH into: "
   (/etc/hosts)
   :action (lambda (host) (tramp-shell (format "/sshx:%s:/home/" host)))
   :sort t))

(defun counsel-tramp-root-shell ()
  "`tramp-root-shell` with a host from /etc/hosts."
  (interactive)
  (ivy-read
   "SSH into: "
   (/etc/hosts)
   :action 'tramp-root-shell
   :sort t))

(defun tramp-root-shell (hostname)
  "Start a shell as root at HOSTNAME's home directory."
  (interactive)
  (tramp-shell (format "/sshx:%s|sudo:root@%s:/home" hostname hostname)))

(defun tramp-shell (path)
  "Start a shell at PATH in buffer named PATH"
  (interactive)
  (let ((default-directory path)
        (explicit-shell-file-name "/bin/bash"))
    (shell path)))

;===============================================================================

(defun counsel-rdc ()
  "RDC into a host from /etc/hosts"
  (interactive)
  (ivy-read
   "RDC into: "
   (/etc/hosts)
   :action 'rdc
   :sort t))

(defun rdc (host)
  "Connect to a host using Microsoft's Remote Desktop Connection"
  (interactive "MHost: ")
  (start-process "RDC" nil "mstsc" (format "-v:%s" host) "-prompt"))

;===============================================================================

(defun counsel-host-term ()
  "`remote-host-term` into a host from /etc/hosts."
  (interactive)
  (ivy-read
   "SSH into: "
   (/etc/hosts)
   :action 'remote-term
   :sort t))

(defun remote-host-term (host)
  "Open a term and ssh in to HOST"
  (interactive "MHost: ")
  (with-current-buffer (term "/bin/bash")
    (insert (format "ssh %s" host))
    (term-send-input)
    (rename-buffer (concat host " term"))))

;===============================================================================
;                           Helper Functions
;===============================================================================

(defun /etc/hosts ()
  "Return list of IP addresses and hostnames in /etc/hosts."
  (shell-command-to-list "grep -v '^#' /etc/hosts | tr '[:blank:]' '\n'"))

;==============================================================================
;                          Probably Worthless
;==============================================================================

(defun grep-canonical-hostnames (&rest patterns)
  "Return list of hostnames matching PATTERNS from /etc/hosts, each of which is
a string used as the arguments to a successively piped grep command"
  (shell-command-to-list
   (format
    "grep -v '^#' /etc/hosts | awk '{print $2}' %s"
    (apply #'concat
           (mapcar (lambda (pattern) (concat "| grep "pattern" "))
                   patterns)))))

;; untested
(defun remote-host-terms (&rest patterns)
  (let* ((hosts (apply #'grep-canonical-hostnames patterns)))
    (when (< (length hosts) 6)
      (layout/grid 2 3)
      (cl-mapcar
       (lambda (host window)
         (select-window window)
         (remote-host-term host))
       hosts
       (-take (length hosts) (window-list))))))

;===============================================================================

(provide 'counsel-remote)
