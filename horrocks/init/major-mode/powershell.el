(defun powershell-command (powershell-command-string)
  (concat powershell-command-string "\nprompt\n"))

(defun powershell-completion-at-point-function ()
  (let ((bounds (bounds-of-thing-at-point 'symbol)))
    (when bounds (list (car bounds) (cdr bounds) (powershell-get-command-completions)))))

(defun powershell-get-command-completions ()
  (if-let ((powershell-get-commands "Get-Command | Format-Table -Property Name -HideTableHeaders")
           (powershell-proc (powershell-proc)))
      (comint-redirect-results-list-from-process
       powershell-proc
       (powershell-command powershell-get-commands)
       (rx (group (zero-or-more (not whitespace))) (zero-or-more whitespace) "\n")
       1)
    (shell-command-to-list 
     (format "powershell '%s' | sed 's|[ ]*$||'" powershell-get-commands))))

(defun powershell-get-help (powershell-symbol)
  (with-output-to-temp-buffer "*PowerShell Help*"
    (princ
     (shell-command-to-string
      (format
       "powershell Get-Help -full %s | sed 's|$||'"
       powershell-symbol)))))

(defun powershell-proc ()
  (get-buffer-process
   (car
    (cl-remove-if-not
     (lambda (buffer)
       (with-current-buffer buffer
         (eq comint-input-sender 'powershell-simple-send)))
     (buffer-list)))))

(defun counsel-powershell-get-help ()
  (interactive)
  (ivy-read
   "Get-Help: "
   (powershell-get-command-completions)
   :action (lambda (symbol) (powershell-get-help symbol))
   :preselect (symbol-at-point)
   :sort t))
