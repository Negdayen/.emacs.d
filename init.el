(defun relative (filepath)
  "Return filepath relative to the currently loading file."
  (concat (file-name-directory load-file-name) filepath))

(add-to-list 'load-path (relative "horrocks/package"))

(cond
 ((daemonp) (add-hook 'after-make-frame-functions
                      (lambda (frame)
                        ;; daemon starts = 1 frame
                        ;; first client connects = 2 frames
                        (when (= 2 (length (frame-list)))
                          (with-selected-frame frame
                            (load-theme 'horrocks t))))))
 (t (add-hook 'window-setup-hook (lambda () (load-theme 'horrocks t)))))

(load (relative "horrocks/package/load-directory"))
(load (relative "horrocks/package/batteries/batteries-core.el"))
(load-directory (relative "horrocks/init/priority"))
(load-directory (relative "horrocks/init/package"))
(load-directory (relative "horrocks/package/batteries"))
(load-directory (relative "horrocks/init/builtin"))
(load-directory (relative "horrocks/init/package"))
(load-directory (relative "horrocks/package"))
(load-directory (relative "horrocks/init/major-mode"))
(load-directory (relative "extern/sachachua"))
