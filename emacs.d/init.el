;; Disable the huge toolbar at the top.
(tool-bar-mode -1)

;; Fix 'invalid font name' errors caused by Emacs reading system configuration and not liking Inconsolata
 (setq initial-frame-alist '(
   (font . "Monospace-10")
 ))
 (setq default-frame-alist '(
   (font . "Monospace-10")
 ))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#585858" "#a74f31" "#367a7f" "#76690b" "#0073b5" "#ad4271" "#3b4bab" "#b3ada6"])
 '(calendar-week-start-day 1)
 '(custom-safe-themes
   '("26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "13d20048c12826c7ea636fbe513d6f24c0d43709a761052adbca052708798ce3" default))
 '(org-agenda-files
   '("~/org/keep.org" "~/org/prive.org" "~/org/mendix.org" "~/org/projects.org" "~/org/mobiel.org"))
 '(org-capture-templates
   '(("w" "Mendix")
     ("p" "Prive")
     ("wt" "TODO Werk" entry
      (file+headline "~/org/mendix.org" "Captures")
      (file "~/org/tpl/todo.txt")
      :empty-lines-before 1)
     ("ws" "TODO Mendix source" entry
      (file+headline "~/org/mendix.org" "Captures")
      (file "~/org/tpl/todo-source.txt")
      :empty-lines-before 1)
     ("wn" "Note Mendix" entry
      (file+headline "mendix.org" "Captures")
      (file "~/org/tpl/note.txt")
      :empty-lines-before 1)
     ("pt" "TODO Prive" entry
      (file+headline "~/org/prive.org" "Captures")
      (file "~/org/tpl/todo.txt")
      :empty-lines-before 1)
     ("pn" "Note prive" entry
      (file+headline "~/org/prive.org" "Captures")
      (file "~/org/tpl/note.txt")
      :empty-lines-before 1)))
 '(package-selected-packages
   '(moe-theme tabbar treemacs treemacs-evil treemacs-projectile counsel-projectile counsel ivy prettier-js evil-nerd-commenter spacemacs-theme leuven-theme org use-package silkworm-theme evil-collection projectile-ripgrep projectile web-mode linum-relative ztree evil-numbers evil-leader evil-surround evil-magit company dracula-theme magit tide flycheck typescript-mode seq pkg-info let-alist evil dash))
 '(tabbar-mode t nil (tabbar))
 '(tabbar-separator '(" | ")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tabbar-highlight ((t (:background "deep sky blue" :foreground "#ffffff" :underline t))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "blue" :foreground "white" :weight bold)))))

(defalias 'yes-or-no-p 'y-or-n-p)

;; Never use tabs
(setq-default indent-tabs-mode nil)

;; Configuration for creating file backups: Central folder, not in working copies.
(setq
      backup-directory-alist `(("." . "~/.emacs-saves"))
      version-control t     ;; Use version numbers for backups.
      kept-new-versions 10  ;; Number of newest versions to keep.
      kept-old-versions 0   ;; Number of oldest versions to keep.
      delete-old-versions t ;; Don't ask to delete excess backup versions.
      backup-by-copying t)  ;; Copy all files, don't rename them.

;; Save all buffers when focus is lost
(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))

;; Expand tabs
(setq-default indent-tabs-mode nil)

(defun ansible-vault-decrypt ()
  (interactive)
  (shell-command (concat
		  "ansible-vault decrypt --vault-password-file ~/.vault-pass "
		  (buffer-file-name)))
  (revert-buffer))

(defun ansible-vault-encrypt ()
  (interactive)
  (shell-command (
		  concat
		  "ansible-vault encrypt --vault-password-file ~/.vault-pass "
		  (buffer-file-name)))
  (revert-buffer))

(load "$HOME/.emacs.d/1-package-init")
(load "$HOME/.emacs.d/2-evil")
(load "$HOME/.emacs.d/3-plugins")
(load "$HOME/.emacs.d/4-org")
