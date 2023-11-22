(load "~/.emacs.d/sanemacs.el" nil t)

;; Sanity setup
(keymap-global-set "M-x" 'smex)
(keymap-global-set "s-g" 'magit)

(require 'which-key)
(which-key-mode)
(which-key-setup-minibuffer)

(require 'multiple-cursors)
(keymap-global-set "C->"     'mc/mark-next-like-this)
(keymap-global-set "C-<"     'mc/mark-previous-like-this)
(keymap-global-set "C-c C-<" 'mc/mark-all-like-this)

(keymap-global-set "C-c p s" 'lsp-clojure-forward-slurp)
(keymap-global-set "C-c p b" 'lsp-clojure-forward-barf)

(require 'neotree)
(keymap-global-set "<f8>" 'neotree-toggle)
(keymap-global-set "C-c n s" 'neotree-show)
(keymap-global-set "C-c n f" 'neotree-find)
(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)

(defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (ffip-project-root))
          (file-name (buffer-file-name)))
      (if project-dir
          (progn
            (neotree-dir project-dir)
            (neotree-find file-name))
        (message "Could not find git project root."))))

(keymap-global-set "C-c C-p" 'neotree-project-dir)

;; LSP setup
(use-package lsp-mode
  :ensure t
  :hook ((clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp))
  :config
  ;; add paths to your local installation of project mgmt tools, like lein
  (setenv "PATH" (concat
                   "/usr/local/bin" path-separator
                   (getenv "PATH")))
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
    (add-to-list 'lsp-language-id-configuration `(,m . "clojure"))))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company
  :ensure t)

;; Clojure setup
(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))

(unless (package-installed-p 'cider)
  (package-install 'cider))

;; Company setup
(add-hook 'after-init-hook 'global-company-mode)

;; Projectile setup
(add-hook 'after-init-hook 'projectile-mode)
(keymap-global-set "C-c p" 'projectile-command-map)

;; Theme setup
(set-face-attribute 'default nil :height 160)

(setq catppuccin-flavor 'latte)

(set-frame-font "Monaspace Neon-16" nil t)



;; Cider workaround to run ns integration tests using stateflow
(setq cider-test-infer-test-ns (lambda (ns) ns))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(cider clojure-mode lsp-ui lsp-mode cmake-mode yaml-mode which-key web-mode visual-regexp vi-tilde-fringe use-package undo-fu smex smartparens simpleclip shell-pop rich-minority powerthesaurus neotree multiple-cursors move-text markdown-mode magit ivy-rich haml-mode git-gutter flyspell-correct-popup flx expand-region exec-path-from-shell emmet-mode define-word counsel-projectile company avy all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
