/* Renvoie tous les livres disponibles*/

CREATE VIEW Vnombre_exemplaire_livres_disponibles AS
SELECT R.titre, Ex.code_classification, COUNT(*) AS Exemplaires_disponibles
FROM Ressources R,Exemplaires Ex, Livres
WHERE R.code = Ex.ressource
AND R.code = Livres.code
AND Ex.statut = 'Disponible'
GROUP BY R.titre, Ex.code_classification
ORDER BY R.titre ASC;

/* Renvoie tous les films disponibles*/

CREATE VIEW Vnombre_exemplaire_films_disponibles AS
SELECT R.titre, Ex.code_classification, COUNT(*) AS Exemplaires_disponibles
FROM Ressources R,Exemplaires Ex, Films
WHERE R.code = Ex.ressource
AND R.code = Films.code
AND Ex.statut = 'Disponible'
GROUP BY R.titre, Ex.code_classification
ORDER BY R.titre ASC;

/* Renvoie toutes les oeuvres musicales disponibles*/

CREATE VIEW Vnombre_exemplaire_musique_disponibles AS
SELECT R.titre, Ex.code_classification, COUNT(*) AS Exemplaires_disponibles
FROM Ressources R,Exemplaires Ex, Oeuvres_musicales
WHERE R.code = Ex.ressource
AND R.code = Oeuvres_musicales.code
AND Ex.statut = 'Disponible'
GROUP BY R.titre, Ex.code_classification
ORDER BY R.titre ASC;


/* Renvoie le nombre d'emprunt en cours pour chaque adhérent */

CREATE VIEW Vemprunt_en_cours AS
SELECT A.nom, A.prenom, A.login, count(*) AS Emprunt_en_cours FROM Adherents A, Emprunts E
WHERE date_retour IS NULL
AND E.login = A.login
GROUP BY A.prenom, A.nom, A.login
ORDER BY A.nom ASC ;


/* Renvoie tous les adhérents privés d'emprunt */

CREATE VIEW Vadhérents_privés_emprunt AS
SELECT A.nom, A.prenom, A.login FROM Adherents A, Sanctions S
WHERE (A.blackliste = TRUE)
OR (
    A.login = S.login
    AND (S.effectue = FALSE 
        OR S.date_fin > NOW()
        OR S.date_fin IS NULL)
    )
AND A.date_fin IS NULL;


/* Renvoie tous les adhérents autorisés à emprunter et actuellemet adhérents */

CREATE VIEW Vadhérents_autorisés_emprunt AS
SELECT A.nom, A.prenom, A.login FROM Adherents A LEFT JOIN Sanctions S ON A.login = S.login
WHERE A.blackliste = False
AND A.date_fin IS NULL
AND ( S.date_fin IS NULL OR S.date_fin < NOW() )
AND (S.effectue IS NULL OR S.effectue = True )
AND (S.login = A.login OR S.login IS NULL)
ORDER BY A.nom ASC;



/*  Compte le nombre de sanction par Adherents sur les 365 derniers jours */

CREATE VIEW Vnombre_sanction_par_adherent AS
SELECT A.nom, A.prenom, COUNT(*) FROM Adherents A, Sanctions S 
WHERE A.login = S.login
AND S.date_debut >= CURRENT_DATE - INTEGER '365'
GROUP BY A.nom, A.prenom;


/* Donne la liste de tous les adhérents en retard dans leur rendu de document */

CREATE VIEW Vadherent_en_retard AS
SELECT A.nom, A.prenom, A.mail FROM Adherents A, Emprunts E
WHERE E.login = A.login
AND NOW() > E.date_emprunt + E.duree
AND E.date_retour IS NULL;

/* Renvoie la liste des adhérents qui doivent repayer une ressource */

CREATE VIEW Vadherent_remboursement AS
SELECT A.nom, A.prenom, A.login, A.mail, S.tarif
FROM Adherents A, Sanctions S, Exemplaires Ex, Emprunts E
WHERE S.login = A.login
AND E.login = S.login
AND S.effectue = False
AND E.id_exemplaire = Ex.id_exemplaire
AND E.date_retour = S.date_debut;


/* Renvoie le top 10 des livres les plus empruntés */

CREATE VIEW Vtop10_livres_empruntés AS
SELECT R.Titre, COUNT(*) AS nombre_emprunt
FROM Ressources R, Emprunts E, Exemplaires Ex
WHERE E.id_exemplaire = Ex.id_exemplaire
AND E.date_emprunt + E.duree >= CURRENT_DATE - INTEGER '365'
AND Ex.ressource = R.code
AND R.code IN (SELECT code FROM Livres)
GROUP BY R.Titre
ORDER BY COUNT(*) ASC
LIMIT 10;

/* Renvoie le top 10 des films les plus empruntés */

CREATE VIEW Vtop10_films_empruntés AS
SELECT R.Titre, COUNT(*) AS nombre_emprunt
FROM Ressources R, Emprunts E, Exemplaires Ex
WHERE E.id_exemplaire = Ex.id_exemplaire
AND E.date_emprunt + E.duree >= CURRENT_DATE - INTEGER '365'
AND Ex.ressource = R.code
AND R.code IN (SELECT code FROM Films)
GROUP BY R.Titre
ORDER BY COUNT(*) ASC
LIMIT 10;

/* Renvoie le top 10 des musiques les plus empruntés */

