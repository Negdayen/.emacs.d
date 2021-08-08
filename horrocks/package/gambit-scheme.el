(require 'cmuscheme)
(require 'scheme)
(require 'scheme-x)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; constant data concerning gambit scheme ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst gambit-scheme-syntax
  '(
    ("##define"        1)
    ("##include"       0)
    ("##lambda"        1)
    ("##namespace"     0)
    ("c-declare"       0)
    ("c-define"        5)
    ("c-define-lambda" 2)
    ("c-define-type"   0)
    ("c-initialize"    0)
    ("c-lambda"        2)
    ))

;;;;;;;;;;;;;;;
;; customize ;;
;;;;;;;;;;;;;;;

(defgroup gambit-scheme nil "" :version "27.1")

(defcustom gambit-scheme-compiler "gsc"
  "Gambit Scheme compiler"
  :group 'gambit-scheme
  :type 'file)

(defcustom gambit-scheme-interpreter "gsi"
  "Gambit Scheme interpreter"
  :group 'gambit-scheme
  :type 'file)

(defcustom gambit-scheme-repl "gsc"
  "Gambit Scheme REPL"
  :group 'gambit-scheme
  :type 'string)

(defcustom gambit-scheme-repl-buffer-name "*gambit-scheme*"
  "Gambit Scheme REPL buffer name"
  :group 'gambit-scheme
  :type 'string)

(defcustom gambit-scheme-runtime-options "-:d-"
  "Gambit Scheme runtime options"
  :group 'gambit-scheme
  :type 'string)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; global customizations ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;,----------
;;| auto mode
;;`----------

(add-to-list 'interpreter-mode-alist '("\\(gambit-\\)?gs[ci].*" . gambit-scheme-mode))

(defconst gambit-scheme-auto-mode
  '("\\(\\.scm\\|\\.sld\\|\\.ss\\)$" . gambit-scheme-mode))

(defun gambit-scheme-enable-auto-mode ()
  (interactive)
  (setq auto-mode-alist
        (cons gambit-scheme-auto-mode
              (if (member gambit-scheme-auto-mode auto-mode-alist)
                  (remove gambit-scheme-auto-mode auto-mode-alist)
                auto-mode-alist))))

(defun gambit-scheme-disable-auto-mode ()
  (interactive)
  (setq auto-mode-alist (remove gambit-scheme-auto-mode auto-mode-alist)))

;;,-------------------------------
;;| compilation mode error regexps
;;`-------------------------------

(with-eval-after-load 'compile
  (dolist
      (compilation-regexp
       `((gambit-scheme-file-error
          ,(rx (and "\""
                    (group (+ (not (any "\""))))
                    "\"@"
                    (group (+ digit))
                    "."
                    (group (+ digit))))
          1 2 3)
         (gambit-scheme-console-error "\\((console)\\)@\\([0-9]+\\)\\.\\([0-9]+\\)[^0-9]" 1 2 3)
         (gambit-scheme-stdin-error "\\((stdin)\\)@\\([0-9]+\\)\\.\\([0-9]+\\)[^0-9]" 1 2 3)))
    (pushnew compilation-regexp compilation-error-regexp-alist-alist)
    (pushnew (car compilation-regexp) compilation-error-regexp-alist)))

;;;;;;;;;;
;; repl ;;
;;;;;;;;;;

(defun run-gambit-scheme ()
  (interactive)
  (run-scheme (concat gambit-scheme-repl " " gambit-scheme-runtime-options))
  (with-current-buffer "*scheme*"
    (rename-buffer gambit-scheme-repl-buffer-name t)
    (inferior-gambit-scheme-mode)))

;;,--------------------
;;| repl comma commands
;;`--------------------

(defun gambit-step-continuation ()
  (interactive)
  (scheme-send-string "#||#,s;"))

(defun gambit-leap-continuation ()
  (interactive)
  (scheme-send-string "#||#,l;"))

(defun gambit-continue ()
  (interactive)
  (scheme-send-string "#||#,c;"))

(defun gambit-environment ()
  (interactive)
  (scheme-send-string "#||#,e;"))

(defun gambit-backtrace ()
  (interactive)
  (scheme-send-string "#||#,b;"))

(defun gambit-crawl-backtrace-newer ()
  (interactive)
  (scheme-send-string "#||#,-;"))

(defun gambit-crawl-backtrace-older ()
  (interactive)
  (scheme-send-string "#||#,+;"))

;; TODO define REPL commands hydra
;; (when (require 'hydra "hydra" t))

;;;;;;;;;;
;; help ;;
;;;;;;;;;;

;;,-----------
;;| completion
;;`-----------

(defun gambit-scheme-completion-at-point-function ()
  "Completion at point function using `gambit-scheme-symbols` as backend."
  (let ((bounds (bounds-of-thing-at-point 'symbol)))
    (when bounds (list (car bounds) (cdr bounds) (gambit-scheme-symbols)))))

(defun gambit-scheme-symbols ()
  "Return list of Gambit Scheme symbol names from running Gambit Scheme REPL or
gambit-scheme-interpreter subprocess."
  (let ((repl (get-buffer gambit-scheme-repl-buffer-name))
        (gambit-symbols-sexp "(##symbol-table-foldl (lambda (_ e) (pp e)) '())"))
    (if repl
        (with-current-buffer repl
          (comint-redirect-results-list gambit-symbols-sexp "\\(.*\\)\n" 1))
      (shell-command-to-list
       (format "%s -e \"%s\"" gambit-scheme-compiler gambit-symbols-sexp)))))

;;,------
;;| eldoc
;;`------

(defun gambit-scheme-eldoc-documentation-function ()
  "Return the parameter list of a Gambit Scheme function as a string, if
  available."
  (if-let ((repl (get-buffer gambit-scheme-repl-buffer-name))
           (current-symbol (save-excursion (sp-beginning-of-sexp) (symbol-at-point)))
           (maybe-doc-string-code
            (format
             "(let ((obj (with-exception-catcher (lambda (e) #f) (lambda () %s))))
                (if (and obj (procedure? obj))
                    (let ((maybe-lambda-list (##decompile obj)))
                      (if (list? maybe-lambda-list)
                          (cadr maybe-lambda-list)))))"
             (symbol-name current-symbol))))
      (if-let ((parameter-list-string
                (with-current-buffer repl
                  (comint-redirect-results-list maybe-doc-string-code "\\(.*\\)\n" 1))))
          (car parameter-list-string)
        "")
    ""))

;;,-------------------------------
;;| info-lookup-symbol integration
;;`-------------------------------

(with-eval-after-load 'info-look
  (info-lookup-add-help
   :mode 'gambit-scheme-mode
   :regexp "[^()`'‘’,\" \t\n]+"
   :ignore-case nil
   :doc-spec '(("(gambit)General Index" nil "^[ \t]+-+ [^:]+:[ \t]*" "\\b"))))

;;;;;;;;;;;;;;;;;;;;;;;;;
;; gambit scheme modes ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(defun gambit-scheme--setup-mode-commonalities ()
  (setq-local completion-at-point-functions '(gambit-scheme-completion-at-point-function))
  (setq-local eldoc-documentation-function 'gambit-scheme-eldoc-documentation-function)
  (setq-local scheme-buffer gambit-scheme-repl-buffer-name))

(define-derived-mode gambit-scheme-mode
  scheme-mode
  "gambit-scheme"
  "Major mode for Gambit Scheme."
  (gambit-scheme--setup-mode-commonalities))

(define-derived-mode inferior-gambit-scheme-mode
  inferior-scheme-mode
  "inferior-gambit-scheme"
  "Major mode for interacting with an inferior Gambit Scheme process."
  (setq-local comint-prompt-regexp "^[0-9]*> ")
  (gambit-scheme--setup-mode-commonalities))

;;,--------------
;;| syntax tables
;;`--------------

(dolist (syntax-table (list gambit-scheme-mode-syntax-table
                            inferior-gambit-scheme-mode-syntax-table))
  ;; Mark the '#' character as being a symbol constituent
  (modify-syntax-entry ?# "_" syntax-table))

;;;;;;;;;;;;;;;
;; font lock ;;
;;;;;;;;;;;;;;;

(defconst gambit-scheme-font-lock-keywords-syntax
  (cons (regexp-opt (mapcar #'car gambit-scheme-syntax)
                    'symbols)
        'font-lock-keyword-face))

(defun gambit-scheme-add-font-locks ()
  "Add gambit scheme font-locks to the current buffer."
  (font-lock-add-keywords
   nil
   (list gambit-scheme-font-lock-keywords-syntax)))

;;;;;;;;;;;;;;;;;
;; indentation ;;
;;;;;;;;;;;;;;;;;

(defun gambit-scheme-put-default-indent-values ()
  ""
  (scheme-x-put-indent-values gambit-scheme-syntax))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; poly gambit scheme mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(with-eval-after-load 'polymode

  (define-hostmode poly-gambit-scheme-hostmode
    :mode 'gambit-scheme-mode)

  (define-innermode poly-gambit-scheme-c-innermode
    :mode 'c-mode
    :head-matcher "^[^;]*#<<c$"
    :tail-matcher "^c$"
    :head-mode 'gambit-scheme-mode
    :tail-mode 'gambit-scheme-mode)

  (define-innermode poly-gambit-scheme-c++-innermode
    :mode 'c++-mode
    :head-matcher "^[^;]*#<<c\\+\\+$"
    :tail-matcher "^c\\+\\+$"
    :head-mode 'gambit-scheme-mode
    :tail-mode 'gambit-scheme-mode)

  (define-innermode poly-gambit-scheme-glsl-innermode
    :mode 'glsl-mode
    :head-matcher "^[^;]*#<<glsl$"
    :tail-matcher "^glsl$"
    :head-mode 'gambit-scheme-mode
    :tail-mode 'gambit-scheme-mode)

  (define-innermode poly-gambit-scheme-js-innermode
    :mode 'js-mode
    :head-matcher "^[^;]*#<<js$"
    :tail-matcher "^js$"
    :head-mode 'gambit-scheme-mode
    :tail-mode 'gambit-scheme-mode)

  (define-innermode poly-gambit-scheme-org-innermode
    :mode 'org-mode
    :head-matcher "^[^;]*#<<org$"
    :tail-matcher "^org$"
    :head-mode 'gambit-scheme-mode
    :tail-mode 'gambit-scheme-mode)

  (define-innermode poly-gambit-scheme-python-innermode
    :mode 'python-mode
    :head-matcher "^[^;]*#<<python$"
    :tail-matcher "^python$"
    :head-mode 'gambit-scheme-mode
    :tail-mode 'gambit-scheme-mode)

  (define-polymode poly-gambit-scheme-mode
    :hostmode 'poly-gambit-scheme-hostmode
    :innermodes '(poly-gambit-scheme-c-innermode
                  poly-gambit-scheme-c++-innermode
                  poly-gambit-scheme-glsl-innermode
                  poly-gambit-scheme-js-innermode
                  poly-gambit-scheme-org-innermode
                  poly-gambit-scheme-python-innermode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; default configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun gambit-scheme-default-configuration ()
  ""
  (dolist (hook '(gambit-scheme-mode-hook
                  inferior-gambit-scheme-mode-hook))
    (dolist (func '(eldoc-mode
                    gambit-scheme-add-font-locks
                    gambit-scheme-put-default-indent-values))
      (add-hook hook func))))

;;

(provide 'gambit-scheme)
