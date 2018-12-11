# Configuration de GNU Emacs pour Coq

Ces instructions supposent que les logiciels suivants sont déjà
installés sur votre système, par exemple avec le gestionnaire de
paquets de votre distribution GNU/Linux :

* [Coq](https://coq.inria.fr/download)
* [GNU Emacs](https://www.gnu.org/software/emacs/) (ou [Emacs Modified for Windows](https://vigou3.gitlab.io/emacs-modified-windows/))

## Installation des modes Emacs pour Coq

Pour installer automatiquement
[ProofGeneral](https://github.com/ProofGeneral/PG) et
et [company-coq](https://github.com/cpitclaudel/company-coq) :

1. Téléchargez et placez ce fichier [.emacs](https://github.com/erikmd/coq-init.el/raw/master/.emacs)
   à la racine de votre homedir (`~/`)

    Notez que vous pouvez effectuer cette étape en ligne de commande :

        cd && mv .emacs .emacs~  # sauvegarder votre fichier si nécessaire
        curl -fSOL https://github.com/erikmd/coq-init.el/raw/master/.emacs


    Sinon − si vous n'utilisez pas `curl` mais la fonctionnalité de
	téléchargement de votre navigateur −, veillez à ce que celui-ci
	n'enlève pas le point au début du fichier
	([`.emacs`](https://github.com/erikmd/coq-init.el/raw/master/.emacs),
	pas `emacs`).

2. Lancez GNU Emacs en exécutant la commande `emacs &` dans un
   terminal.

    L'installation des modes Emacs pour Coq devrait se lancer
    automatiquement et durer environ 2'30.

    En cas de souci, faites
    <kbd>M-x package-install-selected-packages RET</kbd>
    (<kbd>M-x</kbd> désignant <kbd>Alt+X</kbd>
    et <kbd>RET</kbd> la touche Entrée) et redémarrez emacs.

3. Si vous êtes sous Windows, décommentez la ligne de configuration
   indiquée dans le fichier `.emacs` pour que la commande suivante
   soit exécutée au chargement de ProofGeneral :

        (setq coq-prog-name "C:/Coq/bin/coqtop.exe")
