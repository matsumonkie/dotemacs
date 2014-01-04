(setq org-log-done t)

; Shortcuts
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

; agenda-files
(setq org-agenda-files (list "~/.org/perso.org"
                             "~/.org/selectra.org"
))
