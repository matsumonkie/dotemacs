;; Haskell mode
(install-package 'haskell-mode)
(require 'haskell-mode)
;;(require 'haskell-interactive-mode)
(require 'haskell-process)
;;(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(custom-set-variables
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-interactive-popup-errors nil))

(define-key haskell-mode-map (kbd "C-c C-l") 'my-haskell-process-load-file)
(define-key haskell-mode-map (kbd "C-x") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-x") 'haskell-interactive-at-prompt)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
(define-key haskell-mode-map (kbd "M-s") 'haskell-interactive-mode-history-previous)
(define-key haskell-mode-map (kbd "M-r") 'haskell-interactive-mode-history-next)
(define-key haskell-mode-map (kbd "C-c C-m") 'my-load-and-execute)

(define-key haskell-cabal-mode-map (kbd "M-m") 'tabbar-forward-tab)

(defun my-haskell-process-load-file ()
  (interactive)
  "clear console & load code"
    (when (fboundp 'haskell-interactive-mode-clear) haskell-interactive-mode-clear)
    (haskell-process-load-file)
  )

(defun my-load-and-execute ()
  (interactive)
  "load or reload code and execute the m function if present"
  (save-excursion
    (haskell-interactive-mode-clear)
    (haskell-process-reload)
    (haskell-interactive-mode-run-expr "main")
  ))
