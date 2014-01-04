(setq org-log-done t)

; Shortcuts
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

; org personnal hook
(defun my-org-hook ()
  (local-set-key (kbd "C-e") 'set-mark-command)
)

(add-hook 'org-mode-hook 'my-org-hook)

; agenda-files
(setq org-agenda-files (list "~/.org/perso.org"
                             "~/.org/selectra.org"
))
