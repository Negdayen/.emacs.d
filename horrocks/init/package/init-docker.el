(use-package docker
  :config
  (setq docker-run-as-root t))

(use-package dockerfile-mode
  :config
  (setq dockerfile-use-sudo t))
