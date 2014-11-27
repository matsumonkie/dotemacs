;;
;; CTRL
;;

;; do not unset "\C-m" otherwise enter key does not work in console mode
(dolist (key '(
"\C-a" "\C-b" "\C-d" "\C-e" "\C-f" "\C-g"
"\C-j" "\C-k" "\C-l" "\C-n" "\C-o" "\C-p"
"\C-q" "\C-r" "\C-s" "\C-t" "\C-u" "\C-v"
"\C-w" "\C-x" "\C-y" "\C-z" "\C-SPC"))
(global-unset-key key))

;;
;; META
;;
(dolist (key '(
  "\M-a" "\M-b" "\M-c" "\M-d" "\M-e" "\M-f"
  "\M-g" "\M-h" "\M-j" "\M-k" "\M-l" "\M-m"
  "\M-n" "\M-o" "\M-p" "\M-q" "\M-r" "\M-s"
  "\M-t" "\M-u" "\M-v" "\M-w" "\M-x" "\M-y"
  "\M-z" "\M-SPC"))
(global-unset-key key))

(global-unset-key "\C-e\C-n")
