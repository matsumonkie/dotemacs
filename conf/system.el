;; Fast boot
(modify-frame-parameters nil '((wait-for-wm . nil)))
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)

;; Backup in specified folder
(setq backup-directory "~/.emacs.d/backups")
(unless (file-exists-p backup-directory)
  (make-directory backup-directory))
(setq backup-directory-alist `(("." . backup-directory)))

;; No ~ backup
;(setq make-backup-files nil)
(setq version-control t)
;(setq auto-save-list-file-name  nil) ; Don't want any .saves files
;(setq auto-save-default         nil) ; Don't want any auto saving 
;; Otherwise it keeps asking
(setq kept-new-versions 30)
(setq delete-old-versions t)

;; UTF-8
(set-language-environment   'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment   'utf-8)
(prefer-coding-system       'utf-8)

;; No carriage return for long line 
(if (boundp 'truncate-lines)
    (setq-default truncate-lines t) ; always truncate
  (progn
    (setq hscroll-margin 1)
    (setq auto-hscroll-mode 1)
    (setq automatic-hscrolling t)))

;; le contenu se déplace d'une seule ligne en fin de fenetre 
;(setq scroll-step 1)

;; No visual alert
(setq visible-bell 'nil)

;; Cursor position fixed when page is scrolled
;(setq scroll-preserve-screen-position t)

; Save cursor position and load it automatically when opening file
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; Find not case sensitive
(setq case-fold-search nil)

;; Selection can be overwrite 
(delete-selection-mode 1)

;; Mouse support
(if (load "mwheel" t)
	(mwheel-install))

;; Corresponding parentheses shown
(require 'paren)
(show-paren-mode t)
(setq blink-matching-paren t)
(setq blink-matching-paren-on-screen t) 
(setq blink-matching-paren-dont-ignore-comments t)
(set-face-background 'show-paren-match-face "grey")

;; Automatic completion
(require 'dabbrev)
(set 'dabbrev-case-fold-search nil)
(set 'dabbrev-case-replace nil)
(global-set-key [(f1)] 'dabbrev-completion)
(global-set-key (kbd "\C-q") (quote dabbrev-expand))

;; Mode associated to file extension
(setq auto-mode-alist
  (append
    '(("\\.C$"    . c++-mode)
      ("\\.H$"    . c++-mode)
      ("\\.cc$"   . c++-mode)
      ("\\.hh$"   . c++-mode)
      ("\\.c$"    . c-mode)
      ("\\.h$"    . c++-mode)
      ("\\.m$"    . objc-mode)
      ("\\.java$" . java-mode)
      ("\\.tex$"  . latex-mode)
   ) auto-mode-alist))

;; Use same buffer for compilation
(setq-default display-buffer-reuse-frames t)

;; Allow narrowing region
(put 'narrow-to-region 'disabled nil)

;; Allow downcase-region
(put 'downcase-region 'disabled nil)
