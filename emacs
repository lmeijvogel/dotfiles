; CommonLisp is necessary for the setf function that is used
; by NeoTree
(require 'cl)

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(load-theme 'tango-dark)

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
(setq neo-create-file-auto-open t)
(setq neo-dont-be-alone t)
(setq neo-smart-open t)

; = Enter_Open_File_anywhere (Evil) --
(define-key neotree-mode-map [return] 'neotree-enter)

; Disable startup screen: It interferes with the Evil keybindings
(setq inhibit-startup-screen t)

; Assume that background is dark: This is needed for,
; for example, NeoTree
(set-variable 'frame-background-mode 'dark)

(require 'linum-relative)

(set-variable 'linum-relative-format "%3s ")
(global-linum-mode)

; Include _ as a word character
(modify-syntax-entry ?_ "w")

(add-to-list 'auto-mode-alist '("\\.rake" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor" . enh-ruby-mode))

(setq inhibit-startup-screen t)
(setq make-backup-files nil)

(add-hook 'before-save-hook 'whitespace-cleanup)
