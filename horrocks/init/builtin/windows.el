;;; Automatic Scrolling
;;
;; By default, Emacs will recenter the cursor/buffer when it is moved off
;; screen. That behavior is far too jumpy for my taste.

(customize-setq
 display-buffer-alist '(("^Dialog\\|^DialogWindow"
                         (display-buffer-in-side-window)
                         (side . bottom)
                         (slot . 1))
                        ("^Panda\\|^Universal Tournament"
                         (display-buffer-reuse-window
                          display-buffer-in-previous-window
                          display-buffer-in-direction)
                         (direction . right)))
 display-buffer-base-action (cons (list #'display-buffer-reuse-window
                                        #'display-buffer-same-window)
                                  (list))
 ;; even-window-sizes
 ;; frame-auto-hide-function
 hscroll-margin 3
 hscroll-step 0
 ;; make-cursor-line-fully-visible
 ;; maximum-scroll-margin
 next-screen-context-lines 1
 pop-up-frames nil
 ;; pop-up-windows
 ;; recenter-positions
 ;; recenter-redisplay
 resize-mini-windows 'grow-only
 same-window-buffer-names nil
 ;; same-window-regexps
 ;; scroll-bar-adjust-thumb-portion
 scroll-conservatively 101
 scroll-down-aggressively 0.5
 scroll-error-top-bottom t
 scroll-margin 0
 scroll-preserve-screen-position t
 scroll-step 0
 scroll-up-aggressively 0.5
 ;; special-display-buffer-names
 ;; special-display-regexps
 ;; split-height-threshold
 ;; split-width-threshold
 ;; split-window-keep-point
 ;; split-window-preferred-function
 ;; switch-to-buffer-in-dedicated-window
 ;; switch-to-buffer-preserve-window-point
 ;; switch-to-visible-buffer
 ;; temp-buffer-show-function
 ;; window-adjust-process-window-size-function
 ;; window-combination-limit
 ;; window-combination-resize
 window-min-height 17
 window-min-width 68
 ;; window-resize-pixelwise
 ;; window-sides-reversed
 ;; window-sides-slots
 ;; window-sides-vertical
 recenter-positions '(top middle bottom)
 ;; recenter-redisplay
)
