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
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "d70c11f5a2b69a77f9d56eff42090138721d4c51d9d39ce986680786d694f492" "ec1572b17860768fb3ce0fe0148364b7bec9581f6f1a08b066e13719c882576f" default))
 '(package-selected-packages
   '(evil-nerd-commenter spacemacs-theme leuven-theme org use-package silkworm-theme helm-projectile evil-collection projectile-ripgrep projectile web-mode linum-relative ztree evil-numbers evil-leader evil-surround neotree evil-magit company dracula-theme magit tide flycheck typescript-mode seq pkg-info let-alist helm evil dash)))

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

;; Set evil-nerd-commenter default hotkeys
(evilnc-default-hotkeys)

;; Configuration for creating file backups: Central folder, not in working copies.
(setq
      backup-directory-alist `(("." . "~/.emacs-saves"))
      version-control t     ;; Use version numbers for backups.
      kept-new-versions 10  ;; Number of newest versions to keep.
      kept-old-versions 0   ;; Number of oldest versions to keep.
      delete-old-versions t ;; Don't ask to delete excess backup versions.
      backup-by-copying t)  ;; Copy all files, don't rename them.
