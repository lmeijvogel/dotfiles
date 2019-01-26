(use-package org
  :ensure t
  :config

  ;; This is already the default location, but repeating it
  (setq org-directory "~/org")
  (setq org-default-notes-file (concat org-directory "/notes.org"))

  (setq org-todo-keywords '((sequence "TODO" "STARTED" "WAITING" "|" "DONE" "CANCELLED")))

  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)
  (global-set-key (kbd "C-c b") 'org-switchb)
)
