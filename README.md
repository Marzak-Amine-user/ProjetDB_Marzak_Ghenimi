# Mini-Projet 1 — Conception d'une base de données de covoiturage

## Membres du groupe

- Mohammed Amine Marzak
- Ridha Ghenimi

---

## 1. Présentation du projet

Dans le cadre de ce mini-projet de bases de données, nous avons choisi de concevoir le système d'information d'une **plateforme de covoiturage entre particuliers**.

L'objectif de la plateforme est de mettre en relation des conducteurs proposant des places disponibles dans leur véhicule avec des passagers souhaitant effectuer un trajet similaire.

Le fonctionnement général du projet s'inspire de plateformes de covoiturage telles que **BlaBlaCar**, tout en conservant un périmètre volontairement limité afin d'obtenir un modèle de données cohérent et adapté au cadre du projet.

La plateforme permet principalement de gérer :

- les utilisateurs ;
- les véhicules ;
- les trajets proposés ;
- les étapes intermédiaires des trajets ;
- les réservations effectuées par les passagers ;
- les évaluations laissées entre utilisateurs après un trajet.

Certaines fonctionnalités d'une véritable plateforme de covoiturage, telles que la messagerie, les paiements, les remboursements ou encore la vérification des documents d'identité, n'ont volontairement pas été retenues afin de ne pas complexifier inutilement le modèle.

---

# 2. Analyse des besoins

## 2.1 Domaine étudié

**Domaine :** mobilité et transport collaboratif.

**Type d'organisation :** entreprise proposant une plateforme numérique de mise en relation entre particuliers.

**Activité principale :** permettre à des utilisateurs de proposer des trajets en tant que conducteurs et à d'autres utilisateurs de réserver des places en tant que passagers.

Le projet s'inspire principalement du fonctionnement général de **BlaBlaCar**.

---

# 2.2 Utilisation d'une IAG

Une Intelligence Artificielle Générative a été utilisée pendant la phase d'analyse des besoins.

L'objectif n'était pas de générer directement le Modèle Conceptuel de Données, mais d'obtenir un ensemble de règles de gestion ainsi qu'un dictionnaire de données correspondant au fonctionnement d'une plateforme de covoiturage.

Le résultat fourni par l'IAG a ensuite été analysé, corrigé et adapté avant la réalisation manuelle du MCD.

---

# 2.3 Prompt utilisé

Le prompt suivant a été utilisé afin de générer une première analyse des besoins :

> Tu travailles dans le domaine de la mobilité et du transport collaboratif.
>
> Ton entreprise a comme activité de proposer une plateforme numérique de covoiturage permettant de mettre en relation des conducteurs proposant des places disponibles dans leur véhicule avec des passagers souhaitant effectuer un trajet similaire.
>
> C'est une entreprise comme BlaBlaCar.
>
> Les données ont été collectées sur les utilisateurs de la plateforme, leurs véhicules, les trajets qu'ils proposent, les éventuelles étapes intermédiaires de ces trajets, les réservations réalisées par les passagers ainsi que les évaluations laissées entre utilisateurs après un trajet.
>
> Inspire-toi du fonctionnement de plateformes de covoiturage telles que BlaBlaCar, notamment concernant les utilisateurs, les véhicules, les trajets, les réservations et les systèmes d'évaluation.
>
> Ton entreprise veut appliquer MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse, c'est-à-dire de collecter les besoins auprès de l'entreprise.
>
> Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet. Tu dois lui fournir les informations nécessaires pour qu'il applique ensuite lui-même les étapes suivantes de conception et de développement de la base de données.
>
> D'abord, établis les règles de gestion des données de ton entreprise sous la forme d'une liste à puces.
>
> Elles doivent correspondre aux informations que fournirait une personne connaissant le fonctionnement de l'entreprise mais ne connaissant pas nécessairement la conception d'un système d'information.
>
> Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes :
>
> - signification de la donnée ;
> - type ;
> - taille en nombre de caractères ou de chiffres.
>
> Le dictionnaire doit contenir entre 25 et 35 données.
>
> Il doit permettre de préciser le type et la taille des données sans présupposer de la manière dont elles seront ensuite modélisées.
>
> Fournis donc les règles de gestion puis le dictionnaire de données.

