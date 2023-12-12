DROP DATABASE IF EXISTS MLR1;

CREATE DATABASE IF NOT EXISTS MLR1;
USE MLR1;
# -----------------------------------------------------------------------------
#       TABLE : TRANSPORTEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TRANSPORTEUR
 (
   IDT CHAR(32) NOT NULL  ,
   NOMT CHAR(32) NULL  
   , PRIMARY KEY (IDT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : TYPEOPERATION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TYPEOPERATION
 (
   CODETO CHAR(32) NOT NULL  ,
   LIBELLETO CHAR(32) NULL  
   , PRIMARY KEY (CODETO) 
 ) 
 comment = "";

 
 

# -----------------------------------------------------------------------------
#       TABLE : COULEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COULEUR
 (
   CODEC CHAR(32) NOT NULL  ,
   LIBELLEC CHAR(32) NULL  
   , PRIMARY KEY (CODEC) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : GARAGE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS GARAGE
 (
   IDG CHAR(32) NOT NULL  ,
   NOMG CHAR(32) NULL  ,
   ADRESSEG CHAR(32) NULL  ,
   MARQUEG CHAR(32) NULL  ,
   TELG CHAR(32) NULL  ,
   FORFAITG CHAR(32) NULL  ,
   AVANCEACCEPTER CHAR(32) NULL  
   , PRIMARY KEY (IDG) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : MODETRANSPORT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MODETRANSPORT
 (
   IDMT CHAR(32) NOT NULL  ,
   LIBELLE CHAR(32) NULL  
   , PRIMARY KEY (IDMT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : TECHNICIENASSISTANCE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TECHNICIENASSISTANCE
 (
   IDTA CHAR(32) NOT NULL  ,
   NOMTA CHAR(32) NULL  ,
   PRENOMTA CHAR(32) NULL  
   , PRIMARY KEY (IDTA) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : HOTEL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS HOTEL
 (
   IDH CHAR(32) NOT NULL  ,
   NOMH CHAR(32) NULL  ,
   ADRESSEH CHAR(32) NULL  ,
   TELH CHAR(32) NULL  ,
   PRIXNUITÉEH CHAR(32) NULL  
   , PRIMARY KEY (IDH) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : DATES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DATES
 (
   DATE CHAR(32) NOT NULL  
   , PRIMARY KEY (DATE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CONTRAT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CONTRAT
 (
   IDC CHAR(32) NOT NULL  ,
   IDTC CHAR(32) NOT NULL  ,
   NUMADH CHAR(32) NOT NULL  ,
   PRIXC CHAR(32) NULL  ,
   IMMATRICULATIONV CHAR(32) NULL  ,
   MARQUEV CHAR(32) NULL  ,
   TYPEV CHAR(32) NULL  ,
   MODELEV CHAR(32) NULL  ,
   DATEMISEENCIRCULATIONV CHAR(32) NULL  
   , PRIMARY KEY (IDC) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CONTRAT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CONTRAT_TYPECONTRAT
     ON CONTRAT (IDTC ASC);

CREATE  INDEX I_FK_CONTRAT_ADHERENT
     ON CONTRAT (NUMADH ASC);

# -----------------------------------------------------------------------------
#       TABLE : ADHERENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ADHERENT
 (
   NUMADH CHAR(32) NOT NULL  ,
   NOMADH CHAR(32) NULL  ,
   PRENOMADH CHAR(32) NULL  ,
   ADRESSEADH CHAR(32) NULL  ,
   CODEPOSTALADH CHAR(32) NULL  ,
   VILLEADH CHAR(32) NULL  ,
   TELADH CHAR(32) NULL  
   , PRIMARY KEY (NUMADH) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : EVALUATION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EVALUATION
 (
   IDH CHAR(32) NOT NULL  ,
   IDDS CHAR(32) NOT NULL  ,
   CODEC CHAR(32) NOT NULL  
   , PRIMARY KEY (IDH,IDDS) 
 ) 
 comment = "";
 
 

 
 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EVALUATION
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EVALUATION_COULEUR
     ON EVALUATION (CODEC ASC);

CREATE  INDEX I_FK_EVALUATION_DOSSIERSINISTRE
     ON EVALUATION (IDDS ASC);

CREATE  INDEX I_FK_EVALUATION_HOTEL
     ON EVALUATION (IDH ASC);

# -----------------------------------------------------------------------------
#       TABLE : TYPECONTRAT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TYPECONTRAT
 (
   IDTC CHAR(32) NOT NULL  ,
   NOMTC CHAR(32) NULL  
   , PRIMARY KEY (IDTC) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : DOSSIERSINISTRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DOSSIERSINISTRE
 (
   IDDS CHAR(32) NOT NULL  ,
   IDG CHAR(32) NOT NULL  ,
   IDTA CHAR(32) NOT NULL  ,
   IDC CHAR(32) NOT NULL  ,
   DATES CHAR(32) NULL  ,
   HEURES CHAR(32) NULL  ,
   CAUSE CHAR(32) NULL  ,
   DIAGNOSTIC CHAR(32) NULL  ,
   LIEU CHAR(32) NULL  ,
   NBPERSONNES CHAR(32) NULL  
   , PRIMARY KEY (IDDS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE DOSSIERSINISTRE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_DOSSIERSINISTRE_GARAGE
     ON DOSSIERSINISTRE (IDG ASC);

CREATE  INDEX I_FK_DOSSIERSINISTRE_TECHNICIENASSISTANCE
     ON DOSSIERSINISTRE (IDTA ASC);

CREATE  INDEX I_FK_DOSSIERSINISTRE_CONTRAT
     ON DOSSIERSINISTRE (IDC ASC);

# -----------------------------------------------------------------------------
#       TABLE : ETAPE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ETAPE
 (
   IDDS CHAR(32) NOT NULL  ,
   NUMORDRE CHAR(32) NOT NULL  ,
   IDMT CHAR(32) NOT NULL  ,
   IDT CHAR(32) NOT NULL  ,
   HORAIRE CHAR(32) NULL  ,
   COUT CHAR(32) NULL  ,
   VILLEDEPART CHAR(32) NULL  ,
   VILLEARRIVER CHAR(32) NULL  
   , PRIMARY KEY (IDDS,NUMORDRE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ETAPE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ETAPE_DOSSIERSINISTRE
     ON ETAPE (IDDS ASC);

CREATE  INDEX I_FK_ETAPE_MODETRANSPORT
     ON ETAPE (IDMT ASC);

CREATE  INDEX I_FK_ETAPE_TRANSPORTEUR
     ON ETAPE (IDT ASC);

# -----------------------------------------------------------------------------
#       TABLE : PROPOSER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PROPOSER
 (
   IDT CHAR(32) NOT NULL  ,
   IDMT CHAR(32) NOT NULL  
   , PRIMARY KEY (IDT,IDMT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PROPOSER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PROPOSER_TRANSPORTEUR
     ON PROPOSER (IDT ASC);

CREATE  INDEX I_FK_PROPOSER_MODETRANSPORT
     ON PROPOSER (IDMT ASC);

# -----------------------------------------------------------------------------
#       TABLE : EFFECTUER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EFFECTUER
 (
   CODETO CHAR(32) NOT NULL  ,
   IDDS CHAR(32) NOT NULL  
   , PRIMARY KEY (CODETO,IDDS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EFFECTUER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EFFECTUER_TYPEOPERATION
     ON EFFECTUER (CODETO ASC);

CREATE  INDEX I_FK_EFFECTUER_DOSSIERSINISTRE
     ON EFFECTUER (IDDS ASC);

# -----------------------------------------------------------------------------
#       TABLE : HEBERGER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS HEBERGER
 (
   IDDS CHAR(32) NOT NULL  ,
   DATE CHAR(32) NOT NULL  ,
   IDH CHAR(32) NOT NULL  ,
   NBNUITÉES CHAR(32) NULL  
   , PRIMARY KEY (IDDS,DATE,IDH) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE HEBERGER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_HEBERGER_DOSSIERSINISTRE
     ON HEBERGER (IDDS ASC);

CREATE  INDEX I_FK_HEBERGER_DATES
     ON HEBERGER (DATE ASC);

CREATE  INDEX I_FK_HEBERGER_HOTEL
     ON HEBERGER (IDH ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE CONTRAT 
  ADD FOREIGN KEY FK_CONTRAT_TYPECONTRAT (IDTC)
      REFERENCES TYPECONTRAT (IDTC) ;


ALTER TABLE CONTRAT 
  ADD FOREIGN KEY FK_CONTRAT_ADHERENT (NUMADH)
      REFERENCES ADHERENT (NUMADH) ;


ALTER TABLE EVALUATION 
  ADD FOREIGN KEY FK_EVALUATION_COULEUR (CODEC)
      REFERENCES COULEUR (CODEC) ;


ALTER TABLE EVALUATION 
  ADD FOREIGN KEY FK_EVALUATION_DOSSIERSINISTRE (IDDS)
      REFERENCES DOSSIERSINISTRE (IDDS) ;


ALTER TABLE EVALUATION 
  ADD FOREIGN KEY FK_EVALUATION_HOTEL (IDH)
      REFERENCES HOTEL (IDH) ;


ALTER TABLE DOSSIERSINISTRE 
  ADD FOREIGN KEY FK_DOSSIERSINISTRE_GARAGE (IDG)
      REFERENCES GARAGE (IDG) ;


ALTER TABLE DOSSIERSINISTRE 
  ADD FOREIGN KEY FK_DOSSIERSINISTRE_TECHNICIENASSISTANCE (IDTA)
      REFERENCES TECHNICIENASSISTANCE (IDTA) ;


ALTER TABLE DOSSIERSINISTRE 
  ADD FOREIGN KEY FK_DOSSIERSINISTRE_CONTRAT (IDC)
      REFERENCES CONTRAT (IDC) ;


ALTER TABLE ETAPE 
  ADD FOREIGN KEY FK_ETAPE_DOSSIERSINISTRE (IDDS)
      REFERENCES DOSSIERSINISTRE (IDDS) ;


ALTER TABLE ETAPE 
  ADD FOREIGN KEY FK_ETAPE_MODETRANSPORT (IDMT)
      REFERENCES MODETRANSPORT (IDMT) ;


ALTER TABLE ETAPE 
  ADD FOREIGN KEY FK_ETAPE_TRANSPORTEUR (IDT)
      REFERENCES TRANSPORTEUR (IDT) ;


ALTER TABLE PROPOSER 
  ADD FOREIGN KEY FK_PROPOSER_TRANSPORTEUR (IDT)
      REFERENCES TRANSPORTEUR (IDT) ;


ALTER TABLE PROPOSER 
  ADD FOREIGN KEY FK_PROPOSER_MODETRANSPORT (IDMT)
      REFERENCES MODETRANSPORT (IDMT) ;


ALTER TABLE EFFECTUER 
  ADD FOREIGN KEY FK_EFFECTUER_TYPEOPERATION (CODETO)
      REFERENCES TYPEOPERATION (CODETO) ;


ALTER TABLE EFFECTUER 
  ADD FOREIGN KEY FK_EFFECTUER_DOSSIERSINISTRE (IDDS)
      REFERENCES DOSSIERSINISTRE (IDDS) ;


ALTER TABLE HEBERGER 
  ADD FOREIGN KEY FK_HEBERGER_DOSSIERSINISTRE (IDDS)
      REFERENCES DOSSIERSINISTRE (IDDS) ;


ALTER TABLE HEBERGER 
  ADD FOREIGN KEY FK_HEBERGER_DATES (DATE)
      REFERENCES DATES (DATE) ;


ALTER TABLE HEBERGER 
  ADD FOREIGN KEY FK_HEBERGER_HOTEL (IDH)
      REFERENCES HOTEL (IDH) ;
      
      
      
      
 -- Ajout de données à la table TRANSPORTEUR
INSERT INTO TRANSPORTEUR (IDT, NOMT) VALUES
  ('T1', 'Transporteur 1'),
  ('T2', 'Transporteur 2'),
  ('T3', 'Transporteur 3');

-- Ajout de données à la table TYPEOPERATION
INSERT INTO TYPEOPERATION (CODETO, LIBELLETO) VALUES
  ('TO1', 'Type Opération 1'),
  ('TO2', 'Type Opération 2'),
  ('TO3', 'Type Opération 3');

-- Ajout de données à la table COULEUR
INSERT INTO COULEUR (CODEC, LIBELLEC) VALUES
  ('C1', 'Jaune'),
  ('C2', 'Couleur 2'),
  ('C3', 'Couleur 3');

-- Ajout de données à la table GARAGE
INSERT INTO GARAGE (IDG, NOMG, ADRESSEG, MARQUEG, TELG, FORFAITG, AVANCEACCEPTER) VALUES
  ('G1', 'Garage 1', 'Adresse 1', 'Marque 1', '123456789', 'Forfait 1', 'Oui'),
  ('G2', 'Garage 2', 'Adresse 2', 'Marque 2', '987654321', 'Forfait 2', 'Non'),
  ('G3', 'Garage 3', 'Adresse 3', 'Marque 3', '456789123', 'Forfait 3', 'Oui');

-- Ajout de données à la table MODETRANSPORT
INSERT INTO MODETRANSPORT (IDMT, LIBELLE) VALUES
  ('MT1', 'Mode Transport 1'),
  ('MT2', 'Mode Transport 2'),
  ('MT3', 'Mode Transport 3');

-- Ajout de données à la table TECHNICIENASSISTANCE
INSERT INTO TECHNICIENASSISTANCE (IDTA, NOMTA, PRENOMTA) VALUES
  ('TA1', 'Technicien 1', 'Assistance 1'),
  ('TA2', 'Technicien 2', 'Assistance 2'),
  ('TA3', 'Technicien 3', 'Assistance 3');

-- Ajout de données à la table HOTEL
INSERT INTO HOTEL (IDH, NOMH, ADRESSEH, TELH, PRIXNUITÉEH) VALUES
  ('H1', 'Hôtel Océan', 'Adresse H1', '111222333', '50'),
  ('H2', 'Hôtel 2', 'Adresse H2', '444555666', '70'),
  ('H3', 'Hôtel 3', 'Adresse H3', '777888999', '90');

-- Ajout de données à la table DATES
INSERT INTO DATES (DATE) VALUES
  ('2023-01-01'),
  ('2023-02-01'),
  ('2023-03-01');


-- Ajout de données à la table ADHERENT
INSERT INTO ADHERENT (NUMADH, NOMADH, PRENOMADH, ADRESSEADH, CODEPOSTALADH, VILLEADH, TELADH) VALUES
  ('A1', 'Nom1', 'Prenom1', 'Adresse1', '12345', 'Ville1', '111111111'),
  ('A2', 'Nom2', 'Prenom2', 'Adresse2', '67890', 'Ville2', '222222222'),
  ('A3', 'Nom3', 'Prenom3', 'Adresse3', 'ABCDE', 'Ville3', '333333333');


-- Ajout de données à la table TYPECONTRAT
INSERT INTO TYPECONTRAT (IDTC, NOMTC) VALUES
  ('TC1', 'TypeContrat1'),
  ('TC2', 'TypeContrat2'),
  ('TC3', 'TypeContrat3');

-- Ajout de données à la table CONTRAT
INSERT INTO CONTRAT (IDC, IDTC, NUMADH, PRIXC, IMMATRICULATIONV, MARQUEV, TYPEV, MODELEV, DATEMISEENCIRCULATIONV) VALUES
  ('C1', 'TC1', 'A1', '1000', '123ABC', 'Voiture 1', 'Type 1', 'Modele 1', '2023-01-01'),
  ('C2', 'TC2', 'A2', '1500', '456DEF', 'Voiture 2', 'Type 2', 'Modele 2', '2023-02-01'),
  ('C3', 'TC3', 'A3', '2000', '789GHI', 'Voiture 3', 'Type 3', 'Modele 3', '2023-03-01');



-- Ajout de données à la table DOSSIERSINISTRE
INSERT INTO DOSSIERSINISTRE (IDDS, IDG, IDTA, IDC, DATES, HEURES, CAUSE, DIAGNOSTIC, LIEU, NBPERSONNES) VALUES
  ('DS1', 'G1', 'TA1', 'C1', '2023-01-15', '10:30:00', 'Accident', 'Dégâts mineurs', 'Lieu1', '2'),
  ('DS2', 'G2', 'TA2', 'C2', '2023-02-20', '14:45:00', 'Vol', 'Dégâts importants', 'Lieu2', '3'),
  ('DS3', 'G3', 'TA3', 'C3', '2023-03-25', '08:15:00', 'Incendie', 'Dégâts majeurs', 'Lieu3', '5');

-- Ajout de données à la table EVALUATION
INSERT INTO EVALUATION (IDH, IDDS, CODEC) VALUES
  ('H1', 'DS1', 'C1'),
  ('H2', 'DS2', 'C2'),
  ('H3', 'DS3', 'C3');

-- Ajout de données à la table ETAPE
INSERT INTO ETAPE (IDDS, NUMORDRE, IDMT, IDT, HORAIRE, COUT, VILLEDEPART, VILLEARRIVER) VALUES
  ('DS1', '1', 'MT1', 'T1', '12:00:00', '500', 'VilleDepart1', 'VilleArrivee1');
 

