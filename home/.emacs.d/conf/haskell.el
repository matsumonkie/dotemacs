;; Haskell mode
(install-package 'haskell-mode)
(require 'haskell-mode)
;;(require 'haskell-interactive-mode)
(require 'haskell-process)
;;(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))

(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)

(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)

(defun my-load-and-execute ()
  (interactive)
  "load or reload code and execute the m function if present"
  (progn
    (haskell-process-load-or-reload)
    ;;    (switch-to-buffer-other-window "*haskell*")
    (other-window 1)
;    (haskell-interactive-mode-clear)
    (insert "m")
    (newline)
    ;haskell-interactive-mode-return)
    (other-window 1)
  ))

(define-key haskell-mode-map (kbd "C-c C-m") 'my-load-and-execute)
