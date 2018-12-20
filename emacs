(load "$HOME/.emacs.d/1-package-init")
(load "$HOME/.emacs.d/2-evil")
(load "$HOME/.emacs.d/3-plugins")

;; Disable the huge toolbar at the top.
(tool-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(silkworm-theme helm-projectile evil-collection projectile-ripgrep projectile web-mode linum-relative ztree evil-numbers evil-leader evil-surround neotree evil-magit company dracula-theme magit tide flycheck typescript-mode seq pkg-info let-alist helm evil dash)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

