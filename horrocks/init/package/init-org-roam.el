(setq org-roam-v2-ack t)

(use-package org-roam)

(customize-setq org-roam-directory "~/notes")

(when (file-exists-p org-roam-directory)
  (condition-case nil
      (org-roam-setup)
    (error (warn "org-roam-setup failed"))))
