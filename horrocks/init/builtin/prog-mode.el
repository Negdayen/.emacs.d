(customize-setq
 prettify-symbols-unprettify-at-point nil)

(add-hook 'prog-mode-hook 'auto-revert-mode)
(add-hook 'prog-mode-hook 'whitespace-mode)

(bind-key "C-c C-l" 'org-insert-link-global prog-mode-map)
(bind-key "C-c C-o" 'org-open-at-point-global prog-mode-map)
