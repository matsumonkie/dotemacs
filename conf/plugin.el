;; ------------------------------
;; ----------- PLUGINS ----------
;; ------------------------------



;; Add the plugins folder to the load path
(setq plugins-folder (expand-file-name "~/.emacs.d/plugins"))
(add-to-list 'load-path plugins-folder)

;; Linum visible in all modes
(load "linum.el")
(require 'linum)
(global-linum-mode 1) 

;; Yasnippet
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;; Tabbar
(require 'tabbar)
(tabbar-mode)
(setq
	tabbar-scroll-left-help-function nil   ;don't show help information
	tabbar-scroll-right-help-function nil
	tabbar-help-on-tab-function nil
	tabbar-home-help-function nil
	tabbar-buffer-home-button (quote (("") "")) ;don't show tabbar button
	tabbar-scroll-left-button (quote (("") ""))
	tabbar-scroll-right-button (quote (("") "")))

(set-face-attribute 'tabbar-default		nil :weight 'normal
											:width 'normal
											:background "gray60")
(set-face-attribute 'tabbar-unselected	nil :background "gray70" :foreground "black" :box nil)
(set-face-attribute 'tabbar-selected	nil :background "white" :foreground "black" :box nil)
(set-face-attribute 'tabbar-button		nil :box '(:line-width 1 :color "gray72" :style released-button))
(set-face-attribute 'tabbar-separator	nil :height 0.7)

;; Org Mode
;(add-to-list 'load-path "~/.emacs.d/plugins/org-7.7/lisp")
;(require 'org-install)
;(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;(define-key global-map "\C-cl" 'org-store-link)
;(define-key global-map "\C-ca" 'org-agenda)
;(setq org-log-done 1)


; (defun tabbar-buffer-groups ()
;   "Return the list of group names the current buffer belongs to.
; This function is a custom function for tabbar-mode's tabbar-buffer-groups.
; This function group all buffers into 3 groups:
; Those Dired, those user buffer, and those emacs buffer.
; Emacs buffer are those starting with “*”."
;   (list
;    (cond
;     ((string-equal "*" (substring (buffer-name) 0 1))
;      '("Emacs Buffer")
;      )
;     ((eq major-mode 'dired-mode)
;      '("Dired")
;      )
;     (t
;      '("User Buffer")
;      )
;     ))) ;; from Xah Lee
;
; (setq tabbar-buffer-groups-function 'tabbar-buffer-groups)



;; BOOKMARKS

(setq bm-restore-repository-on-load t)
(require 'bm) 
;; make bookmarks persistent as default
(setq-default bm-buffer-persistence t)
;; Loading the repository from file when on start up.
(add-hook' after-init-hook 'bm-repository-load)
;; Restoring bookmarks when on file find.
(add-hook 'find-file-hooks 'bm-buffer-restore) 
;; Saving bookmark data on killing a buffer
(add-hook 'kill-buffer-hook 'bm-buffer-save)
;; Saving the repository to file when on exit.
;; kill-buffer-hook is not called when emacs is killed, so we
;; must save all bookmarks first.
(add-hook 'kill-emacs-hook '(lambda nil
                              (bm-buffer-save-all)
                              (bm-repository-save)))

(require 'redo+)
;; fooooo
;; M-x animate-birthday-present
;; M-x butterfly
;; 