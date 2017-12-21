## Les listes extras

Différents test de listes alternatives.

Les types de liste sont:

* __3k__: liste de 3072 mots pour utilisation purement logiciel (à la xkcd)
* __2k__: liste de 2048 mots pour utilisation purement logiciel (à la xkcd)
* __4d_3__: liste de 1296 mots pour diceware 4 dés. Cette variante implémente le préfixe
    unique de 3 caractères, mais pas de distance d'édition.
* __nonascii__: Variantes des listes principales contenant des caractères non ascii.

### nonascii

Contrairement aux listes standards qui contiennent uniquement des mots composés des lettres ascii
([a-z]), les listes _nonascii ont des mots pouvant contenir également les lettres *àéîôùç*. Ces
lettres ont été choisies pour leur relative facilité à être tapées sur un clavier français physique
ou virtuel (sur clavier android standard, toutes ces lettres sont accessible par un appui prolongé
sur la lettre ascii correspondante).

Les listes _nonascii ont tendance à avoir une longueur de mot moyenne légèrement inférieure à leurs
équivalent ascii, puisqu'elles ont été générées avec une taille de mot maximum inférieure. Elles
peuvent donc être préférées quand on tire beaucoup de mots dans une liste.

### Statistiques

fichier                   | mots | non ascii | avg len | bit/mot | bit/car
--------------------------|------|-----------|---------|---------|--------
wordlist_fr_5d_nonascii   | 7776 |       959 |    6.32 |    12.9 |     2.0
wordlist_fr_4k_nonascii   | 4096 |       280 |    5.20 |    12.0 |     2.3
wordlist_fr_3k            | 3072 |         0 |    5.21 |    11.5 |     2.2
wordlist_fr_2k            | 2048 |         0 |    5.12 |    11.0 |     2.1
wordlist_fr_4d_nonascii   | 1296 |        45 |    4.41 |    10.3 |     2.3
wordlist_fr_4d_2_nonascii | 1296 |       274 |    6.75 |    10.3 |     1.5
wordlist_fr_4d_3          | 1296 |         0 |    5.85 |    10.3 |     1.8