---

# 3. Règles de gestion retenues

## Utilisateurs

- Chaque utilisateur possède un identifiant unique.
- Un utilisateur possède un nom et un prénom.
- Un utilisateur possède une adresse e-mail.
- Une adresse e-mail ne peut être associée qu'à un seul utilisateur.
- Un utilisateur peut renseigner un numéro de téléphone.
- La date d'inscription de l'utilisateur est conservée.
- Un utilisateur peut être conducteur sur certains trajets et passager sur d'autres.
- Un utilisateur peut posséder plusieurs véhicules.
- Un utilisateur peut proposer plusieurs trajets.
- Un utilisateur peut effectuer plusieurs réservations.

## Véhicules

- Chaque véhicule possède un identifiant unique.
- Chaque véhicule possède une immatriculation.
- Une immatriculation ne peut correspondre qu'à un seul véhicule.
- Un véhicule possède une marque.
- Un véhicule possède un modèle.
- Un véhicule peut posséder une couleur renseignée.
- Le nombre de places destinées aux passagers est conservé.
- Un véhicule appartient à un seul utilisateur.
- Un utilisateur peut posséder plusieurs véhicules.
- Un véhicule peut être utilisé pour plusieurs trajets différents.

## Trajets

- Chaque trajet possède un identifiant unique.
- Un trajet est proposé par un seul utilisateur.
- Un utilisateur peut proposer plusieurs trajets.
- Chaque trajet est effectué avec un seul véhicule.
- Le véhicule utilisé doit appartenir à l'utilisateur proposant le trajet.
- Un trajet possède une date de départ.
- Un trajet possède une heure de départ.
- Un trajet possède un lieu de départ.
- Un trajet possède un lieu d'arrivée.
- Un prix par place est défini pour le trajet.
- Un nombre de places disponibles est défini.
- Le nombre de places proposées ne peut pas dépasser la capacité du véhicule.
- Un trajet possède un statut, par exemple : prévu, terminé ou annulé.

## Étapes

- Un trajet peut comporter aucune, une ou plusieurs étapes intermédiaires.
- Une étape appartient obligatoirement à un seul trajet.
- Chaque étape possède un numéro d'ordre.
- Deux étapes appartenant au même trajet ne peuvent pas avoir le même numéro d'ordre.
- Le même numéro d'ordre peut cependant être utilisé dans plusieurs trajets différents.
- Une étape possède un lieu.
- Une heure de passage prévue peut être associée à une étape.

## Réservations

- Un utilisateur peut réserver une ou plusieurs places sur un trajet.
- Un trajet peut faire l'objet de plusieurs réservations.
- Un utilisateur ne peut pas réserver son propre trajet.
- Une réservation concerne un utilisateur et un trajet.
- La date de réservation est conservée.
- Le nombre de places réservées est conservé.
- Une réservation possède un statut.
- Le nombre total de places réservées ne doit pas dépasser le nombre de places proposées pour le trajet.
- Un utilisateur ne doit pas disposer de plusieurs réservations actives pour un même trajet.

## Évaluations

- Un utilisateur peut évaluer un autre utilisateur après un trajet.
- Un utilisateur ne peut pas s'évaluer lui-même.
- Une évaluation concerne toujours un trajet donné.
- L'auteur et l'utilisateur évalué doivent tous les deux avoir participé au trajet.
- Une évaluation possède une note.
- Une note doit être comprise entre 1 et 5.
- Une évaluation peut contenir un commentaire.
- La date de publication de l'évaluation est conservée.
- Un utilisateur ne peut évaluer qu'une seule fois le même utilisateur pour un même trajet.

---

# 4. Dictionnaire de données

