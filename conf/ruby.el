;; Enhanced Ruby Mode
(install-package 'ruby-mode)
(require 'ruby-mode)

(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'ruby-mode-hook 'set-newline-and-indent)

;; HAML mode
(install-package 'haml-mode)

;; Ruby electric mode
(install-package 'ruby-electric)
(defun my-ruby-mode-hook ()
  (ruby-electric-mode))
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook) 

;;fix ruby electric bug
(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

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
))
