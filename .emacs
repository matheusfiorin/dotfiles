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

;; Theme setup
(setq catppuccin-flavor 'latte)
(load-theme 'catppuccin :no-confirm)

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
