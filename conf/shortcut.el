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
;(global-set-key (kbd "C-SPC q") 'save-buffers-kill-emacs)

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
(global-set-key "\C-t" 	  'backward-kill-word)
(global-set-key "\M-t" 	  'my-backward-kill-line)
(global-set-key "\M-c" 	  'my-kill-line)
(global-set-key "\M-\S-c" 'kill-whole-line)
(global-set-key [delete] 'delete-char) ;; delete standard behaviour

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; COPY / CUT / PASTE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-SPC c") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-SPC d") 'kill-region)
(global-set-key (kbd "C-v") 	'yank)
(global-set-key (kbd "M-v") 	'yank-pop)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RECTANGLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-SPC r c") 'delete-rectangle)    ;; supprime un rectangle en l'enregistrant
(global-set-key (kbd "C-SPC r v") 'yank-rectangle)   	;; insère le dernier rectangle enregistré
(global-set-key (kbd "C-SPC r o") 'open-rectangle)   	;; insère un rectangle de blancs
(global-set-key (kbd "C-SPC r d") 'kill-rectangle) 	;; supprime un rectangle sans l'enregistrer
(global-set-key (kbd "C-SPC r t") 'string-rectangle)   	;; insérer un string dans un rectangle



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;; DISPLACEMENT ;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; WORD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PAGE
(global-set-key "\C-r" 'forward-word)
(global-set-key "\C-s" 'backward-word)
;; PARAGRAPH
(global-set-key "\M-i" 'backward-paragraph)
(global-set-key "\M-u" 'forward-paragraph)
;; BUFFER
(global-set-key "\M-a" 'beginning-of-buffer)
(global-set-key "\M-n" 'end-of-buffer)
;; PAGE
(global-set-key "\C-n" 'scroll-up-half)
(global-set-key "\C-a" 'scroll-down-half)



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;; DEV ;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-set-key "\M-h" 'insert-comment)

(define-key global-map (kbd "C-SPC .") 'comment-line)
(define-key global-map (kbd "C-SPC :") 'uncomment-line)

(global-set-key (kbd "C-é") 'my-copy-line)

(global-set-key (kbd "C-SPC i") 'indent-region)

(global-set-key (kbd "C-SPC C-c")  'comment-region)
(global-set-key (kbd "C-SPC C-u")  'uncomment-region)

;; Spécificité console/interface graphique
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

;; Hack to solve problem for tab and C-i
(keyboard-translate ?\C-i ?\C-|)
(global-set-key (kbd "C-|") 'backward-char)
;; Same with return and C-m
(keyboard-translate ?\C-m ?\C-&)
(global-set-key (kbd "C-&") 'newline-and-indent)
;; Same with C-c which is a prefix key
(keyboard-translate ?\C-c ?\C-.)
(global-set-key (kbd "C-.") 'kill-word)

;; Go 2 lines up or down
(global-set-key (kbd "C-|") 'scroll-up-lot)
(global-set-key (kbd "\C-u") 'scroll-down-lot)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Completion automatique
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [(f1)] 'dabbrev-completion)
(global-set-key (kbd "C-q") 'dabbrev-expand)
(global-set-key (kbd "M-q") 'dabbrev-completion)

(global-set-key (kbd "M-<down>") 'move-line-region-down)
(global-set-key (kbd "M-<up>") 'move-line-region-up)

(global-set-key "\M-s" 'tabbar-backward-tab)
(global-set-key "\M-r" 'tabbar-forward-tab)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Recherche 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "M-f") 'isearch-backward)
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)
(define-key isearch-mode-map "\M-f" 'isearch-repeat-backward)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RECENTER
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-S-l") 'my-horizontal-recenter)
(global-set-key (kbd "M-l")   'my-middle-of-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ne detruit pas le serveur si le fichier dans lequel on se trouve est un client
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-SPC q") 'intelligent-close)

(global-set-key [f12] 'toggle-fullscreen)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bookmark
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(global-set-key (kbd "C-b") 'bookmark-set)
(global-set-key (kbd "C-j") 'bookmark-jump)
(global-set-key (kbd "C-b") 'bm-toggle)
(global-set-key (kbd "C-j") 'bm-next)
(global-set-key (kbd "M-j") 'bm-previous)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; iBuffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-SPC C-b") 'ibuffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Agrandir/réduire les frames
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-M-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "C-M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-<down>")  'shrink-window)
(global-set-key (kbd "C-M-<up>")    'enlarge-window)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Compile
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-p")  'tex-compile)
