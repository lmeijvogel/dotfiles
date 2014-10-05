(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
)

(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

(setq tab-width 2)
(setq coffee-tab-width 2)
(setq-default indent-tabs-mode nil)

(require 'projectile)

; Does not work yet
;(setq projectile-completion-system 'grizzl)
(projectile-global-mode)

(add-hook 'before-save-hook 'whitespace-cleanup)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

; = Enter_Open_File_anywhere (Evil) --
(define-key neotree-mode-map [return] 'neotree-enter)
(define-key neotree-mode-map [enter] 'neotree-enter)

; Disable startup screen: It interferes with the Evil keybindings
(setq inhibit-startup-screen t)

; Assume that background is dark: This is needed for,
; for example, NeoTree
(set-variable 'frame-background-mode 'dark)

(require 'linum-relative)

(set-variable 'linum-relative-format "%3s ")
(global-linum-mode)
