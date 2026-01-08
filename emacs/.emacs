(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode 1)

(setq-default truncate-lines t)

(setq display-line-numbers-type 'absolute)
(setq make-backup-files t)

(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/autosaves/" t)))

(setq backup-directory-alist
      `((".*" . "~/.emacs.d/backups/")))
