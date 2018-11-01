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
(blink-cursor-mode nil)

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
;(global-hl-line-mode 1)
;(set-face-background 'hl-line "#111")
;(set-face-foreground 'highlight nil)

;; Tabbar
(require 'tabbar)
(tabbar-mode)

(setq
 tabbar-scroll-left-help-function  nil   ; do not show help information
 tabbar-scroll-right-help-function nil
 tabbar-help-on-tab-function       nil
 tabbar-home-help-function         nil
 tabbar-buffer-home-button  (quote (("") "")) ; do not show tabbar button
 tabbar-scroll-left-button  (quote (("") ""))
 tabbar-scroll-right-button (quote (("") "")))

(set-face-attribute 'tabbar-default nil :weight 'normal :width 'normal :background "blue" :underline nil)
(set-face-attribute 'tabbar-unselected	nil :background "blue"   :foreground "white" :box nil)
(set-face-attribute 'tabbar-selected	nil :background "yellow" :foreground "black" :box nil)
(setq tabbar-separator '(1))

;; Add a buffer modification state indicator in the tab label, and place a
;; space around the label to make it looks less crowd.
(defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
  (setq ad-return-value
    (if (and (buffer-modified-p (tabbar-tab-value tab))
             (buffer-file-name (tabbar-tab-value tab)))
        (concat "*" (concat ad-return-value ""))
        (concat "" (concat ad-return-value "")))))

(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
This function is a custom function for tabbar-mode's tabbar-buffer-groups.
This function group all buffers into 3 groups:
Those Dired, those user buffer, and those emacs buffer.
Emacs buffer are those starting with “*”."
  (list
   (cond
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    (t
     "User Buffer"
     )
    )))

(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)
