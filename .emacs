;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;; .EMACS ;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(defvar personnal-configuration t)


(when personnal-configuration

  (message "\n -- Loading personnal configuration --\n")

  ;; auto compile elisp configuration files after save
  (add-hook 'emacs-lisp-mode-hook (lambda () (add-hook 'after-save-hook 'emacs-lisp-byte-compile t t)) )
    
  ;; Emacs load path
  (setq load-path (cons "~/.emacs.d/conf/" load-path))
  
  ;; variables
  (defvar *emacs-load-start* (current-time))
  (setq files (list "appearance" "reset" "plugin" "function" "shortcut"  "system"  "dev" "alias"))
  (setq error "!! Erreur, fichier de configuration inexistant : ") 

  (defun boot-time (file startup-time)
    "Show how long it took to load a file"
    (message (concat "--> BOOT TIME : %ds to load " file)
	     (destructuring-bind (hi lo ms) (current-time)
	       (- (+ hi lo) (+ (first startup-time) (second startup-time))))))
  
  (defun init-configuration (list-files)
    "Load all configuration files"
    (if (car list-files)
	(progn 
	  (setq file (car list-files))
	  (if (file-exists-p (concat "~/.emacs.d/conf/" file ".el"))
	      (progn
		(setq current-time (current-time))
		(load (concat file ".el"))
		(boot-time file current-time))
	    (message (concat error file)))
	  (init-configuration (cdr list-files)))))

  (init-configuration files)
  
  (message "\n -- personnal configuration load ! --\n")

  (boot-time ".emacs" *emacs-load-start*)

)