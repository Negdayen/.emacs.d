(customize-setq
 auto-image-file-mode t
 image-animate-loop t
 ;; image-file-name-extensions
 ;; image-file-name-regexps
 ;; image-load-path
 ;; image-scaling-factor
 imagemagick-enabled-types t
)

;; imagemagick tries to treat c header files as images; no thanks.
(add-to-list 'imagemagick-types-inhibit 'H)
(imagemagick-register-types)
