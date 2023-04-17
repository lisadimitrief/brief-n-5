create database IF NOT EXISTS euro_fit_lisa;
use euro_fit_lisa;
-- DROP DATABASE euro_fit_lisa;

create table club (
club_id int primary key auto_increment, 
nom varchar(45) not null,
casiers int not null,
surface int not null,
p_parking int not null,
toilettes int not null,
douches int not null,
saunas int not null,
assurance_id int,
adresse_id int,
machines_id int
);

create table salles(
 salles_id int primary key auto_increment,
 para_id int,
 club_id int,
 surface int not null,
 nbr int not null,
 nbr_s_velo int not null,
 nbr_s_rameur int not null,
 clim int not null,
 p_a int not null,
 clim_s_p int not null,
 p_a_s_p int not null
);

create table parametre_salles(
para_id int primary key auto_increment,
temperature int not null,
humidite int not null,
pression float not null
);

create table machines(
machines_id int primary key auto_increment,
nbr_cardio int not null,
nbr_par_type int not null,
nbr_type int not null
);

create table abonnements(
abonnements_id int primary key auto_increment,
nom varchar(45) not null,
tarif int not null,
hygiene int,
coach int
);

-- la faute est volontaire car status est un terme reservé par le logiciel
create table statu(
statu_id int primary key auto_increment,
statu varchar(20) not null 
);

create table membre(
membre_id int primary key auto_increment,
nom varchar(45) not null,
date_naissance date not null,
tel varchar(20) not null,
mail varchar(45),
carte_identite varchar(50),
certif_medical date not null,
licence varchar(20) not null,
login varchar(50) not null,
mot_de_passe varchar(50) not null,
club_id int,
statu_id int,
abonnements_id int,
carte_bleu_id int,
medecin_id int,
assurance_id int,
adresse_id int
);

create table adresse(
adresse_id int primary key auto_increment,
numero_rue_et_rue varchar(80) not null,
code_postal_id int
);

create table ville(
ville_id int primary key auto_increment,
nom varchar(40) not null
);

create table code_postal(
code_postal_id int primary key auto_increment,
num varchar(5) not null,
ville_id int
);

create table carte_bleu(
carte_bleu_id int primary key auto_increment,
nom varchar(50) not null,
num varchar(20) not null,
cvv_cvv2 varchar(3) not null,
expiration varchar(7) not null
);

create table medecin(
medecin_id int primary key auto_increment,
nom varchar(45) not null,
adresse_id int,
mail varchar(45),
tel varchar(20) not null
);

create table assurance(
assurance_id int primary key auto_increment,
nom varchar(45) not null,
adresse_id int,
tel varchar(20)
);

create table utilisation_machine(
utilisation_machine_id int primary key auto_increment,
membre_id int,
club_id int,
debut_seance time not null,
fin_seance time not null,
nrj_produite float not null
);

create table acces_admin(
admin_id int primary key auto_increment,
login varchar(50) not null,
mot_de_passe varchar(50) not null,
club boolean not null,
para_salles boolean not null,
machines boolean not null,
abonnenents boolean not null,
acces_salles boolean not null,
acces_salles_velo boolean not null,
acces_salles_rameur boolean not null,
acces_salles_collectif boolean not null,
acces_club boolean not null,
avantage boolean not null,
statu boolean not null,
membre boolean not null,
adresse boolean not null,
ville boolean not null,
code_postal boolean not null,
carte_bleu boolean not null,
medecin boolean not null,
assurance boolean not null,
utilisation_machine boolean not null
);

create table avantage(
avantage_id int primary key auto_increment,
avantage varchar(10) not null
);

create table acces_salles(
acces_salles_id int primary key auto_increment,
abonnements_id int,
avantage_id int
);

create table acces_salles_velo(
acces_salles_velo_id int primary key auto_increment,
abonnements_id int,
avantage_id int
);

create table acces_salles_rameur(
acces_salles_rameur_id int primary key auto_increment,
abonnements_id int,
avantage_id int
);

