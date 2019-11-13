(use-package powershell)

(customize-setq
 ;; explicit-powershell.exe-args
 ;; powershell-continuation-indent
 ;; powershell-continued-regexp
 ;; powershell-eldoc-def-files
 ;; powershell-indent

 powershell-location-of-exe
 (cond
  ((eq 'cygwin system-type)
   (shell-command-to-string (format "cygpath '%s' | tr -d '\n'"
                                    powershell-location-of-exe)))
  (t powershell-location-of-exe))

 ;; powershell-log-level
 ;; powershell-squish-results-of-silent-commands
 )
