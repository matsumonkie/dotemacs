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

;; Tabbar
(require 'tabbar)
(tabbar-mode)
(setq
 tabbar-scroll-left-help-function  nil   ; do not show help information
 tabbar-scroll-right-help-function nil
 tabbar-help-on-tab-function       nil
 tabbar-home-help-function         nil
 tabbar-buffer-home-button  (quote (("") "")) ; do not show tabbar button
 tabbar-scroll-left-button  (quote (("") ""))
 tabbar-scroll-right-button (quote (("") "")))

(set-face-attribute 'tabbar-default nil :weight 'normal :width 'normal :background "blue" :underline nil)
(set-face-attribute 'tabbar-unselected	nil :background "blue"   :foreground "white" :box nil)
(set-face-attribute 'tabbar-selected	nil :background "yellow" :foreground "black" :box nil)
(setq tabbar-separator '(1))

;; Add a buffer modification state indicator in the tab label, and place a
;; space around the label to make it looks less crowd.
(defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
  (setq ad-return-value
    (if (and (buffer-modified-p (tabbar-tab-value tab))
             (buffer-file-name (tabbar-tab-value tab)))
        (concat "*" (concat ad-return-value ""))
        (concat "" (concat ad-return-value "")))))

;; Redo +
(install-package 'redo+)
(require 'redo+)

;; Nav
(install-package 'nav)
(require 'nav)
(global-set-key [f8] 'nav-toggle)

;; ido
(require 'ido)
(ido-mode t)

;; Find all files in project
(install-package 'find-file-in-project)
(require 'find-file-in-project)
(global-set-key (kbd "C-SPC a") 'find-file-in-project)
(defvar ffip-patterns
  '("*.html" "*.org" "*.txt" "*.md" "*.el" "*.clj" "*.py" "*.rb" "*.js" "*.pl"
    "*.sh" "*.erl" "*.hs" "*.ml" "*.erb")
"List of patterns to look for with `find-file-in-project'.")

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

;; Rainbow mode
;(install-package 'rainbow-mode)
;(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
;  (lambda () (rainbow-mode 1)))
;(my-global-rainbow-mode 1)

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
