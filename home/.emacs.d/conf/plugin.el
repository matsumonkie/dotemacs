(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defun install-package (name)
  (unless (package-installed-p name)
    (package-refresh-contents) (package-install name)))

;; Linum+ visible in all modes
(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'linum+)
(global-linum-mode 1)

;; Redo +
(install-package 'redo+)
(require 'redo+)

;; Nav
(install-package 'nav)
(require 'nav)
(global-set-key [f8] 'nav-toggle)

;; Tabbar
(install-package 'tabbar)

;; ido
(require 'ido)
(ido-mode t)

;; flx-ido
(install-package 'flx-ido)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; projectile
(install-package 'projectile)
(projectile-global-mode)
(global-set-key (kbd "C-SPC a") 'projectile-find-file)

;; Auto-complete
(install-package 'auto-complete)
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
                  "~/.emacs.d/plugins/auto-complete/dict")
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)

;; Yari
(install-package 'yari)
(defun ri-bind-key ()
  (local-set-key [f1] 'yari))
(add-hook 'ruby-mode-hook 'ri-bind-key)

;; Ace jump mode
(install-package 'ace-jump-mode)
(require 'ace-jump-mode)
(global-set-key (kbd "C-j") 'ace-jump-mode)

;; Expand region
(install-package 'expand-region)
(require 'expand-region)
(global-set-key (kbd "M-o") 'er/expand-region)

;; Multiple cursor
(install-package 'multiple-cursors)
(require 'multiple-cursors)

;; Magit
(install-package 'magit)
(require 'magit)

;; Org mode
(install-package 'org)
(require 'org-install)
(load "~/.emacs.d/conf/org.el")
