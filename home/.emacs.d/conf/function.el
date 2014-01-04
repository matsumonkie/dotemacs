;;;;;;;;;;;;;;;
;; FUNCTIONS ;;
;;;;;;;;;;;;;;;

(defun my-kill-buffer ()
  "kill current buffer without asking if it's the good one"
  (interactive)
  (kill-buffer (current-buffer)))

(defun my-backward-kill-line ()
  "Kill backward from point to beginning of line"
  (interactive) (kill-line 0))

(defun my-kill-line ()
  "Kill whole line if point is at the beginning of the line else only kill line"
  (interactive) 
  (if (equal (point) (line-beginning-position))
      (kill-whole-line)
    (kill-line)))

(defun window-half-height ()
  (max 1 (/ (1- (window-height (selected-window))) 2)))

(defun scroll-up-half ()
  (interactive)
  (scroll-up (window-half-height)))

(defun scroll-down-half ()         
  (interactive)                    
  (scroll-down (window-half-height)))

(defun insert-comment ()
  "comment with /* */"
  (interactive)
  (if (region-active-p)
      (beginning-of-line)
    (insert "/*")
    (end-of-line)
    (insert "*/")))

(defun comment-line ()
  "Comments the current line"
  (interactive)
  (condition-case nil
      (comment-region (point-at-bol) (point-at-eol)) (error nil)))

(defun uncomment-line ()
  "Comments the current line and goes to the next one"
  (interactive)
  (condition-case nil
      (uncomment-region (point-at-bol) (point-at-eol)) (error nil)))

(defun my-copy-line ()
  "Copy current line in the kill ring"
  (interactive)
  (kill-ring-save (line-beginning-position)
		  (line-beginning-position 2))
  (message "Line copied"))

(defun scroll-up-lot ()
  (interactive)
  (forward-line -2))

(defun scroll-down-lot ()
  (interactive)
  (forward-line 2))

(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(defun move-region (start end n)
  "Move the current region up or down by N lines."
  (interactive "r\np")
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (let ((start (point)))
      (insert line-text)
      (setq deactivate-mark nil)
      (set-mark start))))

