-----------------CREATION DES TABLES-------------------
CREATE TABLE Contributeurs
(
    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    date_naissance DATE NOT NULL,
    nationalite VARCHAR,
    PRIMARY KEY (nom, prenom, date_naissance)
);

CREATE TABLE Ressources
(
    code SERIAL PRIMARY KEY ,
    titre VARCHAR NOT NULL,
    date_apparition DATE,
    editeur VARCHAR NOT NULL,
    prix FLOAT NOT NULL
    CHECK (date_apparition<=now())
);

CREATE TABLE Films
(
    langue VARCHAR NOT NULL,
    duree INTEGER NOT NULL,
    synopsis VARCHAR NOT NULL,
    code INTEGER,
    FOREIGN KEY (code) REFERENCES Ressources (code),
    PRIMARY KEY (code)
);

CREATE TABLE Livres
(
    code_ISBN VARCHAR NOT NULL,
    langue VARCHAR NOT NULL,
    résumé VARCHAR NOT NULL,
    code INTEGER,
    FOREIGN KEY (code) REFERENCES Ressources (code),
    PRIMARY KEY (code)
);

CREATE TABLE Oeuvres_Musicales
(
    longueure_musique FLOAT NOT NULL,
    code INTEGER,
    FOREIGN KEY (code) REFERENCES Ressources (code),
    PRIMARY KEY (code)
);

CREATE TABLE Joue
(
    film INTEGER REFERENCES Ressources (code),
    nom VARCHAR,
    prenom VARCHAR,
    date_naissance DATE,
    FOREIGN KEY (nom, prenom, date_naissance) REFERENCES Contributeurs(nom, prenom, date_naissance),
    PRIMARY KEY (film, nom, prenom, date_naissance)
);

CREATE TABLE Realise
(
    film INTEGER REFERENCES Ressources (code),
    nom VARCHAR,
    prenom VARCHAR,
    date_naissance DATE,
    FOREIGN KEY (nom, prenom, date_naissance) REFERENCES Contributeurs(nom, prenom, date_naissance),
    PRIMARY KEY (film, nom, prenom, date_naissance)
);

CREATE TABLE Ecrit
(
    livre INTEGER REFERENCES Ressources (code),
    nom VARCHAR,
    prenom VARCHAR,
    date_naissance DATE,
    FOREIGN KEY (nom, prenom, date_naissance) REFERENCES Contributeurs(nom, prenom, date_naissance),
    PRIMARY KEY (livre, nom, prenom, date_naissance)
);

CREATE TABLE Compose
(
    oeuvre_musicale INTEGER REFERENCES Ressources (code),
    nom VARCHAR,
    prenom VARCHAR,
    date_naissance DATE,
    FOREIGN KEY (nom, prenom, date_naissance) REFERENCES Contributeurs(nom, prenom, date_naissance),
    PRIMARY KEY (oeuvre_musicale, nom, prenom, date_naissance)
);

CREATE TABLE Interprete
(
    oeuvre_musicale INTEGER REFERENCES Ressources (code),
    nom VARCHAR,
    prenom VARCHAR,
    date_naissance DATE,
    FOREIGN KEY (nom, prenom, date_naissance) REFERENCES Contributeurs(nom, prenom, date_naissance),
    PRIMARY KEY (oeuvre_musicale, nom, prenom, date_naissance)
);

CREATE TABLE Exemplaires
(
    id_exemplaire  SERIAL PRIMARY KEY,
    code_classification VARCHAR,
    etat CHAR(1) CHECK (etat IN ('N', 'B', 'A', 'P')),
    statut VARCHAR CHECK (statut IN ('Disponible', 'Indisponible')),
    ressource INTEGER,
    FOREIGN KEY (ressource) REFERENCES Ressources(code),
    Check ((etat='A' OR etat='P') AND statut='Indisponible' OR ((etat='N' OR etat='B') AND (statut='Disponible') OR (statut='Indisponible')))
);

