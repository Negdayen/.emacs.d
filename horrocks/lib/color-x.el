(require 'color)

(defun closest-available-color (color)
  (caar
   (sort
    (mapcar
     (lambda (available-color)
       (cons (car available-color)
             (color-distance (car available-color) color)))
     (list-colors-duplicates))
    (lambda (c1 c2) (< (cdr c1) (cdr c2))))))

(defun color-name-to-hsl (color)
  (apply #'color-rgb-to-hsl (color-name-to-rgb color)))

(defun hsl-to-hex (hsl)
  (apply #'color-rgb-to-hex (color-hsl-to-rgb (car hsl) (cadr hsl) (caddr hsl))))

(defun hue+ (hsl h)
  (list (mod (+ (car hsl) h) 1)
        (cadr hsl)
        (caddr hsl)))

(defun light+ (hsl l)
  (list (car hsl)
        (cadr hsl)
        (mod (+ (caddr hsl) l) 1)))

(defun sat+ (hsl s)
  (list (car hsl)
        (mod (+ (cadr hsl) s) 1)
        (caddr hsl)))

(defun set-hue (hsl h)
  (list h (cadr hsl) (caddr hsl)))

(defun set-light (hsl l)
  (list (car hsl) (cadr hsl) l))

(defun set-sat (hsl s)
  (list (car hsl) s (caddr hsl)))

(provide 'color-x)
