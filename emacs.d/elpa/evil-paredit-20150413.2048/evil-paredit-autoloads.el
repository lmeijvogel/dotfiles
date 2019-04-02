;;; evil-paredit-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "evil-paredit" "evil-paredit.el" (0 0 0 0))
;;; Generated autoloads from evil-paredit.el

(autoload 'evil-paredit-mode "evil-paredit" "\
Minor mode for setting up Evil with paredit in a single buffer

If called interactively, enable Evil-Paredit mode if ARG is positive, and
disable it if ARG is zero or negative.  If called from Lisp,
also enable the mode if ARG is omitted or nil, and toggle it
if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-paredit" '("-evil-paredit-check-region" "evil-paredit-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; evil-paredit-autoloads.el ends here
