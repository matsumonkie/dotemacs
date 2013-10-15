;; Add plugins folder to the load path
(setq plugins-folder (expand-file-name "~/.emacs.d/plugins"))
(add-to-list 'load-path plugins-folder)

;; Linum+ visible in all modes
(require 'linum+)
(global-linum-mode 1) 

;; Yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; Tabbar
(require 'tabbar)
(tabbar-mode)
(setq
	tabbar-scroll-left-help-function nil   ; don't show help information
	tabbar-scroll-right-help-function nil
	tabbar-help-on-tab-function nil
	tabbar-home-help-function nil
	tabbar-buffer-home-button (quote (("") "")) ; don't show tabbar button
	tabbar-scroll-left-button (quote (("") ""))
	tabbar-scroll-right-button (quote (("") "")))

(set-face-attribute 'tabbar-default nil :weight 'normal
					:width 'normal
					:background "gray60")
(set-face-attribute 'tabbar-unselected	nil :background "gray70" :foreground "black" :box nil)
(set-face-attribute 'tabbar-selected	nil :background "white" :foreground "black" :box nil)
(set-face-attribute 'tabbar-button	nil :box '(:line-width 1 :color "gray72" :style released-button))
(set-face-attribute 'tabbar-separator	nil :height 0.7)

;; Redo +
(require 'redo+)

;; Key chord
(add-to-list 'load-path "~/.emacs.d/plugins/chord.el")
(require 'key-chord)
(key-chord-mode 1)
