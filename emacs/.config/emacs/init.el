(column-number-mode        1)
(size-indication-mode      1)
(display-time-mode         1)
(display-battery-mode      1)
(savehist-mode             1)
(recentf-mode              1)
(save-place-mode           1)
(global-auto-revert-mode   1)
(repeat-mode               1)
(winner-mode               1)
(blink-cursor-mode         0)
(tooltip-mode              1)
(context-menu-mode         1)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (unless package-archive-contents
    (package-refresh-contents))
  (package-install 'use-package))

(require 'use-package)

(setq-default
 truncate-lines            t
 visual-wrap-prefix-mode   t)

(setq
 frame-title-format
 '("Emacs — %b"
   (:eval
    (when (buffer-file-name)
      (format " (%s)"
              (abbreviate-file-name (buffer-file-name)))))))

(setq
 ad-redefinition-action                     'accept
 auto-save-file-name-transforms             `((".*" ,(expand-file-name "~/.config/emacs/auto-save/") t))
 backup-by-copying                          t
 backup-directory-alist                     '(("." . "~/.config/emacs/backups"))
 custom-file                                (expand-file-name "custom.el" user-emacs-directory)
 delete-old-versions                        t
 global-auto-revert-non-file-buffers        t
 kept-new-versions                          6
 kept-old-versions                          2
 mouse-wheel-follow-mouse                   t
 mouse-wheel-progressive-speed              nil
 mouse-wheel-scroll-amount                  '(2 ((shift) . 8) ((control) . nil))
 native-comp-async-report-warnings-errors   nil
 next-screen-context-lines                  3
 scroll-conservatively                      10000
 scroll-margin                              3
 scroll-preserve-screen-position            t
 scroll-step                                1
 use-dialog-box                             nil
 use-package-always-ensure                  t
 use-package-expand-minimally               t
 vc-follow-symlinks                         t
 vc-make-backup-files                       t
 version-control                            t)

(unless (file-directory-p "~/.config/emacs/backups")
  (make-directory "~/.config/emacs/backups" t))

(unless (file-directory-p "~/.config/emacs/auto-save")
  (make-directory "~/.config/emacs/auto-save" t))

(set-face-attribute 'default nil
		    :family "JetBrainsMono Nerd Font"
                    :height 110)

(set-fontset-font t 'hebrew
		  (font-spec :family "Noto Sans Hebrew"))

(add-hook 'prog-mode-hook              #'display-line-numbers-mode)
(add-hook 'conf-mode-hook              #'display-line-numbers-mode)
(add-hook 'before-save-hook            #'delete-trailing-whitespace)

(global-set-key (kbd "M-<up>")      #'beginning-of-buffer)
(global-set-key (kbd "M-<down>")    #'end-of-buffer)
(global-set-key (kbd "M-]")         #'forward-sexp)
(global-set-key (kbd "M-[")         #'backward-sexp)
(global-set-key (kbd "C-c C-d")     #'my/insert-date-time)
(global-set-key (kbd "C-c C-D")     #'my/insert-iso-datetime)
(global-set-key (kbd "<f11>")       #'eshell)
(global-set-key (kbd "C-c r")       #'rectangle-mark-mode)
(global-set-key (kbd "<f9>")        #'menu-bar-open)

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

(use-package completion-preview
  :ensure nil
  :hook
  (prog-mode . completion-preview-mode)
  :bind
  (:map completion-preview-active-mode-map
    ("M-n" . completion-preview-next-candidate)
    ("M-p" . completion-preview-prev-candidate)))

(use-package which-key
  :diminish
  :init
  (which-key-mode 1)
  :config
  (setq which-key-side-window-location       'bottom
        which-key-sort-order                 #'which-key-key-order-alpha
        which-key-sort-uppercase-first       t
        which-key-max-description-length     nil
        which-key-idle-delay                 0.3
        which-key-allow-imprecise-window-fit nil
        which-key-separator                  " "))

(use-package vertico
  :init
  (vertico-mode 1)
  :config
  (setq vertico-cycle t))

(use-package orderless
  :defer t
  :config
  (setq completion-styles '(orderless basic)
        completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :init
  (marginalia-mode 1))

(use-package consult
  :defer t
  :bind
  (("C-x b"   . consult-buffer)
   ("C-x 4 b" . consult-buffer-other-window)
   ("M-y"     . consult-yank-pop)
   ("M-s r"   . consult-ripgrep)
   ("M-s f"   . consult-find)
   ("M-s l"   . consult-line)
   ("M-s m"   . consult-man)
   ("C-c i"   . consult-imenu)))

(use-package nerd-icons-dired
  :defer t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package ibuffer
  :defer t
  :ensure nil
  :bind
  ("<f12>" . ibuffer))

(use-package dashboard
  :init
  (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  (setq dashboard-banner-logo-title "  Welcome to Nachmen's GNU Emacs "
        dashboard-center-content             t
        dashboard-vertically-center-content  t
        dashboard-show-shortcuts             t
        dashboard-icon-type                  'nerd-icons
        dashboard-set-heading-icons          t
        dashboard-set-file-icons             t
        dashboard-display-icons-p            t
	dashboard-navigation-cycle           t
	dashboard-page-separator             "\n\f\n"
	dashboard-items	                     '((projects  . 10)
                       			       (bookmarks . 10)
                       			       (recents  . 10)))
  :config
  (dashboard-setup-startup-hook)
  (global-set-key (kbd "C-c d") #'dashboard-refresh-buffer))

(use-package magit
  :defer t
  :bind
  (("C-x g" . magit-status)))

(use-package diff-hl
  :init
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode)
  :hook
  ((dired-mode  . diff-hl-dired-mode)
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
  :defer t
  :init
  (defun my-layout-center-buffer ()
    (setq-local visual-fill-column-width 110
                visual-fill-column-center-text t
                truncate-lines nil)
    (visual-line-mode 1)
    (visual-fill-column-mode 1))
  :hook ((help-mode    . my-layout-center-buffer)
         (Info-mode    . my-layout-center-buffer)
         (eww-mode     . my-layout-center-buffer)
	 (Man-mode     . my-layout-center-buffer)
         (org-mode     . my-layout-center-buffer)))

(use-package markdown-mode
  :defer t
  :mode
  ("README\\.md\\'" . gfm-mode)
  :init
  (setq markdown-command "multimarkdown")
  :bind
  (:map markdown-mode-map ("C-c C-e" . markdown-do)))

(use-package pacmacs
  :defer t)

(use-package 2048-game
  :defer t)

(use-package tldr
  :defer t)

(use-package pdf-tools
  :defer t)

(use-package emms
  :defer t
  :config
  (emms-all)
  (setq emms-player-list    '(emms-player-vlc)
        emms-info-functions '(emms-info-native)))

(use-package google-translate
  :defer t
  :init
  (setq google-translate-default-source-language "En"
        google-translate-default-target-language  "He"
        google-translate-output-destination       'echo-area
        google-translate-backend-method           'curl)
  :bind
  ("<f10>" . google-translate-at-point)
  :config
  (require 'google-translate-default-ui))

(use-package nerd-icons)

(use-package nerd-icons-ibuffer
  :defer t
  :hook
  (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package nerd-icons-completion
  :defer t
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package elfeed
  :defer t
  :bind
  ("C-x w" . elfeed)
  :config
  (setq-default elfeed-search-filter "+unread +jdn")
  (setq elfeed-use-curl t)
  (add-hook 'kill-emacs-hook         #'elfeed-db-compact)
  (add-hook 'elfeed-show-mode-hook   #'visual-line-mode)
  (add-hook 'elfeed-search-mode-hook #'visual-line-mode)
  (add-hook 'elfeed-new-entry-hook
            (elfeed-make-tagger :feed-url "youtube\\.com" :add 'video))
  (add-hook 'elfeed-new-entry-hook
            (elfeed-make-tagger :feed-url "jdn\\.co.il"  :add 'jdn))
  (add-hook 'elfeed-new-entry-hook
            (elfeed-make-tagger :feed-url "reddit\\.com" :add 'reddit))
  (run-at-time "1 min" (* 8 60 60) #'elfeed-update))

(use-package elfeed-org
  :after elfeed
  :config
  (setq rmh-elfeed-org-files (list "~/.config/emacs/elfeed.org"))
  (elfeed-org))

(use-package page-break-lines
  :config
  (global-page-break-lines-mode 1))


(use-package org-roam
  :custom
  (org-roam-directory (file-truename "/path/to/org-files/"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  (require 'org-roam-protocol))

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
