;; Resource configuration
(package-initialize)

(setq debug-on-error t)
(load-file "~/.emacs.rc/rc.el")

;; MacOS related setup
(when (eq system-type 'darwin)
  (load-file "~/.emacs.rc/mac.el")
  (load-file "~/.emacs.sc/mac.el"))

;; Required packages
(rc/require 'lsp-mode
	    'smex
            'ido-completing-read+
            'move-text
            'multiple-cursors
	    'catppuccin-theme
	    'treemacs
	    'dired-x)

;; Setup configuration
(load-file "~/.emacs.sc/general-keybindings.el")
(load-file "~/.emacs.sc/display.el")
(load-file "~/.emacs.sc/backup.el")
(load-file "~/.emacs.sc/dired.el")
(load-file "~/.emacs.sc/ido.el")
(load-file "~/.emacs.sc/lsp.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(catppuccin))
 '(custom-safe-themes
   '("75fb82e748f32de807b3f9e8c72de801fdaeeb73c791f405d8f73711d0710856" default))
 '(package-selected-packages
   '(haskell-mode treemacs catppuccin-theme catppuccin smex multiple-cursors move-text lsp-mode ido-completing-read+ dash-functional)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
