;; Upcase / downcase
(defalias 'ur 'upcase-region)
(defalias 'uw 'upcase-word)
(defalias 'dr 'downcase-region)
(defalias 'dw 'downcase-word)

(defalias 'eb 'eval-buffer)

(defalias 'ar 'align-regexp)
;; Align with the symbol '='
(defalias 'ceq 'my-c-equal-align)

;; Information sur une commande
(defalias 'ap 'apropos)

;; buffer
(defalias 'mwb 'mark-whole-bufferi)
(defalias 'kb 'ido-kill-buffer)

;; Magit
(defalias 'ms 'magit-status)

;; Narrow
(defalias 'nr  'narrow-to-region)

;; Package
(defalias 'pl 'package-list-packages)
