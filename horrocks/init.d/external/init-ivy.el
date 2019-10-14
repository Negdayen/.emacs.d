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
  (ivy-mode)
  :bind (:map ivy-minibuffer-map
              ("M-n" . ivy-restrict-to-matches)))

(use-package ivy-hydra)
