(defvar load-my-conf t)

(when load-my-conf
  (message "\n -- Loading personnal configuration --\n")

  ;; auto compile elisp configuration files after save
  (add-hook 'emacs-lisp-mode-hook
            (lambda () (add-hook 'after-save-hook 'emacs-lisp-byte-compile t t)))

  (defvar my-conf-path "~/.emacs.d/conf")
  (defvar load-path (cons my-conf-path load-path))
  (defvar files-to-load (list "reset" "alias" "function" "shortcut" "system" "plugin" "dev" "appearance"))

  (defun load-files (files)
    "Load configuration files"
    (mapcar (lambda (file)
	(progn
	  (setq filename (concat my-conf-path "/" file ".el"))
	  (if (file-exists-p filename) (load filename))))
	    files))

  (load-files files-to-load)

  (message "\n -- personnal configuration setup ! --\n"))
