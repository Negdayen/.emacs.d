(require 'hydra)

(defhydra hydra-apropos (:exit t
                         :hint nil)
  "
_a_propos
_c_md
_d_ocumentation
_i_nfo
_l_ibrary
_t_ags
_u_ser option
_v_alue
va_r_iable
"
  ("a" apropos)
  ("c" apropos-command)
  ("d" apropos-documentation)
  ("i" info-apropos)
  ("l" apropos-library)
  ("r" apropos-variable)
  ("t" tags-apropos)
  ("u" apropos-user-option)
  ("v" apropos-value))

(provide 'hydra-apropos)
