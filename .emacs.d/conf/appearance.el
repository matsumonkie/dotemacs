;; No menu nor bar
(tool-bar-mode 0)
(menu-bar-mode 0)

;; syntaxical colorisation enabled
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

;; Nyan cat mode & tangotango theme when graphic mode
(install-package 'tangotango-theme)
(if (display-graphic-p)
  (progn
    (add-to-list 'load-path (concat user-emacs-directory "themes/nyancat-mode"))
    (require 'nyan-mode)
    (nyan-mode)
    (load-theme 'tangotango t)))

;; Underline current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#222")
(set-face-foreground 'highlight nil)

