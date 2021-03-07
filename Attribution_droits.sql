-- Attribution des droits

CREATE USER Adherent;
CREATE USER Personnel;
--Les membres du personnel seront des administrateur système, ils pourront modifier, insérer et supprimer des valeurs dans la base de données et la consulter.
GRANT ALL ON TABLE  adherents, 
compose, contributeurs, ecrit, exemplaires, films, interprete,
joue, Livres, oeuvres_musicales, personnels, emprunts, realise,
ressources, sanctions TO Personnel;
--Un adhérent pourra consulter la base de données.
GRANT SELECT ON TABLE  
compose, contributeurs, ecrit, exemplaires, films, interprete,
joue, Livres, oeuvres_musicales,  realise,
ressources TO Adherent;