CREATE VIEW Vtop10_musiques_empruntées AS
SELECT R.Titre, COUNT(*) AS nombre_emprunt
FROM Ressources R, Emprunts E, Exemplaires Ex
WHERE E.id_exemplaire = Ex.id_exemplaire
AND E.date_emprunt + E.duree >= CURRENT_DATE - INTEGER '365'
AND Ex.ressource = R.code
AND R.code IN (SELECT code FROM Oeuvres_musicales)
GROUP BY R.Titre
ORDER BY COUNT(*) ASC
LIMIT 10;


/* Renvoie le nombre de livre dans la bibliothèque */

CREATE VIEW Vnombre_livre_bibliothèque AS
SELECT COUNT(*) AS Livres FROM Livres, Ressources, Exemplaires
WHERE Livres.code = Ressources.code
AND Exemplaires.ressource = Ressources.code
AND statut='Disponible';

/* Renvoie le nombre de film dans la bibliothèque */

CREATE VIEW Vnombre_film_bibliothèque AS
SELECT COUNT(*) AS Films FROM Films, Ressources, Exemplaires
WHERE Films.code = Ressources.code
AND Exemplaires.ressource = Ressources.code
AND statut='Disponible';

/* Renvoie le nombre de musique dans la bibliothèque */

CREATE VIEW Vnombre_musique_bibliothèque AS
SELECT COUNT(*) AS Musiques FROM Oeuvres_musicales, Ressources, Exemplaires
WHERE Oeuvres_musicales.code = Ressources.code
AND Exemplaires.ressource = Ressources.code
AND statut='Disponible';

/* Renvoie le nombre de livre emprunté dans la bibliothèque */

CREATE VIEW Vnombre_livres_empruntés AS
SELECT COUNT(*) AS Livre_empruntés
FROM Ressources R, Emprunts E, Exemplaires Ex
WHERE E.id_exemplaire = Ex.id_exemplaire
AND E.date_emprunt + E.duree >= CURRENT_DATE - INTEGER '365'
AND Ex.ressource = R.code
AND R.code IN (SELECT code FROM Livres);

/* Renvoie le nombre de film emprunté dans la bibliothèque */

CREATE VIEW Vnombre_films_empruntés AS
SELECT COUNT(*) AS Films_empruntés
FROM Ressources R, Emprunts E, Exemplaires Ex
WHERE E.id_exemplaire = Ex.id_exemplaire
AND E.date_emprunt + E.duree >= CURRENT_DATE - INTEGER '365'
AND Ex.ressource = R.code
AND R.code IN (SELECT code FROM Films);


/* Renvoie le nombre de musique emprunté dans la bibliothèque */

CREATE VIEW Vnombre_musiques_empruntées AS
SELECT COUNT(*) AS Oeuvres_musicales_empruntées
FROM Ressources R, Emprunts E, Exemplaires Ex
WHERE E.id_exemplaire = Ex.id_exemplaire
AND E.date_emprunt + E.duree >= CURRENT_DATE - INTEGER '365'
AND Ex.ressource = R.code
AND R.code IN (SELECT code FROM Oeuvres_musicales);



/* Afficher toutes les ressources abîmées */

CREATE VIEW Vressources_abîmées AS
SELECT R.code, R.titre, R.editeur, R.prix, COUNT(*) AS Exemplaires_abîmé FROM Exemplaires Ex, Ressources R
WHERE Ex.etat='A'
AND Ex.ressource = R.code
GROUP BY  R.code, R.titre, R.editeur, R.prix;

/* Afficher la liste des acteurs*/

CREATE VIEW Vacteurs AS
select Contributeurs.nom, Contributeurs.prenom from Contributeurs INNER JOIN joue on Contributeurs.nom = joue.nom and Contributeurs.prenom = joue.prenom and Contributeurs.date_naissance = joue.date_naissance
GROUP BY Contributeurs.nom, Contributeurs.prenom, Contributeurs.date_naissance;

/* Afficher la liste des réalisateurs*/

CREATE VIEW Vrealisateurs AS
select Contributeurs.nom, Contributeurs.prenom from Contributeurs INNER JOIN Realise on Contributeurs.nom = Realise.nom and Contributeurs.prenom = Realise.prenom and Contributeurs.date_naissance = Realise.date_naissance
GROUP BY Contributeurs.nom, Contributeurs.prenom, Contributeurs.date_naissance;

/* Afficher la liste des compositeurs*/

CREATE VIEW Vcompositeurs AS
select Contributeurs.nom, Contributeurs.prenom from Contributeurs INNER JOIN Compose on Contributeurs.nom = Compose.nom and Contributeurs.prenom = Compose.prenom and Contributeurs.date_naissance = Compose.date_naissance
GROUP BY Contributeurs.nom, Contributeurs.prenom, Contributeurs.date_naissance;

/* Afficher la liste des interprètes*/

CREATE VIEW Vinterpretes AS
select Contributeurs.nom, Contributeurs.prenom from Contributeurs INNER JOIN Interprete on Contributeurs.nom = Interprete.nom and Contributeurs.prenom = Interprete.prenom and Contributeurs.date_naissance = Interprete.date_naissance
GROUP BY Contributeurs.nom, Contributeurs.prenom, Contributeurs.date_naissance;

/* Afficher la liste des écrivains*/

CREATE VIEW Vecrivains AS
select Contributeurs.nom, Contributeurs.prenom from Contributeurs INNER JOIN Ecrit on Contributeurs.nom = Ecrit.nom and Contributeurs.prenom = Ecrit.prenom and Contributeurs.date_naissance = Ecrit.date_naissance
GROUP BY Contributeurs.nom, Contributeurs.prenom, Contributeurs.date_naissance;
