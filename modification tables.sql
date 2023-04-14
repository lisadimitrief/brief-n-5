-- Donner des valeurs dans plusieurs colonne d'une table

UPDATE membre
SET club_id = 3, status_id = 2, abonnements_id = 11, carte_bleu_id=1, medecin_id=1,
assurance_id=1, adresse_id=1
where nom="Nicolas Clinton";

UPDATE membre
SET club_id = 2, status_id = 1, abonnements_id = 2, carte_bleu_id=2, medecin_id=2,
assurance_id=2, adresse_id=2
where nom="Lamar Bellic";

UPDATE membre
SET club_id = 3, status_id = 1, abonnements_id = 1, carte_bleu_id=3, medecin_id=3,
assurance_id=2, adresse_id=3
where nom="Franklin Jakowski";

UPDATE membre
SET club_id = 4, status_id = 4, abonnements_id = 13, carte_bleu_id=4, medecin_id=4,
assurance_id=1, adresse_id=4
where nom="John Smith";

-- select * from membre

UPDATE adresse
SET code_postal_id = 1
where adresse_id=1;

UPDATE adresse
SET code_postal_id = 2
where adresse_id=2;

UPDATE adresse
SET code_postal_id = 3
where adresse_id=3;

UPDATE adresse
SET code_postal_id = 4
where adresse_id=4;

-- select * from adresse

update code_postal
SET ville_id = 1
where code_postal_id=1;

update code_postal
SET ville_id = 2
where code_postal_id=2;

update code_postal
SET ville_id = 3
where code_postal_id=3;

update code_postal
SET ville_id = 4
where code_postal_id=4;

-- select * from code_postal

update abonnements
SET hygiene = 1, coach=1
where abonnements_id=1;

update abonnements
SET hygiene = 1, coach=2
where abonnements_id=2;

update abonnements
SET hygiene = 1, coach=3
where abonnements_id=3;

update abonnements
SET hygiene = 1, coach=3
where abonnements_id=4;

update abonnements
SET hygiene = 1, coach=1
where abonnements_id=5;

update abonnements
SET hygiene = 1, coach=3
where abonnements_id=6;

update abonnements
SET hygiene = 3, coach=3
where abonnements_id=7;

update abonnements
SET hygiene = 3, coach=3
where abonnements_id=8;

update abonnements
SET hygiene = 1, coach=3
where abonnements_id=9;

update abonnements
SET hygiene = 1, coach=3
where abonnements_id=10;

update abonnements
SET hygiene = 1, coach=3
where abonnements_id=11;

update abonnements
SET hygiene = 1, coach=1
where abonnements_id=12;

update abonnements
SET hygiene = 3, coach=3
where abonnements_id=13;

-- select * from abonnements
