(require 'color-x)

(deftheme horrocks "A minimal tty-first theme with semantic colors.")

(defconst color--bubblegum "#ffff8787d7d7")
(defconst color--cerulean "#00008787d7d7")
(defconst color--dark-lilac "#5f5f0000ffff")
(defconst color--deep-red "#5f5f00000000")
(defconst color--dim-forest-green "#00005f5f0000")
(defconst color--indigo (color-rgb-to-hex .149  .438  .71))
(defconst color--key "#d7d7afaf0000")
(defconst color--light-prune "#87875f5f8787")
(defconst color--lilac "#87875f5fffff")
(defconst color--dollar "#0000afaf5f5f")
(defconst color--pink "#ffff5f5fffff")
(defconst color--purple "#5f5f0000ffff")
(defconst color--serpentine "#8787d7d70000")
(defconst color--vanilla "lightyellow")

(defconst horrocks-theme--default-bg (color-name-to-hsl "#070707"))
(defconst horrocks-theme--default-fg (color-name-to-hsl "#707070"))
(defconst horrocks-theme--mode-line-bg (light+ horrocks-theme--default-bg .05))
(defconst horrocks-theme--mode-line-fg (light+ horrocks-theme--mode-line-bg .15))
(defconst horrocks-theme--mode-line-inactive-bg (color-name-to-hsl "black"))
(defconst horrocks-theme--mode-line-inactive-fg
  (light+ horrocks-theme--mode-line-inactive-bg .15))

(defconst horrocks-theme--org-level-1 (list 0 .75 .75))
(defconst horrocks-theme--org-level-2 (hue+ horrocks-theme--org-level-1 .125))
(defconst horrocks-theme--org-level-3 (hue+ horrocks-theme--org-level-2 .125))
(defconst horrocks-theme--org-level-4 (hue+ horrocks-theme--org-level-3 .125))
(defconst horrocks-theme--org-level-5 (hue+ horrocks-theme--org-level-4 .125))
(defconst horrocks-theme--org-level-6 (hue+ horrocks-theme--org-level-5 .125))
(defconst horrocks-theme--org-level-7 (hue+ horrocks-theme--org-level-6 .125))
(defconst horrocks-theme--org-level-8 (hue+ horrocks-theme--org-level-7 .125))

(defconst horrocks-theme--rainbow-delimiters-depth-1-face (list 0 0 .2))
(defconst horrocks-theme--rainbow-delimiters-depth-2-face
  (light+ horrocks-theme--rainbow-delimiters-depth-1-face .1))
(defconst horrocks-theme--rainbow-delimiters-depth-3-face
  (light+ horrocks-theme--rainbow-delimiters-depth-2-face .1))
(defconst horrocks-theme--rainbow-delimiters-depth-4-face
  (light+ horrocks-theme--rainbow-delimiters-depth-3-face .1))
(defconst horrocks-theme--rainbow-delimiters-depth-5-face
  (light+ horrocks-theme--rainbow-delimiters-depth-4-face .1))
(defconst horrocks-theme--rainbow-delimiters-depth-6-face
  (light+ horrocks-theme--rainbow-delimiters-depth-5-face .1))
(defconst horrocks-theme--rainbow-delimiters-depth-7-face
  (light+ horrocks-theme--rainbow-delimiters-depth-6-face .1))
(defconst horrocks-theme--rainbow-delimiters-depth-8-face
  (light+ horrocks-theme--rainbow-delimiters-depth-7-face .1))
(defconst horrocks-theme--rainbow-delimiters-depth-9-face
  (light+ horrocks-theme--rainbow-delimiters-depth-8-face .1))

(custom-theme-set-faces
 'horrocks
 '(button ((t (:inherit (link)))))
 `(comint-highlight-input ((t (:foreground ,color--indigo))))
 `(comint-highlight-prompt ((t (:foreground ,color--light-prune))))
 '(cursor ((t (:background "#0000ffffffff"))))
 `(default ((t (:background ,(hsl-to-hex horrocks-theme--default-bg)
                :foreground ,(hsl-to-hex horrocks-theme--default-fg)))))
 '(diff-added ((t (:background "#335533" :foreground "black"))))
 ;; '(diff-changed ((t (:background "" :foreground ""))))
 '(diff-context ((t (:inherit default))))
 '(diff-file-header ((t (:background "grey60" :foreground "black"))))
 '(diff-function ((t (:inherit diff-header))))
 '(diff-header ((t (:background "grey45" :foreground "black"))))
 '(diff-hunk-header ((t (:inherit diff-header))))
 '(diff-index ((t (:inherit diff-file-header))))
 '(diff-indicator-added ((t (:inherit diff-added))))
 '(diff-indicator-changed ((t (:inherit diff-changed))))
 '(diff-indicator-removed ((t (:inherit diff-removed))))
 '(diff-nonexistent ((t (:inherit diff-file-header))))
 '(diff-refine-added ((t (:background "#22aa22" :foreground "black"))))
 '(diff-refine-changed ((t (:background "#aaaa22" :foreground "black"))))
 '(diff-refine-removed ((t (:background "#aa2222" :foreground "black"))))
 '(diff-removed ((t (:background "#553333" :foreground "black"))))
 `(dired-directory ((t (:foreground ,color--dim-forest-green))))
 '(ediff-current-diff-A ((t (:background "#553333" :foreground "black"))))
 '(ediff-current-diff-Ancestor ((default (:foreground "black"))
                                (((type graphic))
                                 (:background "#004151"))
                                (((type tty) (min-colors 256))
                                 (:background "#004181"))))
 '(ediff-current-diff-B ((t (:background "#335533" :foreground "black"))))
 '(ediff-current-diff-C ((t (:background "#888833" :foreground "black"))))
 '(ediff-even-diff-A ((t (:background "light grey" :foreground "black"))))
 '(ediff-even-diff-Ancestor ((t (:background "Grey" :foreground "black"))))
 '(ediff-even-diff-B ((t (:background "Grey" :foreground "black"))))
 '(ediff-even-diff-C ((t (:background "light grey" :foreground "black"))))
 '(ediff-fine-diff-A ((t (:background "#aa2222" :foreground "black"))))
 '(ediff-fine-diff-Ancestor ((t (:background "#009591" :foreground "black"))))
 '(ediff-fine-diff-B ((t (:background "#22aa22" :foreground "black"))))
 '(ediff-fine-diff-C ((t (:background "#aaaa22" :foreground "black"))))
 '(ediff-odd-diff-A ((t (:background "Grey" :foreground "black"))))
 '(ediff-odd-diff-Ancestor ((t (:background "gray40" :foreground "black"))))
 '(ediff-odd-diff-B ((t (:background "light grey" :foreground "black"))))
 '(ediff-odd-diff-C ((t (:background "Grey" :foreground "black"))))
 '(error ((default (:weight bold))
          (((type graphic))
           (:foreground "#ffff00000000"))
          (((type tty) (min-colors 256))
           (:foreground "brightred"))))
 `(font-lock-builtin-face ((t (:foreground ,color--bubblegum))))
 '(font-lock-comment-delimiter-face ((t (:inherit (font-lock-comment-face)))))
 `(font-lock-comment-face ((t (:foreground ,color--cerulean))))
 '(font-lock-constant-face ((t (:foreground "cyan"))))
 `(font-lock-doc-face ((t (:foreground ,color--dollar))))
 '(font-lock-function-name-face ((t (:foreground "forestgreen"))))
 `(font-lock-keyword-face ((t (:foreground ,color--key))))
 '(font-lock-negation-char-face ((t nil)))
 `(font-lock-preprocessor-face ((t (:foreground ,color--pink))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
 '(font-lock-string-face ((t (:foreground "steelblue"))))
 '(font-lock-type-face ((t (:foreground "darkturquoise"))))
 `(font-lock-variable-name-face ((t (:foreground ,color--vanilla))))
 '(font-lock-warning-face ((t (:foreground "yellow" :weight bold))))
 '(fringe ((t (:inherit mode-line-inactive))))
 '(header-line ((t (:inherit (mode-line)))))
 '(highlight ((t (:background "grey20"))))
 '(isearch ((default (:foreground "black"))
            (((type graphic))
             (:background "#ffffffff0000"))
            (((type tty) (min-colors 256))
             (:background "brightyellow"))))
 '(isearch-fail ((t (:foreground "red"))))
 '(ivy-minibuffer-match-face-1 ((t (:inherit default))))
 '(ivy-minibuffer-match-face-2 ((t (:inherit default))))
 '(ivy-minibuffer-match-face-3 ((t (:inherit default))))
 '(ivy-minibuffer-match-face-4 ((t (:inherit nil))))
 '(lazy-highlight ((t (:background "yellow" :foreground "black"))))
 `(link ((t (:foreground ,color--lilac :underline t))))
 `(link-visited ((t (:inherit link :foreground ,color--dark-lilac))))
 '(match ((default (:foreground "black"))
          (((type graphic))
           (:background "#5f5fffff0000"))
          (((type tty) (min-colors 256))
           (:background "color-82"))))
 '(minibuffer-prompt ((t (:inherit default))))
 `(mode-line
   ((t (:background ,(hsl-to-hex horrocks-theme--mode-line-bg)
        :foreground ,(hsl-to-hex horrocks-theme--mode-line-fg)))))
 '(mode-line-buffer-id ((t nil)))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((t (:inherit (highlight)))))
 `(mode-line-inactive
   ((t (:background ,(hsl-to-hex horrocks-theme--mode-line-inactive-bg)
        :foreground ,(hsl-to-hex horrocks-theme--mode-line-inactive-fg)))))
 '(next-error ((t (:inherit (region)))))
 '(org-block ((t (:inherit default))))
 '(org-block-begin-line ((t (:inherit org-meta-line))))
 '(org-block-end-line ((t (:inherit org-meta-line))))
 '(org-document-info-keyword ((t (:inherit org-meta-line))))
 '(org-meta-line ((t (:foreground "magenta"))))
 `(org-level-1 ((t (:foreground ,(hsl-to-hex horrocks-theme--org-level-1)))))
 `(org-level-2 ((t (:foreground ,(hsl-to-hex horrocks-theme--org-level-2)))))
 `(org-level-3 ((t (:foreground ,(hsl-to-hex horrocks-theme--org-level-3)))))
 `(org-level-4 ((t (:foreground ,(hsl-to-hex horrocks-theme--org-level-4)))))
 `(org-level-5 ((t (:foreground ,(hsl-to-hex horrocks-theme--org-level-5)))))
 `(org-level-6 ((t (:foreground ,(hsl-to-hex horrocks-theme--org-level-6)))))
 `(org-level-7 ((t (:foreground ,(hsl-to-hex horrocks-theme--org-level-7)))))
 `(org-level-8 ((t (:foreground ,(hsl-to-hex horrocks-theme--org-level-8)))))
 '(org-verbatim ((t (:foreground "silver"))))
 '(query-replace ((t (:inherit (isearch)))))
 `(rainbow-delimiters-depth-1-face ((t (:foreground ,(hsl-to-hex horrocks-theme--rainbow-delimiters-depth-1-face)))))
 `(rainbow-delimiters-depth-2-face ((t (:foreground ,(hsl-to-hex horrocks-theme--rainbow-delimiters-depth-2-face)))))
 `(rainbow-delimiters-depth-3-face ((t (:foreground ,(hsl-to-hex horrocks-theme--rainbow-delimiters-depth-3-face)))))
 `(rainbow-delimiters-depth-4-face ((t (:foreground ,(hsl-to-hex horrocks-theme--rainbow-delimiters-depth-4-face)))))
 `(rainbow-delimiters-depth-5-face ((t (:foreground ,(hsl-to-hex horrocks-theme--rainbow-delimiters-depth-5-face)))))
 `(rainbow-delimiters-depth-6-face ((t (:foreground ,(hsl-to-hex horrocks-theme--rainbow-delimiters-depth-6-face)))))
 `(rainbow-delimiters-depth-7-face ((t (:foreground ,(hsl-to-hex horrocks-theme--rainbow-delimiters-depth-7-face)))))
 `(rainbow-delimiters-depth-8-face ((t (:foreground ,(hsl-to-hex horrocks-theme--rainbow-delimiters-depth-8-face)))))
 `(rainbow-delimiters-depth-9-face ((t (:foreground ,(hsl-to-hex horrocks-theme--rainbow-delimiters-depth-9-face)))))
 '(rainbow-delimiters-mismatched-face ((t (:inherit error))))
 '(rainbow-delimiters-unmatched-face ((t (:inherit error))))
 `(region ((t (:background ,color--deep-red))))
 '(rcirc-other-nick ((t (:foreground "navajowhite"))))
 `(rcirc-server ((t (:foreground ,color--serpentine))))
 '(rcirc-timestamp ((t (:foreground "grey25"))))
 '(rcirc-url ((t (:inherit (link)))))
 '(shadow ((t (:foreground "grey20"))))
 `(show-paren-match ((t (:foreground ,color--purple :weight bold))))
 '(sp-pair-overlay-face ((t nil)))
 '(tooltip ((t (:foreground "black" :background "lightyellow"))))
 '(trailing-whitespace ((t (:background "white"))))
 '(whitespace-empty ((t (:background "ghostwhite"))))
 '(whitespace-line ((t (:background "grey8"))))
 '(whitespace-tab ((t (:foreground "tan"))))
 '(whitespace-trailing ((t (:inherit trailing-whitespace))))
 '(widget-field ((t
                  (:background "black"
                   :foreground "color-162"
                   :box (:line-width 2
                         :color "grey75"
                         :style pressed-button))))))

(provide-theme 'horrocks)