(defun move-region-up (start end n)
  "Move the current line up by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) -1 (- n))))

(defun move-region-down (start end n)
  "Move the current line down by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) 1 n)))

(defun move-line-region-up (start end n)
  (interactive "r\np")
  (if (use-region-p)
      (move-region-up start end n) 
    (move-line-up n)
    ))

(defun move-line-region-down (start end n)
  (interactive "r\np")
  (if (use-region-p)
      (move-region-down start end n)
    (move-line-down n)))

(defun my-horizontal-recenter ()
  "make the cursor horizontally centered in the window"
  (interactive)
  (move-to-column  (/ (- (line-end-position) (line-beginning-position)) 2)))

(defun my-c-equal-align ()
  "align region with the symbol '='"
  (interactive)
  (setq sym '=)
  (align-regexp (region-beginning) (region-end) sym))

(defun intelligent-close ()
  "quit a frame the same way no matter what kind of frame you are on"
  (interactive)
  (if (eq (car (visible-frame-list)) (selected-frame))
      ;;for parent/master frame...
      (if (> (length (visible-frame-list)) 1)
          ;;close a parent with children present
          (delete-frame (selected-frame))
        ;;close a parent with no children present
	(save-buffers-kill-emacs))
    ;;close a child frame
    (delete-frame (selected-frame))))

(defun my-jump-bracket ()
  "Will bounce between matching parens just like % in vi"
  (interactive)
  (let ((prev-char (char-to-string (preceding-char)))
        (next-char (char-to-string (following-char))))
    (cond ((string-match "[[{(<]" next-char) (forward-sexp 1))
	  ((string-match "[\]})>]" prev-char) (backward-sexp 1))
	  (t (error "%s" "Not on a paren, brace, or bracket")))))

(defun my-align-vars(beg end)
  "Aligns c/c++ variable declaration names on the same column, with beginning and end taken from selected region."
  (interactive "r")
  (save-excursion
    (let (bol eol expr-end
	      (max-col 0) col
	      poslist curpos)
      (goto-char end)
      (if (not (bolp))
          (setq end (line-end-position)))
      (goto-char beg)
      (while (and (> end (point)) (not (eobp)))
        (setq bol (line-beginning-position))
        (setq eol (line-end-position))
        (beginning-of-line)
        (setq expr-end (point))
        (if (search-forward-regexp "^[^/][^/]\\([a-zA-Z][a-zA-Z]*\\)[ \t]+[^;]" eol t)
            (let ()
              (setq expr-end (match-end 1))
              (while (search-forward-regexp "\\([a-zA-Z][a-zA-Z]*\\)[ \t]+[^;]" eol t)
                (setq expr-end (match-end 1)))
              (goto-char expr-end)
              (setq col (current-column))
              (if (search-forward-regexp (concat "\\(\\*\\|&[ \t]*\\)?"
                                                 "\\([a-zA-Z\\_][a-zA-Z0-9\\_]*\\)\\([\[][0-9]+[\]]\\)?"
                                                 "\\([ \t]*,[ \t]*\\([a-zA-Z\\_][a-zA-Z0-9\\_]*\\)\\([\[][0-9]+[\]]\\)?\\)*"
                                                 "[ \t]*;$") eol t)
                  (let ((name-col-end 0))
                    (if (eq (match-beginning 2) (match-beginning 0))
                        (setq name-col-end 1))
                    (setq poslist (cons (list expr-end col (match-beginning 0) name-col-end) poslist))
                    (if (> col max-col)
                        (setq max-col col))
                    (beginning-of-next-line))
                (beginning-of-next-line)))
          (beginning-of-next-line)))
      (setq curpos poslist)
      (while curpos
        (let* ((pos (car curpos))
               (col (car (cdr pos)))
               (col-end (car (cdr (cdr pos))))
               (col-end-name (car (cdr (cdr (cdr pos)))))
               (abs-pos (car pos)))
          (goto-char abs-pos)
          (delete-region abs-pos col-end)
          (insert (make-string (+ (+ (- max-col col) 1) col-end-name) 32)))
        (setq curpos (cdr curpos))))))

(defun my-align-all-vars()
  "Aligns c/c++ variable declaration names on the same column in this buffer."
  (interactive)
  (save-excursion
    (let (beg end)
      (beginning-of-buffer)
      (setq beg (point))
      (end-of-buffer)
      (setq end (point))
      (my-align-vars beg end))))

(defun my-comment()
  "Comment or uncomment line or region"
  (interactive)
  ;; check if we need to comment or uncomment
  (setq comment t)
  (save-excursion
    (beginning-of-line)
    (save-excursion
      (if (region-active-p)
	  (goto-char (region-beginning)))
      (if (search-forward-regexp "\\(//\\)\\|\\(/\\*\\)" (line-end-position) t)
	  (setq comment nil)))
    (if comment
	(if (region-active-p)
	    (comment-region (region-beginning) (region-end))
	  (comment-line))
      (progn
	(if (region-active-p)
	    (uncomment-region (region-beginning) (region-end))
	  (uncomment-line))))))

(defun beginning-of-next-line()
  "Moves cursor to the beginning of the next line, or nowhere if at end of the buffer"
  (interactive)
  (end-of-line)
  (if (not (eobp))
      (forward-char 1)))  

(defun my-format-buffer ()
  "indent whole buffer and delete trailing whitespace"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil))

(defun insert-brackets () "insert brackets and go between them" (interactive)
  (insert "[]")
  (backward-char 1))

(defun insert-parentheses ()
  "insert parentheses and go between them"
  (interactive)
  (insert "()")
  (backward-char 1))

(defun my-indent-line()
  "indent current-line"
  (interactive)
  (indent-according-to-mode))

(defun my-indent-buffer ()
  "Indent the current buffer"
  (interactive)
  (save-excursion (indent-region (point-min) (point-max) nil)))