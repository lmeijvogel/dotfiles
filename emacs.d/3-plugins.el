(use-package linum-relative
  :ensure t
  :config
  (linum-relative-global-mode)
)
  
(use-package evil-magit
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (setq projectile-project-search-path '("~/projects/")))
  (projectile-discover-projects-in-search-path)

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
  :ensure t
  :bind
  ("M-x" . counsel-M-x)
)

(use-package counsel-projectile
  :after '(helm projectile)
  :ensure t
  :bind (("C-S-p" . counsel-projectile-switch-project)
         :map evil-normal-state-map)
         ("C-M-p" . counsel-projectile-switch-to-buffer))

;; For some reason, this can't be done inside the `counsel` block
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd "C-p") 'counsel-file-jump))

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

(use-package tide
  :after (company prettier-js)
  :ensure t
  :config
    (defun setup-tide-mode ()
        (interactive)
        (tide-setup)
        (flycheck-mode +1)
        (setq flycheck-check-syntax-automatically '(save mode-enabled))
        (eldoc-mode +1)
        (tide-hl-identifier-mode +1)
        (prettier-js-mode)

        (company-mode +1)
        (setq indent-tabs-mode nil)
    )

    (defun set-tide-keybindings ()
        (define-key tide-mode-map (kbd "<f12>") (lambda () (interactive) (tide-jump-to-definition t)))
        (define-key tide-mode-map (kbd "<S-f12>") 'tide-references))

    (eval-after-load 'tide '(set-tide-keybindings))

    ;; aligns annotation to the right hand side
    (setq company-tooltip-align-annotations t)

    ;; formats the buffer before saving
    (add-hook 'typescript-mode-hook #'setup-tide-mode)
  )

(use-package flycheck
  :ensure t)

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
)

(global-evil-surround-mode)
(use-package neotree
  :ensure t
  :config
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)

  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))

  (evil-leader/set-key
    "nf"
    'neotree-project-dir))

(use-package doom-themes
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

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
)

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(load-theme 'dracula t)
(load-theme 'spacemacs-light t)
(load-theme 'doom-one t)

;; TODO: tabs at the top
;; TODO: Typescript navigation
