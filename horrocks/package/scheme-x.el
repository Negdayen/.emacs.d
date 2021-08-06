;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; constant data concerning Scheme ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst scheme-standard-libraries
  '((scheme base)
    (scheme case-lambda)
    (scheme char)
    (scheme complex)
    (scheme cxr)
    (scheme eval)
    (scheme file)
    (scheme inexact)
    (scheme lazy)
    (scheme load)
    (scheme process-context)
    (scheme r5rs)
    (scheme read)
    (scheme repl)
    (scheme time)
    (scheme write)))

(defconst scheme-standard-procedures
  (list
   "*" "+" "-" "/" "<" "<=" "=" ">" ">=" "abs" "acos" "and" "angle" "append" "apply"
   "asin" "assoc" "assq" "assv" "atan" "boolean?" "caar" "cadr"
   "call-with-current-continuation" "call-with-input-file" "call-with-output-file"
   "call-with-values" "car" "case" "cdddar" "cddddr" "cdr" "ceiling" "char->integer"
   "char-alphabetic?" "char-ci<=?"  "char-ci<?" "char-ci=?" "char-ci>=?" "char-ci>?"
   "char-downcase" "char-lower-case?" "char-numeric?" "char-ready?" "char-upcase"
   "char-upper-case?" "char-whitespace?" "char<=?" "char<?" "char=?"  "char>=?" "char>?"
   "char?" "close-input-port" "close-output-port" "complex?" "cons" "cos"
   "current-input-port" "current-output-port" "denominator" "display" "dynamic-wind"
   "eof-object?" "eq?" "equal?"  "eqv?" "eval" "even?" "exact" "exact->inexact" "exact?"
   "exp" "expt" "floor" "for-each" "force" "gcd" "imag-part" "inexact" "inexact->exact"
   "inexact?" "input-port?" "integer->char" "integer?" "interaction-environment" "lcm"
   "length" "list" "list->string" "list->vector" "list-ref" "list-tail" "list?" "load"
   "log" "magnitude" "make-polar" "make-rectangular" "make-string" "make-vector" "map"
   "max" "member" "memq" "memv" "min" "modulo" "negative?" "newline" "not"
   "null-environment" "null?" "number" "number->string" "number?" "numerator" "odd?"
   "open-input-file" "open-output-file" "output-port?" "pair?" "peek-char" "port?"
   "positive?" "procedure?" "quotient" "rational?" "read" "read-char" "real-part" "real?"
   "remainder" "reverse" "round" "sin" "sqrt" "string" "string->list" "string->number"
   "string->symbol" "string-append" "string-ci<=?" "string-ci<?" "string-ci=?"
   "string-ci>=?" "string-ci>?"  "string-copy" "string-fill!" "string-length" "string-ref"
   "string-set!"  "string<=?" "string<?" "string=?" "string>=?" "string>?" "string?"
   "substring" "symbol->string" "symbol?" "tan" "transcript-off" "transcript-on"
   "truncate" "values" "vector" "vector->list" "vector-fill!" "vector-length" "vector-ref"
   "vector-set!" "vector?"  "with-input-from-file" "with-output-to-file" "write"
   "write-char" "zero?"
   ))

(defconst scheme-standard-literals
  '(
    "#\\@" "#\\newline" "#\\return" "#\\space" "#f" "#false" "#true" "+inf.0" "-inf.0"
    "#t"
    ))

(defconst scheme-standard-reader-syntax
  '("`" "'" "," ",@" "#'"))

(defconst scheme-nonstandard-reader-syntax
  '("#'"))

(defconst scheme-standard-syntax
  '(
    ("..."              0)
    ("=>"               0)
    ("and"              0)
    ("begin"            0)
    ("cond"             0)
    ("cond-expand"      0)
    ("define"           1)
    ("define-library"   1)
    ("define-syntax"    1)
    ("delay"            0)
    ("do"               1)
    ("else"             0)
    ("export"           0)
    ("if"               0)
    ("import"           0)
    ("lambda"           1)
    ("let"              1)
    ("let*"             1)
    ("let-syntax"       1)
    ("letrec"           1)
    ("letrec-syntax"    1)
    ("or"               0)
    ("quasiquote"       0)
    ("quote"            0)
    ("set!"             0)
    ("set-car!"         0)
    ("set-cdr!"         0)
    ("syntax-rules"     1)
    ("unless"           1)
    ("unquote"          0)
    ("unquote-splicing" 0)
    ("when"             1)
    ("while"            1)
    ))

(defconst scheme-srfi-syntax
  '(
    ("<...>"              0)
    ("<>"                 0)
    ("cut"                0)
    ("cute"               0)
    ("define-record-type" 3)
    ("parameterize"       1)
    ("receive"            2)
    ("stream-cons"        0)
    ("syntax-case"        1)
    ))

