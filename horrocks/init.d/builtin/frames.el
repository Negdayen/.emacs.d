(customize-setq
 default-frame-alist '((bottom-divider-width . 0)
                       (font . "DejaVu Sans Mono-10")
                       (horizontal-scroll-bars . nil)
                       (left-fringe . 0)
                       (right-divider-width . 0)
                       (right-fringe . 0)
                       (vertical-scroll-bars . nil))
 ;; display-mm-dimensions-alist
 focus-follows-mouse t
 ;; frame-auto-hide-function
 ;; frame-inhibit-implied-resize
 ;; frame-resize-pixelwise
 horizontal-scroll-bar-mode nil
 ;; iconify-child-frame
 ;; initial-frame-alist
 menu-bar-mode nil
 ;; minibuffer-frame-alist
 ;; pop-up-frame-alist
 ;; pop-up-frame-function
 scroll-bar-mode nil
 ;; special-display-buffer-names
 ;; special-display-frame-alist
 ;; special-display-function
 ;; special-display-regexps
 ;; tool-bar-max-label-size
 tool-bar-mode nil
 ;; tool-bar-style
 )

(and (fboundp 'set-scroll-bar-mode) (set-scroll-bar-mode nil))
