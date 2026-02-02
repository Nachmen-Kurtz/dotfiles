(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(global-display-line-numbers-mode 1)
(column-number-mode 1)
(display-time-mode 1)
(show-paren-mode 1)
(savehist-mode 1)
(which-key-mode 1)
(save-place-mode 1)

(setq-default truncate-lines t)

(setq vc-make-backup-files t)
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)
(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacs.d/backups"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (unless package-archive-contents
    (package-refresh-contents))
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package catppuccin-theme
  :init
  (setq catppuccin-flavor 'mocha)
  :config
  (load-theme 'catppuccin t))

(use-package dashboard
  :init
  (setq initial-buffer-choice 'dashboard-open)
  :config
  (dashboard-setup-startup-hook))

(global-set-key (kbd "C-c f")  #'beginning-of-buffer)
(global-set-key (kbd "C-c l")  #'end-of-buffer)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f9d423fcd4581f368b08c720f04d206ee80b37bfb314fa37e279f554b6f415e9"
     default))
 '(package-selected-packages '(catppuccin-theme dashboard magit use-package)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




;; (setq user-mail-address "shmnzch@gmail.com"
;;       user-full-name "N.K.")

;; (setq gnus-select-method
;;       '(nnimap "mail"
;;         (nnimap-address "imap.gmail.com")
;;         (nnimap-server-port 993)
;;         (nnimap-stream ssl)))

;; (setq message-send-mail-function 'smtpmail-send-it
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587
;;       smtpmail-stream-type 'starttls)
q
