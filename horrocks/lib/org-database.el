(require 'dash)
(require 'org-table)

(defun distinct-elements-p (list)
  "Return non-nil if all elements in LIST are distinct."
  (equal (length (-uniq list)) (length list)))

(defun org-database-distinct-table-names-p ()
  "Return non-nil if all the org tables names in the current buffer are
distinct."
  ;; unnamed tables are nil: filter these out.
  (distinct-elements-p (-filter #'identity (org-database-table-names))))

(defun org-database-export (&optional output-db-filepath)
  "Export all named org tables in the current buffer as a sqlite3 database to
OUTPUT-DB-FILEPATH."
  (interactive "FExport to: ")
  (or (org-database-distinct-table-names-p) (error "org table name not unique"))
  (or (executable-find "sqlite3") (error "sqlite3 not found"))
  (let ((output-db-filepath
         (or output-db-filepath
             (concat (file-name-base (buffer-name)) ".sqlite3"))))
    (delete-file output-db-filepath)
    (org-table-map-tables
     (lambda ()
       (let ((table-name (org-element-property :name (org-element-at-point))))
         (when table-name
           (let ((temp-file (make-temp-file "org-database-table-")))
             (org-table-export temp-file "orgtbl-to-tsv")
             (unwind-protect
                 (shell-command
                  (format "sqlite3 %s '.mode tabs' '.import %s %s'"
                          output-db-filepath
                          temp-file
                          table-name))
               (delete-file temp-file)))))))))

(defun org-database-table-names ()
  "Return list of names of tables in current buffer.  May contain nil elements
for unnamed tables."
  (let ((names '()))
    (org-table-map-tables
     (lambda () (push (org-element-property :name (org-element-at-point))
                 names)))
    names))

(provide 'org-database)
