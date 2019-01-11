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

(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  (global-set-key (kbd "M-x") 'helm-M-x)
)

(use-package helm-projectile
  :after (helm projectile)
  :ensure t
  :bind (("C-S-P" . helm-projectile-switch-project)
         :map evil-normal-state-map
         ("C-p" . helm-projectile))
  :config)

(use-package company
  :ensure t)

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
)

(load-theme 'dracula t)
(load-theme 'spacemacs-light t)

;; TODO: tabs at the top
;; TODO: Typescript navigation
