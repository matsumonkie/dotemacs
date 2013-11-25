;; ------------------------------
;; ----------- SCALA ------------
;; ------------------------------

;; Scala mode 2
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
          
;; AutoComplete
(unless (package-installed-p 'rsense)
  (package-refresh-contents) (package-install 'rsense))
(require 'rsense)

(load "~/.emacs.d/conf/ruby.el")
(load "~/.emacs.d/conf/scala.el")
