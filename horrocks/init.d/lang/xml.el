(with-eval-after-load 'hideshow
  (add-to-list
   'hs-special-modes-alist
   (list 'nxml-mode
         (rx "<" (one-or-more (not (in "/" ">"))) ">")
         (rx "</" (one-or-more (not (in "/" ">"))) ">")
         "<!--"
         'nxml-forward-element
         nil)))

(with-eval-after-load 'nxml-mode
  (bind-key "C-c h h" 'hs-toggle-hiding)
  (bind-key "C-c h l" 'hs-hide-level)
  (add-hook 'nxml-mode-hook 'hs-minor-mode))
