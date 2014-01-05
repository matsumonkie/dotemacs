;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;; MAIN SHORTCUT ;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BASIC COMMAND
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-SPC")   'Control-X-prefix)
(global-set-key (kbd "C-e")     'set-mark-command)
(global-set-key (kbd "M-SPC")   'execute-extended-command)
(global-set-key (kbd "C-SPC u") 'universal-argument)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; OPEN FILE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [f1] 'find-file)
(global-set-key (kbd "C-SPC f") 'find-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SAVE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [f2] 'save-buffer)
(global-set-key [f3] 'write-file)
(global-set-key (kbd "C-w") 'save-buffer)
(global-set-key (kbd "C-SPC w") 'write-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KILL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [f4] 'kill-emacs)
(global-set-key (kbd "C-S-q") 'my-kill-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BUFFER MENU
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [f7] 'buffer-menu)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GOTO
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key "\M-g" 'goto-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; WINDOWS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key "\M-b" 'next-buffer)
(global-set-key [f12] 'repeat-complex-command)
(global-set-key (kbd "C-SPC n") 'next-error)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MINIBUFFER HISTORY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key minibuffer-local-map (kbd "<up>")   'previous-history-element)
(define-key minibuffer-local-map (kbd "<down>") 'next-history-element)



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;; EDITION SHORTCUT ;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MARK AND POINT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "M-e") 'exchange-point-and-mark)
(global-set-key "\M-e" 'open-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UNDO/REDO
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-z") 'redo)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KILL WORD/LINE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Hack to solve problem for tab and C-i
;(global-set-key "\t" 'self-insert-command)

(global-set-key (kbd "C-i") 'backward-kill-word)
(global-set-key (kbd "C-o") 'repeat)

;(keyboard-translate ?\C-i ?\M-|)
;(global-set-key [?\M-|] 'backward-kill-word)
;(global-set-key "¿" 'tab-to-tab-stop)

(global-set-key "\C-u" 	  'kill-word)
(global-set-key "\M-i" 	  'my-backward-kill-line)
(global-set-key "\M-u" 	  'my-kill-line)
(global-set-key [delete] 'delete-char) ;; delete standard behaviour

;;;;;;;;;;;;;;;;;;;;;;;;
;; COPY / CUT / PASTE ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-SPC c") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-SPC d") 'kill-region)
(global-set-key (kbd "C-v") 	'yank)
(global-set-key (kbd "M-v") 	'yank-pop)

;;;;;;;;;;;;;;;;
;; RECTANGLES ;;
;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-SPC r c") 'copy-rectangle-to-register)    ;; supprime un rectangle en l'enregistrant
(global-set-key (kbd "C-SPC r v") 'yank-rectangle)   	;; insère le dernier rectangle enregistré
(global-set-key (kbd "C-SPC r o") 'open-rectangle)   	;; insère un rectangle de blancs
(global-set-key (kbd "C-SPC r d") 'kill-rectangle) 	;; supprime un rectangle sans l'enregistrer
(global-set-key (kbd "C-SPC r t") 'string-rectangle)   	;; insérer un string dans un rectangle


;;;;;;;;;;;;;;;;;;
;; DISPLACEMENT ;;
;;;;;;;;;;;;;;;;;;


;;;;;;;;;;
;; WORD ;;
;;;;;;;;;;

;; PAGE
(global-set-key "\C-n" 'forward-word)
(global-set-key "\C-t" 'backward-word)

;; PARAGRAPH
(global-set-key "\C-d" 'backward-paragraph)
(global-set-key "\C-l" 'forward-paragraph)

;; BUFFER
(global-set-key "\M-d" 'beginning-of-buffer)
(global-set-key "\M-l" 'end-of-buffer)

;; PAGE
(global-set-key "\M-t" 'scroll-down-command)
(global-set-key "\M-n" 'scroll-up-command)



;;;;;;;;;
;; DEV ;;
;;;;;;;;;


(define-key global-map (kbd "C-SPC .") 'comment-line)
(define-key global-map (kbd "C-SPC :") 'uncomment-line)

(keyboard-translate ?\C-y ?\C-é)
;(global-set-key (kbd "é") "y")
(global-set-key (kbd "C-y") 'my-copy-line)

(global-set-key (kbd "C-SPC i") 'indent-region)

(global-set-key (kbd "C-SPC C-c")  'comment-region)
(global-set-key (kbd "C-SPC C-u")  'uncomment-region)

;; Behaviour for emacs in terminal
(if (display-graphic-p)
   (progn
      ;; shortcut terminator like :)
      (global-set-key (kbd "C-S-h") 'split-window-vertically)
      (global-set-key (kbd "C-S-v") 'split-window-horizontally)
      (global-set-key (kbd "C-S-r") 'windmove-right)
      (global-set-key (kbd "C-S-s") 'windmove-left)
      (global-set-key (kbd "C-S-n") 'windmove-down)
      (global-set-key (kbd "C-S-t") 'windmove-up)
      (global-set-key (kbd "C-S-d") 'delete-window))
  ;; else console mode
  (global-unset-key (kbd "C-@"))
  (global-set-key (kbd "C-@") 'Control-X-prefix))


;; Same with return and C-m
;(keyboard-translate ?\C-m ?\C-&)
;(global-set-key (kbd "C-&") 'newline-and-indent)
;(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "RET") 'newline-and-indent)
;; Same with C-c which is a prefix key
;(keyboard-translate ?\C-j ?\C-.)
(global-unset-key (kbd "C-@ C-@"))
(global-set-key (kbd "C-SPC C-SPC") 'execute-extended-command)

;; Go 2 lines up or down
(global-set-key (kbd "\C-s") 'scroll-up-lot)
(global-set-key (kbd "\C-r") 'scroll-down-lot)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Completion automatique ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [(f1)] 'dabbrev-completion)
(global-set-key (kbd "C-q") 'dabbrev-expand)
(global-set-key (kbd "M-q") 'dabbrev-completion)

(global-set-key (kbd "M-<down>") 'move-line-region-down)
(global-set-key (kbd "M-<up>") 'move-line-region-up)

(global-set-key (kbd "M-S-t") 'tabbar-backward-group)
(global-set-key (kbd "M-S-n") 'tabbar-forward-group)
(global-set-key "\M-t" 'tabbar-backward-tab)
(global-set-key "\M-n" 'tabbar-forward-tab)

;;;;;;;;;;;;;;;
;; Recherche ;;
;;;;;;;;;;;;;;;
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "M-f") 'isearch-backward)
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)
(define-key isearch-mode-map "\M-f" 'isearch-repeat-backward)

;;;;;;;;;;;;;;
;; RECENTER ;;
;;;;;;;;;;;;;;
(global-set-key (kbd "C-S-l") 'my-horizontal-recenter)

;; ne detruit pas le serveur si le fichier dans lequel on se trouve est un client
(global-set-key (kbd "C-SPC q") 'intelligent-close)

;;;;;;;;;;;;;
;; iBuffer ;;
;;;;;;;;;;;;;
(global-set-key (kbd "C-SPC C-b") 'ibuffer)

;;;;;;;;;;;;;;;;;;;
;; FRAME SCALING ;;
;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-M-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "C-M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-<down>")  'shrink-window)
(global-set-key (kbd "C-M-<up>")    'enlarge-window)

;;;;;;;;;;;;;
;; Compile ;;
;;;;;;;;;;;;;
(global-set-key (kbd "C-p")  'recenter-top-bottom)
