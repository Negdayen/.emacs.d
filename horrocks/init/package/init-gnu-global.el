;; There's several available frontends to gnu global:
;;
;; gtags.el (distributed with gnu global)
;; ggtags.el (looks fully featured)
;; xgtags.el
;; xcscope.el with (setq cscope-program “gtags-cscope”)
;; agtags.el (looks thin)
;; global-tags.el (looks like the most recent, has project.el and xref.el integration)

(use-package global-tags)

(autoload 'global-tags-exclusive-backend-mode "global-tags" "" t)
(autoload 'global-tags-shared-backend-mode    "global-tags" "" t)
