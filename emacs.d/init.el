;;; my-emacs-config --- Summary

;; This is my emacs configuration. It nags that I need some sections here

;;; Commentary:
;;; Code:

;; Here starts the code.

(require 'package)
(require 'org)

(setq inhibit-startup-screen t)

(setq capture-file-name "~/org/prive.org")

(if (file-exists-p "~/.config/emacs/custom.el")
  (load-file "~/.config/emacs/custom.el"))

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
 '(linum-relative-current-symbol "")
 '(org-agenda-files
   '("~/org/keep.org" "~/org/prive.org" "~/org/mendix.org" "~/org/projects.org" "~/org/mobiel.org"))
 '(org-capture-templates
   '(("t" "TODO" entry
      (file+headline capture-file-name "Captures")
      (file "~/org/tpl/todo.txt")
      :empty-lines-before 1)
     ("s" "TODO source" entry
      (file+headline capture-file-name "Captures")
      (file "~/org/tpl/todo-source.txt")
      :empty-lines-before 1)
     ("n" "Note" entry
      (file+headline capture-file-name "Captures")
      (file "~/org/tpl/note.txt")
      :empty-lines-before 1)))
 '(package-selected-packages
   '(rainbow-blocks rainbow-identifiers paredit-everywhere evil-paredit paredit racket-mode evil-vimish-fold vimish-fold markdown-mode irony multiple-cursors alchemist wgrep ag flx smex org-evil powerline moe-theme tabbar treemacs treemacs-evil treemacs-projectile counsel-projectile counsel ivy prettier-js evil-nerd-commenter spacemacs-theme leuven-theme org use-package silkworm-theme evil-collection projectile-ripgrep projectile web-mode linum-relative ztree evil-numbers evil-leader evil-surround evil-magit company dracula-theme magit tide flycheck typescript-mode seq pkg-info let-alist evil dash))
 '(scroll-conservatively 10000)
 '(scroll-margin 3)
 '(tabbar-mode t nil (tabbar))
 '(tabbar-separator '(" ")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tabbar-default ((t (:inherit variable-pitch :background "gray75" :foreground "gray50" :height 1.1))))
 '(tabbar-highlight ((t (:background "deep sky blue" :foreground "#ffffff" :underline t))))
 '(tabbar-modified ((t (:inherit tabbar-default :foreground "white" :box (:line-width 1 :color "white" :style released-button) :slant italic))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "blue" :foreground "white"))))
 '(tabbar-selected-modified ((t (:inherit tabbar-default :background "blue" :foreground "white" :box (:line-width 1 :color "white" :style released-button) :slant italic)))))

(org-babel-load-file
 (expand-file-name "settings.org"
                   user-emacs-directory))
