;; Enhanced Ruby Mode
(install-package 'ruby-mode)
(require 'ruby-mode)

(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'ruby-mode-hook 'set-newline-and-indent)

;; HAML mode
(install-package 'haml-mode)
(add-hook 'haml-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (local-set-key (kbd "RET") 'newline-and-indent)))

;; Ruby electric mode
(install-package 'ruby-electric)
(defun my-ruby-mode-hook ()
  (ruby-electric-mode))
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook) 
