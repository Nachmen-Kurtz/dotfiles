(column-number-mode             1)
(size-indication-mode           1)
(display-time-mode              1)
(display-battery-mode           1)
(recentf-mode                   1)
(save-place-mode                1)
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

(setq-default truncate-lines   t
              indent-tabs-mode nil)

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
      user-mail-address                        "nachmenkurtz@gmail.com"
      user-full-name                           "Nachmen Kurtz"
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
                    :height 110)

(set-fontset-font t 'hebrew
                  (font-spec :family "Noto Sans Hebrew"))

(add-hook 'emacs-startup-hook #'mu4e)
(add-hook 'emacs-startup-hook #'elfeed)
(add-hook 'prog-mode-hook     #'display-line-numbers-mode)
(add-hook 'conf-mode-hook     #'display-line-numbers-mode)
(add-hook 'before-save-hook   #'delete-trailing-whitespace)

(add-hook 'org-mode-hook (lambda () (visual-wrap-prefix-mode -1)))

(global-set-key (kbd "M-<up>")   #'beginning-of-buffer)
(global-set-key (kbd "M-<down>") #'end-of-buffer)
(global-set-key (kbd "M-]")      #'forward-sexp)
(global-set-key (kbd "M-[")      #'backward-sexp)
(global-set-key (kbd "C-c t s")  #'my/insert-date-time)
(global-set-key (kbd "C-c t i")  #'my/insert-iso-datetime)
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
        which-key-idle-delay                 0.2
        which-key-allow-imprecise-window-fit nil
        which-key-separator                  " 󱕴 "))

(use-package savehist
  :ensure nil
  :init
  (savehist-mode))

(use-package dired
  :ensure nil
  :custom
  (dired-kill-when-opening-new-dired-buffer t)
  (dired-listing-switches "-alh --group-directories-first")
  :hook
  (dired-mode . nerd-icons-dired-mode)
  (dired-mode . dired-hide-details-mode))

(use-package desktop
  :ensure nil
  :init
  (setq desktop-save                't
        desktop-load-locked-desktop t
        desktop-auto-save-timeout   60
        desktop-restore-eager       5
        desktop-path                (list user-emacs-directory)
        desktop-base-file-name      "desktop"
        desktop-base-lock-name      "desktop.lock"
        desktop-globals-to-save     '(desktop-missing-file-warning
                                      tags-file-name
                                      tags-table-list
                                      search-ring
                                      regexp-search-ring
                                      register-alist
                                      file-name-history
                                      kill-ring)
        desktop-buffers-not-to-save
        (rx (or (regexp "\\`\\*")
                (regexp "\\.gpg\\'"))))
  :config
  (desktop-save-mode 1))

(use-package nerd-icons)

(use-package nerd-icons-dired)

(use-package nerd-icons-ibuffer)

(use-package nerd-icons-completion
  :config
  (nerd-icons-completion-mode))

(use-package ibuffer
  :ensure nil
  :bind ("<f12>" . ibuffer)
  :hook
  (ibuffer-mode . nerd-icons-ibuffer-mode)
  (ibuffer-mode . (lambda ()
                    (ibuffer-switch-to-saved-filter-groups "default")))
  :config
  (setq ibuffer-default-sorting-mode 'major-mode
        ibuffer-saved-filter-groups  '(("default"
                                        ("Dired"   (mode . dired-mode))
                                        ("Org"     (or (mode . org-mode)
                                                       (mode . org-agenda-mode)))
                                        ("Prog"    (or (derived-mode . prog-mode)
                                                       (mode . conf-space-mode)
                                                       (mode . conf-xdefaults-mode)
                                                       (mode . conf-unix-mode)))
                                        ("Magit"   (or (name . "^magit")
                                                       (mode . diff-mode)))
                                        ("Shell"   (mode . eshell-mode))
                                        ("Mail"    (name . "^\\*mu4e"))
                                        ("Elfeed"  (name . "^\\*elfeed"))
                                        ("Help"    (or (mode . Man-mode)
                                                       (mode . tldr-mode)
                                                       (mode . help-mode)
                                                       (mode . Info-mode)
                                                       (mode . apropos-mode)))
                                        ("Special" (name . "^\\*"))))))

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
    (visual-line-mode        1)
    (visual-fill-column-mode 1))
  :hook ((Info-mode . my-layout-center-buffer)
         (eww-mode  . my-layout-center-buffer)
         (Man-mode  . my-layout-center-buffer)))

