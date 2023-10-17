(defun cider-jack-in-catalyst ()
  "Start a Cider nREPL server with the 'lein catalyst-repl' command."
  (interactive)
  (cider-jack-in-clj '(:jack-in-cmd "lein catalyst-repl")))

(add-hook 'clojure-mode-hook #'cider-mode)
