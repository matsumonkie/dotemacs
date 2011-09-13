;; Upcase / downcase
(defalias 'ucr 'upcase-region)
(defalias 'ucw 'upcase-word)
(defalias 'dcr 'downcase-region)
(defalias 'dcw 'downcase-word)

(defalias 'eb 'eval-buffer)

(defalias 'ar 'align-regexp)
;; Align with the symbol '='
(defalias 'ceq 'my-c-equal-align)

;; Information sur une commande
(defalias 'ap 'apropos)

;; Mark whole buffer
(defalias 'mwb 'mark-whole-bufferi)

;; Magit
(defalias 'ms 'magit-status)

;; C/C++
(defalias 'av  'my-align-vars)
(defalias 'aav 'my-align-all-vars)
(defalias 'c   'my-comment)

(defalias 'ir  'indent-region)
(defalias 'il  'my-indent-line)
(defalias 'ib  'my-indent-buffer)

(defalias 'dtw 'delete-trailing-whitespace)
(defalias 'fb  'my-format-buffer)
(defalias 'ac  'align-current)

;; Narrow
(defalias 'nr  'narrow-to-region)


