;; Haskell mode
(install-package 'haskell-mode)
(require 'haskell-mode)
(require 'haskell-interactive-mode)
(require 'haskell-process)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-interactive-popup-errors nil)
  '(haskell-process-log t)
  '(haskell-process-type 'stack-ghci))

(setq haskell-compile-cabal-build-command "stack build")

(eval-after-load "haskell-mode"
  '(progn

     (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile)
     (define-key haskell-mode-map (kbd "C-c C-l") 'my-haskell-process-load-file)
     (define-key haskell-mode-map (kbd "C-c C-m") 'my-load-and-execute)
     ))

;(define-key haskell-mode-map (kbd "M-s") 'haskell-interactive-mode-history-previous)
;(define-key haskell-mode-map (kbd "M-r") 'haskell-interactive-mode-history-next)
;(define-key haskell-cabal-mode-map (kbd "M-m") 'tabbar-forward-tab)

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
    (haskell-interactive-mode-run-expr "main")
  ))
