;; show trailing whitespace
(setq-default show-trailing-whitespace t)

;; all backup files in a backups directory
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq backup-by-copying t)

;; insert tabs as spaces
(setq-default indent-tabs-mode nil)

;; scroll one line at a time
(setq scroll-step 1)
