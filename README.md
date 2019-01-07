# Configuration de GNU Emacs pour OCaml et Coq

Ces instructions supposent que les 2 logiciels suivants sont déjà
installés sur votre système, par exemple avec le gestionnaire de
paquets de votre distribution GNU/Linux :

* [GNU Emacs](https://www.gnu.org/software/emacs/),
* [OPAM](https://ocaml.org/) avec les paquets `merlin` (et `coq`).

Pour plus de détails, voir le tutoriel sur Moodle. En particulier pour
configurer Merlin vis-à-vis d'Emacs, **n'exécutez pas la commande
`opam user-setup install`** suggérée à la fin de l'installation de
Merlin, mais suivez les instructions ci-dessous.

## Installation des modes Emacs pour OCaml et Coq

Pour installer automatiquement les modes
[tuareg](https://github.com/ocaml/tuareg),
[merlin-eldoc](https://github.com/Khady/merlin-eldoc),
[company](https://github.com/company-mode/company-mode),
[ProofGeneral](https://github.com/ProofGeneral/PG) et
[company-coq](https://github.com/cpitclaudel/company-coq) :

1. Téléchargez et placez ce fichier [.emacs](https://github.com/erikmd/tapfa-init.el/raw/master/.emacs)
   à la racine de votre homedir (`~/`)

    Notez que vous pouvez effectuer cette étape en ligne de commande :

        cd && mv .emacs .emacs~  # sauvegarder votre fichier si nécessaire
        curl -fSOL https://github.com/erikmd/tapfa-init.el/raw/master/.emacs


    Sinon − si vous n'utilisez pas `curl` mais la fonctionnalité de
	téléchargement de votre navigateur −, veillez à ce que celui-ci
	n'enlève pas le point au début du fichier
	([`.emacs`](https://github.com/erikmd/tapfa-init.el/raw/master/.emacs),
	pas `emacs`).

2. Lancez GNU Emacs en exécutant la commande `emacs &` dans un
   terminal.

    L'installation des modes Emacs pour OCaml et Coq devrait se lancer
    automatiquement et durer environ 2'30.

    En cas de souci, faites
    <kbd>M-x package-install-selected-packages RET</kbd>
    (<kbd>M-x</kbd> désignant <kbd>Alt+X</kbd>
    et <kbd>RET</kbd> la touche Entrée) et redémarrez emacs.
