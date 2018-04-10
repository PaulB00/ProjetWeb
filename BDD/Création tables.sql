#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: UTILISATEUR
#------------------------------------------------------------

CREATE TABLE UTILISATEUR(
        Id_Utilisateur             int (11) Auto_increment  NOT NULL ,
        Nom_Utilisateur            Varchar (25) ,
        Prenom_Utilisateur         Varchar (25) ,
        Mail_Utilisateur           Varchar (50) ,
        Mpd_Utilisateur            Varchar (25) ,
        Statut_Utilisateur         Varchar (25) NOT NULL ,
        Etat_Connexion_Utilisateur Bool ,
        PRIMARY KEY (Id_Utilisateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ACTIVITE
#------------------------------------------------------------

CREATE TABLE ACTIVITE(
        Id_Activite          int (11) Auto_increment  NOT NULL ,
        Nom_Activite         Varchar (25) NOT NULL ,
        Description_Activite Varchar (124) NOT NULL ,
        Validation_Activite  Bool ,
        Id_Manifestation     Int NOT NULL ,
        PRIMARY KEY (Id_Activite )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: INSCRIPTION_MANIFESTATION
#------------------------------------------------------------

CREATE TABLE INSCRIPTION_MANIFESTATION(
        Id_Inscription_Manifestation int (11) Auto_increment  NOT NULL ,
        Nombre_Inscrit               Int NOT NULL ,
        Id_Manifestation             Int NOT NULL ,
        PRIMARY KEY (Id_Inscription_Manifestation ,Id_Manifestation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: VOTE
#------------------------------------------------------------

CREATE TABLE VOTE(
        Id_Vote     int (11) Auto_increment  NOT NULL ,
        Nombre_Vote Int NOT NULL ,
        Id_Activite Int NOT NULL ,
        PRIMARY KEY (Id_Vote ,Id_Activite )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: EVENEMENT_PASSE
#------------------------------------------------------------

CREATE TABLE EVENEMENT_PASSE(
        Id_Evenement_Passe    int (11) Auto_increment  NOT NULL ,
        Nom_Evenement_Passe   Varchar (25) NOT NULL ,
        Photo_Evenement_Passe Numeric NOT NULL ,
        PRIMARY KEY (Id_Evenement_Passe )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: COMMENTAIRE
#------------------------------------------------------------

CREATE TABLE COMMENTAIRE(
        Id_Commentaire          int (11) Auto_increment  NOT NULL ,
        Description_Commentaire Varchar (124) NOT NULL ,
        Id_Evenement_Passe      Int NOT NULL ,
        PRIMARY KEY (Id_Commentaire ,Id_Evenement_Passe )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: LIKE
#------------------------------------------------------------

CREATE TABLE LIKES(
        Id_Likes			   int (11) Auto_increment  NOT NULL ,
        Nombre_Likes        Int NOT NULL ,
        Id_Evenement_Passe Int NOT NULL ,
        PRIMARY KEY (Id_Likes ,Id_Evenement_Passe )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MANIFESTATION
#------------------------------------------------------------

CREATE TABLE MANIFESTATION(
        Id_Manifestation          int (11) Auto_increment  NOT NULL ,
        Nom_Manifestion           Varchar (25) NOT NULL ,
        Description_Manifestation Varchar (124) NOT NULL ,
        Date_Manifestation        Datetime NOT NULL ,
        Lieu_Manifestation        Varchar (25) NOT NULL ,
        Photo_Manifestation       Varchar (25) NOT NULL ,
        Statut_Manifestation      Varchar (25) NOT NULL ,
        Id_Utilisateur            Int NOT NULL ,
        Id_Activite               Int NOT NULL ,
        PRIMARY KEY (Id_Manifestation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PRODUIT
#------------------------------------------------------------

CREATE TABLE PRODUIT(
        Id_Produit          int (11) Auto_increment  NOT NULL ,
        Nom_Produit         Varchar (25) NOT NULL ,
        Description_Produit Varchar (50) NOT NULL ,
        Prix_Produit        DECIMAL (15,3)  NOT NULL ,
        Nombre_Vendu        Int NOT NULL ,
        Categorie           Varchar (25) NOT NULL ,
        PRIMARY KEY (Id_Produit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PANIER
#------------------------------------------------------------

CREATE TABLE PANIER(
        Id_Panier   int (11) Auto_increment  NOT NULL ,
        Quantite    Int NOT NULL ,
        Prix_Panier DECIMAL (15,3)  NOT NULL ,
        PRIMARY KEY (Id_Panier )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ETUDIANT
#------------------------------------------------------------

CREATE TABLE ETUDIANT(
        Id_Utilisateur               Int NOT NULL ,
        Id_Inscription_Manifestation Int NOT NULL ,
        Id_Manifestation             Int NOT NULL ,
        PRIMARY KEY (Id_Utilisateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MEMBRE
#------------------------------------------------------------

CREATE TABLE MEMBRE(
        Id_Utilisateur Int NOT NULL ,
        PRIMARY KEY (Id_Utilisateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PERSONNEL
#------------------------------------------------------------

CREATE TABLE PERSONNEL(
        Id_Utilisateur Int NOT NULL ,
        PRIMARY KEY (Id_Utilisateur )
)ENGINE=InnoDB;




#------------------------------------------------------------
# SCRIPT RELATIONS TABLES
#------------------------------------------------------------





#------------------------------------------------------------
# Table: Proposer
#------------------------------------------------------------

CREATE TABLE Proposer(
        Id_Utilisateur             Int NOT NULL ,
        Id_Activite                Int NOT NULL ,
        Id_Utilisateur_UTILISATEUR Int NOT NULL ,
        PRIMARY KEY (Id_Utilisateur ,Id_Activite ,Id_Utilisateur_UTILISATEUR )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Notifier
#------------------------------------------------------------

CREATE TABLE Notifier(
        Id_Utilisateur             Int NOT NULL ,
        Id_Utilisateur_UTILISATEUR Int NOT NULL ,
        PRIMARY KEY (Id_Utilisateur ,Id_Utilisateur_UTILISATEUR )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Administrer 
#------------------------------------------------------------

CREATE TABLE Administrer(
        Id_Evenement_Passe Int NOT NULL ,
        Id_Utilisateur     Int NOT NULL ,
        PRIMARY KEY (Id_Evenement_Passe ,Id_Utilisateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Contenir
#------------------------------------------------------------

CREATE TABLE Contenir(
        Id_Produit Int NOT NULL ,
        Id_Panier  Int NOT NULL ,
        PRIMARY KEY (Id_Produit ,Id_Panier )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Gerer
#------------------------------------------------------------

CREATE TABLE Gerer(
        Id_Utilisateur Int NOT NULL ,
        Id_Produit     Int NOT NULL ,
        PRIMARY KEY (Id_Utilisateur ,Id_Produit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Effectuer
#------------------------------------------------------------

CREATE TABLE Effectuer(
        Id_Utilisateur Int NOT NULL ,
        Id_Panier      Int NOT NULL ,
        PRIMARY KEY (Id_Utilisateur ,Id_Panier )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Voter
#------------------------------------------------------------

CREATE TABLE Voter(
        Id_Utilisateur             Int NOT NULL ,
        Id_Utilisateur_UTILISATEUR Int NOT NULL ,
        Id_Vote                    Int NOT NULL ,
        Id_Activite                Int NOT NULL ,
        PRIMARY KEY (Id_Utilisateur ,Id_Utilisateur_UTILISATEUR ,Id_Vote ,Id_Activite )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Archiver
#------------------------------------------------------------

CREATE TABLE Archiver(
        Id_Manifestation   Int NOT NULL ,
        Id_Evenement_Passe Int NOT NULL ,
        PRIMARY KEY (Id_Manifestation ,Id_Evenement_Passe )
)ENGINE=InnoDB;

ALTER TABLE ACTIVITE ADD CONSTRAINT FK_ACTIVITE_Id_Manifestation FOREIGN KEY (Id_Manifestation) REFERENCES MANIFESTATION(Id_Manifestation);
ALTER TABLE INSCRIPTION_MANIFESTATION ADD CONSTRAINT FK_INSCRIPTION_MANIFESTATION_Id_Manifestation FOREIGN KEY (Id_Manifestation) REFERENCES MANIFESTATION(Id_Manifestation);
ALTER TABLE VOTE ADD CONSTRAINT FK_VOTE_Id_Activite FOREIGN KEY (Id_Activite) REFERENCES ACTIVITE(Id_Activite);
ALTER TABLE COMMENTAIRE ADD CONSTRAINT FK_COMMENTAIRE_Id_Evenement_Passe FOREIGN KEY (Id_Evenement_Passe) REFERENCES EVENEMENT_PASSE(Id_Evenement_Passe);
ALTER TABLE LIKES ADD CONSTRAINT FK_LIKES_Id_Evenement_Passe FOREIGN KEY (Id_Evenement_Passe) REFERENCES EVENEMENT_PASSE(Id_Evenement_Passe);
ALTER TABLE MANIFESTATION ADD CONSTRAINT FK_MANIFESTATION_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE MANIFESTATION ADD CONSTRAINT FK_MANIFESTATION_Id_Activite FOREIGN KEY (Id_Activite) REFERENCES ACTIVITE(Id_Activite);
ALTER TABLE ETUDIANT ADD CONSTRAINT FK_ETUDIANT_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE ETUDIANT ADD CONSTRAINT FK_ETUDIANT_Id_Inscription_Manifestation FOREIGN KEY (Id_Inscription_Manifestation) REFERENCES INSCRIPTION_MANIFESTATION(Id_Inscription_Manifestation);
ALTER TABLE ETUDIANT ADD CONSTRAINT FK_ETUDIANT_Id_Manifestation FOREIGN KEY (Id_Manifestation) REFERENCES MANIFESTATION(Id_Manifestation);
ALTER TABLE MEMBRE ADD CONSTRAINT FK_MEMBRE_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE PERSONNEL ADD CONSTRAINT FK_PERSONNEL_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE Proposer ADD CONSTRAINT FK_Proposer_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE Proposer ADD CONSTRAINT FK_Proposer_Id_Activite FOREIGN KEY (Id_Activite) REFERENCES ACTIVITE(Id_Activite);
ALTER TABLE Proposer ADD CONSTRAINT FK_Proposer_Id_Utilisateur_UTILISATEUR FOREIGN KEY (Id_Utilisateur_UTILISATEUR) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE Notifier ADD CONSTRAINT FK_Notifier_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE Notifier ADD CONSTRAINT FK_Notifier_Id_Utilisateur_UTILISATEUR FOREIGN KEY (Id_Utilisateur_UTILISATEUR) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE Administrer ADD CONSTRAINT FK_Administrer_Id_Evenement_Passe FOREIGN KEY (Id_Evenement_Passe) REFERENCES EVENEMENT_PASSE(Id_Evenement_Passe);
ALTER TABLE Administrer ADD CONSTRAINT FK_Administrer_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE Contenir ADD CONSTRAINT FK_Contenir_Id_Produit FOREIGN KEY (Id_Produit) REFERENCES PRODUIT(Id_Produit);
ALTER TABLE Contenir ADD CONSTRAINT FK_Contenir_Id_Panier FOREIGN KEY (Id_Panier) REFERENCES PANIER(Id_Panier);
ALTER TABLE Gerer ADD CONSTRAINT FK_Gerer_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE Gerer ADD CONSTRAINT FK_Gerer_Id_Produit FOREIGN KEY (Id_Produit) REFERENCES PRODUIT(Id_Produit);
ALTER TABLE Effectuer ADD CONSTRAINT FK_Effectuer_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE Effectuer ADD CONSTRAINT FK_Effectuer_Id_Panier FOREIGN KEY (Id_Panier) REFERENCES PANIER(Id_Panier);
ALTER TABLE Voter ADD CONSTRAINT FK_Voter_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE Voter ADD CONSTRAINT FK_Voter_Id_Utilisateur_UTILISATEUR FOREIGN KEY (Id_Utilisateur_UTILISATEUR) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE Voter ADD CONSTRAINT FK_Voter_Id_Vote FOREIGN KEY (Id_Vote) REFERENCES VOTE(Id_Vote);
ALTER TABLE Voter ADD CONSTRAINT FK_Voter_Id_Activite FOREIGN KEY (Id_Activite) REFERENCES ACTIVITE(Id_Activite);
ALTER TABLE Archiver ADD CONSTRAINT FK_Archiver_Id_Manifestation FOREIGN KEY (Id_Manifestation) REFERENCES MANIFESTATION(Id_Manifestation);
ALTER TABLE Archiver ADD CONSTRAINT FK_Archiver_Id_Evenement_Passe FOREIGN KEY (Id_Evenement_Passe) REFERENCES EVENEMENT_PASSE(Id_Evenement_Passe);
