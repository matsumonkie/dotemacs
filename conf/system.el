;; Fast boot
(modify-frame-parameters nil '((wait-for-wm . nil)))
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)

;; BACKUP
(defvar my-backup-directory (concat user-emacs-directory "backups"))
(unless (file-exists-p my-backup-directory)
  (make-directory my-backup-directory))
(setq backup-directory-alist
  `((".*" . ,my-backup-directory)))
(setq auto-save-file-name-transforms
  `((".*" ,my-backup-directory t)))
(setq delete-old-versions t
      backup-by-copying t          ; copy rather than rename, slower but simpler
      kept-new-versions 6
      kept-old-versions 2
      version-control t            ; version numbers for backup file
      delete-old-versions t 
      delete-by-moving-to-trash t
      auto-save-default nil        ; no #file# backups
      )

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
(setq save-place-file (concat user-emacs-directory "saveplace"))
(setq-default save-place t)
(require 'saveplace)

;; Find case sensitive
(setq case-fold-search nil)

;; Selection can be overwrite 
(delete-selection-mode 1)

;; Mouse support
(if (load "mwheel" t)
	(mwheel-install))

;; Corresponding parentheses shown
(require 'paren)
(show-paren-mode t)
(setq blink-matching-paren t
 blink-matching-paren-on-screen t
 blink-matching-paren-dont-ignore-comments t)
(set-face-background 'show-paren-match-face "green")

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

;; Indent with space only
(setq-default indent-tabs-mode nil)