create table acces_salles_collectif(
acces_salles_collectif_id int primary key auto_increment,
abonnements_id int,
avantage_id int
);
create table acces_club(
acces_club_id int primary key auto_increment,
abonnements_id int,
acces varchar(10)
);
-- ------------VIEW--------------------------------------------------------------
create view mbr as select * from membre order by nom;
create view pigeon as select membre.nom, tarif, abonnements.nom as abonnement from membre join abonnements using(abonnements_id);
-- -----------------------------------------CLUB----------------------------------------
ALTER TABLE `euro_fit_lisa`.`salles` 
ADD INDEX `fk_club_salles_idx` (`club_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`salles` 
ADD CONSTRAINT `fk_club_salles`
  FOREIGN KEY (`club_id`)
  REFERENCES `euro_fit_lisa`.`club` (`club_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `euro_fit_lisa`.`membre` 
ADD INDEX `fk_club_membre_idx` (`club_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`membre` 
ADD CONSTRAINT `fk_club_membre`
  FOREIGN KEY (`club_id`)
  REFERENCES `euro_fit_lisa`.`club` (`club_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `euro_fit_lisa`.`utilisation_machine` 
ADD INDEX `fk_club_utili_machine_idx` (`club_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`utilisation_machine` 
ADD CONSTRAINT `fk_club_utili_machine`
  FOREIGN KEY (`club_id`)
  REFERENCES `euro_fit_lisa`.`club` (`club_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
-- -----------------------parametre salles--------------------------------------------------------------
ALTER TABLE `euro_fit_lisa`.`salles` 
ADD INDEX `fk_para_salle_idx` (`para_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`salles` 
ADD CONSTRAINT `fk_para_salle`
  FOREIGN KEY (`para_id`)
  REFERENCES `euro_fit_lisa`.`parametre_salles` (`para_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
-- --------------------machines----------------------------------------------------------------------------------
ALTER TABLE `euro_fit_lisa`.`club` 
ADD INDEX `fk_machines_club_idx` (`machines_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`club` 
ADD CONSTRAINT `fk_machines_club`
  FOREIGN KEY (`machines_id`)
  REFERENCES `euro_fit_lisa`.`machines` (`machines_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
-- --------------------abonnements----------------------------------------------------------------------------------
ALTER TABLE `euro_fit_lisa`.`membre` 
ADD INDEX `fk_abonnements_membre_idx` (`abonnements_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`membre` 
ADD CONSTRAINT `fk_abonnements_membre`
  FOREIGN KEY (`abonnements_id`)
  REFERENCES `euro_fit_lisa`.`abonnements` (`abonnements_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `euro_fit_lisa`.`acces_salles` 
ADD INDEX `fk_abonnements_salles_idx` (`abonnements_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`acces_salles` 
ADD CONSTRAINT `fk_abonnements_salles`
  FOREIGN KEY (`abonnements_id`)
  REFERENCES `euro_fit_lisa`.`abonnements` (`abonnements_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `euro_fit_lisa`.`acces_salles_collectif` 
ADD INDEX `fk_abonnements_collectif_idx` (`abonnements_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`acces_salles_collectif` 
ADD CONSTRAINT `fk_abonnements_collectif`
  FOREIGN KEY (`abonnements_id`)
  REFERENCES `euro_fit_lisa`.`abonnements` (`abonnements_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `euro_fit_lisa`.`acces_salles_rameur` 
ADD INDEX `fk_abonnements_rameur_idx` (`abonnements_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`acces_salles_rameur` 
ADD CONSTRAINT `fk_abonnements_rameur`
  FOREIGN KEY (`abonnements_id`)
  REFERENCES `euro_fit_lisa`.`abonnements` (`abonnements_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `euro_fit_lisa`.`acces_salles_velo` 
ADD INDEX `fk_abonnements_velo_idx` (`abonnements_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`acces_salles_velo` 
ADD CONSTRAINT `fk_abonnements_velo`
  FOREIGN KEY (`abonnements_id`)
  REFERENCES `euro_fit_lisa`.`abonnements` (`abonnements_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `euro_fit_lisa`.`acces_club` 
ADD INDEX `fk_abonnements_club_idx` (`abonnements_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`acces_club` 
ADD CONSTRAINT `fk_abonnements_club`
  FOREIGN KEY (`abonnements_id`)
  REFERENCES `euro_fit_lisa`.`abonnements` (`abonnements_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
-- --------------------statu----------------------------------------------------------------------------------
ALTER TABLE `euro_fit_lisa`.`membre` 
ADD INDEX `fk_statu_membre_idx` (`statu_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`membre` 
ADD CONSTRAINT `fk_statu_membre`
  FOREIGN KEY (`statu_id`)
  REFERENCES `euro_fit_lisa`.`statu` (`statu_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
-- -------------------membre-----------------------------------------------------------------------------
ALTER TABLE `euro_fit_lisa`.`utilisation_machine` 
ADD INDEX `fk_membre_utili_machine_idx` (`membre_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`utilisation_machine` 
ADD CONSTRAINT `fk_membre_utili_machine`
  FOREIGN KEY (`membre_id`)
  REFERENCES `euro_fit_lisa`.`membre` (`membre_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;  
-- --------------------adresse----------------------------------------------------------------------------------
ALTER TABLE `euro_fit_lisa`.`club`
ADD INDEX `fk_adresse_idx` (`adresse_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`club` 
ADD CONSTRAINT `fk_adresse`
  FOREIGN KEY (`adresse_id`)
  REFERENCES `euro_fit_lisa`.`adresse` (`adresse_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `euro_fit_lisa`.`membre` 
ADD INDEX `fk_adresse_membre_idx` (`adresse_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`membre` 
ADD CONSTRAINT `fk_adresse_membre`
  FOREIGN KEY (`adresse_id`)
  REFERENCES `euro_fit_lisa`.`adresse` (`adresse_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `euro_fit_lisa`.`medecin` 
ADD INDEX `fk_adresse_medecin_idx` (`adresse_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`medecin` 
ADD CONSTRAINT `fk_adresse_medecin`
  FOREIGN KEY (`adresse_id`)
  REFERENCES `euro_fit_lisa`.`adresse` (`adresse_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
-- ---------------------------code postal------------------------------------------------------------------
ALTER TABLE `euro_fit_lisa`.`adresse` 
ADD INDEX `fk_code_adresse_idx` (`code_postal_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`adresse` 
ADD CONSTRAINT `fk_code_adresse`
  FOREIGN KEY (`code_postal_id`)
  REFERENCES `euro_fit_lisa`.`code_postal` (`code_postal_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
-- --------------------ville----------------------------------------------------------------------------------
ALTER TABLE `euro_fit_lisa`.`code_postal` 
ADD INDEX `fk_ville_code_idx` (`ville_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`code_postal` 
ADD CONSTRAINT `fk_ville_code`
  FOREIGN KEY (`ville_id`)
  REFERENCES `euro_fit_lisa`.`ville` (`ville_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
-- ------------------carte_bleu------------------------------------------------
ALTER TABLE `euro_fit_lisa`.`membre` 
ADD INDEX `fk_carte_bleu_membre_idx` (`carte_bleu_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`membre` 
ADD CONSTRAINT `fk_carte_bleu_membre`
  FOREIGN KEY (`carte_bleu_id`)
  REFERENCES `euro_fit_lisa`.`carte_bleu` (`carte_bleu_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
-- ------------------medecin---------------------------------------------------
ALTER TABLE `euro_fit_lisa`.`membre` 
ADD INDEX `fk_medecin_membre_idx` (`medecin_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`membre` 
ADD CONSTRAINT `fk_medecin_membre`
  FOREIGN KEY (`medecin_id`)
  REFERENCES `euro_fit_lisa`.`medecin` (`medecin_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
-- ------------------assurance-------------------------------------------------
ALTER TABLE `euro_fit_lisa`.`membre` 
ADD INDEX `fk_assurance_membre_idx` (`assurance_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`membre` 
ADD CONSTRAINT `fk_assurance_membre`
  FOREIGN KEY (`assurance_id`)
  REFERENCES `euro_fit_lisa`.`assurance` (`assurance_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `euro_fit_lisa`.`club` 
ADD INDEX `fk_assurance_club_idx` (`assurance_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`club` 
ADD CONSTRAINT `fk_assurance_club`
  FOREIGN KEY (`assurance_id`)
  REFERENCES `euro_fit_lisa`.`assurance` (`assurance_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
-- ------------------avantage-----------------------------------
ALTER TABLE `euro_fit_lisa`.`acces_salles` 
ADD INDEX `fk_avantage_idx` (`avantage_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`acces_salles` 
ADD CONSTRAINT `fk_avantage`
  FOREIGN KEY (`avantage_id`)
  REFERENCES `euro_fit_lisa`.`avantage` (`avantage_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
ALTER TABLE `euro_fit_lisa`.`acces_salles` 
ADD INDEX `fk_avantage_salles_idx` (`avantage_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`acces_salles` 
ADD CONSTRAINT `fk_avantage_salles`
  FOREIGN KEY (`avantage_id`)
  REFERENCES `euro_fit_lisa`.`avantage` (`avantage_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `euro_fit_lisa`.`acces_salles_collectif` 
ADD INDEX `fk_avantage_collectif_idx` (`avantage_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`acces_salles_collectif` 
ADD CONSTRAINT `fk_avantage_collectif`
  FOREIGN KEY (`avantage_id`)
  REFERENCES `euro_fit_lisa`.`avantage` (`avantage_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `euro_fit_lisa`.`acces_salles_rameur` 
ADD INDEX `fk_avantage_rameur_idx` (`avantage_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`acces_salles_rameur` 
ADD CONSTRAINT `fk_avantage_rameur`
  FOREIGN KEY (`avantage_id`)
  REFERENCES `euro_fit_lisa`.`avantage` (`avantage_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `euro_fit_lisa`.`acces_salles_velo` 
ADD INDEX `fk_avantage_velo_idx` (`avantage_id` ASC) VISIBLE;
;
ALTER TABLE `euro_fit_lisa`.`acces_salles_velo` 
ADD CONSTRAINT `fk_avantage_velo`
  FOREIGN KEY (`avantage_id`)
  REFERENCES `euro_fit_lisa`.`avantage` (`avantage_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
