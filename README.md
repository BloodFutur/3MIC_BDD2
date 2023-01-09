# TP_BDD2

Ce projet est un TP de BDD2, il a pour but de créer une base de données et de répondre à des requêtes SQL demandées. Il est basé sur le projet BDD1.

## Cahier des charges
- Créer les tables qui correspondent au schéma relationnel conçu
- Remplir les tables crées par un jeu de données pertinent pour pouvoir tester vos requêtes
- Une fois votre base de données est prête, écrivez les requêtes suivantes en SQL en les testant

### Requêtes demandées

1. Le nom et le grade des encadrants du doctorant dont l'identifiant est "d001"

2. Le nom et le pays des auteurs collaborateurs (auteurs externes) du chercheur "Jean Azi" de 2016 à 2020

3. Le nombre de collaborateurs total du chercheur dont l'ID est "S001" 

4. Le nombre de pays avec lesquels le LAAS a collaboré dans le cadre de publications de rang A (i.e., des articles publiés dans des conférences de classe A)

5. Pour les doctorants, on souhaiterait récupérer le nombre de leurs publications. On veut retourner l'identifiant des doctorants accompagné du nombre de leur publication.

6. Le nombre de doctorants du laboratoire ayant soutenu

7. Le nom et le prénom des chercheurs qui n’ont jamais encadré

8. Le nom et le prénom des chercheurs qui n’ont jamais publié ni encadré

9. Le nom et prénom des chercheurs qui encadrent mais n’ont pas de doctorants ayant déjà soutenu

10. Identifiant, nom et prénom des doctorants qui ont un seul encadrant 

11. Les chercheurs qui ont plus de 4 doctorants en cours. Pour chaque chercheur, on veut afficher son identifiant,  nom, prenom, et nombre de ses doctorants

12. L'identifiant des chercheurs qui n'ont publié que dans des conférences de classe A

13. Nom, prénom et identifiant des chercheurs qui auraient été encadrants de tous les doctorants

14. Le nombre de publications par année du laboratoire.

15. Le nombre d'enseignants chercheurs par établissement d'enseignement 

16. Le pays avec lequel le laboratoire a plus de publications 

17. Les scientifiques qui ont un seul projet

18. Les scientifiques qui auraient participé à tous les projets 

19. Les établissements d'enseignements ayant plus de 50 enseignants-chercheurs appartenant au LAAS

20. Les scientifiques qui ont le plus de projets 

21. Les pays qui sont impliqués dans tous les projets 

## Choix
Les choix ont été effectué en fonction de la conception lors du projet BDD1, on peut retrouver le modèle relationnel dans [bdd.pdf](bdd.pdf)

## Utilisation
### Prérequis
- Utiliser PostgreSQL
- Se connecter sur sa base de données

### Charger les fichiers
Pour charger un fichier : `\i nomfichier.sql`

Charger ces fichiers dans cet ordre :
1. [dropall.sql](dropall.sql) (Vider la base de données)
2. [tables.sql](tables.sql) (Création des tables et relations)
3. [insert.sql](insert.sql) (Insertion d'un jeu de données)
4. [request.sql](request.sql) (Exécute requêtes demandées)

Exemple : 
```psql
\i dropall.sql
\i tables.sql
\i insert.sql
\i request.sql
```

