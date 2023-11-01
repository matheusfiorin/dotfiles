;; smex
(global-set-key (kbd "M-x") 'smex)

(defun mark-line ()
  "Mark the current line."
  (interactive)
  (let ((beg (line-beginning-position))
        (end (line-end-position)))
    (push-mark beg t t)
    (goto-char end)))

(global-set-key (kbd "C-s-v") 'mark-line)

;; move text
(require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)
