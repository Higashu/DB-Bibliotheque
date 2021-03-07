-----------------AJOUT DES DONNEES DE TEST-------------------
--RESSOURCES
INSERT INTO Ressources(titre, date_apparition,editeur,prix) VALUES ('Le seigneur des anneaux I','1978.04.26','Bayard',19.90);
INSERT INTO Ressources(titre, date_apparition,editeur,prix) VALUES ('Le seigneur des anneaux II','1980.02.03','Bayard',19.90);
INSERT INTO Ressources (titre, date_apparition,editeur,prix)VALUES ('Le seigneur des anneaux III','1982.08.29','Bayard',19.90);

INSERT INTO Ressources(titre, date_apparition,editeur,prix) VALUES ('AVATAR', '2009.09.01', 'editeur_avatar', 10);
INSERT INTO Ressources(titre, date_apparition,editeur,prix) Values ('Titanic', '02.04.1997', 'editeur_titanic', 10);
INSERT INTO Ressources (titre, date_apparition,editeur,prix)Values ('Star Wars: Episode IV - A New Hope', '02.04.2012', 'editeur_star_wars', 10);

INSERT INTO Ressources (titre, date_apparition,editeur,prix)  VALUES ('Outrageous','2019.10.18','Minus Is More',17.50);
INSERT INTO Ressources (titre, date_apparition,editeur,prix) VALUES ('Chikita','2016.09.07','Vol.2',0);
INSERT INTO Ressources  (titre, date_apparition,editeur,prix) VALUES ('Broccoli F*ck','2019.04.19','GPF Recordz',1.50);
INSERT INTO Ressources (titre, date_apparition,editeur,prix) VALUES ('Le Lac Des Cygnes','1875.10.18','Bolchoi Record',17.50);
INSERT INTO Ressources (titre, date_apparition,editeur,prix) VALUES ('Nothing Like The Oldschool','1875.10.18','Thunderdome DH3',3);
INSERT INTO Ressources (titre, date_apparition,editeur,prix) VALUES ('Run The World','2011.06.21','Columbia',5);

--LIVRES
INSERT INTO Livres VALUES ('9782081631755','FR','Bilbon Saquet vivait sa petite vie...',1);
INSERT INTO Livres VALUES ('9782081631789','FR','Les aventures continues...',2);
INSERT INTO Livres VALUES ('9782081631793','FR','La fin est proche...',3);

--OEUVRES_MUSICALES
INSERT INTO Oeuvres_musicales VALUES ('3', '7');
INSERT INTO Oeuvres_musicales VALUES ('4', '8');
INSERT INTO Oeuvres_musicales VALUES ('5', '9');
INSERT INTO Oeuvres_musicales VALUES ('180', '10');
INSERT INTO Oeuvres_musicales VALUES ('6', '11');
INSERT INTO Oeuvres_musicales VALUES ('5', '12');

--CONTRIBUTEURS
INSERT INTO Contributeurs VALUES ('Tolkien','John Ronald Reuel','1892.01.03','Britannique');
INSERT INTO Contributeurs VALUES ('SALDANA','ZOE','1978.06.23','Britannique');
INSERT INTO Contributeurs VALUES ('LEONARDO','DICAPRIO','1840.06.23','Britannique');
INSERT INTO Contributeurs VALUES ('OMAR','SALAM','1840.06.23','Britannique');
INSERT INTO Contributeurs VALUES ('Norman','TOE','1978.06.23','Britannique');
INSERT INTO Contributeurs VALUES ('SILIM','OUNI','1840.06.23','Britannique');
INSERT INTO Contributeurs VALUES ('KAMEL','PLI','1840.06.23','Britannique');
INSERT INTO Contributeurs VALUES ('MARK','HAMILL','1840.06.23','Britannique');
INSERT INTO Contributeurs VALUES ('Act of','Rage','1980.05.04','Hollandais');
INSERT INTO Contributeurs VALUES ('Mari','Jul','1990.03.26','Française');
INSERT INTO Contributeurs VALUES ('Greazy Puzzy','Fuckerz','1975.05.04','Hollandais');
INSERT INTO Contributeurs VALUES ('Tchaikovsky', 'Piotr', '1840.05.04', 'Russe');
INSERT INTO Contributeurs VALUES ('Vlaarkamp','Sefa','2000.06.30','Hollandaise');
INSERT INTO Contributeurs VALUES ('Knowles','Beyonce','1975.03.18','Americaine');
INSERT INTO Contributeurs VALUES ('The','Dream','1970.09.30','Americain');

