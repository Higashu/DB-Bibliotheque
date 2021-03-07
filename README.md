# NF17 - Projet Biblio - V1

### Membres du groupe : 

Dylan CORNELIE
Luis Enrique GONZALES HILARIO
Julien LE CERF
Yassine OUMNI
Margot SERNA

---
### Organisation des documents SQL

Pour plus de lisibilité, nous avons scindé nos requêtes en trois fichiers : 
* creation_tables.sql contient les requêtes SQL pour créer les tables de notre base de données
* insertion_données.sql contient les données de tests que nous avons utilisées pour ce projet
* creation-vue.sql contient les requêtes pour réaliser nos vues
* attribution_droit.sql contient les requêtes pour attribuer les droits aux utilisateurs de la base de données
---
### Contraintes compliquées

 * CC1 : On crée une vue qui fait apparaître les ressources qui ne sont ni des films, ni des livres ni des oeuvres musicales
 * CC2 : La vue nous permet d'obtenir les ressources qui n'ont aucun exemplaire dans la bibliothèque et qui doivent donc être suprimés
 * CC3 : On s'assure ici qu'aucun adhérent n'a le même login qu'un membre du personnel
 * CC4 : On vérifie que chaque emprunt au cours duquel un livre est rendu en mauvais état est sanctionné par une sanction de remboursement
 * CC5 : On vérifie que chaque emprunt rendu en retard se traduit par une suspension du droit de prêt égale au nombre de jours de retard
---
### Choix 
#### Héritage
Par rapport à notre MDC, nous avons décidé de faire différents types d'héritage : 
 * Héritage par classe fille pour adhérents et personnel
 * Héritage par classe mère pour les sanctions (remboursements, suspensions)
 * Héritage par référence pour les ressources (livres, films, œuvres musicales, exemplaires)
 * Héritage par classe mère pour les contributeurs (auteur, réalisateur, acteur, compositeur, interprète) 
 ---
 #### Vues

 Nos vues ont plusieurs objectifs : 
 * Vérifier nos contraintes compliquées
 * Offrir des fonctionnalités en plus aux utilisateurs
 * Restituer des relations d'héritages (ex : acteur, auteurs, etc.)
---