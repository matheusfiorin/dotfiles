;; Resource configuration
(package-initialize)

(load-file "~/.emacs.rc/rc.el")
(load-file "~/.emacs.rc/mac.el")

;; Display settings
(setq inhibit-startup-screen t)
(setq backup-directory-alist '(("." . "~/.emacs_saves")))
(setq display-line-numbers 'relative)
(setq create-lockfiles nil)
(setq vc-follow-symlinks t)
(set-frame-font "OverpassM Nerd Font Mono 20")

;; General mode settings
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(menu-bar-mode 0)
(tool-bar-mode 0)
(tab-bar-mode 1)

(keymap-global-set "s-c"       'kill-ring-save)
(keymap-global-set "s-v"       'yank)
(keymap-global-set "s-x"       'kill-region)
(keymap-global-set "s-a"       'mark-whole-buffer)
(keymap-global-set "s-z"       'undo)
(keymap-global-set "s-o"       'find-file)
(keymap-global-set "s-w"       'tab-bar-close-tab)
(keymap-global-set "s-t"       'tab-bar-new-tab)
(keymap-global-set "s-s"       'save-buffer)
(keymap-global-set "s-S"       'mac-save-file-as) 
(keymap-global-set "s-q"       'save-buffers-kill-emacs)
(keymap-global-set "s-l"       'goto-line)
(keymap-global-set "s-k"       'kill-buffer)
(keymap-global-set "s-<up>"    'beginning-of-buffer)
(keymap-global-set "s-<down>"  'end-of-buffer)
(keymap-global-set "s-<left>"  'beginning-of-line)
(keymap-global-set "s-<right>" 'end-of-line)
(keymap-global-set "M-<down>"  'forward-paragraph)
(keymap-global-set "M-<up>"    'backward-paragraph)

(add-hook 'emacs-startup-hook
          (lambda ()
	    (setq display-line-numbers 'relative)))

;; Mac related
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)

;;; ido
(rc/require 'smex 'ido-completing-read+)

(require 'ido-completing-read+)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

(keymap-global-set "M-x" 'smex)
(keymap-global-set "C-c C-c M-x" 'execute-extended-command)

;; Frame size
(set-frame-size (selected-frame) 140 45)

;; Dired
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")

;; Move text
(rc/require 'move-text)
(require 'move-text)
(keymap-global-set "M-p" 'move-text-up)
(keymap-global-set "M-n" 'move-text-down)

;; Keymap settings
(defun mark-line ()
  "Mark the current line."
  (interactive)
  (let ((beg (line-beginning-position))
        (end (line-end-position)))
    (push-mark beg t t)
    (goto-char end)))

(keymap-global-set "M-[" 'tab-bar-switch-to-prev-tab)
(keymap-global-set "M-]" 'tab-bar-switch-to-next-tab)
(keymap-global-set "s-[" 'tab-bar-switch-to-prev-tab)
(keymap-global-set "s-]" 'tab-bar-switch-to-next-tab)
(keymap-global-set "M-t" 'tab-bar-new-tab)
(keymap-global-set "M-w" 'tab-bar-close-tab)
(keymap-global-set "M-o" 'treemacs)
(keymap-global-set "C-s-v" 'mark-line)

;; LSP
(require 'lsp-mode)
(defun turn-on-lsp-and-paredit ()
  (interactive)
  (lsp-mode 1)
  (paredit-mode 1))

(add-hook 'clojure-mode-hook 'turn-on-lsp-and-paredit)

;; Auth-source
(setq auth-sources '("~/.authinfo.json.gpg"))

;; Cider
(defun cider-jack-in-catalyst ()
  "Start a Cider nREPL server with the 'lein catalyst-repl' command."
  (interactive)
  (cider-jack-in-clj '(:jack-in-cmd "lein catalyst-repl")))

(add-hook 'clojure-mode-hook #'cider-mode)

;; Whitespace mode
(defun rc/set-up-whitespace-handling ()
  (interactive)
  (whitespace-mode 1)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

(add-hook 'emacs-lisp-mode 'rc/set-up-whitespace-handling)
(add-hook 'markdown-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'python-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'clojure-mode-hook 'rc/set-up-whitespace-handling)

;; Multiple cursors
(rc/require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;; Generated code
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(connection-local-criteria-alist
   '(((:application tramp :protocol "flatpak")
      tramp-container-connection-local-default-flatpak-profile)
     ((:application tramp :machine "localhost")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp :machine "matheus.fiorin")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp)
      tramp-connection-local-default-system-profile tramp-connection-local-default-shell-profile)))
 '(connection-local-profile-alist
   '((tramp-container-connection-local-default-flatpak-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin"))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o" "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "state=abcde" "-o" "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (euid . number)
       (user . string)
       (egid . number)
       (comm . 52)
       (state . 5)
       (ppid . number)
       (pgrp . number)
       (sess . number)
       (ttname . string)
       (tpgid . number)
       (minflt . number)
       (majflt . number)
       (time . tramp-ps-time)
       (pri . number)
       (nice . number)
       (vsize . number)
       (rss . number)
       (etime . tramp-ps-time)
       (pcpu . number)
       (pmem . number)
       (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o" "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "stat=abcde" "-o" "ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (user . string)
       (group . string)
       (comm . 52)
       (state . 5)
       (ppid . number)
       (pgrp . number)
       (ttname . string)
       (time . tramp-ps-time)
       (nice . number)
       (etime . tramp-ps-time)
       (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o" "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (euid . number)
       (user . string)
       (egid . number)
       (group . string)
       (comm . 52)
       (state . string)
       (ppid . number)
       (pgrp . number)
       (sess . number)
       (ttname . string)
       (tpgid . number)
       (minflt . number)
       (majflt . number)
       (time . tramp-ps-time)
       (pri . number)
       (nice . number)
       (vsize . number)
       (rss . number)
       (etime . number)
       (pcpu . number)
       (pmem . number)
       (args)))
     (tramp-connection-local-default-shell-profile
      (shell-file-name . "/bin/sh")
      (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile
      (path-separator . ":")
      (null-device . "/dev/null"))))
 '(custom-enabled-themes '(catppuccin))
 '(custom-safe-themes
   '("75fb82e748f32de807b3f9e8c72de801fdaeeb73c791f405d8f73711d0710856" "ba4ab079778624e2eadbdc5d9345e6ada531dc3febeb24d257e6d31d5ed02577" default))
 '(package-selected-packages
   '(treemacs catppuccin-theme multiple-cursors ido-completing-read+ move-text eshell-syntax-highlighting lsp-treemacs flycheck flycheck-clojure lsp-ui lsp-mode cider clojure-mode paredit gruber-darker-theme smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
