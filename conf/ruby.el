;; Enhanced Ruby Mode
(add-to-list 'load-path 
             "~/.emacs.d/plugins/Enhanced-Ruby-Mode")
(require 'ruby-mode)

(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'ruby-mode-hook 'set-newline-and-indent)

;; HAML mode
(add-hook 'haml-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (local-set-key (kbd "RET") 'newline-and-indent)))

(defun install-package (name)  
  (unless (package-installed-p name)
    (package-refresh-contents) (package-install name)))

;; Ruby electric mode
(install-package 'ruby-electric)

(defun my-ruby-mode-hook ()
  (ruby-electric-mode))
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook) 
