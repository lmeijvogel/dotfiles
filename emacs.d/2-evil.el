(setq evil-want-C-u-scroll t) ;; Map C-u to scrolling up
(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)


(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "nt"
  'neotree
)

(evil-leader/set-key
  "gs"
  'magit-status
)

(evil-leader/set-key
  "ss"
  'evil-window-split)

(evil-leader/set-key
  "vv"
  'evil-window-vsplit)
(require 'evil)
(evil-mode 1)

(evil-collection-init)

;; Make '_' a word character to match vim behavior
(modify-syntax-entry ?_ "w")
