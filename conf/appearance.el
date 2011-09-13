;; ------------------------------
;; --------- APPEARANCE ---------
;; ------------------------------
 
 
;; Suppression des barres d'icônes
(tool-bar-mode 0)
(menu-bar-mode 0)

;; Colorisation syntaxique maximale dans tous les modes
(require 'font-lock)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; Couleur de fond et écriture a la gedit pour emacs en interface graphique
;;(if window-system
;;(setq default-frame-alist
;;' ((foreground-color . "white")
;;   (background-color . "#252525") ;; black pour un fond noir
;;)))
 
;; couleur de la police du buffer
;;(set-face-background 'modeline     "lightgreen")

;; couleur de selection
;(set-face-foreground 'region    "black")
;(set-face-background 'region    "grey")

;; heure au format 24h
(display-time)
(setq display-time-24hr-format t) 

;; Numéro de ligne et de colonne
(column-number-mode t)
(line-number-mode t)

;; Personnalisation du curseur
(setq default-cursor-type '(bar . 2))
(set-cursor-color "red")
(blink-cursor-mode -1)

;; on change le nom de la fenetre par le nom du fichier edité 
(setq frame-title-format '(buffer-file-name "%f"))


(add-to-list 'load-path "~/.emacs.d/themes")

;; Theme tango tango
(require 'color-theme)
(setq color-theme-load-all-themes nil)
(require 'color-theme-tangotango)
(color-theme-tangotango)

;; surligner la ligne ou se trouve le curseur
(global-hl-line-mode 1)
;; Surlignage façon gedit
(set-face-background 'highlight "#5a5c59")
;(set-face-foreground 'highlight "white")

;; Nyancat Mode
(add-to-list 'load-path "~/.emacs.d/themes/nyancat-mode")
(require 'nyan-mode)
(nyan-mode)