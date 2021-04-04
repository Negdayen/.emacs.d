(defun copy-buffer-file-name ()
  (interactive)
  (kill-new (buffer-file-name)))

(defun copy-buffer-name ()
  (interactive)
  (kill-new (buffer-name)))

(defun back-to-indentation* ()
  "Move point to identation if not already there, else to beginning of line."
  (interactive)
  (if (= (save-excursion (back-to-indentation) (point))
         (point))
      (move-beginning-of-line nil)
    (back-to-indentation)))

(defun move-beginning-of-line* ()
  "Move point to beginning of line if not already there, else to indentation."
  (interactive)
  (if (= (point) (point-at-bol))
      (back-to-indentation)
    (move-beginning-of-line nil)))
