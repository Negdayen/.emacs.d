(use-package dired-filter)
(use-package dired-rainbow)
(use-package dired-ranger)

(bind-key "/" dired-filter-map dired-mode-map)
(bind-key "?" dired-filter-mark-map dired-mode-map)
(bind-key "r c" 'dired-ranger-copy dired-mode-map)
(bind-key "r m" 'dired-ranger-move dired-mode-map)
(bind-key "r p" 'dired-ranger-paste dired-mode-map)