| N° | Donnée | Type | Taille |
|---:|---|---|---:|
| 1 | Identifiant d'un utilisateur | Entier | 10 chiffres |
| 2 | Nom d'un utilisateur | Alphanumérique | 50 caractères |
| 3 | Prénom d'un utilisateur | Alphanumérique | 50 caractères |
| 4 | Adresse e-mail d'un utilisateur | Alphanumérique | 100 caractères |
| 5 | Numéro de téléphone | Alphanumérique | 20 caractères |
| 6 | Date d'inscription | Date | 10 caractères |
| 7 | Identifiant d'un véhicule | Entier | 10 chiffres |
| 8 | Immatriculation d'un véhicule | Alphanumérique | 15 caractères |
| 9 | Marque d'un véhicule | Alphanumérique | 30 caractères |
| 10 | Modèle d'un véhicule | Alphanumérique | 50 caractères |
| 11 | Couleur d'un véhicule | Alphanumérique | 30 caractères |
| 12 | Nombre de places d'un véhicule | Entier | 1 chiffre |
| 13 | Identifiant d'un trajet | Entier | 10 chiffres |
| 14 | Date de départ | Date | 10 caractères |
| 15 | Heure de départ | Heure | 5 caractères |
| 16 | Adresse de départ | Alphanumérique | 150 caractères |
| 17 | Ville de départ | Alphanumérique | 80 caractères |
| 18 | Adresse d'arrivée | Alphanumérique | 150 caractères |
| 19 | Ville d'arrivée | Alphanumérique | 80 caractères |
| 20 | Prix par place | Décimal | 6 chiffres |
| 21 | Nombre de places proposées | Entier | 1 chiffre |
| 22 | Statut du trajet | Alphanumérique | 20 caractères |
| 23 | Numéro d'ordre d'une étape | Entier | 2 chiffres |
| 24 | Ville d'une étape | Alphanumérique | 80 caractères |
| 25 | Adresse d'une étape | Alphanumérique | 150 caractères |
| 26 | Heure de passage à une étape | Heure | 5 caractères |
| 27 | Date de réservation | Date/heure | 19 caractères |
| 28 | Nombre de places réservées | Entier | 1 chiffre |
| 29 | Statut d'une réservation | Alphanumérique | 20 caractères |
| 30 | Note d'une évaluation | Entier | 1 chiffre |
| 31 | Commentaire d'une évaluation | Alphanumérique | 500 caractères |
| 32 | Date d'une évaluation | Date/heure | 19 caractères |

Le dictionnaire comporte **32 données**, ce qui respecte la contrainte imposant entre 25 et 35 données.

---

# 5. Analyse critique du résultat produit par l'IAG

Le premier résultat produit par l'IAG était plus large que le périmètre que nous souhaitions donner au projet.

L'IAG proposait notamment de gérer :

- les paiements ;
- les remboursements ;
- les commissions prélevées par la plateforme ;
- la messagerie entre utilisateurs ;
- les documents d'identité ;
- les préférences de voyage ;
- les statistiques détaillées des utilisateurs.

Ces éléments peuvent effectivement exister sur une véritable plateforme de covoiturage.

Nous avons cependant estimé qu'ils n'étaient pas nécessaires pour représenter le cœur du fonctionnement du système étudié.

Le périmètre a donc été limité aux fonctionnalités principales :

- gestion des utilisateurs ;
- gestion des véhicules ;
- publication des trajets ;
- gestion des étapes ;
- réservations ;
- évaluations.

Certaines règles fournies par l'IAG ont également dû être précisées.

Par exemple, l'IAG indiquait initialement qu'un utilisateur pouvait laisser un avis sur un autre utilisateur.

Cette règle n'était pas suffisamment précise.

Une évaluation dépend en réalité :

- de l'utilisateur qui écrit l'évaluation ;
- de l'utilisateur qui reçoit l'évaluation ;
- du trajet concerné.

Cette réflexion a directement influencé la construction de notre MCD.

---

# 6. Modèle Conceptuel de Données

Le Modèle Conceptuel de Données a été réalisé manuellement avec **Looping** à partir des règles de gestion précédentes.

Le MCD contient les entités suivantes :

- UTILISATEUR ;
- VEHICULE ;
- TRAJET ;
- ETAPE.

Il contient également les associations :

- POSSEDER ;
- PROPOSER ;
- UTILISER ;
- RESERVER ;
- CONTENIR ;
- EVALUER.

---

## 6.1 UTILISATEUR

