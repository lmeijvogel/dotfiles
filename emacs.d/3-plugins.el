(use-package linum-relative
  :ensure t
  :config
  (linum-relative-global-mode)
)
  
;; (require 'linum-relative)

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
)

(use-package helm-projectile
  :ensure t
  :bind (("C-S-P" . helm-projectile-switch-project)
         :map evil-normal-state-map
         ("C-p" . helm-projectile))
  :config)

(use-package tide
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

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(defun set-tide-keybindings ()
  (define-key tide-mode-map (kbd "<f12>") 'tide-jump-to-definition)
  (define-key tide-mode-map (kbd "<S-f12>") 'tide-references))

(eval-after-load 'tide
  '(set-tide-keybindings))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(load-theme 'dracula t)
(load-theme 'spacemacs-light t)

;; TODO: tabs at the top
;; TODO: Typescript navigation