(use-package markdown-mode
  :mode
  ("README\\.md\\'" . gfm-mode)
  :init
  (setq markdown-command "multimarkdown")
  :bind
  (:map markdown-mode-map
        ("C-c C-e" . markdown-do)))

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
        google-translate-backend-method           'curl)
  :bind ("<f10>" . google-translate-at-point)
  :config (require 'google-translate-default-ui))

(use-package elfeed
  :preface
  (defun my/elfeed-no-video ()
    (interactive)
    (elfeed)
    (elfeed-search-set-filter "+unread -video"))
  (defun my/elfeed-only-video ()
    (interactive)
    (elfeed)
    (elfeed-search-set-filter "+unread +video"))
  (defun my/elfeed-hebrew ()
    (interactive)
    (elfeed)
    (elfeed-search-set-filter "+unread +he"))
  (defun my/elfeed-english ()
    (interactive)
    (elfeed)
    (elfeed-search-set-filter "+unread +en"))
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
            (elfeed-make-tagger :feed-url "jdn\\.co.il"  :add 'jdn)))

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
  :custom
  (org-agenda-files      '("~/org/tasks.org" "~/org/projects.org"))
  (org-startup-folded    'fold)
  (org-log-done          'time)
  (org-log-into-drawer   t)
  (org-refile-targets    '((org-agenda-files         :maxlevel . 3)
                           ("~/org/ideas.org"        :maxlevel . 2)
                           ("~/org/thoughts.org"     :maxlevel . 1)))
  (org-todo-keywords     '((sequence "TODO" "IN-PROGRESS" "|" "DONE" "CANCELLED")))
  (org-capture-templates '(("i" "Inbox"   entry (file              "~/org/inbox.org")               "* %?\n%U\n")
                           ("t" "Task"    entry (file+headline     "~/org/tasks.org"    "Tasks")    "* TODO %?\n")
                           ("p" "Project" entry (file+headline     "~/org/projects.org" "Projects") "* TODO %?\n")
                           ("j" "Journal" entry (file+olp+datetree "~/org/journal.org")             "* %?\n%U\n")
                           ("d" "Idea"    entry (file+headline     "~/org/ideas.org"    "Ideas")    "* %?\n%U\n")
                           ("h" "Thought" entry (file+headline     "~/org/thoughts.org" "Thoughts") "* %?\n%U\n")))
  :config
  (require 'org-tempo))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package mu4e
  :ensure nil
  :config
  (setq message-send-mail-function        'message-send-mail-with-sendmail
        sendmail-program                  "/usr/bin/msmtp"
        message-sendmail-f-is-evil        t
        message-sendmail-extra-arguments  '("--read-envelope-from")
        mu4e-maildir                      "~/mail"
        mu4e-get-mail-command             "mbsync gmail"
        mu4e-update-interval              300
        mu4e-change-filenames-when-moving t
        mu4e-user-mail-address-list       '("nachmenkurtz@gmail.com" "shmnzch@gmail.com" "lniz.cloud@gmail.com")
        mu4e-context-policy               'pick-first
        mu4e-compose-context-policy       'ask-if-none
        mu4e-maildir-shortcuts            '((:maildir "/nachmen/INBOX"                :key ?1)
                                            (:maildir "/shmnzch/INBOX"                :key ?2)
                                            (:maildir "/lniz-cloud/INBOX"             :key ?3)
                                            (:maildir "/nachmen/[Gmail]/Sent Mail"    :key ?s)
                                            (:maildir "/shmnzch/[Gmail]/Sent Mail"    :key ?S)
                                            (:maildir "/lniz-cloud/[Gmail]/Sent Mail" :key ?e)
                                            (:maildir "/nachmen/[Gmail]/Drafts"       :key ?d)
                                            (:maildir "/shmnzch/[Gmail]/Drafts"       :key ?D)
                                            (:maildir "/lniz-cloud/[Gmail]/Drafts"    :key ?f)
                                            (:maildir "/nachmen/[Gmail]/Trash"        :key ?t)
                                            (:maildir "/shmnzch/[Gmail]/Trash"        :key ?T)
                                            (:maildir "/lniz-cloud/[Gmail]/Trash"     :key ?g)
                                            (:maildir "/nachmen/[Gmail]/All Mail"     :key ?a)
                                            (:maildir "/shmnzch/[Gmail]/All Mail"     :key ?A)
                                            (:maildir "/lniz-cloud/[Gmail]/All Mail"  :key ?q))
        mu4e-contexts
        `(,(make-mu4e-context
            :name "nachmen"
            :match-func (lambda (msg)
                          (when msg
                            (string-prefix-p "/nachmen" (mu4e-message-field msg :maildir))))
            :vars '((user-mail-address       . "nachmenkurtz@gmail.com")
                    (user-full-name          . "Nachmen Kurtz")
                    (mu4e-sent-folder        . "/nachmen/[Gmail]/Sent Mail")
                    (mu4e-drafts-folder      . "/nachmen/[Gmail]/Drafts")
                    (mu4e-trash-folder       . "/nachmen/[Gmail]/Trash")
                    (mu4e-refile-folder      . "/nachmen/[Gmail]/All Mail")))
          ,(make-mu4e-context
            :name "shmnzch"
            :match-func (lambda (msg)
                          (when msg
                            (string-prefix-p "/shmnzch" (mu4e-message-field msg :maildir))))
            :vars '((user-mail-address       . "shmnzch@gmail.com")
                    (user-full-name          . "Nachmen Kurtz")
                    (mu4e-sent-folder        . "/shmnzch/[Gmail]/Sent Mail")
                    (mu4e-drafts-folder      . "/shmnzch/[Gmail]/Drafts")
                    (mu4e-trash-folder       . "/shmnzch/[Gmail]/Trash")
                    (mu4e-refile-folder      . "/shmnzch/[Gmail]/All Mail")))
          ,(make-mu4e-context
            :name "lniz"
            :match-func (lambda (msg)
                          (when msg
                            (string-prefix-p "/lniz-cloud" (mu4e-message-field msg :maildir))))
            :vars '((user-mail-address       . "lniz.cloud@gmail.com")
                    (user-full-name          . "Nachmen Kurtz")
                    (mu4e-sent-folder        . "/lniz-cloud/[Gmail]/Sent Mail")
                    (mu4e-drafts-folder      . "/lniz-cloud/[Gmail]/Drafts")
                    (mu4e-trash-folder       . "/lniz-cloud/[Gmail]/Trash")
                    (mu4e-refile-folder      . "/lniz-cloud/[Gmail]/All Mail"))))))

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

(server-start)

(when (file-exists-p custom-file)
  (load custom-file))
