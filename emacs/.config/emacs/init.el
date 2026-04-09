(column-number-mode             1)
(size-indication-mode           1)
(display-time-mode              1)
(display-battery-mode           1)
(recentf-mode                   1)
(save-place-mode                1)
(global-auto-revert-mode        1)
(repeat-mode                    1)
(winner-mode                    1)
(blink-cursor-mode              0)
(tooltip-mode                   1)
(context-menu-mode              1)
(global-hl-line-mode            1)
(global-visual-wrap-prefix-mode 1)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (unless package-archive-contents
    (package-refresh-contents))
  (package-install 'use-package))

(require 'use-package)

(setq-default truncate-lines t)

(setq frame-title-format
      '("GNU Emacs — %b"
        (:eval (when (buffer-file-name)
                 (format " (%s)" (abbreviate-file-name (buffer-file-name)))))))

(setq use-package-always-ensure                t
      use-package-expand-minimally             t
      backup-by-copying                        t
      backup-directory-alist                   '(("." . "~/.config/emacs/backups"))
      auto-save-file-name-transforms           `((".*" ,(expand-file-name "~/.config/emacs/auto-save/") t))
      delete-old-versions                      t
      kept-new-versions                        6
      kept-old-versions                        2
      version-control                          t
      vc-make-backup-files                     t
      custom-file                              (expand-file-name "custom.el" user-emacs-directory)
      mouse-wheel-follow-mouse                 t
      mouse-wheel-progressive-speed            nil
      mouse-wheel-scroll-amount                '(2 ((shift) . 8) ((control) . nil))
      ad-redefinition-action                   'accept
      native-comp-async-report-warnings-errors nil
      global-auto-revert-non-file-buffers      t
      vc-follow-symlinks                       t
      select-enable-clipboard                  t
      select-enable-primary                    t
      confirm-kill-emacs                       #'yes-or-no-p)

(setopt enable-recursive-minibuffers    t
	read-extended-command-predicate #'command-completion-default-include-p
	minibuffer-prompt-properties    '(read-only t cursor-intangible t face minibuffer-prompt)
	scroll-conservatively           10000
	scroll-margin                   3
	scroll-preserve-screen-position t
	scroll-step                     1
	next-screen-context-lines       3
	use-dialog-box                  nil)

(unless (file-directory-p "~/.config/emacs/backups")
  (make-directory "~/.config/emacs/backups" t))
(unless (file-directory-p "~/.config/emacs/auto-save")
  (make-directory "~/.config/emacs/auto-save" t))

(set-face-attribute 'default nil
                    :family "JetBrainsMono Nerd Font"
                    :height 120)

(set-fontset-font t 'hebrew
                  (font-spec :family "Noto Sans Hebrew"))

(add-hook 'prog-mode-hook   #'display-line-numbers-mode)
(add-hook 'conf-mode-hook   #'display-line-numbers-mode)
(add-hook 'before-save-hook #'delete-trailing-whitespace)

(global-set-key (kbd "M-<up>")   #'beginning-of-buffer)
(global-set-key (kbd "M-<down>") #'end-of-buffer)
(global-set-key (kbd "M-]")      #'forward-sexp)
(global-set-key (kbd "M-[")      #'backward-sexp)
(global-set-key (kbd "C-c C-d")  #'my/insert-date-time)
(global-set-key (kbd "C-c C-D")  #'my/insert-iso-datetime)
(global-set-key (kbd "<f11>")    #'eshell)
(global-set-key (kbd "C-c r")    #'rectangle-mark-mode)
(global-set-key (kbd "<f9>")     #'menu-bar-open)
(global-set-key (kbd "<home>")   #'delete-other-windows)
(global-set-key (kbd "<end>")    #'delete-window)
(global-set-key (kbd "<f8>")     #'list-bookmarks)
(global-set-key (kbd "<f7>")     #'mu4e)

(use-package doom-themes
  :config
  (load-theme 'doom-one t))

(use-package completion-preview
  :ensure nil
  :hook (prog-mode . completion-preview-mode)
  :bind (:map completion-preview-active-mode-map
              ("M-n" . completion-preview-next-candidate)
              ("M-p" . completion-preview-prev-candidate)))

(use-package which-key
  :ensure nil
  :diminish
  :init (which-key-mode 1)
  :config
  (setq which-key-side-window-location       'bottom
        which-key-sort-order                 #'which-key-key-order-alpha
        which-key-sort-uppercase-first       t
        which-key-max-description-length     nil
        which-key-idle-delay                 0.3
        which-key-allow-imprecise-window-fit nil
        which-key-separator                  " "))

(use-package savehist
  :ensure nil
  :init
  (savehist-mode))

(use-package dired
  :ensure nil
  :custom
  (dired-kill-when-opening-new-dired-buffer t)
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons)

(use-package nerd-icons-dired)

(use-package nerd-icons-ibuffer
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode))

(use-package ibuffer
  :ensure nil
  :bind ("<f12>" . ibuffer)
  :config
  (setq ibuffer-default-sorting-mode 'major-mode))

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package diff-hl
  :init
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode)
  :hook ((dired-mode  . diff-hl-dired-mode)
         (vc-dir-mode . diff-hl-dir-mode))
  :bind (("C-c v n" . diff-hl-next-hunk)
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
  :init
  (defun my-layout-center-buffer ()
    (setq-local visual-fill-column-width       80
                visual-fill-column-center-text t
                truncate-lines                 nil)
    (visual-line-mode 1)
    (visual-fill-column-mode 1))
  :hook ((Info-mode . my-layout-center-buffer)
         (eww-mode  . my-layout-center-buffer)
         (Man-mode  . my-layout-center-buffer)
         (org-mode  . my-layout-center-buffer)))

(use-package markdown-mode
  :mode  ("README\\.md\\'" . gfm-mode)
  :init  (setq markdown-command "multimarkdown")
  :bind  (:map markdown-mode-map ("C-c C-e" . markdown-do)))

(use-package pacmacs)

(use-package 2048-game)

(use-package tldr)

(use-package emms
  :config
  (emms-all)
  (setq emms-player-list    '(emms-player-vlc)
        emms-info-functions '(emms-info-native)))

(use-package dictionary
  :ensure nil
  :custom
  (dictionary-server            "dict.org")
  (dictionary-use-single-window t)
  :bind
  ("C-c d" . dictionary-lookup-definition)
  ("C-c D" . dictionary-search))

(use-package google-translate
  :init
  (setq google-translate-default-source-language  "En"
        google-translate-default-target-language  "He"
	google-translate-output-destination       'popup
        google-translate-backend-method           'curl)
  :bind ("<f10>" . google-translate-at-point)
  :config (require 'google-translate-default-ui))

(use-package elfeed
  :bind (("C-c e d" . elfeed)
	 ("C-c e t" . my/elfeed-no-video)
	 ("C-c e v" . my/elfeed-only-video)
	 ("C-c e h" . my/elfeed-hebrew)
	 ("C-c e e" . my/elfeed-english))
  :config
  (setq-default elfeed-search-filter "+unread +jdn")
  (setq elfeed-use-curl t)
  (add-hook 'elfeed-show-mode-hook   #'visual-line-mode)
  (add-hook 'elfeed-search-mode-hook #'visual-line-mode)
  (add-hook 'elfeed-new-entry-hook
            (elfeed-make-tagger :feed-url "youtube\\.com" :add 'video))
  (add-hook 'elfeed-new-entry-hook
            (elfeed-make-tagger :feed-url "jdn\\.co.il"  :add 'jdn))
  (add-hook 'elfeed-new-entry-hook
            (elfeed-make-tagger :feed-url "reddit\\.com" :add 'reddit)))

(use-package elfeed-org
  :after elfeed
  :config
  (setq rmh-elfeed-org-files (list "~/.config/emacs/elfeed.org"))
  (elfeed-org))

(use-package org
  :ensure nil
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :config
  (setq org-directory                  "~/Org"
        org-default-notes-file         "~/Org/inbox.org"
        org-agenda-files               '("~/Org/")
        org-todo-keywords              '((sequence "TODO" "IN-PROGRESS" "|" "DONE" "CANCELLED"))
        org-log-done                   'time
        org-src-fontify-natively       t
        org-src-tab-acts-natively      t
        org-src-window-setup           'current-window
        org-hide-emphasis-markers      t
        org-startup-folded             t
        org-startup-with-inline-images t
        org-return-follows-link        t
        org-capture-templates
        '(("t" "Task"    entry (file+headline "~/Org/inbox.org" "Tasks")
           "* TODO %?\n  Added: %T\n")
          ("n" "Note"    entry (file+headline "~/Org/inbox.org" "Notes")
           "* %?\n  Added: %T\n")
          ("j" "Journal" entry (file+datetree "~/Org/journal.org")
           "* %?\n  Entered: %T\n"))))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package nov
  :init
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode
    '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
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

(defun my/elfeed-no-video ()
  "Open elfeed with the -video filter applied."
  (interactive)
  (elfeed)
  (elfeed-search-set-filter "+unread -video"))

(defun my/elfeed-only-video ()
  "Open elfeed with the +video filter applied."
  (interactive)
  (elfeed)
  (elfeed-search-set-filter "+unread +video"))

(defun my/elfeed-hebrew ()
  "Open elfeed filtered by +unread +he."
  (interactive)
  (elfeed)
  (elfeed-search-set-filter "+unread +he"))

(defun my/elfeed-english ()
  "Open elfeed filtered by +unread +en."
  (interactive)
  (elfeed)
  (elfeed-search-set-filter "+unread +en"))

(server-start)

(when (file-exists-p custom-file)
  (load custom-file))
