(defun relative (filepath)
  "Return filepath relative to the currently loading file."
  (concat (file-name-directory load-file-name) filepath))

(add-to-list 'load-path (relative "horrocks/lib"))

(cond
 ((daemonp) (add-hook 'after-make-frame-functions
                      (lambda (frame)
                        ;; daemon starts = 1 frame
                        ;; first client connects = 2 frames
                        (when (= 2 (length (frame-list)))
                          (with-selected-frame frame
                            (load-theme 'horrocks t))))))
 (t (add-hook 'window-setup-hook
              (lambda () (load-theme 'horrocks t)))))

(load (relative "horrocks/lib/load-directory"))
(load-directory (relative "horrocks/init.d/priority"))
(load-directory (relative "horrocks/init.d/lib"))
(load-directory (relative "horrocks/lib/batteries"))
(load-directory (relative "horrocks/init.d/builtin"))
(load-directory (relative "horrocks/init.d/external"))
(load-directory (relative "horrocks/lib"))
(load-directory (relative "horrocks/init.d/internal"))
(load-directory (relative "horrocks/init.d/lang"))
(load (relative "horrocks/global-key-bindings.el"))