L'entité `UTILISATEUR` représente les personnes inscrites sur la plateforme.

Elle contient :

- `id_utilisateur`
- `nom`
- `prenom`
- `email`
- `telephone`
- `date_inscription`

`id_utilisateur` constitue l'identifiant de l'entité.

Nous avons volontairement choisi de ne pas créer deux entités différentes `CONDUCTEUR` et `PASSAGER`.

Un même utilisateur peut en effet être conducteur sur un trajet et passager sur un autre.

---

## 6.2 VEHICULE

L'entité `VEHICULE` représente les véhicules enregistrés par les utilisateurs.

Elle contient :

- `id_vehicule`
- `immatriculation`
- `marque`
- `modele`
- `couleur`
- `nombre_places`

Un utilisateur peut posséder plusieurs véhicules mais un véhicule appartient à un seul utilisateur.

Cette relation est représentée par l'association `POSSEDER`.

---

## 6.3 TRAJET

L'entité `TRAJET` contient les informations concernant les trajets publiés sur la plateforme.

Elle contient :

- `id_trajet`
- `date_depart`
- `heure_depart`
- `adresse_depart`
- `ville_depart`
- `adresse_arrivee`
- `ville_arrivee`
- `prix_place`
- `nombre_places_proposees`
- `statut_trajet`

Un trajet est proposé par un utilisateur grâce à l'association `PROPOSER`.

Il est également associé au véhicule utilisé grâce à l'association `UTILISER`.

---

# 7. Associations principales

## 7.1 POSSEDER

L'association `POSSEDER` relie `UTILISATEUR` et `VEHICULE`.

Cardinalités :

- UTILISATEUR : `(0,N)`
- VEHICULE : `(1,1)`

Un utilisateur peut ne posséder aucun véhicule ou en posséder plusieurs.

Un véhicule appartient obligatoirement à un seul utilisateur.

---

## 7.2 PROPOSER

L'association `PROPOSER` relie `UTILISATEUR` et `TRAJET`.

Cardinalités :

- UTILISATEUR : `(0,N)`
- TRAJET : `(1,1)`

Un utilisateur peut proposer plusieurs trajets.

Un trajet possède obligatoirement un seul conducteur.

---

## 7.3 UTILISER

L'association `UTILISER` relie `VEHICULE` et `TRAJET`.

Cardinalités :

- VEHICULE : `(0,N)`
- TRAJET : `(1,1)`

Un véhicule peut servir pour plusieurs trajets.

Un trajet est réalisé avec un seul véhicule.

Une contrainte métier supplémentaire impose que le véhicule utilisé appartienne au conducteur ayant proposé le trajet.

---

## 7.4 RESERVER

L'association `RESERVER` relie `UTILISATEUR` et `TRAJET`.

Cardinalités :

- UTILISATEUR : `(0,N)`
- TRAJET : `(0,N)`

Cette association possède les propriétés suivantes :

- `date_reservation`
- `nombre_places_reservees`
- `statut_reservation`

Ces propriétés appartiennent à l'association car elles dépendent simultanément de l'utilisateur et du trajet.

Par exemple, le nombre de places réservées n'est pas une propriété intrinsèque de l'utilisateur ni du trajet : il dépend d'une réservation précise.

---

# 8. Éléments avancés de modélisation

Le projet utilise plusieurs éléments avancés de modélisation MERISE.

---

## 8.1 Entité faible : ETAPE

L'entité `ETAPE` représente une étape intermédiaire d'un trajet.

Elle contient :

- `numero_ordre`
- `ville_etape`
- `adresse_etape`
- `heure_passage`

Une étape n'existe pas indépendamment de son trajet.

Le numéro d'ordre n'est pas unique sur l'ensemble de la base.

Par exemple :

- le trajet 12 peut posséder une étape numéro 1 ;
- le trajet 35 peut également posséder une étape numéro 1.

Une étape est donc identifiée relativement au trajet auquel elle appartient.

Son identification complète correspond à :

`id_trajet + numero_ordre`

Dans Looping, cette dépendance est représentée par une cardinalité relative :

`1,1(R)`

entre `ETAPE` et l'association `CONTENIR`.

