(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (unless package-archive-contents
    (package-refresh-contents))
  (package-install 'use-package))

(require 'use-package)

(setq-default truncate-lines t)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory)
      vc-make-backup-files t
      backup-by-copying t
      backup-directory-alist '(("." . "~/.config/emacs/backups"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
      vc-follow-symlinks t
      ad-redefinition-action 'accept
      native-comp-async-report-warnings-errors nil
      initial-buffer-choice 'dashboard-open
      use-package-always-ensure t
      use-dialog-box nil
      use-package-expand-minimally t
      global-auto-revert-non-file-buffers t
      auto-save-file-name-transforms `((".*" ,(expand-file-name "~/.config/emacs/auto-save/") t))
      org-link-descriptive nil)

(unless (file-directory-p "~/.config/emacs/backups")
  (make-directory "~/.config/emacs/backups" t))

(unless (file-directory-p "~/.config/emacs/auto-save")
  (make-directory "~/.config/emacs/auto-save" t))

(column-number-mode 1)
(display-time-mode 1)
(display-battery-mode 1)
(savehist-mode 1)
(recentf-mode 1)
(save-place-mode 1)
(global-auto-revert-mode 1)
(repeat-mode t)

(set-face-attribute 'default nil
		    :family "JetBrainsMono Nerd Font"
                    :height 110)

(set-fontset-font t 'hebrew
		  (font-spec :family "Noto Sans Hebrew"))

(add-hook 'prog-mode-hook              #'display-line-numbers-mode)
(add-hook 'conf-mode-hook              #'display-line-numbers-mode)
(add-hook 'before-save-hook            #'delete-trailing-whitespace)
(add-hook 'org-mode-hook               #'visual-line-mode)

(global-set-key (kbd "M-<up>")      #'beginning-of-buffer)
(global-set-key (kbd "M-<down>")    #'end-of-buffer)
(global-set-key (kbd "C-c C-k")     #'clipboard-kill-region)
(global-set-key (kbd "C-c C-y")     #'clipboard-yank)
(global-set-key (kbd "M-]")         #'forward-sexp)
(global-set-key (kbd "M-[")         #'backward-sexp)
(global-set-key (kbd "C-c C-d")     #'my/insert-date-time)
(global-set-key (kbd "C-c C-D")     #'my/insert-iso-datetime)

(keymap-set minibuffer-local-map "C-p" #'minibuffer-previous-completion)
(keymap-set minibuffer-local-map "C-n" #'minibuffer-next-completion)

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

(use-package completion-preview
  :ensure nil
  :hook (prog-mode . completion-preview-mode)
  :bind
  ( :map completion-preview-active-mode-map
    ("M-n" . completion-preview-next-candidate)
    ("M-p" . completion-preview-prev-candidate)))

(use-package which-key
  :init
  (which-key-mode 1)
  :diminish
  :config
  (setq which-key-side-window-location        'bottom
	which-key-sort-order                  #'which-key-key-order-alpha
	which-key-sort-uppercase-first        t
	which-key-max-description-length      nil
	which-key-idle-delay                  0
	which-key-allow-imprecise-window-fit  nil
	which-key-separator                   " " ))

(use-package nerd-icons-dired
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package ibuffer
  :ensure nil
  :bind ("C-x C-b" . ibuffer))

(use-package dashboard
  :init
  (setq dashboard-banner-logo-title "  Welcome to Nachmen's GNU Emacs "
        dashboard-startup-banner             'logo
        dashboard-center-content             t
        dashboard-vertically-center-content  t
        dashboard-show-shortcuts             t
        dashboard-icon-type                  'nerd-icons
        dashboard-set-heading-icons          t
        dashboard-set-file-icons             t
        dashboard-display-icons-p            t)
  :config
  (dashboard-setup-startup-hook)
  (global-set-key (kbd "C-c d") 'dashboard-refresh-buffer))

(use-package magit
  :bind
  (("C-x g" . magit-status)))

(use-package diff-hl
  :init
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode)
  :hook
  ((dired-mode . diff-hl-dired-mode)
   (vc-dir-mode . diff-hl-dir-mode))
  :bind
  (("C-c v n" . diff-hl-next-hunk)
   ("C-c v p" . diff-hl-previous-hunk)
   ("C-c v h" . diff-hl-show-hunk)
   ("C-c v r" . diff-hl-revert-hunk)
   ("C-c v s" . diff-hl-stage-current-hunk)
   ("C-c v u" . diff-hl-unstage-current-hunk))
  :config
  (unless (display-graphic-p)
    (setq diff-hl-fallback-to-margin t)
    (diff-hl-margin-mode))
  (with-eval-after-load 'magit
    (add-hook 'magit-post-refresh-hook #'diff-hl-magit-post-refresh)))

(use-package visual-fill-column
  :hook ((eww-mode         . my-layout-center-buffer)
         (elfeed-show-mode . my-layout-center-buffer)
         (Info-mode        . my-layout-center-buffer)
         (org-mode         . my-layout-center-buffer))
  :init
  (defvar my-layout-default-width 100)
  (defvar my-layout-widths
    '((eww-mode         . 110)
      (elfeed-show-mode . 90)
      (Info-mode        . 110)
      (org-mode         . 120)))
  (defun my-layout-center-buffer (&optional width)
    (let* ((mode major-mode)
           (w (or width (alist-get mode my-layout-widths) my-layout-default-width)))
      (setq-local visual-fill-column-width w)
      (setq-local visual-fill-column-center-text t)
      (visual-fill-column-mode 1)
      (visual-line-mode 1))))

(use-package pacmacs)

(use-package 2048-game)

(use-package tldr)

(use-package emms
  :config
  (emms-all)
  (setq emms-player-list    '(emms-player-vlc)
	emms-info-functions '(emms-info-native)))

(use-package google-translate
  :defer t
  :init
  (setq google-translate-default-source-language "En"
        google-translate-default-target-language "He"
        google-translate-output-destination 'echo-area
        google-translate-backend-method 'curl)
  :bind ("C-c t" . google-translate-at-point)
  :config
  (require 'google-translate-default-ui))

(use-package nerd-icons)

(use-package nerd-icons-ibuffer
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package nerd-icons-completion
  :config
  (nerd-icons-completion-mode))

(use-package elfeed
  :bind ("C-x w" . elfeed)
  :config
  (setq-default elfeed-search-filter "@1-day-ago +unread +he")
  (setq elfeed-use-curl t)
  (add-hook 'kill-emacs-hook             #'elfeed-db-compact)
  (add-hook 'elfeed-show-mode-hook       #'visual-line-mode)
  (add-hook 'elfeed-search-mode-hook     #'visual-line-mode)
  (add-hook 'elfeed-new-entry-hook
            (elfeed-make-tagger :feed-url "youtube\\.com"
                                :add 'video))
  (run-at-time nil (* 8 60 60) #'elfeed-update))

(use-package elfeed-org
  :after elfeed
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/.config/emacs/elfeed.org")))

(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\\\" "://"))

  (global-ligature-mode t))

(defun my/insert-date-time ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d %a %H:%M")))

(defun my/insert-iso-datetime ()
  (interactive)
  (insert (format-time-string "%Y-%m-%dT%H:%M:%S%z")))

(when (file-exists-p custom-file)
  (load custom-file))
