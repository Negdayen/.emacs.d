(use-package rainbow-mode)

(customize-setq
 rainbow-ansi-colors nil
 rainbow-html-colors nil
 rainbow-latex-colors nil
 rainbow-r-colors nil
 rainbow-x-colors nil)

(defun rainbow-toggle-color-names ()
  "Toggle whether rainbow-mode can colorize color names."
  (interactive)
  (when rainbow-mode
    (if rainbow-ansi-colors
        (customize-setq
         rainbow-ansi-colors nil
         rainbow-html-colors nil
         rainbow-latex-colors nil
         rainbow-r-colors nil
         rainbow-x-colors nil)
      (customize-setq
       rainbow-ansi-colors 'auto
       rainbow-html-colors 'auto
       rainbow-latex-colors 'auto
       rainbow-r-colors 'auto
       rainbow-x-colors 'auto))
    (rainbow-mode -1)
    (rainbow-mode)))
