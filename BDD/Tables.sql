#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
CREATE DATABASE bde_cesi_lyon;

#------------------------------------------------------------
# Table: UTILISATEUR
#------------------------------------------------------------

CREATE TABLE UTILISATEUR(
        Id_Utilisateur             int (11) Auto_increment  NOT NULL ,
        Nom_Utilisateur            Varchar (100) NOT NULL ,
        Prenom_Utilisateur         Varchar (100) NOT NULL ,
        Mail_Utilisateur           Varchar (255) NOT NULL ,
        Mdp_Utilisateur            Varchar (255) NOT NULL ,
        Statut_Utilisateur         Varchar (25) NOT NULL ,
        Etat_Connexion_Utilisateur Bool ,
        PRIMARY KEY (Id_Utilisateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ACTIVITE
#------------------------------------------------------------

CREATE TABLE ACTIVITE(
        Id_Activite          int (11) Auto_increment  NOT NULL ,
        Nom_Activite         Varchar (100) NOT NULL ,
        Description_Activite Varchar (124) NOT NULL ,
        Validation_Activite  Bool NULL,
        Nombre_Vote          Int NULL,
        Nom_Utilisateur      Varchar (100) NOT NULL , 
        Prenom_Utilisateur   Varchar (100) NOT NULL ,
        Id_Manifestation     Int NULL ,
        PRIMARY KEY (Id_Activite )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: INSCRIPTION_MANIFESTATION
#------------------------------------------------------------

CREATE TABLE INSCRIPTION_MANIFESTATION(
        Id_Inscription_Manifestation int (11) Auto_increment  NOT NULL ,
        Nom_Manifestation            Varchar (100) NOT NULL ,
        Mail_Utilisateur			 Varchar (100) NOT NULL ,
        Statut_Utilisateur			 Varchar (25) NOT NULL ,
        
        PRIMARY KEY (Id_Inscription_Manifestation )
)ENGINE=InnoDB;



#------------------------------------------------------------
# Table: COMMENTAIRE
#------------------------------------------------------------

CREATE TABLE COMMENTAIRE(
        Id_Commentaire          int (11) Auto_increment  NOT NULL ,
        Description_Commentaire Varchar (124) NOT NULL ,
        Id_Image                Varchar (255) NULL,
        Id_Evenement_Passe      Int NULL ,
        Id_Manifestation        Int NULL ,
        Id_Utilisateur			Int NUll,
        PRIMARY KEY (Id_Commentaire)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MANIFESTATION
#------------------------------------------------------------

CREATE TABLE MANIFESTATION(
        Id_Manifestation          int (11) Auto_increment  NOT NULL ,
        Nom_Manifestation           Varchar (255) ,
        Description_Manifestation Varchar (255) ,
        Photo_Manifestation       Varchar (255) NOT NULL,
        Date_Manifestation        Varchar (255) ,
        Lieu_Manifestation        Varchar (255) ,
        Statut_Manifestation      Varchar (255) ,
        Info_Manifestation        Varchar (255) NOT NULL ,
        Event_Passe				  Boolean DEFAULT false,
        Nombre_Manifestation      Int ,
        Id_Activite               Int NULL ,
        PRIMARY KEY (Id_Manifestation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PRODUIT
#------------------------------------------------------------

CREATE TABLE PRODUIT(
        Id_Produit          int (11) Auto_increment  NOT NULL ,
        Nom_Produit         Varchar (50) NOT NULL,
        Description_Produit Varchar (255) NOT NULL,
        Img_Produit         Varchar (255) NOT NULL,
        Prix_Produit        DECIMAL (15,3)  NOT NULL,
        Nom_Categorie       Varchar (50) NOT NULL ,
        Nombre_Vendu        Int NULL,
        PRIMARY KEY (Id_Produit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: COMMANDE
#------------------------------------------------------------

CREATE TABLE COMMANDE(
        Id_Commande   int (11) Auto_increment  NOT NULL ,
        Prix_Commande DECIMAL (15,3)  NOT NULL ,
        PRIMARY KEY (Id_Commande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: IMAGE
#------------------------------------------------------------

CREATE TABLE IMAGE(
        Id_Image           int (11) Auto_increment  NOT NULL ,
        Image              Varchar (255) NOT NULL,
        Nombre_Like        Int ,
        Id_Manifestation   Int NULL,
        PRIMARY KEY (Id_Image )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CATEGORIE
#------------------------------------------------------------

CREATE TABLE CATEGORIE(
        Id_Categorie   int (11) Auto_increment  NOT NULL ,
        Nom_Categorie  Varchar (50) NOT NULL ,
        PRIMARY KEY (Id_Categorie )
)ENGINE=InnoDB;



ALTER TABLE ACTIVITE ADD CONSTRAINT FK_ACTIVITE_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE ACTIVITE ADD CONSTRAINT FK_ACTIVITE_Id_Manifestation FOREIGN KEY (Id_Manifestation) REFERENCES MANIFESTATION(Id_Manifestation);
ALTER TABLE INSCRIPTION_MANIFESTATION ADD CONSTRAINT FK_INSCRIPTION_MANIFESTATION_Id_Manifestation FOREIGN KEY (Id_Manifestation) REFERENCES MANIFESTATION(Id_Manifestation);
ALTER TABLE COMMENTAIRE ADD CONSTRAINT FK_COMMENTAIRE_Id_Image FOREIGN KEY (Id_Image) REFERENCES IMAGE(Id_Image);
ALTER TABLE COMMENTAIRE ADD CONSTRAINT FK_COMMENTAIRE_Id_Evenement_Passe FOREIGN KEY (Id_Evenement_Passe) REFERENCES EVENEMENT_PASSE(Id_Evenement_Passe);
ALTER TABLE COMMENTAIRE ADD CONSTRAINT FK_COMMENTAIRE_Id_Manifestation FOREIGN KEY (Id_Manifestation) REFERENCES MANIFESTATION(Id_Manifestation);
ALTER TABLE MANIFESTATION ADD CONSTRAINT FK_MANIFESTATION_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE MANIFESTATION ADD CONSTRAINT FK_MANIFESTATION_Id_Activite FOREIGN KEY (Id_Activite) REFERENCES ACTIVITE(Id_Activite);
ALTER TABLE PRODUIT ADD CONSTRAINT FK_PRODUIT_Id_Categorie FOREIGN KEY (Id_Categorie) REFERENCES CATEGORIE(Id_Categorie);
ALTER TABLE IMAGE ADD CONSTRAINT FK_IMAGE_Id_Evenement_Passe FOREIGN KEY (Id_Evenement_Passe) REFERENCES EVENEMENT_PASSE(Id_Evenement_Passe);
ALTER TABLE IMAGE ADD CONSTRAINT FK_IMAGE_Id_Manifestation FOREIGN KEY (Id_Manifestation) REFERENCES MANIFESTATION(Id_Manifestation);
