;;; pfuture-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "pfuture" "../../../../../.emacs.d/elpa/pfuture-20190505.1006/pfuture.el"
;;;;;;  "17d64300bf5f0b14250403d923f56f68")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/pfuture-20190505.1006/pfuture.el

(autoload 'pfuture-new "pfuture" "\
Create a new future process for command CMD.
Any arguments after the command are interpreted as arguments to the command.
This will return a process object with additional 'stderr and 'stdout
properties, which can be read via (process-get process 'stdout) and
\(process-get process 'stderr) or alternatively with
\(pfuture-result process) or (pfuture-stderr process).

Note that CMD must be a *sequence* of strings, meaning
this is wrong: (pfuture-new \"git status\")
this is right: (pfuture-new \"git\" \"status\")

\(fn &rest CMD)" nil nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/pfuture-20190505.1006/pfuture-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/pfuture-20190505.1006/pfuture.el")
;;;;;;  (23936 61136 50035 645000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; pfuture-autoloads.el ends here
