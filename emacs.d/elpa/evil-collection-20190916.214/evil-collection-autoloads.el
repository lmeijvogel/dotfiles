;;; evil-collection-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "evil-collection" "evil-collection.el" (23936
;;;;;;  61662 845338 160000))
;;; Generated autoloads from evil-collection.el

(autoload 'evil-collection-translate-key "evil-collection" "\
Translate keys in the keymap(s) corresponding to STATES and KEYMAPS.
STATES should be the name of an evil state, a list of states, or nil. KEYMAPS
should be a symbol corresponding to the keymap to make the translations in or a
list of keymap symbols. Like `evil-define-key', when a keymap does not exist,
the keybindings will be deferred until the keymap is defined, so
`with-eval-after-load' is not neccessary. TRANSLATIONS corresponds to a list of
key replacement pairs. For example, specifying \"a\" \"b\" will bind \"a\" to
\"b\"'s definition in the keymap. Specifying nil as a replacement will unbind a
key. If DESTRUCTIVE is nil, a backup of the keymap will be stored on the initial
invocation, and future invocations will always look up keys in the backup
keymap. When no TRANSLATIONS are given, this function will only create the
backup keymap without making any translations. On the other hand, if DESTRUCTIVE
is non-nil, the keymap will be destructively altered without creating a backup.
For example, calling this function multiple times with \"a\" \"b\" \"b\" \"a\"
would continue to swap and unswap the definitions of these keys. This means that
when DESTRUCTIVE is non-nil, all related swaps/cycles should be done in the same
invocation.

\(fn STATES KEYMAPS &rest TRANSLATIONS &key DESTRUCTIVE &allow-other-keys)" nil nil)

(function-put 'evil-collection-translate-key 'lisp-indent-function 'defun)

(autoload 'evil-collection-swap-key "evil-collection" "\
Wrapper around `evil-collection-translate-key' for swapping keys.
STATES, KEYMAPS, and ARGS are passed to `evil-collection-translate-key'. ARGS
should consist of key swaps (e.g. \"a\" \"b\" is equivalent to \"a\" \"b\" \"b\"
\"a\" with `evil-collection-translate-key') and optionally keyword arguments for
`evil-collection-translate-key'.

\(fn STATES KEYMAPS &rest ARGS)" nil t)

(function-put 'evil-collection-swap-key 'lisp-indent-function 'defun)

(autoload 'evil-collection-init "evil-collection" "\
Register the Evil bindings for all modes in `evil-collection-mode-list'.

Alternatively, you may register select bindings manually, for
instance:

  (with-eval-after-load 'calendar
    (require 'evil-collection-calendar)
    (evil-collection-calendar-setup))

If MODES is specified (as either one mode or a list of modes), use those modes
instead of the modes in `evil-collection-mode-list'.

\(fn &optional MODES)" t nil)

;;;***

;;;### (autoloads nil "evil-collection-2048-game" "evil-collection-2048-game.el"
;;;;;;  (23936 61662 769338 241000))
;;; Generated autoloads from evil-collection-2048-game.el

(autoload 'evil-collection-2048-game-setup "evil-collection-2048-game" "\
Set up `evil' bindings for `2048-game'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-ag" "evil-collection-ag.el"
;;;;;;  (23936 61662 977338 19000))
;;; Generated autoloads from evil-collection-ag.el

(autoload 'evil-collection-ag-setup "evil-collection-ag" "\
Set up `evil' bindings for `ag'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-alchemist" "evil-collection-alchemist.el"
;;;;;;  (23936 61662 733338 279000))
;;; Generated autoloads from evil-collection-alchemist.el

(autoload 'evil-collection-alchemist-setup "evil-collection-alchemist" "\
Set up `evil' bindings for `alchemist'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-anaconda-mode" "evil-collection-anaconda-mode.el"
;;;;;;  (23936 61663 101337 886000))
;;; Generated autoloads from evil-collection-anaconda-mode.el

(autoload 'evil-collection-anaconda-mode-setup "evil-collection-anaconda-mode" "\
Set up `evil' bindings for `anaconda-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-apropos" "evil-collection-apropos.el"
;;;;;;  (23936 61663 157337 827000))
;;; Generated autoloads from evil-collection-apropos.el

(autoload 'evil-collection-apropos-setup "evil-collection-apropos" "\
Set up `evil' bindings for `apropos'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-arc-mode" "evil-collection-arc-mode.el"
;;;;;;  (23936 61663 189337 792000))
;;; Generated autoloads from evil-collection-arc-mode.el

(autoload 'evil-collection-arc-mode-setup "evil-collection-arc-mode" "\
Set up `evil' bindings for `arc-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-bookmark" "evil-collection-bookmark.el"
;;;;;;  (23936 61662 741338 271000))
;;; Generated autoloads from evil-collection-bookmark.el

(autoload 'evil-collection-bookmark-setup "evil-collection-bookmark" "\
Set up `evil' bindings for `bookmark'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-buff-menu" "evil-collection-buff-menu.el"
;;;;;;  (23936 61662 797338 211000))
;;; Generated autoloads from evil-collection-buff-menu.el

(autoload 'evil-collection-buff-menu-setup "evil-collection-buff-menu" "\
Set up `evil' bindings for `buff-menu'..

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-calc" "evil-collection-calc.el"
;;;;;;  (23936 61662 817338 189000))
;;; Generated autoloads from evil-collection-calc.el

(autoload 'evil-collection-calc-setup "evil-collection-calc" "\
Set up `evil' bindings for `calc'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-calendar" "evil-collection-calendar.el"
;;;;;;  (23936 61662 889338 112000))
;;; Generated autoloads from evil-collection-calendar.el

(autoload 'evil-collection-calendar-setup "evil-collection-calendar" "\
Set up `evil' bindings for `calendar'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-cider" "evil-collection-cider.el"
;;;;;;  (23936 61662 833338 172000))
;;; Generated autoloads from evil-collection-cider.el

(autoload 'evil-collection-cider-setup "evil-collection-cider" "\
Set up `evil' bindings for `cider'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-cmake-mode" "evil-collection-cmake-mode.el"
;;;;;;  (23936 61663 213337 767000))
;;; Generated autoloads from evil-collection-cmake-mode.el

(autoload 'evil-collection-cmake-mode-setup "evil-collection-cmake-mode" "\
Set up `evil' bindings for `cmake-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-comint" "evil-collection-comint.el"
;;;;;;  (23936 61662 757338 254000))
;;; Generated autoloads from evil-collection-comint.el

(autoload 'evil-collection-comint-setup "evil-collection-comint" "\
Set up `evil' bindings for `comint'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-company" "evil-collection-company.el"
;;;;;;  (23936 61663 137337 848000))
;;; Generated autoloads from evil-collection-company.el

(autoload 'evil-collection-company-setup "evil-collection-company" "\
Set up `evil' bindings for `company'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-compile" "evil-collection-compile.el"
;;;;;;  (23936 61662 893338 108000))
;;; Generated autoloads from evil-collection-compile.el

(autoload 'evil-collection-compile-setup "evil-collection-compile" "\
Set up `evil' bindings for `compile'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-cus-theme" "evil-collection-cus-theme.el"
;;;;;;  (23936 61662 805338 202000))
;;; Generated autoloads from evil-collection-cus-theme.el

(autoload 'evil-collection-cus-theme-setup "evil-collection-cus-theme" "\
Set up `evil' bindings for `cus-theme'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-custom" "evil-collection-custom.el"
;;;;;;  (23936 61663 221337 758000))
;;; Generated autoloads from evil-collection-custom.el

(autoload 'evil-collection-custom-setup "evil-collection-custom" "\
Set up `evil' bindings for `Custom-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-daemons" "evil-collection-daemons.el"
;;;;;;  (23936 61662 937338 61000))
;;; Generated autoloads from evil-collection-daemons.el

(autoload 'evil-collection-daemons-setup "evil-collection-daemons" "\
Set up `evil' bindings for `daemons'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-deadgrep" "evil-collection-deadgrep.el"
;;;;;;  (23936 61663 125337 860000))
;;; Generated autoloads from evil-collection-deadgrep.el

(autoload 'evil-collection-deadgrep-setup "evil-collection-deadgrep" "\
Set up `evil' bindings for deadgrep..

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-debbugs" "evil-collection-debbugs.el"
;;;;;;  (23936 61662 873338 130000))
;;; Generated autoloads from evil-collection-debbugs.el

(autoload 'evil-collection-debbugs-setup "evil-collection-debbugs" "\
Set up `evil' bindings for `debbugs-gnu-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-debug" "evil-collection-debug.el"
;;;;;;  (23936 61663 133337 851000))
;;; Generated autoloads from evil-collection-debug.el

(autoload 'evil-collection-debug-setup "evil-collection-debug" "\
Set up `evil' bindings for `debug'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-diff-mode" "evil-collection-diff-mode.el"
;;;;;;  (23936 61663 9337 984000))
;;; Generated autoloads from evil-collection-diff-mode.el

(autoload 'evil-collection-diff-toggle-setup "evil-collection-diff-mode" "\
Toggle visiting diff buffers in motion state.

\(fn)" t nil)

(autoload 'evil-collection-diff-mode-setup "evil-collection-diff-mode" "\
Set up `evil' bindings for `diff-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-dired" "evil-collection-dired.el"
;;;;;;  (23936 61662 897338 104000))
;;; Generated autoloads from evil-collection-dired.el

(autoload 'evil-collection-dired-setup "evil-collection-dired" "\
Set up `evil' bindings for `dired'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-disk-usage" "evil-collection-disk-usage.el"
;;;;;;  (23936 61662 757338 254000))
;;; Generated autoloads from evil-collection-disk-usage.el

(autoload 'evil-collection-disk-usage-setup "evil-collection-disk-usage" "\
Set up `evil' bindings for `disk-usage'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-doc-view" "evil-collection-doc-view.el"
;;;;;;  (23936 61663 65337 924000))
;;; Generated autoloads from evil-collection-doc-view.el

(autoload 'evil-collection-doc-view-setup "evil-collection-doc-view" "\
Set up `evil' bindings for `doc-view'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-ebib" "evil-collection-ebib.el"
;;;;;;  (23936 61663 177337 805000))
;;; Generated autoloads from evil-collection-ebib.el

(autoload 'evil-collection-ebib-setup "evil-collection-ebib" "\
Set up `evil' bindings for `ebib'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-edbi" "evil-collection-edbi.el"
;;;;;;  (23936 61662 913338 87000))
;;; Generated autoloads from evil-collection-edbi.el

(autoload 'evil-collection-edbi-setup "evil-collection-edbi" "\
Set up `evil' bindings for EDBI.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-edebug" "evil-collection-edebug.el"
;;;;;;  (23936 61662 921338 79000))
;;; Generated autoloads from evil-collection-edebug.el

(autoload 'evil-collection-edebug-setup "evil-collection-edebug" "\
Set up `evil' bindings for `edebug'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-ediff" "evil-collection-ediff.el"
;;;;;;  (23936 61663 13337 980000))
;;; Generated autoloads from evil-collection-ediff.el

(autoload 'evil-collection-ediff-setup "evil-collection-ediff" "\
Initialize evil-ediff.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "evil-collection-eglot" "evil-collection-eglot.el"
;;;;;;  (23936 61663 89337 899000))
;;; Generated autoloads from evil-collection-eglot.el

(autoload 'evil-collection-eglot-setup "evil-collection-eglot" "\
Set up `evil' bindings for `eglot'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-elfeed" "evil-collection-elfeed.el"
;;;;;;  (23936 61662 981338 14000))
;;; Generated autoloads from evil-collection-elfeed.el

(autoload 'evil-collection-elfeed-setup "evil-collection-elfeed" "\
Set up `evil' bindings for `elfeed'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-elisp-mode" "evil-collection-elisp-mode.el"
;;;;;;  (23936 61663 33337 959000))
;;; Generated autoloads from evil-collection-elisp-mode.el

(autoload 'evil-collection-elisp-mode-setup "evil-collection-elisp-mode" "\
Set up `evil' bindings for `elisp-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-elisp-refs" "evil-collection-elisp-refs.el"
;;;;;;  (23936 61662 749338 262000))
;;; Generated autoloads from evil-collection-elisp-refs.el

(autoload 'evil-collection-elisp-refs-setup "evil-collection-elisp-refs" "\
Set up `evil' bindings for `elisp-refs'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-elisp-slime-nav" "evil-collection-elisp-slime-nav.el"
;;;;;;  (23936 61662 737338 275000))
;;; Generated autoloads from evil-collection-elisp-slime-nav.el

(autoload 'evil-collection-elisp-slime-nav-setup "evil-collection-elisp-slime-nav" "\
Set up `evil' bindings for `elisp-slime-nav'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-emms" "evil-collection-emms.el"
;;;;;;  (23936 61663 93337 895000))
;;; Generated autoloads from evil-collection-emms.el

(autoload 'evil-collection-emms-browser-setup "evil-collection-emms" "\
Set up `evil' bindings for `emms-browser'.

\(fn)" nil nil)

(autoload 'evil-collection-emms-playlist-setup "evil-collection-emms" "\
Set up `evil' bindings for `emms-playlist'.

\(fn)" nil nil)

(autoload 'evil-collection-emms-setup "evil-collection-emms" "\
Set up `evil' bindings for `emms'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-epa" "evil-collection-epa.el"
;;;;;;  (23936 61662 877338 125000))
;;; Generated autoloads from evil-collection-epa.el

(autoload 'evil-collection-epa-setup "evil-collection-epa" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-ert" "evil-collection-ert.el"
;;;;;;  (23936 61662 781338 227000))
;;; Generated autoloads from evil-collection-ert.el

(autoload 'evil-collection-ert-setup "evil-collection-ert" "\
Set up `evil' bindings for `ert'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-eshell" "evil-collection-eshell.el"
;;;;;;  (23936 61662 849338 156000))
;;; Generated autoloads from evil-collection-eshell.el

(autoload 'evil-collection-eshell-setup "evil-collection-eshell" "\
Set up `evil' bindings for `eshell'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-eval-sexp-fu" "evil-collection-eval-sexp-fu.el"
;;;;;;  (23936 61663 77337 911000))
;;; Generated autoloads from evil-collection-eval-sexp-fu.el

(autoload 'evil-collection-eval-sexp-fu-setup "evil-collection-eval-sexp-fu" "\
Set up `evil' with `eval-sexp-fu'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-evil-mc" "evil-collection-evil-mc.el"
;;;;;;  (23936 61663 1337 993000))
;;; Generated autoloads from evil-collection-evil-mc.el

(autoload 'evil-collection-evil-mc-setup "evil-collection-evil-mc" "\
Set up `evil' bindings for evil-mc.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-eww" "evil-collection-eww.el"
;;;;;;  (23936 61662 985338 10000))
;;; Generated autoloads from evil-collection-eww.el

(autoload 'evil-collection-eww-setup "evil-collection-eww" "\
Set up `evil' bindings for `eww'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-flycheck" "evil-collection-flycheck.el"
;;;;;;  (23936 61662 745338 266000))
;;; Generated autoloads from evil-collection-flycheck.el

(autoload 'evil-collection-flycheck-setup "evil-collection-flycheck" "\
Set up `evil' bindings for `flycheck'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-flymake" "evil-collection-flymake.el"
;;;;;;  (23936 61662 797338 211000))
;;; Generated autoloads from evil-collection-flymake.el

(autoload 'evil-collection-flymake-setup "evil-collection-flymake" "\
Set up `evil' bindings for `flymake'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-free-keys" "evil-collection-free-keys.el"
;;;;;;  (23936 61662 969338 27000))
;;; Generated autoloads from evil-collection-free-keys.el

(autoload 'evil-collection-free-keys-setup "evil-collection-free-keys" "\
Set up `evil' bindings for `free-keys'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-geiser" "evil-collection-geiser.el"
;;;;;;  (23936 61663 97337 891000))
;;; Generated autoloads from evil-collection-geiser.el

(autoload 'evil-collection-geiser-setup "evil-collection-geiser" "\
Set up bindings for `geiser'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-ggtags" "evil-collection-ggtags.el"
;;;;;;  (23936 61662 885338 117000))
;;; Generated autoloads from evil-collection-ggtags.el

(autoload 'evil-collection-ggtags-setup "evil-collection-ggtags" "\
Set up `evil' bindings for `ggtags'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-git-timemachine" "evil-collection-git-timemachine.el"
;;;;;;  (23936 61663 217337 762000))
;;; Generated autoloads from evil-collection-git-timemachine.el

(autoload 'evil-collection-git-timemachine-setup "evil-collection-git-timemachine" "\
Setup `evil' keybindings for `git-timemachine'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-go-mode" "evil-collection-go-mode.el"
;;;;;;  (23936 61662 957338 40000))
;;; Generated autoloads from evil-collection-go-mode.el

(autoload 'evil-collection-go-mode-setup "evil-collection-go-mode" "\
Set up `evil' bindings for `go-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-grep" "evil-collection-grep.el"
;;;;;;  (23936 61663 201337 780000))
;;; Generated autoloads from evil-collection-grep.el

(autoload 'evil-collection-grep-setup "evil-collection-grep" "\
Set up `evil' bindings for `grep'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-guix" "evil-collection-guix.el"
;;;;;;  (23936 61662 917338 83000))
;;; Generated autoloads from evil-collection-guix.el

(autoload 'evil-collection-guix-setup "evil-collection-guix" "\
Set up `evil' bindings for `guix'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-hackernews" "evil-collection-hackernews.el"
;;;;;;  (23936 61662 865338 138000))
;;; Generated autoloads from evil-collection-hackernews.el

(autoload 'evil-collection-hackernews-setup "evil-collection-hackernews" "\
Set up `evil' bindings for `hackernews-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-helm" "evil-collection-helm.el"
;;;;;;  (23936 61662 841338 163000))
;;; Generated autoloads from evil-collection-helm.el

(autoload 'evil-collection-helm-setup "evil-collection-helm" "\
Set up `evil' bindings for `helm'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-help" "evil-collection-help.el"
;;;;;;  (23936 61663 129337 856000))
;;; Generated autoloads from evil-collection-help.el

(autoload 'evil-collection-help-setup "evil-collection-help" "\
Set up `evil' bindings for `help'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-helpful" "evil-collection-helpful.el"
;;;;;;  (23936 61662 965338 32000))
;;; Generated autoloads from evil-collection-helpful.el

(autoload 'evil-collection-helpful-setup "evil-collection-helpful" "\
Set up `evil' bindings for `helpful'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-hg-histedit" "evil-collection-hg-histedit.el"
;;;;;;  (23936 61662 785338 224000))
;;; Generated autoloads from evil-collection-hg-histedit.el

(autoload 'evil-collection-hg-histedit-setup "evil-collection-hg-histedit" "\
Set up `evil' bindings for `hg-histedit'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-hungry-delete" "evil-collection-hungry-delete.el"
;;;;;;  (23936 61662 869338 134000))
;;; Generated autoloads from evil-collection-hungry-delete.el

(autoload 'evil-collection-hungry-delete-setup "evil-collection-hungry-delete" "\
Set up `evil' bindings for `hungry-delete'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-ibuffer" "evil-collection-ibuffer.el"
;;;;;;  (23936 61662 793338 215000))
;;; Generated autoloads from evil-collection-ibuffer.el

(autoload 'evil-collection-ibuffer-setup "evil-collection-ibuffer" "\
Set up `evil' bindings for `ibuffer'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-image" "evil-collection-image.el"
;;;;;;  (23936 61663 41337 950000))
;;; Generated autoloads from evil-collection-image.el

(autoload 'evil-collection-image-setup "evil-collection-image" "\
Set up `evil' bindings for `image-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-image+" "evil-collection-image+.el"
;;;;;;  (23936 61663 205337 775000))
;;; Generated autoloads from evil-collection-image+.el

(autoload 'evil-collection-image+-setup "evil-collection-image+" "\
Set up `evil' bindings for `image+'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-image-dired" "evil-collection-image-dired.el"
;;;;;;  (23936 61663 81337 908000))
;;; Generated autoloads from evil-collection-image-dired.el

(autoload 'evil-collection-image-dired-setup "evil-collection-image-dired" "\
Set up `evil' bindings for `image-dired-thumbnail-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-imenu-list" "evil-collection-imenu-list.el"
;;;;;;  (23936 61662 857338 147000))
;;; Generated autoloads from evil-collection-imenu-list.el

(autoload 'evil-collection-imenu-list-setup "evil-collection-imenu-list" "\
Set up `evil' bindings for `imenu-list'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-indium" "evil-collection-indium.el"
;;;;;;  (23936 61663 61337 929000))
;;; Generated autoloads from evil-collection-indium.el

(autoload 'evil-collection-indium-setup "evil-collection-indium" "\
Set up `evil' bindings for `indium'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-info" "evil-collection-info.el"
;;;;;;  (23936 61663 37337 955000))
;;; Generated autoloads from evil-collection-info.el

(autoload 'evil-collection-info-setup "evil-collection-info" "\
Set up `evil' bindings for `info-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-ivy" "evil-collection-ivy.el"
;;;;;;  (23936 61662 773338 236000))
;;; Generated autoloads from evil-collection-ivy.el

(autoload 'evil-collection-ivy-setup "evil-collection-ivy" "\
Set up `evil' bindings for `ivy-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-js2-mode" "evil-collection-js2-mode.el"
;;;;;;  (23936 61662 941338 57000))
;;; Generated autoloads from evil-collection-js2-mode.el

(autoload 'evil-collection-js2-mode-setup "evil-collection-js2-mode" "\
Set up `evil' bindings for `js2-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-kotlin-mode" "evil-collection-kotlin-mode.el"
;;;;;;  (23936 61663 85337 904000))
;;; Generated autoloads from evil-collection-kotlin-mode.el

(autoload 'evil-collection-kotlin-mode-setup "evil-collection-kotlin-mode" "\
Set up `evil' bindings for `kotlin-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-leetcode" "evil-collection-leetcode.el"
;;;;;;  (23936 61662 789338 220000))
;;; Generated autoloads from evil-collection-leetcode.el

(autoload 'evil-collection-leetcode-setup "evil-collection-leetcode" "\
Set up `evil' bindings for `leetcode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-lispy" "evil-collection-lispy.el"
;;;;;;  (23936 61663 17337 976000))
;;; Generated autoloads from evil-collection-lispy.el

(autoload 'evil-collection-lispy-setup "evil-collection-lispy" "\
Set up `evil' bindings for `lispy'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-log-edit" "evil-collection-log-edit.el"
;;;;;;  (23936 61662 829338 176000))
;;; Generated autoloads from evil-collection-log-edit.el

(autoload 'evil-collection-log-edit-setup "evil-collection-log-edit" "\
Set up `evil' bindings for `log-edit'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-log-view" "evil-collection-log-view.el"
;;;;;;  (23936 61662 773338 236000))
;;; Generated autoloads from evil-collection-log-view.el

(autoload 'evil-collection-log-view-setup "evil-collection-log-view" "\
Set up `evil' bindings for `log-view'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-lsp-ui-imenu" "evil-collection-lsp-ui-imenu.el"
;;;;;;  (23936 61662 841338 163000))
;;; Generated autoloads from evil-collection-lsp-ui-imenu.el

(autoload 'evil-collection-lsp-ui-imenu-setup "evil-collection-lsp-ui-imenu" "\
Set up `evil' bindings for `lsp-ui-imenu'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-lua-mode" "evil-collection-lua-mode.el"
;;;;;;  (23936 61662 777338 232000))
;;; Generated autoloads from evil-collection-lua-mode.el

(autoload 'evil-collection-lua-mode-setup "evil-collection-lua-mode" "\
Set up `evil' bindings for `lua-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-macrostep" "evil-collection-macrostep.el"
;;;;;;  (23936 61663 53337 937000))
;;; Generated autoloads from evil-collection-macrostep.el

(autoload 'evil-collection-macrostep-setup "evil-collection-macrostep" "\
Set up `evil' bindings for `macrostep'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-magit" "evil-collection-magit.el"
;;;;;;  (23936 61662 765338 245000))
;;; Generated autoloads from evil-collection-magit.el

(autoload 'evil-collection-magit-setup "evil-collection-magit" "\
Set up `evil' bindings for `magit'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-magit-todos" "evil-collection-magit-todos.el"
;;;;;;  (23936 61662 853338 151000))
;;; Generated autoloads from evil-collection-magit-todos.el

(autoload 'evil-collection-magit-todos-setup "evil-collection-magit-todos" "\
Set up `evil' bindings for `magit-todos'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-man" "evil-collection-man.el"
;;;;;;  (23936 61663 181337 801000))
;;; Generated autoloads from evil-collection-man.el

(autoload 'evil-collection-man-setup "evil-collection-man" "\
Set up `evil' bindings for `man'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-minibuffer" "evil-collection-minibuffer.el"
;;;;;;  (23936 61662 905338 96000))
;;; Generated autoloads from evil-collection-minibuffer.el

(autoload 'evil-collection-minibuffer-setup "evil-collection-minibuffer" "\
Initialize minibuffer for `evil'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-monky" "evil-collection-monky.el"
;;;;;;  (23936 61662 877338 125000))
;;; Generated autoloads from evil-collection-monky.el

(autoload 'evil-collection-monky-setup "evil-collection-monky" "\
Set up `evil' bindings for `monky'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-mu4e" "evil-collection-mu4e.el"
;;;;;;  (23936 61663 153337 831000))
;;; Generated autoloads from evil-collection-mu4e.el

(autoload 'evil-collection-mu4e-setup "evil-collection-mu4e" "\
Initialize evil-mu4e if necessary.
If mu4e-main-mode is in evil-state-motion-modes, initialization
is already done earlier.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-mu4e-conversation" "evil-collection-mu4e-conversation.el"
;;;;;;  (23936 61663 209337 771000))
;;; Generated autoloads from evil-collection-mu4e-conversation.el

(autoload 'evil-collection-mu4e-conversation-setup "evil-collection-mu4e-conversation" "\
Set up `evil' bindings for `mu4e-conversation'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-neotree" "evil-collection-neotree.el"
;;;;;;  (23936 61663 185337 796000))
;;; Generated autoloads from evil-collection-neotree.el

(autoload 'evil-collection-neotree-setup "evil-collection-neotree" "\
Set up `evil' bindings for `neotree'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-notmuch" "evil-collection-notmuch.el"
;;;;;;  (23936 61663 197337 784000))
;;; Generated autoloads from evil-collection-notmuch.el

(autoload 'evil-collection-notmuch-setup "evil-collection-notmuch" "\
Set up `evil' bindings for `notmuch'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-nov" "evil-collection-nov.el"
;;;;;;  (23936 61662 945338 53000))
;;; Generated autoloads from evil-collection-nov.el

(autoload 'evil-collection-nov-setup "evil-collection-nov" "\
Set up `evil' bindings for `nov'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-occur" "evil-collection-occur.el"
;;;;;;  (23936 61663 21337 971000))
;;; Generated autoloads from evil-collection-occur.el

(autoload 'evil-collection-occur-setup "evil-collection-occur" "\
Set up `evil' bindings for `occur'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-omnisharp" "evil-collection-omnisharp.el"
;;;;;;  (23936 61663 149337 835000))
;;; Generated autoloads from evil-collection-omnisharp.el

(autoload 'evil-collection-omnisharp-setup "evil-collection-omnisharp" "\
Set up `evil' bindings for `omnisharp'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-outline" "evil-collection-outline.el"
;;;;;;  (23936 61662 741338 271000))
;;; Generated autoloads from evil-collection-outline.el

(autoload 'evil-collection-outline-setup "evil-collection-outline" "\
Set up `evil' bindings for `outline'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-p4" "evil-collection-p4.el"
;;;;;;  (23936 61662 997337 997000))
;;; Generated autoloads from evil-collection-p4.el

(autoload 'evil-collection-p4-setup "evil-collection-p4" "\
Set up `evil' bindings for `p4'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-package-menu" "evil-collection-package-menu.el"
;;;;;;  (23936 61662 901338 99000))
;;; Generated autoloads from evil-collection-package-menu.el

(autoload 'evil-collection-package-menu-setup "evil-collection-package-menu" "\
Set up `evil' bindings for `package-menu'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-pass" "evil-collection-pass.el"
;;;;;;  (23936 61663 25337 968000))
;;; Generated autoloads from evil-collection-pass.el

(autoload 'evil-collection-pass-setup "evil-collection-pass" "\
Set up `evil' bindings for `pass-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-pdf" "evil-collection-pdf.el"
;;;;;;  (23936 61663 169337 814000))
;;; Generated autoloads from evil-collection-pdf.el

(autoload 'evil-collection-pdf-setup "evil-collection-pdf" "\
Set up `evil' bindings for `pdf-view'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-popup" "evil-collection-popup.el"
;;;;;;  (23936 61662 929338 70000))
;;; Generated autoloads from evil-collection-popup.el

(autoload 'evil-collection-popup-setup "evil-collection-popup" "\
Set up `evil' bindings for `popup'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-proced" "evil-collection-proced.el"
;;;;;;  (23936 61662 965338 32000))
;;; Generated autoloads from evil-collection-proced.el

(autoload 'evil-collection-proced-setup "evil-collection-proced" "\
Set up `evil' bindings for `proced'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-process-menu" "evil-collection-process-menu.el"
;;;;;;  (23936 61663 69337 920000))
;;; Generated autoloads from evil-collection-process-menu.el

(autoload 'evil-collection-process-menu-setup "evil-collection-process-menu" "\
Set up `evil' bindings for `list-processes'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-prodigy" "evil-collection-prodigy.el"
;;;;;;  (23936 61662 905338 96000))
;;; Generated autoloads from evil-collection-prodigy.el

(autoload 'evil-collection-prodigy-setup "evil-collection-prodigy" "\
Set up `evil' bindings for `prodigy'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-profiler" "evil-collection-profiler.el"
;;;;;;  (23936 61663 49337 942000))
;;; Generated autoloads from evil-collection-profiler.el

(autoload 'evil-collection-profiler-setup "evil-collection-profiler" "\
Set up `evil' bindings for `profiler'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-python" "evil-collection-python.el"
;;;;;;  (23936 61663 225337 754000))
;;; Generated autoloads from evil-collection-python.el

(autoload 'evil-collection-python-setup "evil-collection-python" "\
Set up `evil' bindings for `python'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-quickrun" "evil-collection-quickrun.el"
;;;;;;  (23936 61662 929338 70000))
;;; Generated autoloads from evil-collection-quickrun.el

(autoload 'evil-collection-quickrun-setup "evil-collection-quickrun" "\
Set up `evil' bindings for `quickrun'..

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-racer" "evil-collection-racer.el"
;;;;;;  (23936 61663 173337 809000))
;;; Generated autoloads from evil-collection-racer.el

(autoload 'evil-collection-racer-setup "evil-collection-racer" "\
Set up `evil' bindings for `racer'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-realgud" "evil-collection-realgud.el"
;;;;;;  (23936 61662 801338 207000))
;;; Generated autoloads from evil-collection-realgud.el

(autoload 'evil-collection-realgud-setup "evil-collection-realgud" "\
Set up `evil' bindings for `realgud'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-reftex" "evil-collection-reftex.el"
;;;;;;  (23936 61663 165337 818000))
;;; Generated autoloads from evil-collection-reftex.el

(autoload 'evil-collection-reftex-setup "evil-collection-reftex" "\
Set up `evil' bindings for `reftex'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-restclient" "evil-collection-restclient.el"
;;;;;;  (23936 61662 861338 143000))
;;; Generated autoloads from evil-collection-restclient.el

(autoload 'evil-collection-restclient-setup "evil-collection-restclient" "\
Set up `evil' bindings for `restclient'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-rjsx-mode" "evil-collection-rjsx-mode.el"
;;;;;;  (23936 61662 881338 121000))
;;; Generated autoloads from evil-collection-rjsx-mode.el

(autoload 'evil-collection-rjsx-mode-setup "evil-collection-rjsx-mode" "\
Set up `evil' bindings for `rjsx-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-robe" "evil-collection-robe.el"
;;;;;;  (23936 61662 925338 74000))
;;; Generated autoloads from evil-collection-robe.el

(autoload 'evil-collection-robe-setup "evil-collection-robe" "\
Set up `evil' bindings for `robe'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-rtags" "evil-collection-rtags.el"
;;;;;;  (23936 61663 161337 822000))
;;; Generated autoloads from evil-collection-rtags.el

(autoload 'evil-collection-rtags-setup "evil-collection-rtags" "\
Set up `evil' bindings for `rtags'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-ruby-mode" "evil-collection-ruby-mode.el"
;;;;;;  (23936 61663 145337 840000))
;;; Generated autoloads from evil-collection-ruby-mode.el

(autoload 'evil-collection-ruby-mode-setup "evil-collection-ruby-mode" "\
Set up `evil' bindings for `ruby'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-simple" "evil-collection-simple.el"
;;;;;;  (23936 61662 989338 6000))
;;; Generated autoloads from evil-collection-simple.el

(autoload 'evil-collection-simple-setup "evil-collection-simple" "\
Set up `evil' bindings for `simple'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-slime" "evil-collection-slime.el"
;;;;;;  (23936 61662 961338 35000))
;;; Generated autoloads from evil-collection-slime.el

(autoload 'evil-collection-slime-setup "evil-collection-slime" "\
Set up `evil' bindings for `slime'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-term" "evil-collection-term.el"
;;;;;;  (23936 61663 109337 878000))
;;; Generated autoloads from evil-collection-term.el

(autoload 'evil-collection-term-setup "evil-collection-term" "\
Set up `evil' bindings for `term'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-tetris" "evil-collection-tetris.el"
;;;;;;  (23936 61662 933338 66000))
;;; Generated autoloads from evil-collection-tetris.el

(autoload 'evil-collection-tetris-setup "evil-collection-tetris" "\
Set up `evil' bindings for `tetris'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-tide" "evil-collection-tide.el"
;;;;;;  (23936 61663 13337 980000))
;;; Generated autoloads from evil-collection-tide.el

(autoload 'evil-collection-tide-setup "evil-collection-tide" "\
Set up `evil' bindings for `tide'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-transmission" "evil-collection-transmission.el"
;;;;;;  (23936 61662 993338 2000))
;;; Generated autoloads from evil-collection-transmission.el

(autoload 'evil-collection-transmission-setup "evil-collection-transmission" "\
Set up `evil' bindings for `transmission'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-typescript-mode" "evil-collection-typescript-mode.el"
;;;;;;  (23936 61663 57337 933000))
;;; Generated autoloads from evil-collection-typescript-mode.el

(autoload 'evil-collection-typescript-mode-setup "evil-collection-typescript-mode" "\
Set up `evil' bindings for `typescript-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-unimpaired" "evil-collection-unimpaired.el"
;;;;;;  (23936 61662 761338 249000))
;;; Generated autoloads from evil-collection-unimpaired.el

(defvar global-evil-collection-unimpaired-mode nil "\
Non-nil if Global Evil-Collection-Unimpaired mode is enabled.
See the `global-evil-collection-unimpaired-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-evil-collection-unimpaired-mode'.")

(custom-autoload 'global-evil-collection-unimpaired-mode "evil-collection-unimpaired" nil)

(autoload 'global-evil-collection-unimpaired-mode "evil-collection-unimpaired" "\
Toggle Evil-Collection-Unimpaired mode in all buffers.
With prefix ARG, enable Global Evil-Collection-Unimpaired mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Evil-Collection-Unimpaired mode is enabled in all buffers where
`evil-collection-unimpaired-mode-on' would do it.
See `evil-collection-unimpaired-mode' for more information on Evil-Collection-Unimpaired mode.

\(fn &optional ARG)" t nil)

(autoload 'evil-collection-unimpaired-setup "evil-collection-unimpaired" "\
Set up unimpaired-like bindings.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-vc-annotate" "evil-collection-vc-annotate.el"
;;;;;;  (23936 61663 29337 963000))
;;; Generated autoloads from evil-collection-vc-annotate.el

(autoload 'evil-collection-vc-annotate-setup "evil-collection-vc-annotate" "\
Set up `evil' bindings for `vc-annotate'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-vc-dir" "evil-collection-vc-dir.el"
;;;;;;  (23936 61662 813338 194000))
;;; Generated autoloads from evil-collection-vc-dir.el

(autoload 'evil-collection-vc-dir-setup "evil-collection-vc-dir" "\
Set up `evil' bindings for `vc-dir'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-vc-git" "evil-collection-vc-git.el"
;;;;;;  (23936 61662 825338 181000))
;;; Generated autoloads from evil-collection-vc-git.el

(autoload 'evil-collection-vc-git-setup "evil-collection-vc-git" "\
Set up `evil' bindings for `vc-git'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-vdiff" "evil-collection-vdiff.el"
;;;;;;  (23936 61663 41337 950000))
;;; Generated autoloads from evil-collection-vdiff.el

(autoload 'evil-collection-vdiff-setup "evil-collection-vdiff" "\
Set up `evil' bindings for `vdiff-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-view" "evil-collection-view.el"
;;;;;;  (23936 61662 837338 168000))
;;; Generated autoloads from evil-collection-view.el

(autoload 'evil-collection-view-setup "evil-collection-view" "\
Set up `evil' bindings for `view'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-vlf" "evil-collection-vlf.el"
;;;;;;  (23936 61663 5337 989000))
;;; Generated autoloads from evil-collection-vlf.el

(autoload 'evil-collection-vlf-setup "evil-collection-vlf" "\
Set up `evil' bindings for `vlf'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-vterm" "evil-collection-vterm.el"
;;;;;;  (23936 61662 949338 48000))
;;; Generated autoloads from evil-collection-vterm.el

(autoload 'evil-collection-vterm-setup "evil-collection-vterm" "\
Set up `evil' bindings for `vterm'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-w3m" "evil-collection-w3m.el"
;;;;;;  (23936 61663 121337 865000))
;;; Generated autoloads from evil-collection-w3m.el

(autoload 'evil-collection-w3m-setup "evil-collection-w3m" "\
Set up `evil' bindings for `w3m'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-wdired" "evil-collection-wdired.el"
;;;;;;  (23936 61662 809338 198000))
;;; Generated autoloads from evil-collection-wdired.el

(autoload 'evil-collection-wdired-setup "evil-collection-wdired" "\
Set up `evil' bindings for `wdired'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-wgrep" "evil-collection-wgrep.el"
;;;;;;  (23936 61662 953338 44000))
;;; Generated autoloads from evil-collection-wgrep.el

(autoload 'evil-collection-wgrep-setup "evil-collection-wgrep" "\
Set up `evil' bindings for `wgrep'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-which-key" "evil-collection-which-key.el"
;;;;;;  (23936 61663 73337 916000))
;;; Generated autoloads from evil-collection-which-key.el

(autoload 'evil-collection-which-key-setup "evil-collection-which-key" "\
Set up `evil' bindings for `which-key'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-woman" "evil-collection-woman.el"
;;;;;;  (23936 61662 909338 92000))
;;; Generated autoloads from evil-collection-woman.el

(autoload 'evil-collection-woman-setup "evil-collection-woman" "\
Set up `evil' bindings for `woman'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-xref" "evil-collection-xref.el"
;;;;;;  (23936 61663 113337 873000))
;;; Generated autoloads from evil-collection-xref.el

(autoload 'evil-collection-xref-setup "evil-collection-xref" "\
Set up `evil' bindings for `xref'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-youtube-dl" "evil-collection-youtube-dl.el"
;;;;;;  (23936 61662 973338 23000))
;;; Generated autoloads from evil-collection-youtube-dl.el

(autoload 'evil-collection-youtube-dl-setup "evil-collection-youtube-dl" "\
Set up `evil' bindings for `youtube-dl'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "evil-collection-ztree" "evil-collection-ztree.el"
;;;;;;  (23936 61662 729338 284000))
;;; Generated autoloads from evil-collection-ztree.el

(autoload 'evil-collection-ztree-setup "evil-collection-ztree" "\
Set up `evil' bindings for `ztree'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("evil-collection-integration.el" "evil-collection-pkg.el"
;;;;;;  "evil-collection-settings.el") (23936 61663 117337 869000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; evil-collection-autoloads.el ends here
