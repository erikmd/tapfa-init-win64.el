# Environnement de TP pour OCaml et Coq (avec Emacs)

Cette configuration nécessite d'installer [GNU
Emacs](https://www.gnu.org/software/emacs/) et
[opam](https://ocaml.org/) (*the OCaml package manager*).

La procédure ci-dessous concerne uniquement Windows 10 (64 bits).

Pour GNU/Linux, consulter <https://github.com/erikmd/tapfa-init.el>.

## Installation sous Windows 10 (64 bits) avec WSL

1.  Installer GNU Emacs 26 à partir de
    <https://vigou3.gitlab.io/emacs-modified-windows/>

1.  Activer WSL dans Windows 10 :
    <https://docs.microsoft.com/en-us/windows/wsl/install-win10>

1.  Installer une distribution GNU/Linux (Debian ou Ubuntu) à partir de
    <https://aka.ms/wslstore>

1.  Ouvrir un terminal WSL (par ex. en tapant le nom de la distribution
    dans le Menu Démarrer) et assurez-vous que vous avez un compte
    utilisateur Linux "normal" (**pas `root`**)

1.  Mettre à jour l'index des paquets :

    ```
    sudo apt-get update
    ```

1.  Installer les dépendances d'`opam` :

    ```
    sudo apt-get install aspcud bubblewrap build-essential curl git m4 tar unzip
    ```

1.  Installer `opam` 2.0 (comme les paquets Debian/Ubuntu sont trop
    anciens, mieux vaut utiliser le [script d'installation
    officiel](http://opam.ocaml.org/doc/Install.html)) :

    ```
    curl -fOL https://github.com/ocaml/opam/raw/master/shell/install.sh
    sh ./install.sh
    ```

1.  Configurer `opam` et installer `merlin` et `coq` (l'option
    `--disable-sandboxing` est requise) :

    ```
    opam init --disable-sandboxing --auto-setup --yes --compiler=ocaml-base-compiler.4.05.0
    eval $(opam env)
    opam install -y merlin coq.8.8.2
    ```

    **Ne pas exécuter `opam user-setup install`**.

1.  Installer `wsl-alias` :

    ```
    curl -fOL https://github.com/leongrdic/wsl-alias/raw/master/install.sh
    bash ./install.sh
    ```

    et valider les questions posées.

1.  Ajouter comme indiqué, le chemin suivant à votre `PATH` Windows :
    `%userprofile%\wsl-alias` (vous pouvez vous inspirer de la page
    <https://stackoverflow.com/a/44272417>).

1.  Ouvrir un terminal cmd.exe (a.k.a. MS-DOS, **pas WSL**) et taper les
    commandes suivantes :

    ```
    b wsl-alias add rlwrap rlwrap
    b wsl-alias add opam opam
    b wsl-alias add ocaml "opam exec -- ocaml"
    b wsl-alias add ocamlc "opam exec -- ocamlc"
    b wsl-alias add ocamlmerlin "opam exec -- ocamlmerlin"
    b wsl-alias add coqtop "opam exec -- coqtop"
    b wsl-alias add coqc "opam exec -- coqc"
    b wsl-alias list  # pour vérifier
    b                 # sans argument, pour passer en mode WSL
    ```

1.  Vérifier que vous êtes bien dans le répertoire
    `/mnt/c/Users/VOTRELOGIN` (dossier personnel Windows) et télécharger
    le fichier `.emacs` fourni :

    ```
    mv -f .emacs .emacs.bak  # pour sauvegarder votre fichier au cas où
    curl -fOL https://github.com/erikmd/tapfa-init-win64.el/raw/master/.emacs
    ```

1.  Lancer Emacs à partir de Windows.

    L'installation des modes Emacs pour OCaml et Coq
	([tuareg](https://github.com/ocaml/tuareg),
	[merlin](https://github.com/ocaml/merlin),
	[company](https://github.com/company-mode/company-mode),
	[ProofGeneral](https://github.com/ProofGeneral/PG) et
	[company-coq](https://github.com/cpitclaudel/company-coq)) devrait
	se lancer automatiquement et durer environ 2'30.

    En cas de souci, faites
    <kbd>M-x package-install-selected-packages RET</kbd>
    (<kbd>M-x</kbd> désignant <kbd>Alt+X</kbd>
    et <kbd>RET</kbd> la touche Entrée) et redémarrez emacs.

    Vous pouvez alors **créer ou ouvrir un fichier OCaml** en tapant
    <kbd>C-x C-f tp1.ml RET</kbd>
