(require 'package)

;; TODO
(setq
 package--init-file-ensured t
 ;; package-check-signature
 ;; package-unsigned-archives
 ;; package-pinned-packages
 ;; package-menu-hide-low-priority
 ;; package-load-list
 ;; package-user-dir
 ;; package-directory-list
 )

;; Providing Emacs with a list of package repositories increases our chances
;; of finding the desired package.  Melpa has bleeding-edge, timestamp
;; versioned packages--not a good idea for either stability or security.
(defconst initial-package-archives package-archives)
(defconst more-package-archives
  '(
    ;; ("marmalade"    . "https://marmalade-repo.org/packages/")
    ("melpa"        . "https://melpa.org/packages/")
    ("melpa-stable" . "https://stable.melpa.org/packages/")
    ("org"          . "https://orgmode.org/elpa/")
    ))

;; Add only new package archives to PACKAGE-ARCHIVES.
(dolist (package-archive more-package-archives)
  (let ((id (car package-archive)))
    (unless (assoc id package-archives)
      (push package-archive package-archives))))

(defconst package-archive-priorities
  '(("marmalade" . 80)
    ("melpa" . 70)
    ("melpa-stable" . 90)
    ("org" . 100)))

;; Unable to download gnu archive bug workaround
(when (and (= emacs-major-version 26)
           (> emacs-minor-version 0)
           (< emacs-minor-version 3))
    (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

;; We initialize our installed packages to make them available to load.  Emacs
;; normally does this after loading our init file, so we also let Emacs know
;; not to do that.
(setq package-enable-at-startup nil)
(package-initialize)
;; (package-refresh-contents)

;; The use-package package is used to configure most other packages,
;; and so is a dependency that needs to be fetched directly;
;; bootstrapping it here.
(defun ensure-package (package &optional archives)
  (when (not (package-installed-p package))
    (let ((package-archives (if archives archives package-archives)))
      (package-refresh-contents)
      (package-install package))))
(ensure-package 'use-package)
(eval-when-compile (require 'use-package)
                   (setq use-package-always-defer t
                         use-package-always-ensure t
                         use-package-minimum-reported-time 0
                         use-package-verbose t))
