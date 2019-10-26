(defun layout/grid (m n)
  (interactive "nNumber of rows: \nnNumber of columns: ")
  (delete-other-windows)
  (let ((rows (number-sequence 1 m))
        (vsplits (number-sequence 1 (- m 1)))
        (hsplits (number-sequence 1 (- n 1))))
    (dolist (vsplit vsplits)
      (split-window-vertically)
      (balance-windows))
    (dolist (row rows)
      (dolist (hsplit hsplits)
        (split-window-horizontally)
        (balance-windows))
      (when (window-in-direction 'below)
        (select-window (window-in-direction 'below))))))

(defun layout/inverted-thong ()
  (interactive)
  (delete-other-windows)
  (split-window-vertically)
  (split-window-horizontally)
  (balance-windows)
  (enlarge-window 10))

(defun layout/fork ()
  (interactive)
  (delete-other-windows)
  (split-window-vertically)
  (split-window-horizontally)
  (split-window-horizontally)
  (select-window (window-in-direction 'below))
  (split-window-horizontally)
  (balance-windows-area)
  (shrink-window 6))

(defun layout/sandal ()
  (interactive)
  (delete-other-windows)
  (split-window-vertically)
  (balance-windows)
  (enlarge-window 10))

(defun layout/sandals ()
  (interactive)
  (delete-other-windows)
  (split-window-vertically)
  (split-window-horizontally)
  (select-window (window-in-direction 'below))
  (split-window-horizontally)
  (shrink-window 15))

(defun layout/thong ()
  (interactive)
  (delete-other-windows)
  (split-window-vertically)
  (select-window (window-in-direction 'below))
  (enlarge-window 15)
  (split-window-horizontally))
