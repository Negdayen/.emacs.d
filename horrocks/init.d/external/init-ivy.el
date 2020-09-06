(use-package ivy)
(use-package ivy-hydra)

(bind-key "M-n" 'ivy-restrict-to-matches ivy-minibuffer-map)

(with-eval-after-load 'ivy
  (customize-setq
   ivy-count-format "(%d/%d) "
   ivy-extra-directories '()
   ivy-magic-tilde nil
   ivy-use-selectable-prompt t
   ivy-use-virtual-buffers nil)
  (add-to-list 'ivy-ignore-buffers "\\*epc con"))

(ivy-mode)
