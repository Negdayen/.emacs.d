(customize-setq
 ;; explicit-shell-file-name
 ;; term-buffer-maximum-size
 ;; term-char-mode-buffer-read-only
 ;; term-char-mode-point-at-process-mark
 ;; term-completion-addsuffix
 ;; term-completion-autolist
 ;; term-completion-fignore
 ;; term-completion-recexact
 ;; term-default-bg-color
 ;; term-default-fg-color
 ;; term-eol-on-send
 ;; term-exec-hook
 ;; term-input-autoexpand
 ;; term-input-chunk-size
 ;; term-input-ignoredups
 ;; term-input-ring-file-name
 ;; term-scroll-show-maximum-output
 ;; term-scroll-to-bottom-on-output
 ;; term-suppress-hard-newline
 )

;; Start in term-line-mode.
(advice-add 'term :after  (lambda (&rest ignored) (term-line-mode)))

;; Makes more sense than ?\C-c default.
(eval-after-load 'term
  '(progn
     (define-key term-mode-map (kbd "C-c C-h") 'term-dynamic-list-input-ring)
     (define-key term-mode-map (kbd "C-x C-x") 'term-char-mode)

     (term-set-escape-char ?\C-x)
     (define-key term-raw-map (kbd "C-x C-j") nil)
     (define-key term-raw-map (kbd "C-x C-x") 'term-line-mode)))
