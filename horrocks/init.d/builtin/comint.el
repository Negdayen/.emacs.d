(customize-setq
 ;; comint-buffer-maximum-size
 comint-eol-on-send t
 ;; comint-exec-hook
 ;; comint-history-isearch
 comint-input-autoexpand nil
 comint-input-ignoredups t
 ;; comint-input-ring-file-name
 ;; comint-input-ring-size
 ;; comint-mode-hook
 ;; comint-move-point-for-matching-input
 comint-move-point-for-output nil
 ;; comint-password-prompt-regexp
 ;; comint-process-echoes
 comint-prompt-read-only t
 ;; comint-redirect-verbose
 comint-scroll-show-maximum-output t
 comint-scroll-to-bottom-on-input nil
 ;; comint-terminfo-terminal
 comint-use-prompt-regexp nil
 )

(customize-setq
 comint-completion-addsuffix t
 comint-completion-autolist nil
 comint-completion-fignore nil
 comint-completion-recexact nil
 )

(remove-hook 'comint-output-filter-functions 'comint-postoutput-scroll-to-bottom)
;; (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
;; (add-hook 'comint-output-filter-functions 'comint-truncate-buffer)
