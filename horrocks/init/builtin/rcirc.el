(customize-setq
 ;; rcirc-always-use-server-buffer-flag
 ;; rcirc-authenticate-before-join
 ;; rcirc-authinfo
 ;; rcirc-auto-authenticate-flag
 ;; rcirc-bright-nicks
 ;; rcirc-buffer-maximum-lines
 ;; rcirc-coding-system-alist
 ;; rcirc-decode-coding-system
 ;; rcirc-default-full-name
 ;; rcirc-default-nick
 ;; rcirc-default-port
 ;; rcirc-default-user-name
 ;; rcirc-dim-nicks
 ;; rcirc-encode-coding-system
 ;; rcirc-fill-column
 ;; rcirc-fill-flag
 ;; rcirc-fill-prefix
 ;; rcirc-ignore-list
 ;; rcirc-input-ring-size
 ;; rcirc-keywords
 ;; rcirc-kill-channel-buffers
 ;; rcirc-log-directory
 ;; rcirc-log-filename-function
 ;; rcirc-log-flag
 ;; rcirc-log-process-buffers
 ;; rcirc-multiline-major-mode
 ;; rcirc-nick-completion-format
 ;; rcirc-omit-responses
 ;; rcirc-omit-threshold
 ;; rcirc-print-functions
 ;; rcirc-prompt
 ;; rcirc-read-only-flag
 ;; rcirc-reconnect-delay
 ;; rcirc-response-formats
 ;; rcirc-scroll-show-maximum-output
 ;; rcirc-server-alist
 ;; rcirc-time-format
 ;; rcirc-track-minor-mode
 )

(use-package rcirc
  :bind (:map rcirc-mode-map
              ( "C-c C-r" . rcirc-cmd-reconnect))
  :hook (rcirc-mode . rcirc-omit-mode))
