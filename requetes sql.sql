-- Voir toutes les colonnes d'une table                                                                                                                                                                                      
-- select * from abonnements;

-- Utiliser une view
-- select * from mbr;
select * from pigeon;


-- faire un join
-- select * from abonnements join acces_salles using(abonnements_id) join avantage using(avantage_id);

-- rendre joli un join avec des as et un ordre
/*select membre.nom as "Prénom Nom", login, mot_de_passe as mdp, tarif, 
acces_salles.avantage_id as "salle basique pour les feignants",
 acces_salles_velo.avantage_id as "salle cycliste arrogant",
 acces_salles_rameur.avantage_id as "salle pour les rameur"
from membre join abonnements using(abonnements_id) join acces_salles using(abonnements_id) join avantage using(avantage_id) join acces_salles_rameur using(abonnements_id) join acces_salles_velo using(abonnements_id) order by "Prénom Nom";