;; ------------------------------
;; ------------ C/C++ -----------
;; ------------------------------


(defun my-c++-style-hook ()
  "set behaviour and style for c/c++ mode"

  ;; Style d'indentation Allman
  (c-set-style "bsd") 
  ;; Le pas d'indentation du code C/C++ est de 4 espaces
  (setq c-basic-offset 4)
  (setq c-indent-level 4)
  ;; We like hungry-delete
  (c-toggle-hungry-state 1)
  ;; Initial state of auto/hungry mode when buffer is first visited
  (setq c++-auto-hungry-initial-state t)

  (setq c++-delete-function 'backward-delete-char)
  (setq c++-tab-always-indent t)
  (setq c-continued-statement-offset 4)
  (setq c++-empty-arglist-indent 4)
)

(defun my-c++-shortcut-hook ()
  "set all the shortcut made for c/c++ mode"

  (local-set-key (kbd "C-SPC <right>") 'hs-show-block)
  (local-set-key (kbd "C-SPC <left>")  'hs-hide-block)
  (local-set-key (kbd "C-SPC <up>")    'hs-hide-all)
  (local-set-key (kbd "C-SPC <down>")  'hs-show-all)
	
  ; Editions shortcut
  (local-set-key (kbd "C-m")     'reindent-then-newline-and-indent)
  (local-set-key (kbd "C-SPC b") 'my-jump-bracket)

  (local-set-key "[" 'insert-brackets)
  (local-set-key "(" 'insert-parentheses)
   
  (local-set-key (kbd "C-SPC s") 'my-format-line)
  (local-set-key (kbd "C-SPC i") 'my-indent-line)
)


;; Add my own configuration mode
(add-hook 'c++-mode-hook 'my-c++-style-hook)
(add-hook 'c++-mode-hook 'my-c++-shortcut-hook)
(add-hook 'c-mode-hook 	 'my-c++-shortcut-hook)
(add-hook 'c-mode-hook 	 'my-c++-style-hook)


(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))
