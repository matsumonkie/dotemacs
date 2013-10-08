;; ------------------------------
;; --------- JAVA/SCALA ---------
;; ------------------------------

;; Scala mode 2
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))

(add-hook 'scala-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key (kbd "¿") 'scala-indent:indent-with-reluctant-strategy)
  (local-set-key (kbd "C-i") 'backward-kill-word)
  (local-set-key (kbd "<backtab>") 'scala-indent:indent-with-reluctant-strategy)

  ;; format right operand like this :
  ;; val x = if (foo)
  ;;           1
  ;;         else
  ;;           2
  (setq scala-indent:align-forms t)

  ;; whitespace mode, clean whitespace at save
  (require 'whitespace)
  (make-local-variable 'before-save-hook)
  (add-hook 'before-save-hook 'whitespace-cleanup)
))
