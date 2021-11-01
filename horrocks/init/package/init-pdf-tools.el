;; TODO Consider testing on Windows
(when (eq system-type 'gnu/linux)
  (use-package pdf-tools)
  (condition-case nil
      ;; Installing will compile the necessary backend programs.  We uninstall immediately
      ;; after to NOT unconditionally use pdf-view-mode on pdf files because it has issues
      ;; under WSL; we conditionally enable it later.  (Manually enabling pdf-view-mode
      ;; after loading a .pdf file works fine under WSL).
      ;; TODO See if issue persists if I bypass most of my configuration.
      (progn
        (pdf-tools-install)
        (pdf-tools-uninstall)
        (if (not (file-exists-p "/run/WSL"))
            (add-to-list 'auto-mode-alist '("\\.pdf$" . pdf-view-mode))))
    (error (warn "pdf-tools-install failed"))))

(customize-setq
 pdf-view-display-size 'fit-page
)
