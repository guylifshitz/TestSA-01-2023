# Test technique

## Intro

Alain est un Advisor d'un autre multivers. Dans cette version du monde, 
les PiouPious ne parlent pas Français... ils parlent PiouPiou.  
  
Vous vous en doutez, Alain ne parle pas cette langue. Heureusement, vos 
compétences en dev lui permettront sûrement de venir en aide au pioupiou 
avec qui il a pris rendez-vous sur StudyAdvisor.  
  
Voici les indications du PiouPiou :

```
poup uiui piop poup uiui piop iupo  ipip ioui  ipou uiui piop iiou iupi piou ppou piuu  iiou ioui ipou ioui piui ppou iupi  piou piuu piup iupi piou piop piui piou piop piup ioui iipu  poup uiui piiu piiu ioui piui piup  pipp piou ppou iupi ioui  ppip
```

## Level 1

Écrire un programme en Ruby permettant de convertir du français en PiouPiou et
vice-versa. Veillez à versionner vos travaux avec Git et vous assurer de la
fiabilité de la transcription des messages.  
  
Voici une table de caractères de l'alphabet PiouPiou :

```
{
  "A"=>"piou",
  "B"=>"ioup",
  "C"=>"poup",
  "D"=>"iiou",
  "E"=>"ioui",
  "F"=>"pipp",
  "G"=>"ouip",
  "H"=>"poui",
  "I"=>"ppou",
  "J"=>"ipip",
  "K"=>"oupi",
  "L"=>"pouu",
  "M"=>"piiu",
  "N"=>"piui",
  "O"=>"uiui",
  "P"=>"opui",
  "Q"=>"pupu",
  "R"=>"iupi",
  "S"=>"piuu",
  "T"=>"piup",
  "U"=>"piop",
  "V"=>"ipou",
  "W"=>"oupu",
  "X"=>"uopu",
  "Y"=>"iupu",
  "Z"=>"iupp",
  "!"=>"iipu",
  ","=>"iupo",
  "."=>"ipuu",
  "?"=>"ppip"
}
```

## Level 2

Alain a trouve cette nouvelle aventure passionnante. Venir en aide à cette 
personne a été un réel plaisir. Mais il n'est pas du tout à l'aise en 
console et doit sans arrêt faire appel à vous s'il veut communiquer. Il vous 
demande donc de créer une application Ruby on Rails permettant de poster des 
messages.  
  
Les messages devront également comporter le nom de l'auteur, être persistés en
base de donnée (avec PostgreSQL) et s'afficher directement en langue PiouPiou 
sur une vue.  
  
Pour trier les messages, il devra être possible de leur associer des tags
(Urgent, Secret ou Rigolo).  
  
Mais attention, Alain se voit acquérir une passion infinie pour cette nouvelle 
activité, et devient bavard à en avoir des crampes à la langue. L'application
devra permettre de stocker de nombreux messages (on prendra 1000 messages par
exemple).  
  
Afin qu'Alain ne soit pas totalement perdu, il faudra donner un minimum de 
style à cette application, en utilisant Slim et Sass.  
  
L'application devra exposer les routes suivantes :

- /messages/
- /messages/:id
- /tags/:name/messages

## Level 3

Pour son anniversaire, Alain s'est acheté un robot dernier cri, pour 
reproduire les mêmes actions que lui, et discuter avec encore plus de 
PiouPious à la fois !  
  
Seulement, ce robot n'a pas de doigts, bien qu'on soit dans un multivers où 
les robots sont très avancés. Le seul moyen de lui faire communiquer sera 
une API.  
  
Il faudra donc implémenter une API REST dans l'application Rails précédente 
qui aura les routes suivantes :

```
- GET /api/messages.json?per_page={per_page:-10}
  Pour avoir la liste des messages filtrés par tag et
  limité à 10 messages par défaut

- GET /api/messages/:id.json
  Pour avoir le corps d'un message (id, auteur, date, plain, pioupiou et tags)

- GET /api/tags/:name/messages.json?per_page={per_page:-10}
  Pour avoir la liste des messages filtrés par tag
```

## Conseils

Pensez à bien faire des commits Git et des commentaires si nécessaire.
