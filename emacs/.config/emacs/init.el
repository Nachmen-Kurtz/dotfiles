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
      org-link-descriptive nil)

(unless (file-directory-p "~/.config/emacs/backups")
  (make-directory "~/.config/emacs/backups" t))

(column-number-mode 1)
(display-time-mode 1)
(display-battery-mode)
(savehist-mode 1)
(recentf-mode 1)
(save-place-mode 1)

(set-face-attribute 'default nil
		    :family "JetBrainsMono Nerd Font"
                    :height 110)

(set-fontset-font t 'hebrew
		  (font-spec :family "Noto Sans Hebrew"))

(add-hook 'prog-mode-hook              #'display-line-numbers-mode)
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

(use-package completion-preview
  :ensure nil
  :hook (prog-mode . completion-preview-mode)
  :bind
  ( :map completion-preview-active-mode-map
    ("M-n" . completion-preview-next-candidate)
    ("M-p" . completion-preview-prev-candidate)))

(use-package which-key
  :ensure nil
  :config
  (which-key-mode))

(use-package ibuffer
  :ensure nil
  :bind ("C-x C-b" . ibuffer)
  :config
  (setq ibuffer-saved-filter-groups
        '(("Default"
	   ("Info" (mode . Info-mode))
           ("Org" (mode . org-mode))
           ("Web" (or (mode . eww-mode)
                      (mode . browse-url-mode)))
           ("Programming" (or (mode . emacs-lisp-mode)
                              (mode . python-mode)
                              (mode . c-mode)))
           ("Emacs" (name . "^\\*.*\\*$")))))
  (add-hook 'ibuffer-mode-hook
            (lambda ()
              (ibuffer-switch-to-saved-filter-groups "Default"))))

(use-package catppuccin-theme
  :init
  (setq catppuccin-flavor 'mocha)
  :config
  (load-theme 'catppuccin t))

(use-package dashboard
  :init
  (setq dashboard-banner-logo-title "🚀 Welcome to Nachmen's GNU Emacs 🎨"
        dashboard-startup-banner             'logo
        dashboard-center-content             t
        dashboard-vertically-center-content  t
        dashboard-show-shortcuts             t
        dashboard-icon-type                  'nerd-icons
        dashboard-set-heading-icons          t
        dashboard-set-file-icons             t
        dashboard-display-icons-p            t
        dashboard-navigation-cycle           t
	dashboard-projects-backend           'project-el
        dashboard-set-init-info              t
        dashboard-items '((recents . 10)
                          (bookmarks . 5)
                          (projects . 5)
                          (agenda . 5))
        dashboard-footer-messages '("🌟 Code with passion, debug with patience!"
                                    "💡 Every function is an adventure!"
                                    "🚀 Today you'll write something amazing!"
                                    "✨ Your best code is yet to come!"
                                    "🎯 Focus on progress, not perfection!"
                                    "💪 Building the future, one line at a time!"
                                    "🌈 Make it work, make it right, make it beautiful!"
                                    "🔥 You've got this!"
                                    "⚡ Coffee + Code = Magic ☕"
                                    "🎨 Programming is art. You're the artist!"
                                    "🧠 Think different. Code different."
                                    "🏆 Today's bugs are tomorrow's features!"
                                    "🌸 Code happy, be happy!"))
  :config
  (dashboard-setup-startup-hook)
  (global-set-key (kbd "C-c d") 'dashboard-refresh-buffer))

(use-package magit
  :bind (("C-x g" . magit-status)))

(use-package visual-fill-column)

(use-package pacmacs)

(use-package 2048-game)

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

(use-package nerd-icons
  :custom
  (nerd-icons-font-family "Symbols Nerd Font Mono"))

(use-package diff-hl
  :ensure t
  :config
  (add-hook 'prog-mode-hook    'turn-on-diff-hl-mode)
  (add-hook 'vc-dir-mode-hook  'turn-on-diff-hl-mode))

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

(defun my-layout-center-buffer (&optional width)
  (setq visual-fill-column-width (or width 100))
  (setq visual-fill-column-center-text t)
  (visual-fill-column-mode 1)
  (visual-line-mode 1))

(add-hook 'eww-mode-hook
	  (lambda ()
	    (my-layout-center-buffer 110)))

(add-hook 'newsticker-treeview-item-mode-hook
	  (lambda ()
	    (my-layout-center-buffer 90)))

(add-hook 'newsticker-treeview-list-mode-hook
	  (lambda ()
	    (my-layout-center-buffer 90)))

(add-hook 'elfeed-show-mode-hook
	  (lambda ()
	    (my-layout-center-buffer 90)))

(add-hook 'elfeed-search-mode-hook
	  (lambda ()
	    (my-layout-center-buffer 120)))

(add-hook 'Info-mode-hook
	  (lambda ()
	    (my-layout-center-buffer 110)))

(add-hook 'org-mode-hook
	  (lambda ()
	    (my-layout-center-buffer 120)))

(defun my/insert-date-time ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d %a %H:%M")))

(defun my/insert-iso-datetime ()
  (interactive)
  (insert (format-time-string "%Y-%m-%dT%H:%M:%S%z")))

(when (file-exists-p custom-file)
  (load custom-file))
