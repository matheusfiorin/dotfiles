(global-set-key (kbd "C-c t a") 'centaur-tabs-ace-jump)
(global-set-key (kbd "C-c t n") 'centaur-tabs-forward)
(global-set-key (kbd "C-c t p") 'centaur-tabs-backward)
(global-set-key (kbd "C-c t q") 'centaur-tabs-do-close)

(setq centaur-tabs-style "bar")
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-gray-out-icons 'buffer)
(setq centaur-tabs-set-bar 'under)
(setq x-underline-at-descent-line t)
(setq centaur-tabs-set-close-button nil)
(setq centaur-tabs-set-modified-marker t)
(setq centaur-tabs-height 32)
(setq centaur-tabs-show-new-tab-button t)

(defun centaur-tabs-hide-tab (x)
  "Do no to show buffer X in tabs."
  (let ((name (format "%s" x)))
    (or
     ;; Current window is not dedicated window.
     (window-dedicated-p (selected-window))

     ;; Buffer name not match below blacklist.
     (string-prefix-p "*epc" name)
     (string-prefix-p "*helm" name)
     (string-prefix-p "*Helm" name)
     (string-prefix-p "*Compile-Log*" name)
     (string-prefix-p "*lsp" name)
     (string-prefix-p "*company" name)
     (string-prefix-p "*Flycheck" name)
     (string-prefix-p "*tramp" name)
     (string-prefix-p " *Mini" name)
     (string-prefix-p "*help" name)
     (string-prefix-p "*straight" name)
     (string-prefix-p " *temp" name)
     (string-prefix-p "*Help" name)
     (string-prefix-p "*mybuf" name)
     (string-prefix-p "*Async" name)

     ;; Is not magit buffer.
     (and (string-prefix-p "magit" name)
          (not (file-name-extension name)))
     )))

(require 'centaur-tabs)

(centaur-tabs-mode t)
(centaur-tabs-headline-match)
(centaur-tabs-group-by-projectile-project)

(add-hook 'dired-mode-hook 'centaur-tabs-local-mode)
