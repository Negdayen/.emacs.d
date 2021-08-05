(customize-setq
 prettify-symbols-unprettify-at-point nil)

(add-hook 'prog-mode-hook 'auto-revert-mode)
(add-hook 'prog-mode-hook 'rebox-mode)
(add-hook 'prog-mode-hook 'whitespace-mode)
