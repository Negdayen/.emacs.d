(add-hook 'text-mode-hook 'auto-revert-mode)
(add-hook 'text-mode-hook 'whitespace-mode)

(bind-key "C-c C-l" 'org-insert-link-global text-mode-map)
(bind-key "C-c C-o" 'org-open-at-point-global text-mode-map)
