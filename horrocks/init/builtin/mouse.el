(customize-setq
 ;; double-click-fuzz
 ;; double-click-time
 make-pointer-invisible t
 ;; mouse-1-click-follows-link
 mouse-1-click-in-non-selected-windows t
 ;; mouse-buffer-menu-maxlen
 ;; mouse-buffer-menu-mode-mult
 ;; mouse-drag-and-drop-region
 ;; mouse-drag-and-drop-region-cut-when-buffers-differ
 ;; mouse-drag-and-drop-region-show-cursor
 ;; mouse-drag-and-drop-region-show-tooltip
 ;; mouse-drag-copy-region
 mouse-highlight t
 ;; mouse-scroll-delay
 mouse-scroll-min-lines 1
 ;; mouse-select-region-move-to-beginning
 ;; mouse-wheel-click-event
 ;; mouse-wheel-down-event
 ;; mouse-wheel-flip-direction
 mouse-wheel-follow-mouse t
 ;; mouse-wheel-inhibit-click-time
 ;; mouse-wheel-mode
 mouse-wheel-progressive-speed nil
 mouse-wheel-scroll-amount '(0.05
                             ((shift) . 1)
                             ((control) . 0.25))
 ;; mouse-wheel-tilt-scroll
 ;; mouse-wheel-up-event
 mouse-yank-at-point t
 )

;; (xterm-mouse-mode)
;; I don't think you can make urxvt/xterm transmit any shift-modified mouse
;; events. This enables "single" (double) line scrolling with alt+mouse-wheel.
;; This may also partly be specific to XWindows, I'm not sure.
;; (if (display-graphic-p)
;;     (progn
;;       (global-set-key (kbd "<M-mouse-4>") 'scroll-down-line)
;;       (global-set-key (kbd "<M-mouse-5>") 'scroll-up-line))
;;   (setq mouse-wheel-scroll-amount '(4))
;;   (global-set-key (kbd "<mouse-12>") 'scroll-down-line)
;;   (global-set-key (kbd "<mouse-13>") 'scroll-up-line))

;; (setq x-mouse-click-focus-ignore-position nil)
