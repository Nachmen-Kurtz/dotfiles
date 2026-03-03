(setq package-enable-at-startup    nil
      inhibit-startup-message      t
      frame-resize-pixelwise       t
      frame-inhibit-implied-resize t
      default-frame-alist
      (append '((tool-bar-lines        . 0)
                (menu-bar-lines        . 0)
                (vertical-scroll-bars  . nil))
              default-frame-alist))
