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
assurance_id int
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
status_id int,
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
status boolean not null,
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