(defconst scheme-nonstandard-syntax
  '(
    ("aif"                1)
    ("alet"               1)
    ("assert"             0)
    ("def"                1)
    ("define-er-macro"    1)
    ("define-ir-macro"    1)
    ("define-macro"       1)
    ("define-record"      3)
    ("define-syntax-rule" 1)
    ("fluid-let"          1)
    ("include"            0)
    ("match-bind"         2)
    ("match-case"         1)
    ("match-lambda"       0)
    ("match-let"          1)
    ("match-let*"         1)
    ("nlambda"            1)
    ("with-gensyms"       1)
    ))

(defconst scheme-srfis
  '(("SRFI 0: Feature-based conditional expansion construct" final (srfi 0))
    ("SRFI 1: List Library" final (srfi 1))
    ("SRFI 2: AND-LET*: an AND with local bindings, a guarded LET* special form" final (srfi 2))
    ("SRFI 4: Homogeneous numeric vector datatypes" final (srfi 4))
    ("SRFI 5: A compatible let form with signatures and rest arguments" final (srfi 5))
    ("SRFI 6: Basic String Ports" final (srfi 6))
    ("SRFI 7: Feature-based program configuration language" final (srfi 7))
    ("SRFI 8: receive: Binding to multiple values" final (srfi 8))
    ("SRFI 9: Defining Record Types" final (srfi 9))
    ("SRFI 10: #, external form" final (srfi 10))
    ("SRFI 11: Syntax for receiving multiple values" final (srfi 11))
    ("SRFI 13: String Libraries" final (srfi 13))
    ("SRFI 14: Character-set Library" final (srfi 14))
    ("SRFI 16: Syntax for procedures of variable arity" final (srfi 16))
    ("SRFI 17: Generalized set!" final (srfi 17))
    ("SRFI 18: Multithreading support" final (srfi 18))
    ("SRFI 19: Time Data Types and Procedures" final (srfi 19))
    ("SRFI 21: Real-time multithreading support" final (srfi 21))
    ("SRFI 22: Running Scheme Scripts on Unix" final (srfi 22))
    ("SRFI 23: Error reporting mechanism" final (srfi 23))
    ("SRFI 25: Multi-dimensional Array Primitives" final (srfi 25))
    ("SRFI 26: Notation for Specializing Parameters without Currying" final (srfi 26))
    ("SRFI 27: Sources of Random Bits" final (srfi 27))
    ("SRFI 28: Basic Format Strings" final (srfi 28))
    ("SRFI 29: Localization" final (srfi 29))
    ("SRFI 30: Nested Multi-line Comments" final (srfi 30))
    ("SRFI 31: A special form `rec' for recursive evaluation" final (srfi 31))
    ("SRFI 34: Exception Handling for Programs" final (srfi 34))
    ("SRFI 35: Conditions" final (srfi 35))
    ("SRFI 36: I/O Conditions" final (srfi 36))
    ("SRFI 37: args-fold: a program argument processor" final (srfi 37))
    ("SRFI 38: External Representation for Data With Shared Structure" final (srfi 38))
    ("SRFI 39: Parameter objects" final (srfi 39))
    ("SRFI 41: Streams" final (srfi 41))
    ("SRFI 42: Eager Comprehensions" final (srfi 42))
    ("SRFI 43: Vector library" final (srfi 43))
    ("SRFI 44: Collections" final (srfi 44))
    ("SRFI 45: Primitives for Expressing Iterative Lazy Algorithms" final (srfi 45))
    ("SRFI 46: Basic Syntax-rules Extensions" final (srfi 46))
    ("SRFI 47: Array" final (srfi 47))
    ("SRFI 48: Intermediate Format Strings" final (srfi 48))
    ("SRFI 49: Indentation-sensitive syntax" final (srfi 49))
    ("SRFI 51: Handling rest list" final (srfi 51))
    ("SRFI 54: Formatting" final (srfi 54))
    ("SRFI 55: require-extension" final (srfi 55))
    ("SRFI 57: Records" final (srfi 57))
    ("SRFI 58: Array Notation" final (srfi 58))
    ("SRFI 59: Vicinity" final (srfi 59))
    ("SRFI 60: Integers as Bits" final (srfi 60))
    ("SRFI 61: A more general cond clause" final (srfi 61))
    ("SRFI 62: S-expression comments" final (srfi 62))
    ("SRFI 63: Homogeneous and Heterogeneous Arrays" final (srfi 63))
    ("SRFI 64: A Scheme API for test suites" final (srfi 64))
    ("SRFI 66: Octet Vectors" final (srfi 66))
    ("SRFI 67: Compare Procedures" final (srfi 67))
    ("SRFI 69: Basic hash tables" final (srfi 69))
    ("SRFI 70: Numbers" final (srfi 70))
    ("SRFI 71: Extended LET-syntax for multiple values" final (srfi 71))
    ("SRFI 72: Hygienic macros" final (srfi 72))
    ("SRFI 74: Octet-Addressed Binary Blocks" final (srfi 74))
    ("SRFI 78: Lightweight testing" final (srfi 78))
    ("SRFI 86: MU and NU simulating VALUES & CALL-WITH-VALUES, and their related LET-syntax" final (srfi 86))
    ("SRFI 87: => in case clauses" final (srfi 87))
    ("SRFI 88: Keyword objects" final (srfi 88))
    ("SRFI 89: Optional positional and named parameters" final (srfi 89))
    ("SRFI 90: Extensible hash table constructor" final (srfi 90))
    ("SRFI 94: Type-Restricted Numerical Functions" final (srfi 94))
    ("SRFI 95: Sorting and Merging" final (srfi 95))
    ("SRFI 96: SLIB Prerequisites" final (srfi 96))
    ("SRFI 97: SRFI Libraries" final (srfi 97))
    ("SRFI 98: An interface to access environment variables" final (srfi 98))
    ("SRFI 99: ERR5RS Records" final (srfi 99))
    ("SRFI 100: define-lambda-object" final (srfi 100))
    ("SRFI 101: Purely Functional Random-Access Pairs and Lists" final (srfi 101))
    ("SRFI 105: Curly-infix-expressions" final (srfi 105))
    ("SRFI 106: Basic socket interface" final (srfi 106))
    ("SRFI 107: XML reader syntax" final (srfi 107))
    ("SRFI 108: Named quasi-literal constructors" final (srfi 108))
    ("SRFI 109: Extended string quasi-literals" final (srfi 109))
    ("SRFI 110: Sweet-expressions (t-expressions)" final (srfi 110))
    ("SRFI 111: Boxes" final (srfi 111))
    ("SRFI 112: Environment Inquiry" final (srfi 112))
    ("SRFI 113: Sets and bags" final (srfi 113))
    ("SRFI 115: Scheme Regular Expressions" final (srfi 115))
    ("SRFI 116: Immutable List Library" final (srfi 116))
    ("SRFI 117: Queues based on lists" final (srfi 117))
    ("SRFI 118: Simple adjustable-size strings" final (srfi 118))
    ("SRFI 119: wisp: simpler indentation-sensitive scheme" final (srfi 119))
    ("SRFI 120: Timer APIs" final (srfi 120))
    ("SRFI 122: Nonempty Intervals and Generalized Arrays" final (srfi 122))
    ("SRFI 123: Generic accessor and modifier operators" final (srfi 123))
    ("SRFI 124: Ephemerons" final (srfi 124))
    ("SRFI 125: Intermediate hash tables" final (srfi 125))
    ("SRFI 126: R6RS-based hashtables" final (srfi 126))
    ("SRFI 127: Lazy Sequences" final (srfi 127))
    ("SRFI 128: Comparators" final (srfi 128))
    ("SRFI 129: Titlecase procedures" final (srfi 129))
    ("SRFI 130: Cursor-based string library" final (srfi 130))
    ("SRFI 131: ERR5RS Record Syntax (reduced)" final (srfi 131))
    ("SRFI 132: Sort Libraries" final (srfi 132))
    ("SRFI 133: Vector Library (R7RS-compatible)" final (srfi 133))
    ("SRFI 134: Immutable Deques" final (srfi 134))
    ("SRFI 135: Immutable Texts" final (srfi 135))
    ("SRFI 136: Extensible record types" final (srfi 136))
    ("SRFI 137: Minimal Unique Types" final (srfi 137))
    ("SRFI 138: Compiling Scheme programs to executables" final (srfi 138))
    ("SRFI 139: Syntax parameters" final (srfi 139))
    ("SRFI 140: Immutable Strings" final (srfi 140))
    ("SRFI 141: Integer division" final (srfi 141))
    ("SRFI 143: Fixnums" final (srfi 143))
    ("SRFI 144: Flonums" final (srfi 144))
    ("SRFI 145: Assumptions" final (srfi 145))
    ("SRFI 146: Mappings" final (srfi 146))
    ("SRFI 147: Custom macro transformers" final (srfi 147))
    ("SRFI 148: Eager syntax-rules" final (srfi 148))
    ("SRFI 149: Basic Syntax-rules Template Extensions" final (srfi 149))
    ("SRFI 150: Hygienic ERR5RS Record Syntax (reduced)" final (srfi 150))
    ("SRFI 151: Bitwise Operations" final (srfi 151))
    ("SRFI 152: String Library (reduced)" final (srfi 152))
    ("SRFI 154: First-class dynamic extents" final (srfi 154))
    ("SRFI 155: Promises" final (srfi 155))
    ("SRFI 156: Syntactic combiners for binary predicates" final (srfi 156))
    ("SRFI 157: Continuation marks" final (srfi 157))
    ("SRFI 158: Generators and Accumulators" final (srfi 158))
    ("SRFI 160: Homogeneous numeric vector libraries" final (srfi 160))
    ("SRFI 161: Unifiable Boxes" final (srfi 161))
    ("SRFI 162: Comparators sublibrary" final (srfi 162))
    ("SRFI 163: Enhanced array literals" final (srfi 163))
    ("SRFI 164: Enhanced multi-dimensional Arrays" final (srfi 164))
    ("SRFI 165: The Environment Monad" final (srfi 165))
    ("SRFI 166: Monadic Formatting" final (srfi 166))
    ("SRFI 167: Ordered Key Value Store" final (srfi 167))
    ("SRFI 168: Generic Tuple Store Database" final (srfi 168))
    ("SRFI 169: Underscores in numbers" final (srfi 169))
    ("SRFI 170: POSIX API" final (srfi 170))
    ("SRFI 171: Transducers" final (srfi 171))
    ("SRFI 172: Two Safer Subsets of R7RS" final (srfi 172))
    ("SRFI 173: Hooks" final (srfi 173))
    ("SRFI 174: POSIX Timespecs" final (srfi 174))
    ("SRFI 175: ASCII character library" final (srfi 175))
    ("SRFI 176: Version flag" final (srfi 176))
    ("SRFI 178: Bitvector library" final (srfi 178))
    ("SRFI 179: Nonempty Intervals and Generalized Arrays (Updated)" final (srfi 179))
    ("SRFI 180: JSON" final (srfi 180))
    ("SRFI 181: Custom ports (including transcoded ports)" final (srfi 181))
    ("SRFI 185: Linear adjustable-length strings" final (srfi 185))
    ("SRFI 188: Splicing binding constructs for syntactic keywords" final (srfi 188))
    ("SRFI 189: Maybe and Either: optional container types" final (srfi 189))
    ("SRFI 190: Coroutine Generators" final (srfi 190))
    ("SRFI 192: Port Positioning" final (srfi 192))
    ("SRFI 193: Command line" final (srfi 193))
    ("SRFI 194: Random data generators" final (srfi 194))
    ("SRFI 195: Multiple-value boxes" final (srfi 195))
    ("SRFI 196: Range Objects" final (srfi 196))
    ("SRFI 197: Pipeline Operators" final (srfi 197))
    ("SRFI 200: Pattern Matching" draft (srfi 200))
    ("SRFI 201: Syntactic Extensions to the Core Scheme Bindings" final (srfi 201))
    ("SRFI 202: Pattern-matching Variant of the and-let* Form that Supports Multiple Values" final (srfi 202))
    ("SRFI 203: A Simple Picture Language in the Style of SICP" final (srfi 203))
    ("SRFI 204: Wright-Cartwright-Shinn Pattern Matcher" draft (srfi 204))
    ("SRFI 205: POSIX Terminal Fundamentals" draft (srfi 205))
    ("SRFI 206: Auxiliary Syntax Keywords" final (srfi 206))
    ("SRFI 207: String-notated bytevectors" final (srfi 207))
    ("SRFI 208: NaN procedures" final (srfi 208))
    ("SRFI 209: Enums and Enum Sets" final (srfi 209))
    ("SRFI 210: Procedures and Syntax for Multiple Values" final (srfi 210))
    ("SRFI 211: Scheme Macro Libraries" draft (srfi 211))
    ("SRFI 212: Aliases" final (srfi 212))
    ("SRFI 213: Identifier Properties" final (srfi 213))
    ("SRFI 214: Flexvectors" final (srfi 214))
    ("SRFI 215: Central Log Exchange" final (srfi 215))
    ("SRFI 216: SICP Prerequisites (Portable)" final (srfi 216))
    ("SRFI 217: Integer Sets" final (srfi 217))
    ("SRFI 219: Define higher-order lambda" final (srfi 219))
    ("SRFI 221: Generator/accumulator sub-library" final (srfi 221))
    ("SRFI 222: Compound Objects" final (srfi 222))
    ("SRFI 223: Generalized binary search procedures" final (srfi 223))
    ("SRFI 224: Integer Mappings" final (srfi 224))
    ("SRFI 225: Dictionaries" draft (srfi 225))))

