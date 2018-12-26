(load "$HOME/.emacs.d/1-package-init")
(load "$HOME/.emacs.d/2-evil")
(load "$HOME/.emacs.d/3-plugins")
(load "$HOME/.emacs.d/4-org")

;; Disable the huge toolbar at the top.
(tool-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org use-package silkworm-theme helm-projectile evil-collection projectile-ripgrep projectile web-mode linum-relative ztree evil-numbers evil-leader evil-surround neotree evil-magit company dracula-theme magit tide flycheck typescript-mode seq pkg-info let-alist helm evil dash)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defalias 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-h") 'previous-buffer)
(global-set-key (kbd "M-l") 'next-buffer)

;; Configuration for creating file backups: Central folder, not in working copies.
(setq
      backup-directory-alist `(("." . "~/.emacs-saves"))
      version-control t     ;; Use version numbers for backups.
      kept-new-versions 10  ;; Number of newest versions to keep.
      kept-old-versions 0   ;; Number of oldest versions to keep.
      delete-old-versions t ;; Don't ask to delete excess backup versions.
      backup-by-copying t)  ;; Copy all files, don't rename them.
