; CommonLisp is necessary for the setf function that is used
; by NeoTree
(require 'cl)

(require 'package)

(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(load "~/.emacs.d/default-packages")

(load-theme 'tango-dark)

(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key "a" 'projectile-ack)
(evil-leader/set-key "g" 'align-regexp)

(setq tab-width 2)
(setq-default tab-width 2)
(defvaralias 'coffee-tab-width 'tab-width)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(setq-default indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 2 200 2))
(require 'projectile)

; Does not work yet
;(setq projectile-completion-system 'grizzl)
(projectile-global-mode)

(add-hook 'before-save-hook 'whitespace-cleanup)
;(setq ruby-tab-width 2)
(setq enh-ruby-tab-width 2)

(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(add-hook 'fundamental-mode-hook 'projectile-mode)
(setq neo-create-file-auto-open t)
(setq neo-dont-be-alone t)
(setq neo-smart-open t)

; = Disable annoying GPL hotkey
(global-set-key (kbd "C-h C-c") 'ignore)

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

(require 'rspec-mode)
(set-variable 'rspec-use-rake-when-possible nil)

; Include _ as a word character
(modify-syntax-entry ?_ "w")

(add-to-list 'auto-mode-alist '("\\.rake" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor" . enh-ruby-mode))

(setq inhibit-startup-screen t)
(setq make-backup-files nil)

(add-hook 'before-save-hook 'whitespace-cleanup)

(setq auto-save-default nil)

(global-evil-surround-mode 1)
(global-evil-matchit-mode 1)

;;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
   In Delete Selection mode, if the mark is active, just deactivate it;
   then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(standard-indent 2)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(define-key evil-normal-state-map [down] 'enlarge-window)
(define-key evil-normal-state-map [up] 'shrink-window)
(define-key evil-normal-state-map [left] 'enlarge-window-horizontally)
(define-key evil-normal-state-map [right] 'shrink-window-horizontally)