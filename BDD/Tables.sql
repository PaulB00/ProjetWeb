#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: UTILISATEUR
#------------------------------------------------------------

CREATE TABLE UTILISATEUR(
        Id_Utilisateur             int (11) Auto_increment  NOT NULL ,
        Nom_Utilisateur            Varchar (50) NOT NULL ,
        Prenom_Utilisateur         Varchar (50) NOT NULL ,
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
        Nom_Activite         Varchar (25) NOT NULL ,
        Description_Activite Varchar (124) NOT NULL ,
        Validation_Activite  Bool ,
        Nombre_Vote          Int ,
        Id_Utilisateur       Int NOT NULL ,
        Id_Manifestation     Int NOT NULL ,
        PRIMARY KEY (Id_Activite )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: INSCRIPTION_MANIFESTATION
#------------------------------------------------------------

CREATE TABLE INSCRIPTION_MANIFESTATION(
        Id_Inscription_Manifestation int (11) Auto_increment  NOT NULL ,
        Id_Manifestation             Int NOT NULL ,
        PRIMARY KEY (Id_Inscription_Manifestation ,Id_Manifestation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: EVENEMENT_PASSE
#------------------------------------------------------------

CREATE TABLE EVENEMENT_PASSE(
        Id_Evenement_Passe int (11) Auto_increment  NOT NULL ,
        Id_Manifestation   Int NOT NULL ,
        PRIMARY KEY (Id_Evenement_Passe ,Id_Manifestation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: COMMENTAIRE
#------------------------------------------------------------

CREATE TABLE COMMENTAIRE(
        Id_Commentaire          int (11) Auto_increment  NOT NULL ,
        Description_Commentaire Varchar (124) NOT NULL ,
        Id_Image                Int NOT NULL ,
        Id_Evenement_Passe      Int NOT NULL ,
        Id_Manifestation        Int NOT NULL ,
        PRIMARY KEY (Id_Commentaire ,Id_Image ,Id_Evenement_Passe ,Id_Manifestation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MANIFESTATION
#------------------------------------------------------------

CREATE TABLE MANIFESTATION(
        Id_Manifestation          int (11) Auto_increment  NOT NULL ,
        Nom_Manifestion           Varchar (25) ,
        Description_Manifestation Varchar (124) ,
        Photo_Manifestation       Numeric NOT NULL ,
        Date_Manifestation        Varchar (25) ,
        Lieu_Manifestation        Varchar (25) ,
        Statut_Manifestation      Varchar (25) ,
        Info_Manifestation        Varchar (255) NOT NULL ,
        Nombre_Manifestation      Int ,
        Id_Utilisateur            Int NOT NULL ,
        Id_Activite               Int NOT NULL ,
        PRIMARY KEY (Id_Manifestation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PRODUIT
#------------------------------------------------------------

CREATE TABLE PRODUIT(
        Id_Produit          int (11) Auto_increment  NOT NULL ,
        Nom_Produit         Varchar (25) ,
        Description_Produit Varchar (50) ,
        Img_Produit         Numeric NOT NULL ,
        Prix_Produit        DECIMAL (15,3)  ,
        Nombre_Vendu        Int ,
        Id_Categorie        Int NOT NULL ,
        PRIMARY KEY (Id_Produit ,Id_Categorie )
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
        Image              Numeric ,
        Nombre_Like        Int ,
        Id_Evenement_Passe Int NOT NULL ,
        Id_Manifestation   Int NOT NULL ,
        PRIMARY KEY (Id_Image ,Id_Evenement_Passe ,Id_Manifestation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CATEGORIE
#------------------------------------------------------------

CREATE TABLE CATEGORIE(
        Id_Categorie   int (11) Auto_increment  NOT NULL ,
        Nom_Categorie  Varchar (50) NOT NULL ,
        Id_Utilisateur Int NOT NULL ,
        PRIMARY KEY (Id_Categorie )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Administrer 
#------------------------------------------------------------

CREATE TABLE Administrer(
        Id_Evenement_Passe Int NOT NULL ,
        Id_Manifestation   Int NOT NULL ,
        Id_Utilisateur     Int NOT NULL ,
        PRIMARY KEY (Id_Evenement_Passe ,Id_Manifestation ,Id_Utilisateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Contenir
#------------------------------------------------------------

CREATE TABLE Contenir(
        Id_Produit   Int NOT NULL ,
        Id_Categorie Int NOT NULL ,
        Id_Commande  Int NOT NULL ,
        PRIMARY KEY (Id_Produit ,Id_Categorie ,Id_Commande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Gerer
#------------------------------------------------------------

CREATE TABLE Gerer(
        Id_Produit     Int NOT NULL ,
        Id_Categorie   Int NOT NULL ,
        Id_Utilisateur Int NOT NULL ,
        PRIMARY KEY (Id_Produit ,Id_Categorie ,Id_Utilisateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Effectuer
#------------------------------------------------------------

CREATE TABLE Effectuer(
        Id_Commande    Int NOT NULL ,
        Id_Utilisateur Int NOT NULL ,
        PRIMARY KEY (Id_Commande ,Id_Utilisateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Inscrire
#------------------------------------------------------------

CREATE TABLE Inscrire(
        Id_Inscription_Manifestation Int NOT NULL ,
        Id_Manifestation             Int NOT NULL ,
        Id_Utilisateur               Int NOT NULL ,
        PRIMARY KEY (Id_Inscription_Manifestation ,Id_Manifestation ,Id_Utilisateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ajouter
#------------------------------------------------------------

CREATE TABLE Ajouter(
        Id_Utilisateur     Int NOT NULL ,
        Id_Image           Int NOT NULL ,
        Id_Evenement_Passe Int NOT NULL ,
        Id_Manifestation   Int NOT NULL ,
        PRIMARY KEY (Id_Utilisateur ,Id_Image ,Id_Evenement_Passe ,Id_Manifestation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commenter
#------------------------------------------------------------

CREATE TABLE Commenter(
        Id_Utilisateur     Int NOT NULL ,
        Id_Commentaire     Int NOT NULL ,
        Id_Image           Int NOT NULL ,
        Id_Evenement_Passe Int NOT NULL ,
        Id_Manifestation   Int NOT NULL ,
        PRIMARY KEY (Id_Utilisateur ,Id_Commentaire ,Id_Image ,Id_Evenement_Passe ,Id_Manifestation )
)ENGINE=InnoDB;

ALTER TABLE ACTIVITE ADD CONSTRAINT FK_ACTIVITE_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE ACTIVITE ADD CONSTRAINT FK_ACTIVITE_Id_Manifestation FOREIGN KEY (Id_Manifestation) REFERENCES MANIFESTATION(Id_Manifestation);
ALTER TABLE INSCRIPTION_MANIFESTATION ADD CONSTRAINT FK_INSCRIPTION_MANIFESTATION_Id_Manifestation FOREIGN KEY (Id_Manifestation) REFERENCES MANIFESTATION(Id_Manifestation);
ALTER TABLE EVENEMENT_PASSE ADD CONSTRAINT FK_EVENEMENT_PASSE_Id_Manifestation FOREIGN KEY (Id_Manifestation) REFERENCES MANIFESTATION(Id_Manifestation);
ALTER TABLE COMMENTAIRE ADD CONSTRAINT FK_COMMENTAIRE_Id_Image FOREIGN KEY (Id_Image) REFERENCES IMAGE(Id_Image);
ALTER TABLE COMMENTAIRE ADD CONSTRAINT FK_COMMENTAIRE_Id_Evenement_Passe FOREIGN KEY (Id_Evenement_Passe) REFERENCES EVENEMENT_PASSE(Id_Evenement_Passe);
ALTER TABLE COMMENTAIRE ADD CONSTRAINT FK_COMMENTAIRE_Id_Manifestation FOREIGN KEY (Id_Manifestation) REFERENCES MANIFESTATION(Id_Manifestation);
ALTER TABLE MANIFESTATION ADD CONSTRAINT FK_MANIFESTATION_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE MANIFESTATION ADD CONSTRAINT FK_MANIFESTATION_Id_Activite FOREIGN KEY (Id_Activite) REFERENCES ACTIVITE(Id_Activite);
ALTER TABLE PRODUIT ADD CONSTRAINT FK_PRODUIT_Id_Categorie FOREIGN KEY (Id_Categorie) REFERENCES CATEGORIE(Id_Categorie);
ALTER TABLE IMAGE ADD CONSTRAINT FK_IMAGE_Id_Evenement_Passe FOREIGN KEY (Id_Evenement_Passe) REFERENCES EVENEMENT_PASSE(Id_Evenement_Passe);
ALTER TABLE IMAGE ADD CONSTRAINT FK_IMAGE_Id_Manifestation FOREIGN KEY (Id_Manifestation) REFERENCES MANIFESTATION(Id_Manifestation);
ALTER TABLE CATEGORIE ADD CONSTRAINT FK_CATEGORIE_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE Administrer ADD CONSTRAINT FK_Administrer_Id_Evenement_Passe FOREIGN KEY (Id_Evenement_Passe) REFERENCES EVENEMENT_PASSE(Id_Evenement_Passe);
ALTER TABLE Administrer ADD CONSTRAINT FK_Administrer_Id_Manifestation FOREIGN KEY (Id_Manifestation) REFERENCES MANIFESTATION(Id_Manifestation);
ALTER TABLE Administrer ADD CONSTRAINT FK_Administrer_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE Contenir ADD CONSTRAINT FK_Contenir_Id_Produit FOREIGN KEY (Id_Produit) REFERENCES PRODUIT(Id_Produit);
ALTER TABLE Contenir ADD CONSTRAINT FK_Contenir_Id_Categorie FOREIGN KEY (Id_Categorie) REFERENCES CATEGORIE(Id_Categorie);
ALTER TABLE Contenir ADD CONSTRAINT FK_Contenir_Id_Commande FOREIGN KEY (Id_Commande) REFERENCES COMMANDE(Id_Commande);
ALTER TABLE Gerer ADD CONSTRAINT FK_Gerer_Id_Produit FOREIGN KEY (Id_Produit) REFERENCES PRODUIT(Id_Produit);
ALTER TABLE Gerer ADD CONSTRAINT FK_Gerer_Id_Categorie FOREIGN KEY (Id_Categorie) REFERENCES CATEGORIE(Id_Categorie);
ALTER TABLE Gerer ADD CONSTRAINT FK_Gerer_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE Effectuer ADD CONSTRAINT FK_Effectuer_Id_Commande FOREIGN KEY (Id_Commande) REFERENCES COMMANDE(Id_Commande);
ALTER TABLE Effectuer ADD CONSTRAINT FK_Effectuer_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE Inscrire ADD CONSTRAINT FK_Inscrire_Id_Inscription_Manifestation FOREIGN KEY (Id_Inscription_Manifestation) REFERENCES INSCRIPTION_MANIFESTATION(Id_Inscription_Manifestation);
ALTER TABLE Inscrire ADD CONSTRAINT FK_Inscrire_Id_Manifestation FOREIGN KEY (Id_Manifestation) REFERENCES MANIFESTATION(Id_Manifestation);
ALTER TABLE Inscrire ADD CONSTRAINT FK_Inscrire_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE Ajouter ADD CONSTRAINT FK_Ajouter_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE Ajouter ADD CONSTRAINT FK_Ajouter_Id_Image FOREIGN KEY (Id_Image) REFERENCES IMAGE(Id_Image);
ALTER TABLE Ajouter ADD CONSTRAINT FK_Ajouter_Id_Evenement_Passe FOREIGN KEY (Id_Evenement_Passe) REFERENCES EVENEMENT_PASSE(Id_Evenement_Passe);
ALTER TABLE Ajouter ADD CONSTRAINT FK_Ajouter_Id_Manifestation FOREIGN KEY (Id_Manifestation) REFERENCES MANIFESTATION(Id_Manifestation);
ALTER TABLE Commenter ADD CONSTRAINT FK_Commenter_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE Commenter ADD CONSTRAINT FK_Commenter_Id_Commentaire FOREIGN KEY (Id_Commentaire) REFERENCES COMMENTAIRE(Id_Commentaire);
ALTER TABLE Commenter ADD CONSTRAINT FK_Commenter_Id_Image FOREIGN KEY (Id_Image) REFERENCES IMAGE(Id_Image);
ALTER TABLE Commenter ADD CONSTRAINT FK_Commenter_Id_Evenement_Passe FOREIGN KEY (Id_Evenement_Passe) REFERENCES EVENEMENT_PASSE(Id_Evenement_Passe);
ALTER TABLE Commenter ADD CONSTRAINT FK_Commenter_Id_Manifestation FOREIGN KEY (Id_Manifestation) REFERENCES MANIFESTATION(Id_Manifestation);
