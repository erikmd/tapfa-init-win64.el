;; .emacs

(custom-set-variables
 ;; uncomment to always end a file with a newline
 ;'(require-final-newline t)
 ;; uncomment to disable loading of "default.el" at startup
 ;'(inhibit-default-init t)
 ;; default to unified diffs
 '(diff-switches "-u"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Configuration globale
(setq column-number-mode t
      line-number-mode t)

;; Marquage des parenthèses
(load-library "paren")
(show-paren-mode 1)

;; Raccourcis C-c/C-x/C-v/C-z standards
;; au lieu de M-w/C-w/C-y/C-_ par défaut dans GNU Emacs
(cua-mode 1)
