(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(global-display-line-numbers-mode 1)
(savehist-mode 1)
(column-number-mode 1)
(display-time-mode 1)
(show-paren-mode 1)

(setq-default truncate-lines t)
(setq vc-make-backup-files t)
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)
(setq catppuccin-flavor 'mocha)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 '(package-selected-packages '(catppuccin-theme timu-macos-theme vertico)))
(custom-set-faces)

(load-theme 'catppuccin t)
