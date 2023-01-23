# Test Technique - Study Advisor

## Comment faire ce test ?

1. Merci de cloner le repository, et de ne pas faire de fork !
2. Commencer par voir les indications dans [SUJET.md](./SUJET.md).
3. Comprendre l'intention, le travail attendu et les guidelines dans [HOWTO.md](./HOWTO.md).
4. Bonne chance et bon courage 🔥

-----

# Notes

- Pour créer les Tags il faut utiliser
	``rake db:seed``

- J'étais pas sûr de comment les messages seraient ajoutés au site, donc j'ai aussi ajouté une page simple pour la création des messages. Si le texte français ou le texte pioupiou est vide, il serait traduit durant le “Save” du message (pareil pour les messages créés via le rails console).

- J'ai utilisé un format de table assez compacte pour permettre l'affichage d’un grand nombre de messages (+1000). Une version de pagination aurait pu être utilisée, mais comme on fait cela déjà dans la partie 3, il ne me semblait pas nécessaire pour cette partie.

- J'ai aussi limité le nombre de messages qu'une personne pourrait créer à 1000.

- la partie 3 ce trouve sur une autre branche "level3"  https://github.com/guylifshitz/TestSA-01-2023/tree/level3
