(defvar my-conf t)

(when my-conf
  (message "\n -- Loading personnal configuration --\n")

  ;; auto compile elisp configuration files after save
  (add-hook 'emacs-lisp-mode-hook (lambda () (add-hook 'after-save-hook 'emacs-lisp-byte-compile t t)) )
    
  ;; Emacs load path
  (setq load-path (cons "~/.emacs.d/conf/" load-path))
  
  (defvar *emacs-load-start* (current-time))
  (defvar files-to-load (list "appearance" "reset" "plugin" "function" "shortcut"  "system"  "dev" "alias"))
    
  (defun init-conf (list-files)
    "Load configuration files"
    (if (car list-files)
	(progn 
	  (setq f (car list-files))
	  (if (file-exists-p (concat "~/.emacs.d/conf/" f ".el"))
		(load (concat f ".el")))
	  (init-conf (cdr list-files)))))

  (init-conf files-to-load)
  
  (message "\n -- configuration setup ! --\n"))

