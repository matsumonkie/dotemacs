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

(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
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

(defun my-load-and-execute2 ()
  (interactive)
  "load or reload code and execute the m function if present"
  (haskell-process-load-file)
  (with-current-buffer "*moneylender*"
    (haskell-interactive-mode-clear)
    (insert "main ")
    (let ((expr (haskell-interactive-mode-input)))
      (foo expr))))

(defun my-load-and-execute ()
  (interactive)
  "load or reload code and execute the m function if present"
  (haskell-process-load-file)
  (message (format "try %s" (haskell-session))))

(defun foo (expr)
  "Run the given expression."
  (let ((session (haskell-interactive-session))
        (process (haskell-interactive-process)))
    (haskell-process-queue-command
     process
     (make-haskell-command
      :state (list session process expr 0)
      :go (lambda (state)
            (with-current-buffer "*moneylender*"
              (goto-char (point-max))
              (insert "\n")
              )
            (setq haskell-interactive-mode-result-end
                  (point-max))
            (haskell-process-send-string (cadr state)
                                         (haskell-interactive-mode-multi-line (cl-caddr state)))
            (haskell-process-set-evaluating (cadr state) t)
            )
      :live (lambda (state buffer)
              (unless (and (string-prefix-p ":q" (cl-caddr state))
                           (string-prefix-p (cl-caddr state) ":quit"))
                (let* ((cursor (cl-cadddr state))
                       (next (replace-regexp-in-string
                              haskell-process-prompt-regex
                              ""
                              (substring buffer cursor))))
                  (haskell-interactive-mode-eval-result (car state) next)
                  (setf (cl-cdddr state) (list (length buffer)))
                  nil)))
      :complete
      (lambda (state response)
        (haskell-process-set-evaluating (cadr state) nil)
        (unless (haskell-interactive-mode-trigger-compile-error state response)
          (haskell-interactive-mode-expr-result state response)))))))