--Films 
INSERT INTO Films VALUES ('ANGLAIS', 40,'synopsis_avatar', 4);
INSERT INTO Films VALUES ('ANGLAIS', 40, 'synopsis_titanic', 5);
INSERT INTO Films VALUES ('ANGLAIS', 40, 'synopsis_star_wars', 6);

--ECRIT
INSERT INTO Ecrit VALUES (1,'Tolkien','John Ronald Reuel','1892.01.03');
INSERT INTO Ecrit VALUES (2,'Tolkien','John Ronald Reuel','1892.01.03');
INSERT INTO Ecrit VALUES (3,'Tolkien','John Ronald Reuel','1892.01.03');

--JOUE
INSERT INTO Joue VALUES(4, 'SALDANA', 'ZOE', '1978.06.23');
INSERT INTO Joue VALUES(5, 'LEONARDO', 'DICAPRIO', '1840.06.23');
INSERT INTO Joue VALUES(6, 'MARK', 'HAMILL', '1840.06.23');
INSERT INTO Joue VALUES(6, 'OMAR', 'SALAM', '1840.06.23');
INSERT INTO Joue VALUES(4, 'OMAR', 'SALAM', '1840.06.23');
--Réalise
INSERT INTO Realise VALUES(4, 'Norman', 'TOE', '1978.06.23');
INSERT INTO Realise VALUES(5, 'SILIM', 'OUNI', '1840.06.23');
INSERT INTO Realise VALUES(6, 'KAMEL', 'PLI', '1840.06.23');

--COMPOSE
INSERT INTO Compose VALUES ('7','Act of', 'Rage', '1980.05.04');
INSERT INTO Compose VALUES ('8','Mari', 'Jul', '1990.03.26');
INSERT INTO Compose VALUES ('9','Greazy Puzzy', 'Fuckerz', '1975.05.04');
INSERT INTO Compose VALUES ('10','Tchaikovsky', 'Piotr', '1840.05.04');
INSERT INTO Compose VALUES ('11','Vlaarkamp', 'Sefa', '2000.06.30');
INSERT INTO Compose VALUES ('12','The', 'Dream','1970.09.30');

--INTERPRETE
INSERT INTO Interprete VALUES ('7','Act of', 'Rage', '1980.05.04');
INSERT INTO Interprete VALUES ('8','Mari', 'Jul', '1990.03.26');
INSERT INTO Interprete VALUES ('9','Greazy Puzzy', 'Fuckerz', '1975.05.04');
INSERT INTO Interprete VALUES ('10','Tchaikovsky', 'Piotr', '1840.05.04');
INSERT INTO Interprete VALUES ('11','Vlaarkamp', 'Sefa', '2000.06.30');
INSERT INTO Interprete VALUES ('12','Knowles', 'Beyonce', '1975.03.18');

--Exemplaire
INSERT INTO Exemplaires(code_classification,etat,statut,ressource) VALUES ('L1','B','Disponible',1);
INSERT INTO Exemplaires(code_classification,etat,statut,ressource) VALUES ('L1','N','Disponible',1);
INSERT INTO Exemplaires(code_classification,etat,statut,ressource) VALUES ('L2','A','Indisponible',2);
INSERT INTO Exemplaires(code_classification,etat,statut,ressource) VALUES ('L2','B','Disponible',2);
INSERT INTO Exemplaires(code_classification,etat,statut,ressource) VALUES ('L3','N','Disponible',3);
INSERT INTO Exemplaires(code_classification,etat,statut,ressource) VALUES ('F1','B','Disponible',4);
INSERT INTO Exemplaires(code_classification,etat,statut,ressource) VALUES ('F1','B','Disponible',4);
INSERT INTO Exemplaires(code_classification,etat,statut,ressource) VALUES ('F2','N','Disponible',5);
INSERT INTO Exemplaires(code_classification,etat,statut,ressource) VALUES ('F3','P','Indisponible',6);
INSERT INTO Exemplaires (code_classification,etat,statut,ressource) VALUES ('M7', 'P', 'Indisponible', '7');
INSERT INTO Exemplaires (code_classification,etat,statut,ressource) VALUES ('M8', 'N', 'Disponible', '8');
INSERT INTO Exemplaires (code_classification,etat,statut,ressource) VALUES ('M12', 'B', 'Disponible', '12');
INSERT INTO Exemplaires (code_classification,etat,statut,ressource) VALUES ('M12', 'B', 'Disponible', '12');
INSERT INTO Exemplaires(code_classification,etat,statut,ressource) VALUES ('M9','A','Indisponible',9);
INSERT INTO Exemplaires(code_classification,etat,statut,ressource) VALUES ('M9','B','Disponible',9);
INSERT INTO Exemplaires(code_classification,etat,statut,ressource) VALUES ('M10','B','Disponible',10);
INSERT INTO Exemplaires(code_classification,etat,statut,ressource) VALUES ('M11','N','Disponible',11);






