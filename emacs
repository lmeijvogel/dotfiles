(load "$HOME/.emacs.d/1-package-init")
(load "$HOME/.emacs.d/2-evil")
(load "$HOME/.emacs.d/3-plugins")
(load "$HOME/.emacs.d/4-org")

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
 '(custom-safe-themes
   '("100e7c5956d7bb3fd0eebff57fde6de8f3b9fafa056a2519f169f85199cc1c96" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "b54826e5d9978d59f9e0a169bbd4739dd927eead3ef65f56786621b53c031a7c" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "d70c11f5a2b69a77f9d56eff42090138721d4c51d9d39ce986680786d694f492" "ec1572b17860768fb3ce0fe0148364b7bec9581f6f1a08b066e13719c882576f" default))
 '(org-agenda-files
   '("~/org/keep.org" "~/org/prive.org" "~/org/mendix.org" "~/org/projects.org"))
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
   '(tabbar lsp-mode treemacs treemacs-evil treemacs-projectile counsel-projectile counsel ivy doom-themes prettier-js evil-nerd-commenter spacemacs-theme leuven-theme org use-package silkworm-theme evil-collection projectile-ripgrep projectile web-mode linum-relative ztree evil-numbers evil-leader evil-surround evil-magit company dracula-theme magit tide flycheck typescript-mode seq pkg-info let-alist evil dash))
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
      backup-directory-alist `(("~/.emacs-saves"))
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
