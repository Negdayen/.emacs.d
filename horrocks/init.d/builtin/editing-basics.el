(customize-setq
 ;; change-major-mode-with-file-name
 delete-selection-mode t
 global-mark-ring-max 32
 ;; goal-column
 ;; line-move-ignore-invisible
 line-move-visual t
 mark-even-if-inactive nil
 mark-ring-max 32
 mode-require-final-newline 'visit-save
 next-line-add-newlines nil
 ;; normal-erase-is-backspace
 ;; open-paren-in-column-0-is-defun-start
 ;; parse-sexp-ignore-comments
 read-quoted-char-radix 10
 require-final-newline 'sure-why-not
 set-mark-command-repeat-pop t
 shift-select-mode nil
 ;; show-trailing-whitespace nil ;this is handled by whitespace-mode
 tab-width 4
 track-eol nil
 transient-mark-mode nil
 use-empty-active-region nil
 ;; words-include-escapes
 )

(put 'set-goal-column 'disabled nil)

(setq sort-fold-case t)
