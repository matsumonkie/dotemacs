;;; Package

(install-package 'haskell-mode)
(require 'haskell-mode)
(require 'haskell-interactive-mode)
(require 'haskell-process)

;; This will auto insert "module XXX where" template when creating a new XXX.hs file
(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;; With ghc 8.X, errors are no longer shown in the repl. This fix it !
(setq haskell-process-args-stack-ghci
      '("--ghci-options=-ferror-spans -fshow-loaded-modules"
        "--no-build" "--no-load"))

(custom-set-variables
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-interactive-popup-errors nil)
 '(haskell-process-suggest-hoogle-imports t)
 '(haskell-process-log t)
 '(haskell-process-type 'stack-ghci))

(setq haskell-compile-cabal-build-command "stack build")

;; Create tags on save
(custom-set-variables '(haskell-tags-on-save t))
(define-key haskell-mode-map (kbd "M-.") 'haskell-mode-tag-find)

;; somehow this settings remove the pragma: {-# LANGUAGE ViewPatterns #-} on every save...
;;(custom-set-variables '(haskell-stylish-on-save t))


;;; Shortcuts

(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile)
     (define-key haskell-mode-map (kbd "C-c C-l") 'my-haskell-process-load-file)
     (define-key haskell-mode-map (kbd "C-c C-m") 'my-load-and-execute)
     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
     ))

(define-key haskell-mode-map (kbd "M-s") 'haskell-interactive-mode-history-previous)
(define-key haskell-mode-map (kbd "M-r") 'haskell-interactive-mode-history-next)
(define-key haskell-cabal-mode-map (kbd "M-m") 'tabbar-forward-tab)

(defun my-haskell-process-load-file ()
  (interactive)
  "clear console & load code"
                                        ;  (when (fboundp 'haskell-interactive-mode-clear)
  (haskell-interactive-mode-clear)
  (haskell-process-load-file))

(defun my-load-and-execute ()
  (interactive)
  "load or reload code and execute the m function if present"
  (save-excursion
    (my-haskell-process-load-file)
    (haskell-interactive-switch)
    (insert "main")
    (haskell-interactive-mode-return)
    (sit-for 0.500)
    (haskell-interactive-switch-back)
    ))
