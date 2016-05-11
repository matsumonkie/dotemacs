;; Replace
(defalias 'r 'query-replace)

;; Line mode
(defalias 'glm 'global-hl-line-mode)

;; Macro
(defalias 'sm 'start-kbd-macro)
(defalias 'em 'end-kbd-macro)
(defalias 'lm 'call-last-kbd-macro)

;; Rectangle
(defalias 'rm 'rectangle-mark-mode)

;; Upcase / downcase
(defalias 'ur 'upcase-region)
(defalias 'uw 'upcase-word)
(defalias 'dr 'downcase-region)
(defalias 'dw 'downcase-word)
(defalias 'ir 'downcase-word)

(defalias 'dtw 'delete-trailing-whitespace)
(defalias 'eb 'eval-buffer)

(defalias 'ar 'align-regexp)
;; Align with the symbol '='
(defalias 'ceq 'my-c-equal-align)

;; Information sur une commande
(defalias 'ap 'apropos)

;; buffer
(defalias 'mwb 'mark-whole-bufferi)
(defalias 'kb 'ido-kill-buffer)
(defalias 'reload 'revert-buffer)
(defalias 'ib 'indent-buffer)

;; Narrow
(defalias 'nr  'narrow-to-region)
(defalias 'wd  'widen)

;; Package
(defalias 'pl 'package-list-packages)

;; Multiple cursor
(defalias 'cml 'mc/edit-lines)
(defalias 'cmn 'mc/mark-next-like-this)
(defalias 'cmp 'mc/mark-previous-like-this)
(defalias 'cma 'mc/mark-all-like-this)

;; Magit
(defalias 'mm 'magit-mode)
(defalias 'gs 'magit-status)
(defalias 'gbm 'magit-blame-mode)

;; window
(defalias 'o 'other-window)
(defalias 'q 'delete-window)
(defalias 'f 'delete-other-windows)

;; copy/paste
(defalias 'cc 'copy-to-clipboard)
(defalias 'pc 'paste-from-clipboard)

;; visual line mode
(defalias 'vlm 'visual-line-mode)

;; artist mode
(defalias 'draw 'artist-select-operation)