`ETAPE` constitue donc une **entité faible**, tandis que `TRAJET` constitue son **entité forte**.

---

## 8.2 Association n-aire : EVALUER

L'association `EVALUER` représente une évaluation réalisée après un trajet.

Elle dépend de trois éléments :

- l'utilisateur qui écrit l'évaluation ;
- l'utilisateur évalué ;
- le trajet concerné.

Elle contient :

- `note`
- `commentaire`
- `date_evaluation`

Une simple relation entre deux utilisateurs serait insuffisante.

En effet, deux utilisateurs peuvent effectuer plusieurs trajets ensemble et une évaluation doit toujours être rattachée à un trajet précis.

L'association `EVALUER` relie donc trois rôles et constitue une **association ternaire**.

---

## 8.3 Association récursive

L'association `EVALUER` fait intervenir deux fois l'entité `UTILISATEUR`.

Les deux participations ont des rôles différents :

- **auteur** : utilisateur laissant l'évaluation ;
- **évalué** : utilisateur recevant l'évaluation.

Une même entité intervient donc deux fois dans une même association.

Il s'agit d'une **association récursive**.

---

# 9. Cardinalités du MCD

Le modèle utilise principalement les cardinalités suivantes :

| Association | Première entité | Cardinalité | Deuxième entité | Cardinalité |
|---|---|---:|---|---:|
| POSSEDER | UTILISATEUR | 0,N | VEHICULE | 1,1 |
| PROPOSER | UTILISATEUR | 0,N | TRAJET | 1,1 |
| UTILISER | VEHICULE | 0,N | TRAJET | 1,1 |
| RESERVER | UTILISATEUR | 0,N | TRAJET | 0,N |
| CONTENIR | TRAJET | 0,N | ETAPE | 1,1 (R) |

Pour `EVALUER` :

- UTILISATEUR dans le rôle **auteur** : `(0,N)`
- UTILISATEUR dans le rôle **évalué** : `(0,N)`
- TRAJET : `(0,N)`

---

# 10. Respect de la troisième forme normale

Lors de la conception du MCD, nous avons essayé de limiter les dépendances inutiles et les redondances.

Par exemple :

- les informations du véhicule ne sont pas recopiées dans `TRAJET` ;
- les informations du conducteur ne sont pas stockées directement dans `TRAJET` ;
- les informations d'une réservation sont placées dans l'association `RESERVER` ;
- les informations d'une évaluation sont placées dans l'association `EVALUER` ;
- la note moyenne d'un utilisateur n'est pas stockée car elle pourra être calculée à partir de ses évaluations ;
- les étapes sont séparées de `TRAJET` puisqu'un trajet peut en posséder plusieurs.

Cette organisation permet d'éviter la duplication d'informations et de limiter les anomalies d'insertion, de suppression ou de modification.

---

# 11. Contraintes métier non représentables uniquement par les cardinalités

Certaines règles métier ne peuvent pas être entièrement exprimées dans le MCD.

Elles devront être implémentées ou vérifiées lors de la conception logique et physique de la base de données.

Par exemple :

- une adresse e-mail doit être unique ;
- une immatriculation doit être unique ;
- un véhicule utilisé pour un trajet doit appartenir au conducteur ;
- un utilisateur ne peut pas réserver son propre trajet ;
- le nombre de places proposées ne peut pas dépasser la capacité du véhicule ;
- le nombre total de places réservées ne peut pas dépasser le nombre de places proposées ;
- une note doit être comprise entre 1 et 5 ;
- un utilisateur ne peut pas s'évaluer lui-même ;
- l'auteur et l'utilisateur évalué doivent avoir participé au trajet ;
- deux étapes d'un même trajet ne peuvent pas avoir le même numéro d'ordre ;
- un utilisateur ne peut évaluer qu'une seule fois un même utilisateur pour un même trajet.

Ces contraintes seront étudiées lors des étapes suivantes du projet.

---

# 12. MCD

Le MCD a été réalisé avec **Looping**.

L'image du modèle est disponible dans le dépôt du projet.


Le fichier source Looping est également conservé afin de permettre la modification du modèle.