--PERSONNELS

INSERT INTO Personnels (login, mot_de_passe, nom, prenom, adresse, mail)
VALUES ('sernamar', 'oui', 'serna', 'margot', '42 avenue d''Orsay, 91400 ORSAY', 'margot.serna@etu.utc.fr');

INSERT INTO Personnels (login, mot_de_passe, nom, prenom, adresse, mail)
VALUES ('lbiagioni', 'oui1', 'biagioni', 'luca', '34 rue Jeanne d''Arc, 60200 COMPIEGNE', 'luca.biagioni@etu.utc.fr');

--ADHERENTS

INSERT INTO Adherents (login, mot_de_passe, nom, prenom, adresse, mail, date_naissance, telephone, id_carte, date_debut)
VALUES ('curtodel', 'oui2', 'curto', 'delphine', '42 avenue d''Orsay, 91400 ORSAY', 'delphine@hotmail.fr', '1974.11.14', '0767191919', '000000001', NOw());

INSERT INTO Adherents (login, mot_de_passe, nom, prenom, adresse, mail, date_naissance, telephone, id_carte, date_debut)
VALUES ('sernaste', 'oui3', 'serna', 'stephane', '42 avenue d''Orsay, 91400 ORSAY', 'stephane@hotmail.fr', '1972.08.10', '0767191919', '000000002', '2020.04.04');

INSERT INTO Adherents (login, mot_de_passe, nom, prenom, adresse, mail, date_naissance, telephone, id_carte, date_debut)
VALUES ('champocyn', 'oui4', 'champonnois', 'cynael', '4 rue des freres garnier, 52000 CHAUMONT', 'cynael@hotmailfr', '1998.12.15', '0767191919', '000000003', '2020.04.04');

INSERT INTO Adherents (login, mot_de_passe, nom, prenom, adresse, mail, date_naissance, telephone, id_carte, date_debut)
VALUES ('champodor', 'oui5', 'champonnois', 'doriane', '4 rue des freres garnier, 52000 CHAUMONT', 'doriane@hotmailfr', '2001.09.15', '0767191919', '000000004', '2020.04.04');

INSERT INTO Adherents (login, mot_de_passe, nom, prenom, adresse, mail, date_naissance, telephone, id_carte, date_debut)
VALUES ('champosan', 'oui6', 'champonnois', 'sandrine', '4 rue des freres garnier, 52000 CHAUMONT', 'sandrine@hotmailfr', '1998.12.15', '0767191919', '000000005', '2020.04.04');

INSERT INTO Adherents (login, mot_de_passe, nom, prenom, adresse, mail, date_naissance, telephone, id_carte, date_debut)
VALUES ('champofab', 'oui7', 'champonnois', 'fabian', '4 rue des freres garnier, 52000 CHAUMONT', 'fabian@hotmailfr', '1998.12.15', '0767191919', '000000006', '2020.04.04');

--EMPRUNT
INSERT INTO Emprunts VALUES (now(),14,NULL,'N',NULL,2,'curtodel');
UPDATE Exemplaires SET statut='Indisponible' WHERE id_exemplaire=2;
INSERT INTO Emprunts VALUES ('2020.01.10',14,'2020.01.24','B','B',1,'sernaste');
INSERT INTO Emprunts VALUES ('2020.03.20',14,'2020.04.02','B','A',3,'champocyn');
INSERT Into Emprunts VALUES (now(),14,NULL,'B',NULL,6,'curtodel');
UPDATE Exemplaires SET statut='Indisponible' WHERE id_exemplaire=6;



--SANCTION
INSERT INTO Sanctions(date_debut,date_fin,tarif,effectue,type_sanction,login) VALUES('2020.04.02',NULL,19.90,FALSE,'Remboursement','champocyn');
