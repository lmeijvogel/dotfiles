(setq evil-want-C-u-scroll t) ;; Map C-u to scrolling up
(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)


(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")

  (evil-leader/set-key
    "ss"
    'evil-window-split)

  (evil-leader/set-key
    "vv"
    'evil-window-vsplit)
)

(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

  (evil-collection-init)
)

;; Make '_' a word character to match vim behavior
(modify-syntax-entry ?_ "w")
