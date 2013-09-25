;; No menu nor bar
(tool-bar-mode 0)
(menu-bar-mode 0)

;; Syntaxical colorisation enabled
(require 'font-lock)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
 
;; 24h hour format
(display-time)
(setq display-time-24hr-format t) 

;; Line and column number enabled
(column-number-mode t)
(line-number-mode t)

;; No blinking cursor
(blink-cursor-mode -1)

;; Frame name = edited file name
(setq frame-title-format '(buffer-file-name "%f"))

(add-to-list 'load-path "~/.emacs.d/themes")

;; Theme tango tango
(require 'color-theme)
(setq color-theme-load-all-themes nil)
(require 'color-theme-tangotango)
(color-theme-tangotango)

;; Underline current line
(global-hl-line-mode 1)
(set-face-background 'highlight "#5a5c59")
