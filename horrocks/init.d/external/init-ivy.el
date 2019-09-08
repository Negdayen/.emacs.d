(use-package ivy
  :config
  (customize-setq
   ivy-count-format "(%d/%d) "
   ivy-extra-directories '()
   ivy-magic-tilde nil
   ivy-use-selectable-prompt t
   ivy-use-virtual-buffers nil)
  (add-to-list 'ivy-ignore-buffers "\\*epc con")
  :init
  (ivy-mode))

(use-package ivy-hydra)
