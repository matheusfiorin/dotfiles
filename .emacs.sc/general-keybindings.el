;; smex
(keymap-global-set "M-x" 'smex)

;; tab-bar related
(defun mark-line ()
  "Mark the current line."
  (interactive)
  (let ((beg (line-beginning-position))
        (end (line-end-position)))
    (push-mark beg t t)
    (goto-char end)))

(keymap-global-set "C-s-v" 'mark-line)

;; treemacs
(require 'treemacs)
(keymap-global-set "M-o" 'treemacs)

;; move text
(require 'move-text)
(keymap-global-set "M-p" 'move-text-up)
(keymap-global-set "M-n" 'move-text-down)

;; multiple cursors
(require 'multiple-cursors)
(keymap-global-set "C-S-c C-S-c" 'mc/edit-lines)
(keymap-global-set "C->"         'mc/mark-next-like-this)
(keymap-global-set "C-<"         'mc/mark-previous-like-this)
(keymap-global-set "C-c C-<"     'mc/mark-all-like-this)
(keymap-global-set "C-\""        'mc/skip-to-next-like-this)
(keymap-global-set "C-:"         'mc/skip-to-previous-like-this)
