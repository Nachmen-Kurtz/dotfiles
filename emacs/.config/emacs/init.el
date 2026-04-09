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
        mu4e-maildir-shortcuts            '((:maildir "/nachmen/INBOX"                 :key ?I)
                                            (:maildir "/nachmen/[Gmail]/Sent Mail"     :key ?S)
                                            (:maildir "/nachmen/[Gmail]/All Mail"      :key ?A)
                                            (:maildir "/nachmen/[Gmail]/Drafts"        :key ?D)
                                            (:maildir "/nachmen/[Gmail]/Trash"         :key ?T)
                                            (:maildir "/shmnzch/INBOX"                 :key ?n)
                                            (:maildir "/shmnzch/[Gmail]/Sent Mail"     :key ?e)
                                            (:maildir "/shmnzch/[Gmail]/All Mail"      :key ?m)
                                            (:maildir "/shmnzch/[Gmail]/Drafts"        :key ?x)
                                            (:maildir "/shmnzch/[Gmail]/Trash"         :key ?z)
                                            (:maildir "/lniz-cloud/INBOX"              :key ?i)
                                            (:maildir "/lniz-cloud/[Gmail]/Sent Mail"  :key ?s)
                                            (:maildir "/lniz-cloud/[Gmail]/All Mail"   :key ?a)
                                            (:maildir "/lniz-cloud/[Gmail]/Drafts"     :key ?d)
                                            (:maildir "/lniz-cloud/[Gmail]/Trash"      :key ?t))
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
