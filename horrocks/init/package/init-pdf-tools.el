;; TODO Consider testing on Windows
(when (eq system-type 'gnu/linux)
  (use-package pdf-tools)
  (condition-case nil
      ;; Installing will compile the necessary backend programs.
      ;; Uninstall immediately after to not autoload pdf-view-mode because it has issues.
      ;; Manually enabling pdf-view-mode after loading a .pdf file works fine.
      ;;
      ;; TODO See if issue persists if I bypass most of my configuration.
      (progn
        (pdf-tools-install)
        (pdf-tools-uninstall))
    (error (warn "pdf-tools-install failed"))))

(customize-setq
 pdf-view-display-size 'fit-page
)
