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

;; Yasnippet
(install-package 'yasnippet)
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/plugins/yasnippets-rails/rails-snippets"
        "~/.emacs.d/elpa/yasnippet-20131031.628/snippets"))
(yas-global-mode 1)

;; Tabbar
(if (display-graphic-p)
    (progn
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
      ))

;; Redo +
(install-package 'redo+)
(require 'redo+)

;; Nav
(install-package 'nav)
(require 'nav)
(nav-disable-overeager-window-splitting)
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
;(install-package 'auto-complete)
;(require 'auto-complete)

;; Yari
(install-package 'yari)
(defun ri-bind-key ()
  (local-set-key [f1] 'yari))

(add-hook 'ruby-mode-hook 'ri-bind-key)


