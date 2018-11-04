(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defun install-package (name)
  (unless (package-installed-p name)
    (package-refresh-contents) (package-install name)))

;;; Linum
(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'linum+)
(global-linum-mode 1)

;;; Redo +
(install-package 'redo+)
(require 'redo+)

;;; Nav
(install-package 'nav)
(require 'nav)
(global-set-key [f8] 'nav-toggle)

;;; Tabbar
(install-package 'tabbar)

;;; Ido
(require 'ido)
(ido-mode t)

;;; Flx-ido
(install-package 'flx-ido)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;;; Projectile
(install-package 'projectile)
(projectile-mode)
(global-set-key (kbd "C-SPC a") 'projectile-find-file)
                                        ;(global-set-key (kbd "C-SPC d") 'projectile-find-file-in-directory)
(global-set-key (kbd "C-SPC p") 'projectile-switch-project)

;;; Ace jump mode
(install-package 'ace-jump-mode)
(require 'ace-jump-mode)
(setq ace-jump-mode-case-fold nil)
(global-set-key (kbd "C-j") 'ace-jump-mode)
(global-set-key (kbd "M-j") 'ace-jump-char-mode)

;;; Expand region
(install-package 'expand-region)
(require 'expand-region)
(global-set-key (kbd "M-o") 'er/expand-region)

;;; Multiple cursor
(install-package 'multiple-cursors)
(require 'multiple-cursors)

;;; Magit
(install-package 'magit)
(require 'magit)
;; prevent instructions from being shown at startup
(setq magit-last-seen-setup-instructions "1.4.0")

;;; Org mode
(install-package 'org)
(require 'org-install)
(load "~/.emacs.d/conf/org.el")

;;; Web mode (.erb)
(install-package 'web-mode)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(setq web-mode-extra-auto-pairs
      '(("erb"  . (("open" "close")))
        ("php"  . (("open" "close")
                   ("open" "close")))
        ))
(setq web-mode-enable-auto-pairing t)

;;; Coffee mode
(install-package 'coffee-mode)
(custom-set-variables '(coffee-tab-width 2))

;;; Slim-mode
(install-package 'slim-mode)
(require 'slim-mode)

;;; Github markdown
(install-package 'markdown-mode)
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(custom-set-variables
 '(markdown-command "rdiscount"))

;;; ERC
(setq erc-hide-list '("JOIN" "PART" "QUIT"))

(require 'erc-match)
(setq erc-keywords '("iori" "itsu"))
(setq erc-autojoin-channels-alists
      '(("freenode.net" "#emacs" "#haskell")))
(add-to-list 'erc-nick "itsu")

;;; Jade
(install-package 'jade-mode)
(require 'jade-mode)

;;; Elm
(install-package 'elm-mode)
(require 'elm-mode)

;;; Csv
(install-package 'csv-mode)
(require 'csv-mode)

;;; Vimish Fold
(install-package 'vimish-fold)
(require 'vimish-fold)
(global-set-key (kbd "C-SPC t") 'my-fold-toggle)

;;; Outline & Outshine

(install-package 'outshine)
(require 'outshine)

(add-hook 'outline-minor-mode-hook 'outshine-hook-function)
(add-hook 'prog-mode-hook 'outline-minor-mode)
;; for haskell, headers like `--*` will not compile
;; this var makes it possible to write headers like: `-- *`
(setq outshine-preserve-delimiter-whitespace t)

(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)

(custom-set-faces
 '(markdown-header-face-1 ((t (:inherit outline-1))))
 '(markdown-header-face-2 ((t (:inherit outline-2))))
 '(outline-1 ((t (:foreground "red" :bold t :underline t))))
 '(outline-2 ((t (:foreground "yellow" :bold nil :underline t))))
 )

(set-display-table-slot standard-display-table
                        'selective-display
                        (string-to-vector "[…]"))

(defun -add-font-lock-kwds (FONT-LOCK-ALIST)
  (font-lock-add-keywords
   nil (--map (-let (((rgx uni-point) it))
                `(,rgx (0 (progn
                            (compose-region (match-beginning 1) (match-end 1)
                                            ,(concat "\t" (list uni-point)))
                            nil))))
              FONT-LOCK-ALIST)))

(defmacro add-font-locks (FONT-LOCK-HOOKS-ALIST)
  `(--each ,FONT-LOCK-HOOKS-ALIST
     (-let (((font-locks . mode-hooks) it))
       (--each mode-hooks
         (add-hook it (-partial '-add-font-lock-kwds
                                (symbol-value font-locks)))))))

(defconst lisp-outlines-font-lock-alist
  ;; Outlines
  '(("\\(^-- \\*\\) "          ?■)
    ("\\(^-- \\*\\*\\) "       ?○)
    ("\\(^-- \\*\\*\\*\\) "    ?✸)
    ("\\(^-- \\*\\*\\*\\*\\) " ?✿)))
(add-font-locks                                         '((lisp-outlines-font-lock-alist haskell-mode-hook)))
