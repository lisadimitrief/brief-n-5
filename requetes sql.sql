-- Voir toutes les colonnes d'une table                                                                                                                                                                                      
-- select * from abonnements;
-- select * from membre;

-- Utiliser une view
-- select * from mbr;
-- select * from pigeon;

-- faire un join
-- select * from abonnements join acces_salles using(abonnements_id) join avantage using(avantage_id);

-- rendre joli un join avec des as et un ordre
/*select membre.nom as "Prénom Nom", login, mot_de_passe as mdp, tarif, 
avantage_id.acces_salles as "salle basique pour les feignants",
 acces_salles_velo as "salle cycliste arrogant",
 acces_salles_rameur as "salle pour les rameur"
from membre join abonnements using(abonnements_id) join acces_salles using(abonnements_id) join avantage using(avantage_id) join acces_salles_rameur using(abonnements_id) join acces_salles_velo using(abonnements_id) order by "Prénom Nom";*/

select membre.nom as "Prénom Nom", avantage, avantage 
from membre join abonnements using(abonnements_id) 
join acces_salles using(abonnements_id) join avantage on acces_salles.avantage_id = avantage.avantage_id
join acces_salles_rameur using(abonnements_id) join avantage on acces_salles_rameur.avantage_id = avantage.avantage_id
join acces_salles_velo using(abonnements_id) join avantage on acces_salles_velo.avantage_id = avantage.avantage_id;


-- insert into abonnements (nom, tarif, hygiene, coach) values ("bruh", 400, 1, 1);
-- select * from abonnements;

-- compte toute les colonne d'une table
-- SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'membre';

-- select membre.nom, club.nom from membre join club using(club_id)