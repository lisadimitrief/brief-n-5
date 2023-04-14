INSERT INTO club(nom, casiers, surface, p_parking, toilettes, douches, saunas)
VALUES
("L.Santos mountain park", 200, 600, 50, 5, 10, 2),
("Fleeca fit", 100, 250, 5, 2, 2, 0),
("Diamond goal", 50, 200, 5, 3, 3, 1),
("Dragnis eternum", 42, 700, 42, 42,42,42);
 
INSERT INTO salles(surface,nbr,nbr_s_velo,nbr_s_rameur,clim,p_a,clim_s_p,p_a_s_p)
VALUES
(25, 10, 2, 2, 2,2, 10, 10),
(30, 5, 1, 1, 1, 1, 5, 5),
(30, 5, 1, 1, 1, 1, 10, 10),
(50, 42, 10, 10, 0, 0, 0, 0);

INSERT INTO parametre_salles(temperature, humidite, pression)
VALUES
(22, 60, 1013.2),
(22, 60, 1013.2),
(22, 60, 1013.2),
(22, 60, 1013.2),
(22, 60, 1013.2),
(22, 60, 1013.2),
(22, 60, 1013.2),
(22, 60, 1013.2),
(22, 50, 1013.2),
(22, 50, 1013.2),
(22, 50, 1013.2),
(23, 40, 1013.2),
(23, 40, 1013.2),
(23, 40, 1013.2),
(23, 40, 1013.2),
(23, 30, 1013.2),
(23, 30, 1013.2),
(24, 40, 1013.2),
(24, 40, 1013.2),
(23, 50, 1013.2),
(23, 50, 1013.2),
(23, 50, 1013.2),
(22, 50, 1013.2),
(22, 50, 1013.2);


INSERT INTO machines(nbr_cardio, nbr_par_type, nbr_type)
VALUES
(40, 2, 25),
(30, 2, 20),
(15, 2, 15),
(90, 4, 30);

INSERT INTO abonnements(nom, tarif)
VALUES
("VIP", 200),
("Premium version International", 175),
("Premium", 150),
("Cycliste International", 150),
("Cycliste d'Eau Douce", 100),
("Le Muscle est Partout", 150),
("Membre International", 135),
("Bain-l Fit International", 130),
("B Less-Fit", 125),
("Membre", 100),
("Coach", 50),
("Agent de Nettoyage et de Sécurité", 0),
("Picsou", 9999);

INSERT INTO statu(statu)
VALUES
("membre"),
("coach"),
("menage"),
("cresus");

INSERT INTO membre(nom, date_naissance, tel, mail, carte_identite, certif_medical, licence, login, mot_de_passe)
VALUES
("Nicolas Clinton", "1995-04-20", "+336420697", "musclefit@yahoo.com", "dolauhdvjnaqikdhv.jpg", "2022-11-25", "DG456A7", "NCLINTON", "000000"),
("Lamar Bellic", "1978-04-19", "+4511527563", "imporage@gmail.com", "veqfdbhv.jgp", "2023-01-15","FL325F8","LBELLIC","123456"),
("Franklin Jakowski", "1970-04-09", "+33655487565", "frajaski@aol.com", "qiudhga.jpg", "2022-10-21", "DG684E4", "FJAKO", "246810"),
("John Smith", "2005-03-26", "07700900461", "doctor.who@tardis.ga", "####.jpg", "2005-03-26", "DW2005RT", "TheDoctor", "Who?");

INSERT INTO adresse(numero_rue_et_rue)
VALUES
("30 Rue de la Fontaine"),
("Stadhouderskade 78"),
("42 Rue de Lattre de Tassigny"),
("10 Avenue Bad Wolf");

INSERT INTO ville(nom)
VALUES
("Saint-Mars-la-Réorthe"),
("AE Amsterdam"),
("Les Epesses"),
("Londre");

INSERT INTO code_postal(num)
VALUES
(85590),
(1072),
(85590),
(2005);

INSERT INTO carte_bleu(nom, num, cvv_cvv2, expiration)
VALUES
("VISA", "4125-0910-1085-0791", 586, "2028-11"),
("MASTER CARD", "3617-4607-6802-9683", 676, "2024-01"),
("UNKNOW", "4540-7336-0239-1976", 215, "2027-06"),
("MASTER CARD", "9876-5432-2147-2580", 042, "9999-12");

INSERT INTO medecin(nom, mail, tel)
VALUES
("Agatha Duggan", "A.Dug@gmail.com", "+33678543289"),
("Karim Jonas", "", "+4513467982"),
("Sacha Martinez", "Samar@hotmail.com", "+33611568493"),
("The Doctor", "thedoctor@who.co", "+33123456789");

INSERT INTO assurance(nom, tel)
VALUES
("Assurix", "+336 54 55 55 56"),
("VitalFish", "+45 55 21 21 21");

INSERT INTO utilisation_machine(debut_seance, fin_seance, nrj_produite)
VALUES
("02:45:55", "05:30:00", 900),
("10:00:00", "10:02:12", 12),
("08:33:25", "19:30:25", 16541),
("16:02:11", "00:02:35", 1654);

INSERT INTO acces_admin(login, mot_de_passe, club, para_salles, machines, abonnenents, acces_salles, acces_salles_rameur, acces_salles_velo, acces_salles_collectif, acces_club, avantage, statu, membre, adresse, ville, code_postal,  carte_bleu, medecin, assurance, utilisation_machine)
VALUES
("membre01", "je ss le maileure yolo", false, true, true, false, false, false, false, false, false, true, true, false, false, false, false, false, false, true, false),
("gestionnaire01", "gestionnaire01", true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true),
("coach01", "misterbellegosse", false, false, false, false,true, false, false, false, true, true, false, false, false, false, false, false, true, true, true),
("feignant01", "123456789", true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);

INSERT INTO avantage(avantage)
VALUES
("ilimité"),
("discount"),
("supplément");

INSERT INTO acces_club(acces)
VALUES
("tous"),
("unique");