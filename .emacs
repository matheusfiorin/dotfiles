;; Resource configuration
(package-initialize)

(setq debug-on-error t)
(load-file "~/.emacs.rc/rc.el")

;; Required packages
(rc/require 'lsp-mode
	    'smex
            'ido-completing-read+
            'move-text
            'multiple-cursors
	    'catppuccin-theme
	    'which-key
	    'centaur-tabs
	    'all-the-icons)

;; Setup configuration
(setq force-load-messages t)
(load-file "~/.emacs.sc/general-keybindings.el")
(load-file "~/.emacs.sc/display.el")
(load-file "~/.emacs.sc/backup.el")
(load-file "~/.emacs.sc/dired.el")
(load-file "~/.emacs.sc/ido.el")
(load-file "~/.emacs.sc/lsp.el")
(load-file "~/.emacs.sc/tab.el")

(which-key-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(catppuccin))
 '(custom-safe-themes
   '("75fb82e748f32de807b3f9e8c72de801fdaeeb73c791f405d8f73711d0710856" default))
 '(package-selected-packages
   '(lsp-haskell dired-rainbow centaur-tabs all-the-icons paredit clojure-mode lsp-dart dart-mode flutter dired-x which-key web-mode haskell-mode catppuccin-theme catppuccin smex multiple-cursors move-text lsp-mode ido-completing-read+)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
