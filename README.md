# Alternative french diceware/xkcd936 wordlists

Une série de listes de mots pour générer des phrases secrètes (passphrases) inspiré par
[xkcd 936](https://xkcd.com/936/) et les
[nouvelles listes pour diceware de l'eff](https://www.eff.org/fr/deeplinks/2016/07/new-wordlists-random-passphrases).

L'idée est d'avoir des mots facile à retenir et facile à taper sur clavier physique ou virtuel.

La [liste française pour diceware](https://github.com/chmduquesne/diceware-fr) originale est plutôt
optmisée pour générer des passphrases plus courtes.

## Les listes

Toutes les listes sont générées avec [genwordlist](src/genwordlist).

[genwordlist](src/genwordlist) utilise le fichier de [lexique](lexique/) (http://www.lexique.org)
pour tenter de générer une liste des mots les plus utilisés, en supprimant les homophones.

Les paramètres utilisés pour générer ces listes sont visible dans le fichier [makefile](Makefile).

Les types de liste sont:
* __8k__: listes de 8192 mots pour utilisation purement logiciel
* __4k__: listes de 4096 mots pour utilisation purement logiciel
* __5d__: listes de 7776 mots pour diceware 5 dés, comparable à la liste large de l'eff
* __4d__: listes de 1296 mots pour diceware 4 dés, comparable à la liste short_1 de l'eff
* __4d_2__: listes de 1296 mots pour diceware 4 dés, avec racine unique de 3 caractères
	et distance d'édition d'au moins 3, comparable à la liste short_2 de l'eff

### nonascii

Contrairement aux listes standards qui contiennent uniquement des mots composés des lettres ascii
([a-z]), les listes _nonascii ont des mots pouvant contenir également les lettres *àéîôùç*. Ces
lettres ont été choisies pour leur relative facilité à être tapées sur un clavier français physique
ou virtuel (sur clavier android standard, toutes ces lettres sont accessible par un appui prolongé
sur la lettre ascii correspondante, sans glissé).

### Statistiques

fichier						| mots  | non ascii | avg len | bit/mot |bit/car 
----------------------------|-------|-----------|---------|---------|-------
wordlist_fr_8k				| 8192 |   0 | 6.74 | 13.0 | 1.9 |
wordlist_fr_8k_nonascii		| 8192 | 991 | 6.32 | 13.0 | 2.1 |
wordlist_fr_5d				| 7776 |   0 | 6.72 | 12.9 | 1.9 |
wordlist_fr_5d_nonascii		| 7776 | 901 | 6.31 | 12.9 | 2.0 |
wordlist_fr_4k				| 4096 |   0 | 5.77 | 12.0 | 2.1 |
wordlist_fr_4k_nonascii		| 4096 | 360 | 5.70 | 12.0 | 2.1 |
wordlist_fr_4d				| 1296 |   0 | 4.47 | 10.3 | 2.3 |
wordlist_fr_4d_2			| 1296 |   0 | 7.04 | 10.3 | 1.5 |
wordlist_fr_4d_2_nonascii	| 1296 | 272 | 6.74 | 10.3 | 1.5 |

## Générer des passphrases

Un générateur de passphrase, [rolldice](src/rolldice), est disponible dans le dossier src.

### combien de mots choisirs

**Disclaimer**: je n'ai aucune formation ou réelle compétence en crypto ou en théorie de
l'information. L'anssi
[dit](https://www.ssi.gouv.fr/administration/precautions-elementaires/calculer-la-force-dun-mot-de-passe/)
que en dessous de 80 bits d'entropie c'est de la daube.

Le site original de [diceware](diceware.com) et l'article de l'eff conseillent 6 mots depuis une
liste _5d_ (77.5 bits) ou 8 mots depuis une liste _4d_ (82.7 bits). xkcd parle de 44bits d'entropie
(4 mots dans une liste de 2048).

En réalité, tout dépends de la difficulté d'attaquer le mot de passe et des moyens de l'attaquant,
xkcd parle de 1000 essais par secondes, on est dans l'attaque par le réseau (« weak remote web
service »). Pour une attaque locale sur un hash faible comme md5 on atteint au moins 200 milliards
essais par seconde sur du matériel disponible à tous (voir ce
[benchmark de hashcat](https://gist.github.com/epixoip/a83d38f412b4737e99bbef804a270c40) par
exemple).

vitesse (exemple*) \ entropie | 44 | 56 | 60 | 72 | 80
------------------------------|----|----|----|----|----
100 GH/s (Skype)	| 1 min		| 4 jours	| 66 jours	| 7 siècles	| ...
10 GH/s (SHA512)	| 14 min	| 41 jours	| 1 an		| ...		| lol
1 GH/s (Lotus)		| 2 heures	| 1 an		| 18 ans	| ...		| lol
100 MH/s (md5crypt)	| 1 jour	| 11 ans	| 1 siècle	| ...		| lol
10 MH/s (winzip)	| 10 jours	| 1 siècle	| ...		| lol		| lol
1 MH/s (keepass)	| 101 jours	| ...		| ...		| lol		| lol
100 kH/s (bcrypt)	| 2 ans		| ...		| ...		| lol		| lol
10 kH/s (veracrypt)	| 27 ans	| ...		| lol		| lol		| lol

Légende: «_..._» de l'odre de plusieurs millénaire, «_lol_» de l'odre de plusieurs millions d'années

\* tiré du [benchmark de hashcat](https://gist.github.com/epixoip/a83d38f412b4737e99bbef804a270c40)

Tout ça sous réserve que je ne me sois pas trompé dans mes calculs (cf. disclaimer)

Par défaut [rolldice](src/rolldice) tente de générer au moins 56 bits d'entropie avec la liste
fournie, cependant avec les listes par defaut il générera au minimum 60 bits d'entropie (5 mots
dans une liste _4k_).

## Licences
Le code source est sous licence MIT

La liste de mots Lexique est sous licence CC BY-NC-SA 3.0, aucune idée si la même licence doit
s'appliquer à une liste de quelques milliers de mots généré automatiquement sans le reste des
informations. J'ai envie de dire non.