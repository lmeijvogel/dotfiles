(use-package linum-relative
  :ensure t
  :config
  (linum-relative-global-mode)
)
  
(use-package magit
  :ensure t)

(use-package evil-nerd-commenter
  :after evil evil-leader
  :ensure t
  :config

  (evil-leader/set-key
    "cc" 'evilnc-comment-or-uncomment-lines
    )
  )

(use-package evil-magit
  :after magit
  :ensure t
  :config
  (evil-leader/set-key
    "gs"
    'magit-status)
  )

(use-package typescript-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode)))

(use-package projectile
             :ensure t
             :config
             (setq projectile-project-search-path '("~/projects/"))
             (projectile-discover-projects-in-search-path))

(use-package company
  :ensure t)

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  ;; Recommended by Ivy Getting StarteD
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))

(use-package counsel
  :after evil-leader
  :ensure t
  :bind
  ("M-x" . counsel-M-x)
  :config
  (evil-leader/set-key
    "a"
    'counsel-git-grep)
)

(use-package counsel-projectile
  :after '(helm projectile)
  :ensure t)

;; For some reason, this can't be done inside the `counsel` block: The evil binding will override this anyway.
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd "C-p") 'counsel-projectile-find-file))

;; I can't get use-package to pick up these bindings, either in a :bind block or :config.
(define-key evil-normal-state-map (kbd "C-S-p") 'counsel-projectile-switch-project)
(define-key evil-normal-state-map (kbd "C-M-p") 'counsel-projectile-switch-to-buffer)

(use-package prettier-js
  :ensure t
  :after web-mode
  :config
  (add-hook 'web-mode-hook 'prettier-js-mode)
  (add-hook 'typescript-mode-hook 'prettier-js-mode)

  (setq prettier-js-args '(
    "--tab-width" "4"
    "--print-width" "120"
    "--semi" "true"
    "--single-quote" "false")))

(use-package flycheck
  :ensure t)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1)
  (define-key evil-normal-state-map (kbd "<f12>") 'tide-jump-to-definition)
  (define-key evil-normal-state-map (kbd "S-<f12>") 'tide-references)
  (define-key evil-normal-state-map (kbd "<f2>") 'tide-rename-symbol)

  (evil-leader/set-key
    "tf"
    'tide-fix)
  )

(use-package web-mode
  :ensure t
  :after flycheck
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (add-hook 'web-mode-hook
       (lambda ()
         (when (string-equal "tsx" (file-name-extension buffer-file-name))
           (setup-tide-mode))))

  ;; enable typescript-tslint checker
  (flycheck-add-mode 'typescript-tslint 'web-mode)

  ;; No quotes after html tag props.
  (setq web-mode-enable-auto-quoting nil)

  ;; formats the buffer before saving
  (add-hook 'before-save-hook 'tide-format-before-save)
)

(use-package treemacs
  :ensure t
  :config
  (setq
    treemacs-follow-after-init t
  ))

(use-package treemacs-evil
  :ensure t
  :after evil evil-leader treemacs
  :config
  (define-key evil-treemacs-state-map (kbd "S-u") 'treemacs-go-to-parent-node)
  (define-key evil-treemacs-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-treemacs-state-map (kbd "C-l") 'evil-window-right)

  (evil-leader/set-key
    "nt"
    'treemacs)
)

(use-package doom-themes
  :after all-the-icons
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
    doom-themes-enable-italic t) ; if nil, italics is universally disabled

  ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
  ;; may have their own settings.
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; or for treemacs users
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
)

(use-package tabbar
  :ensure t
  :config
    (defun my-tabbar-buffer-groups ()
      "Returns the name of the tab group names the current buffer belongs to.
       There are three groups:
       - Emacs buffers (those whose name starts with '*', plus dired buffers),
       - orgmode buffers, since they disrupt buffer navigation keyboard commands,
       - and the rest."
      (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
                  ((string-equal "magit" (substring (buffer-name) 0 5)) "emacs")
                  ((eq major-mode 'dired-mode) "emacs")
                  ((string-equal ".org" (file-name-extension (buffer-name) t)) "org")
                  (t "user"))))

    (setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

    (tabbar-mode)
    (global-set-key (kbd "M-h") 'tabbar-backward-tab)
    (global-set-key (kbd "M-l") 'tabbar-forward-tab)
)

(use-package yaml-mode
  :ensure t)

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(load-theme 'spacemacs-light t)
(load-theme 'dracula t)
(load-theme 'doom-one-light t)

(defun my-shrink-current-window-vertically ()
  (interactive)
  (shrink-window 10))

(defun my-grow-current-window-vertically ()
  (interactive)
  (shrink-window -10))

(defun my-shrink-current-window-horizontally ()
  (interactive)
  (shrink-window-horizontally 10))

(defun my-grow-current-window-horizontally ()
  (interactive)
  (shrink-window-horizontally -10))

(evil-define-key 'normal 'global (kbd "<left>") 'my-shrink-current-window-horizontally)
(evil-define-key 'normal 'global (kbd "<right>") 'my-grow-current-window-horizontally)
(evil-define-key 'normal 'global (kbd "<down>") 'my-shrink-current-window-vertically)
(evil-define-key 'normal 'global (kbd "<up>") 'my-grow-current-window-vertically)

;; TODO: tabs at the top
