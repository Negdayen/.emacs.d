;; This is an amalgamation of Paredit and Smartparens bindings, plus
;; a few of my own.

(use-package smartparens
  :bind (:map smartparens-mode-map

              ;; Navigation

              ("C-M-f" . sp-forward-sexp)
              ("C-M-b" . sp-backward-sexp)

              ("C-M-u" . sp-backward-up-sexp)
              ("C-M-d" . sp-down-sexp)

              ("C-M-n" . sp-next-sexp)
              ("C-M-p" . sp-previous-sexp)
              ("C-M-N" . sp-backward-down-sexp)
              ("C-M-P" . sp-up-sexp)

              ("C-M-a" . sp-beginning-of-sexp)
              ("C-M-e" . sp-end-of-sexp)

              ("M-F" . sp-forward-symbol)
              ("M-B" . sp-backward-symbol)

              ;; Kill Ring

              ("<C-M-backspace>" . sp-backward-kill-sexp)
              ("C-M-h" . sp-backward-kill-sexp)
              ("C-M-k" . sp-kill-sexp)
              ("C-M-w" . sp-copy-sexp)

              ;; Slurping and Barfing

              ("C-(" . sp-backward-slurp-sexp)
              ("C-{" . sp-backward-barf-sexp)

              ("C-)" . sp-forward-slurp-sexp)
              ("C-}" . sp-forward-barf-sexp)

              ("C-M-(" . sp-add-to-next-sexp)
              ("C-M-)" . sp-add-to-previous-sexp)

              ;; Select Region

              ("C-]" . sp-select-next-thing-exchange)
              ("C-M-]" . sp-select-next-thing)
              )
  :commands (smartparens-global-mode
             smartparens-mode
             smartparens-strict-mode)
  :init
  (show-smartparens-global-mode 1)
  (smartparens-global-mode)
  :config
  (sp-local-pair sp-lisp-modes "`" "`" :actions nil)

  ;; (sp-with-modes '(html-mode sgml-mode) (sp-local-pair "<" ">"))
  ;; (setq
  ;;  sp-highlight-pair-overlay nil
  ;;  sp-highlight-wrap-overlay nil
  ;;  sp-highlight-wrap-tag-overlay nil)
  )

(defun sp-backwards-top-level (arg)
  (interactive "p")
  (beginning-of-defun arg))

(defun sp-forwards-top-level (arg)
  (interactive "p")
  (beginning-of-defun (- arg)))

(defun sp-kill-sexp-backwards (arg)
  (interactive "p")
  (dotimes (_ arg) (sp-kill-sexp -1)))
