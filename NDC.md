## Note de clarification pour un système de gestion d'une Bibliothèque municipale

 

### Ressources
-----------

* Une ressource est définie par un __code unique__, __un titre__, __une date d'apparition__, __un éditeur__, __un code de classification__, __un nombre d'exemplaire__ et __son état__ (neuf, bon, abîmé, perdu).

  

* Une ressource peut être __disponible__ ou __indisponible__.

  

* Une ressource peut être :
	* __Un livre__ :  on doit alors renseigner _les auteurs_ du livre, _son ISBN_ (International Standard Book Number), _le résumé du livre_ et _la langue_ dans laquelle il est écrit.

	* __Une oeuvre musicale__ : on doit alors renseigner _les compositeurs_ de la musique, _ses interprètes_ ainsi que _la longueur_ de la musique.

	* __Un film__ : on doit alors renseigner _les acteurs_ qui jouent dans ce film, _les réalisateurs_, _la langue_ du film, _la durée du film_ et _son synopsis_.

  
### Contributeur (auteurs, compositeurs, interprètes, acteurs, réalisateurs)
----------
  

* Un contributeur est défini par __son nom__, __son prénom__, __sa date de naissance__ et __sa nationalité__.

  

### Membres du personnel de la bibliothèque
---------
  

* Un membre du personnel est défini par __son login__, __son mot de passe__, __son nom__, __son prénom__, __son adresse__ et __son adresse e-mail__.

  

* Les membres du personnel seront des __administrateur système__, ils pourront _modifier_, _insérer_ et _supprimer_ des valeurs dans la base de données et la consulter.

  

### Adhérents
--------
* Un adhérent est défini par __son login__, __son mot de passe__, __son nom__, __son prénom__, __sa date de naissance__, __son adresse__, __son adresse e-mail__, __son numéro de téléphone__.

* Un adhérent possèdent __une carte__ d'adhérent.

* Un adhérent peut __emprunter un nombre limité d’œuvres__.

* Un adhérent doit __s'authentifier__ pour emprunter une ressource.

* La bibliothèque souhaite __garder une trace de toutes les adhésions__.

* Un adhérent est __sanctionné__ pour chaque _retard dans le retour d'une ressources_ ou pour la _dégradation d'une ressource empruntée_.

* Un adhérent sanctionné ne peut plus emprunter pour une durée égale au nombre de jour de retard de la restitution, à partir de la date de la restitution.

* Un adhérent peut être __interdit d'emprunt__ s'il a _perdu ou gravement abîmé une ressources_.

* Un adhérent peut être __blacklisté__, il ne pourra donc _plus emprunter_.

* Un adhérent pourra __consulter la base de données__.

  

### Emprunt
---------
* Un emprunt est caractérisé par __une date de prêt__, __une durée de prêt__.

* Une _ressource empruntée_ peut être __perdue__ ou __abîmée__.

* Une _ressource perdue ou gravement abîmée_ doit être __remboursée__.

* Un emprunt est __contracté par un adhérent__.