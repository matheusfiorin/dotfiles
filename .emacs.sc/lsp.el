(require 'lsp-mode)
(defun turn-on-lsp-and-paredit ()
  (interactive)
  (lsp-mode 1)
  (paredit-mode 1))

(add-hook 'clojure-mode-hook 'turn-on-lsp-and-paredit)
