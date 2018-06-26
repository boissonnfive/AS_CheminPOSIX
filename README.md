# AS_CheminPOSIXLib

Bibliothèque de manipulation de chemin POSIX en AppleScript.

## Fonctionnalités

Nombreuses fonctions de traitement des sur les chemin POSIX.

(voir les tests pour des exemples)

## Fonctions

- __sansExtension__    : Renvoi le chemin et le nom sans l'extension à partir d'un chemin complet POSIX.
- __extension__        : Renvoi l'extension à partir d'un chemin complet POSIX.
- __nom__              : Renvoi le nom (avec l'extension) à partir d'un chemin complet POSIX.
- __nomSansExtension__ : Renvoi le nom (sans l'extension) à partir d'un chemin complet POSIX.
- __chemin__           : Renvoi le chemin à partir d'un chemin complet POSIX.
- __POSIXVersAlias__   : Renvoi un alias à partir d'un chemin POSIX
- __aliasVersPOSIX__   : Renvoi un chemin POSIX à partir d'un alias

## Installer

Pour installer cette bibliothèque :

1. Ouvrez le fichier *Chemin POSIX.applescript* avec l'« Éditeur de script »
2. Exporter ce fichier au format « Script » => *Chemin POSIX.scpt*
3. Copiez *Chemin POSIX.scpt* dans le dossier *~/Library/Script Libraries*

## Utliser/Tester

Pour tester le fonctionnement de cette bibliothèque :

1. Ouvrez le fichier *Chemin POSIX.applescript* avec l'« Éditeur de script »
2. Copiez dans un nouveau fichier Applescript tout le code qui se trouve sous :

        -----------------------------------------------------------------------
        --                              TESTS
        -----------------------------------------------------------------------

3. Enlevez les marqueurs de commentaires «(\*» et «\*)»
4. Lancer le script

Vous savez comment utliser cette bibliothèque. Faites de même dans votre projet.