CREATE TABLE Adherents
(
    login VARCHAR PRIMARY KEY,
    mot_de_passe VARCHAR NOT NULL,
    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    adresse VARCHAR NOT NULL,
    mail VARCHAR NOT NULL,
    date_naissance DATE NOT NULL,
    telephone INTEGER,
    id_carte INTEGER UNIQUE NOT NULL, 
    date_debut DATE NOT NULL,
    date_fin DATE DEFAULT NULL,
    blackliste BOOLEAN DEFAULT FALSE
);

CREATE TABLE Personnels
(
    login VARCHAR PRIMARY KEY,
    mot_de_passe VARCHAR NOT NULL,
    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    adresse VARCHAR NOT NULL,
    mail VARCHAR NOT NULL
);

CREATE TABLE Emprunts
(
    date_emprunt DATE,
    duree INTEGER,
    date_retour DATE DEFAULT NULL,
    etat_debut CHAR(1) CHECK (etat_debut IN ('N', 'B')),
    etat_retour CHAR(1) DEFAULT NULL CHECK (etat_retour IN ('N', 'B', 'A', 'P')),
    id_exemplaire INTEGER,
    login VARCHAR,
    FOREIGN KEY (id_exemplaire) REFERENCES Exemplaires(id_exemplaire),
    FOREIGN KEY (login) REFERENCES Adherents(login),
    PRIMARY KEY (date_emprunt, id_exemplaire, login)
);

CREATE TABLE Sanctions
(
    id_sanction SERIAL PRIMARY KEY,
    date_debut DATE DEFAULT NULL,
    date_fin DATE DEFAULT NULL,
    tarif FLOAT DEFAULT NULL,
    effectue BOOLEAN DEFAULT FALSE,
    type_sanction VARCHAR CHECK (type_sanction IN ('Suspension', 'Remboursement')),
    login VARCHAR REFERENCES Adherents(login),
    CONSTRAINT CHK_type CHECK ((type_sanction = 'Suspension' AND effectue=NULL AND tarif=NULL) OR (type_sanction = 'Remboursement' AND date_debut=NULL AND date_fin=NULL))
);
--
--
--
--Contraintes compliquées

-- CC1 : Projection(Ressource(code)) = Projection(Film(Ressource)) U Projection(Livre(Ressource)) U Projection(Livre(Ressource)) U Projection(Oeuvre_musicale(Ressource))
CREATE VIEW VCC1 AS
select ressources.code from ressources
FULL JOIN
(select films.code  from Films 
union select livres.code from livres 
union select Oeuvres_Musicales.code from Oeuvres_Musicales) R on R.code=ressources.code 
where ressources.code is null OR R.code is null;

-- CC2 : Projection(Ressource(code)) = Projection(Exemplaires(Ressource)) 
CREATE VIEW VCC2 AS
SELECT ressources.code FROM ressources
FULL JOIN
(SELECT DISTINCT exemplaires.ressource from exemplaires) R on R.ressource=ressources.code where ressources.code is null OR R.ressource is null;

-- CC3 : intersection(projection(Adhérents, login), projection(Personnel, login)) = {}
CREATE VIEW VCC3 AS
SELECT login FROM adherents 
intersect 
SELECT login FROM personnels;

-- CC4 : projection(Emprunt, login, etat_fin in ('A',‘P’)=projection(Sanction,login,tarif not null) :
CREATE VIEW VCC4 AS
SELECT E.login FROM Emprunts E, Sanctions S
WHERE E.etat_retour  in ('A','P')
AND E.login = S.login
AND (S.tarif IS NULL OR S.type_sanction != 'Remboursement')
AND E.date_retour = S.date_debut;

--CC5 : R1 = Restrict(Emprunts,date_retour > date_emprunt + duree)
--R2 = Jointure (R1,Sanctions,R1.login = Sanctions.login ET R1.date_retour = Sanctions.date_debut)
--R3 = Restrict(R2, ( date_fin IS NULL OR date_fin != date_debut + (date_retour - ( date_emprunt+ duree)) ))
CREATE VIEW VCC5 AS
SELECT * FROM Emprunts E, Sanctions S 
WHERE E.date_retour > E.date_emprunt + E.duree
AND E.login = S.login
AND E.date_retour = S.date_debut
AND  ( S.date_fin IS NULL OR S.date_fin != S.date_debut + (E.date_retour - (E.date_emprunt+E.duree)) );
