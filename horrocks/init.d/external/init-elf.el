(defconst regex-filename-elf
  (rx (sequence (one-or-more anything)
                (or ".a"
                    ".o"
                    (sequence ".so" (zero-or-more
                                     (sequence "." (one-or-more digit)))))
                string-end))
  "Regex to match against filenames that are indicative of elf binaries.")

(defmacro use-package-elf-mode ()
  `(use-package elf-mode
     :mode (,regex-filename-elf . elf-mode)))

(use-package-elf-mode)
