;; Enhanced Ruby Mode
(install-package 'ruby-mode)
(require 'ruby-mode)

(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'ruby-mode-hook 'set-newline-and-indent)

;; HAML mode
(install-package 'haml-mode)

;; RSense
(install-package 'rsense)
(require 'rsense)

;; Rinari
(install-package 'rinari)
(require 'rinari)
(global-rinari-mode)

(add-hook 'rinari-minor-mode-hook (lambda()
  (local-set-key (kbd "C-c c") 'rinari-find-controller)
  (local-set-key (kbd "C-c m") 'rinari-find-model)
  (local-set-key (kbd "C-c v") 'rinari-find-view)
  (local-set-key (kbd "C-c f") 'rinari-find-file-in-project)
  (local-set-key (kbd "C-j") 'ace-jump-mode)
))

;; Ruby electric
;(require 'ruby-mode)

;(defun ruby-insert-end ()
;  (interactive)
;  (insert "end")
;  (ruby-indent-line t)
;  (end-of-line))

;; electric-ruby
(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'ruby-electric)
(add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode t)))

;; do not add header => -*- coding: utf-8 -*-
(setq ruby-insert-encoding-magic-comment nil)
