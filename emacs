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

(defun my-move-key (keymap-from keymap-to key)
  "Moves key binding from one keymap to another, deleting from the old location. "
  (define-key keymap-to key (lookup-key keymap-from key))
  (define-key keymap-from key nil))

; Do not remap enter and space to vim defaults, since they are kind of useless and have meaning in Emacs
(my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
(my-move-key evil-motion-state-map evil-normal-state-map " ")


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

; = Disable annoying GPL hotkeys
(global-set-key (kbd "C-h C-c") 'ignore)
(global-set-key (kbd "C-h C-w") 'ignore)

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

; Automatically save all buffers when losing focus
(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

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

(require 'helm-config)
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(setq helm-quick-update                 t ; do not display invisible candidates
  helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
  helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
  helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
  helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
  helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
  helm-ff-file-name-history-use-recentf t)

(helm-mode 1)

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