(defun lookup-srfi-library-form-from-name (srfi-name)
  (caddr (assoc srfi-name scheme-srfis)))

(defun lookup-srfi-number-from-name (srfi-name)
  (cadr (lookup-srfi-library-form-from-name srfi-name)))

;;;;;;;;;;;;;;;;;;;
;; abbreviations ;;
;;;;;;;;;;;;;;;;;;;

(defun scheme-x-define-abbrevs ()
  ""
  (define-abbrev scheme-mode-abbrev-table "df" "(define)" #'backward-char)
  (define-abbrev scheme-mode-abbrev-table "dl" "(define-library)" #'backward-char)
  (define-abbrev scheme-mode-abbrev-table "ds" "(define-syntax)" #'backward-char)
  (define-abbrev scheme-mode-abbrev-table "dsr" "" 'scheme-x-skeleton-define-syntax-rules)
  (define-abbrev scheme-mode-abbrev-table "lm" "(lambda)" #'backward-char)
  (define-abbrev scheme-mode-abbrev-table "sr" "" 'scheme-x-skeleton-syntax-rules))

;;;;;;;;;;;;;;;
;; skeletons ;;
;;;;;;;;;;;;;;;

(define-skeleton scheme-x-skeleton-define-syntax-rules
  ""
  "Identifier: "
  > "(define " str     \n
  > "(syntax-rules ()" \n
  >   "(("str")"       \n
  >    "("-"))))"      \n )

(define-skeleton scheme-x-skeleton-syntax-rules
  ""
  nil
  > "(syntax-rules ()" \n
  >   "(("str")"       \n
  >    "("-")))"       \n )

;;;;;;;;;;;;;
;; counsel ;;
;;;;;;;;;;;;;

(when (require 'ivy "ivy" t)

  (defun counsel-scheme-library ()
    (interactive)
    (ivy-read "Scheme Library Name:"
              (mapcar (lambda (library-name) (format "%s" library-name))
                      scheme-standard-libraries)
              :action 'insert))

  (defun counsel-scheme-srfi ()
    (interactive)
    (ivy-read
     "Scheme SRFI Name:"
     (mapcar #'car scheme-srfis)
     :action
     (lambda (srfi-name)
       (insert
        (format "%s" (lookup-srfi-library-form-from-name srfi-name))))))

  (ivy-add-actions
   'counsel-srfi
   '(("w"
      (lambda (srfi-name)
        (browse-url
         (format "https://srfi.schemers.org/srfi-%d"
                 (lookup-srfi-number-from-name srfi-name))))
      "web browser"))))

;;;;;;;;;;;;;;;
;; font lock ;;
;;;;;;;;;;;;;;;

(defconst scheme-x-font-lock-keywords-keyword-literals
  (list (rx (group (? "'")
                   (or (seq (+ (or (syntax word) (syntax symbol))) ":")
                       (seq ":" (+ (or (syntax word) (syntax symbol))))))
            (or eol space (syntax close-parenthesis)))
        1
        'font-lock-constant-face))

(defconst scheme-x-font-lock-keywords-null-literal
  (cons "'()" 'font-lock-constant-face))

(defconst scheme-x-font-lock-keywords-numeric-literals
  (list (rx (group (? (or "-" "+"))
                   (+ digit)
                   (? ".")
                   (* digit))
            (or eol space (syntax close-parenthesis)))
        1
        'font-lock-constant-face))

(defconst scheme-x-font-lock-keywords-quoted-symbol-literals
  (list (rx (group "'"
                   (+ (or (syntax word) (syntax symbol))))
            (or eol space (syntax close-parenthesis)))
        1
        'font-lock-constant-face))

(defconst scheme-x-font-lock-keywords-character-literals
  (cons (rx "#\\" (in graph) eow) 'font-lock-constant-face))

(defconst scheme-x-font-lock-keywords-character-literals
  (cons (rx "#\\" (in graph) eow) 'font-lock-constant-face))

(defconst scheme-x-font-lock-keywords-standard-literals
  (cons (regexp-opt scheme-standard-literals 'symbols) 'font-lock-constant-face))

(defconst scheme-x-font-lock-keywords-builtins
  (cons (regexp-opt scheme-standard-procedures 'symbols) 'font-lock-builtin-face))

(defconst scheme-x-font-lock-keywords-reader-syntax
  (cons (regexp-opt (append scheme-standard-reader-syntax
                            scheme-nonstandard-reader-syntax))
        'font-lock-keyword-face))

(defconst scheme-x-font-lock-keywords-syntax
  (cons (regexp-opt (append (mapcar #'car scheme-standard-syntax)
                            (mapcar #'car scheme-srfi-syntax)
                            (mapcar #'car scheme-nonstandard-syntax))
                    'symbols)
        'font-lock-keyword-face))

(defconst scheme-x-font-lock-keywords-procedure-definitions
  (list (rx (syntax open-parenthesis)
            (* space)
            (group (or "def" "define"))
            (+ space)
            (syntax open-parenthesis)
            (* space)
            (group (+ (or (syntax word) (syntax symbol)))))
        (list 1 'font-lock-keyword-face)
        (list 2 'font-lock-function-name-face)))

(defconst scheme-x-font-lock-keywords-variable-definitions
  (list (rx (syntax open-parenthesis)
              (* space)
              (group (or "def" "define"))
              (+ space)
              (group (+ (or (syntax word) (syntax symbol)))))
          (list 1 'font-lock-keyword-face)
          (list 2 'font-lock-variable-name-face)))

(defun scheme-x-add-font-locks ()
  "Add scheme-x font-locks to the current buffer."
  (font-lock-add-keywords
   nil
   (list scheme-x-font-lock-keywords-keyword-literals
         scheme-x-font-lock-keywords-null-literal
         scheme-x-font-lock-keywords-standard-literals
         scheme-x-font-lock-keywords-numeric-literals
         scheme-x-font-lock-keywords-quoted-symbol-literals
         scheme-x-font-lock-keywords-character-literals
         scheme-x-font-lock-keywords-builtins
         scheme-x-font-lock-keywords-reader-syntax
         scheme-x-font-lock-keywords-syntax
         scheme-x-font-lock-keywords-procedure-definitions
         scheme-x-font-lock-keywords-variable-definitions)))

;;;;;;;;;;;;;;;;;
;; indentation ;;
;;;;;;;;;;;;;;;;;

(defun scheme-x-put-indent-values (list-of-syntax)
  ""
  (make-local-variable 'scheme-indent-function)
  (let ((scheme-syntax ))
    (mapcar* (lambda (syntax-name syntax-indent-value)
               (put (intern syntax-name) 'scheme-indent-function syntax-indent-value))
             (mapcar #'car list-of-syntax)
             (mapcar #'cadr list-of-syntax))))

(defun scheme-x-put-default-indent-values ()
  ""
  (scheme-x-put-indent-values (append scheme-standard-syntax
                                      scheme-srfi-syntax
                                      scheme-nonstandard-syntax)))

;;;;;;;;;;;;;
;; outline ;;
;;;;;;;;;;;;;

(defun scheme-x-set-local-outline-regexp ()
  ""
  (setq-local outline-regexp (rx ";; " (+ "*"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; default configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun scheme-x-default-configuration ()
  ""

  (add-to-list 'auto-mode-alist '("\\.sld$" . scheme-mode))

  (dolist (mode '(inferior-scheme-mode
                  scheme-mode))
    (add-to-list 'font-lock-maximum-decoration (cons mode 1)))

  (dolist (hook '(scheme-mode-hook
                  inferior-scheme-mode-hook))
    (dolist (func '(abbrev-mode
                    scheme-x-add-font-locks
                    scheme-x-put-default-indent-values))
      (add-hook hook func)))

  (add-hook 'scheme-mode-hook 'scheme-x-set-local-outline-regexp)

  (scheme-x-define-abbrevs))

;;

(provide 'scheme-x)
