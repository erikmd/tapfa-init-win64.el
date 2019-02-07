;;; .emacs --- Emacs conf file -*- coding: utf-8 -*-

;; Téléchargez et placez ce fichier à la racine de votre homedir (=> ~/.emacs)
;; puis lancez GNU Emacs en exécutant la commande "emacs &" dans un terminal.

;; L'installation des modes Emacs pour OCaml et Coq devrait se lancer
;; automatiquement et durer environ 2'30.

;; En cas de souci, faites "M-x package-install-selected-packages RET"
;; (M-x désignant Alt+X et RET la touche Entrée) et redémarrez emacs.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Config de package.el, MELPA et use-package

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives
               (cons "melpa" (concat proto "://melpa.org/packages/")) t))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-switches "-u")
 '(package-selected-packages
   (quote (company-coq proof-general company merlin tuareg use-package))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Bootstrap use-package

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Config de Tuareg, Merlin et Company

(use-package tuareg
  :ensure t
  :defer t
  :config
  (setq tuareg-interactive-program "ocaml"
        tuareg-opam "opam"))

(use-package merlin
  :ensure t
  :hook
  ((tuareg-mode caml-mode) . merlin-mode)
  :config
  (setq merlin-command "ocamlmerlin"))

;;;  Désactivé car induit un ralentissement sous Windows+WSL
;; (use-package merlin-eldoc
;;   :ensure t
;;   :hook
;;   ((tuareg-mode caml-mode) . merlin-eldoc-setup)
;;   :bind (:map merlin-mode-map
;;               ("C-c <C-left>" . merlin-eldoc-jump-to-prev-occurrence)
;;               ("C-c <C-right>" . merlin-eldoc-jump-to-next-occurrence)))

(use-package company
  :ensure t
  :hook
  ((tuareg-mode caml-mode) . company-mode)
  :config
  (bind-key "<S-tab>" 'company-complete))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Config de ProofGeneral et company-coq

(use-package proof-general
  :ensure t
  :mode ("\\.v\\'" . coq-mode)
  :config
  (setq coq-prog-name "coqtop")
  :custom-face
  (proof-locked-face ((t (:background "#add8e6")))))

(use-package company-coq
  :ensure t
  :hook
  (coq-mode . company-coq-mode)
  :init
  (setq company-coq-disabled-features '(hello prettify-symbols)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Config générale

(setq column-number-mode t
      line-number-mode t
      require-final-newline t)

;; Marquage des parenthèses
(load-library "paren")
(show-paren-mode 1)

;; Raccourcis C-c/C-x/C-v/C-z standards
;; au lieu de M-w/C-w/C-y/C-_ par défaut dans GNU Emacs
(cua-mode 1)
