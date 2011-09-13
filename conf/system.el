;; ------------------------------
;; ----------- SYSTEM -----------
;; ------------------------------



;; démarrage rapide
(modify-frame-parameters nil '((wait-for-wm . nil)))

;; Inhiber l'affichage du message d'accueil
(setq inhibit-startup-message t)

;; C'est fastidieux de taper « yes » pour confirmer, raccourcissons
(fset 'yes-or-no-p 'y-or-n-p)

;; Make all backups in a single directory
(if (file-exists-p "~/.emacs.d/backups")
(setq backup-directory-alist `(("." . "~/.emacs.d/backups"))))
;; Pas de fichier en ~
(setq make-backup-files nil)
(setq version-control t)
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving 
; otherwise it keeps asking
(setq kept-new-versions 30)
(setq delete-old-versions t)

;; Scrollbar positionner a droite
(custom-set-variables '(scroll-bar-mode (quote right)))

;; UTF-8
(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)

;; Par défaut, lorsqu'Emacs est lancé dans un terminal, il ne s'adapte
;; pas à la configuration du terminal et du clavier et ne procède donc
;; à aucune conversion des entrées/sorties. Les lignes ci-dessous lui
;; demandent de le faire en se basant sur les locales.
;(when (not window-system)
;  (set-language-environment locale-coding-system)
;  (set-keyboard-coding-system locale-coding-system)
;  (set-terminal-coding-system locale-coding-system))

;; Tabulation de 4 char
;(setq-default tab-width 4)
;(setq indent-line-function 'insert-tab)

;; Plus de retour a la ligne pour les lignes trop longues
;; Et defilement horizontal activé
(if (boundp 'truncate-lines)
    (setq-default truncate-lines t) ; always truncate
  (progn
    (setq hscroll-margin 1)
    (setq auto-hscroll-mode 1)
    (setq automatic-hscrolling t)
   ))

;; Start scrolling when 2 lines from top/bottom
(setq scroll-margin 2)
;; le contenu se déplace d'une seule ligne en fin de fenetre 
(setq scroll-step 1)

;; Pas d'alerte visuelle
(setq visible-bell 'nil)

; Laisser le curseur en place lors d'un défilement par pages.
(setq scroll-preserve-screen-position t)

; Save cursor position and load it automatically when openning file
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; Recherche insensible a la casse
(setq case-fold-search nil)

;; Lorsqu'on saisit un texte alors qu'une zone est sélectionnée,
;; cette dernière est écrasée par le texte saisi.
(delete-selection-mode 1)

;; activer la souris
(if (load "mwheel" t)
	(mwheel-install))

;; Montrer la correspondance des parenthèses (systématiquement et non seulement après la frappe)
(require 'paren)
(show-paren-mode t)
(setq blink-matching-paren t)
(setq blink-matching-paren-on-screen t) 
(setq blink-matching-paren-dont-ignore-comments t)
(set-face-background 'show-paren-match-face "grey")

;; Completion automatique
(require 'dabbrev)
(set 'dabbrev-case-fold-search nil)
(set 'dabbrev-case-replace nil)
(global-set-key [(f1)] 'dabbrev-completion)
(global-set-key (kbd "\C-q") (quote dabbrev-expand))

;; Extension de fichier et mode associés
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
     ) auto-mode-alist))

;; reutiliser le meme buffer pour compiler par exemple, ne pas ouvrir un autre buffer dans une autre frame a
(setq-default display-buffer-reuse-frames t)

;; Plein écran au démarrage
(toggle-fullscreen)

;; Allow narrowing region
(put 'narrow-to-region 'disabled nil)


;; Cat & mouse
;; marrant mais chiant quand on bosse avec la souris et le clavier
;; (mouse-avoidance-mode 'cat-and-mouse)
