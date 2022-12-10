-- Nathan
CREATE TYPE T_CLASSECONF AS ENUM (
    'A*',
    'A',
    'B',
    'C'
);

-- Nathan
CREATE TYPE T_GRADE AS ENUM (
    'cr1',
    'cr2',
    'mcf',
    'mcf hors classe'
);

CREATE TYPE T_ECHELON AS ENUM (
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7'
);

-- Axel
CREATE TABLE Personnel
(
    idPersonnel SERIAL NOT NULL,
    nom VARCHAR,
    prenom VARCHAR,
    date_de_naissance DATE,
    adress VARCHAR,
    date_de_recrutement DATE,
    CONSTRAINT pk_Personnel
        PRIMARY KEY (idPersonnel)
);

--Axel
CREATE TABLE Doctorant(
    idDoctorant INT NOT NULL,
    date_debut_these DATE,
    date_soutenance DATE,
    CONSTRAINT fk_doctorant
        FOREIGN KEY (idDoctorant)
            REFERENCES Personnel(idPersonnel)
                ON DELETE CASCADE
                ON UPDATE CASCADE,
    CONSTRAINT pk_doctorant
        PRIMARY KEY(idDoctorant)
);

--Yasmine
CREATE TABLE Scientifique(
    idScientifique INT NOT NULL,
    grade T_GRADE,
    CONSTRAINT fk_scientifique
        FOREIGN KEY (idScientifique)
            REFERENCES Personnel(idPersonnel)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT pk_scientifique
        PRIMARY KEY(idScientifique)
);


--Axel
CREATE TABLE Etablissement(
    idEtablissement SERIAL NOT NULL,
    nom VARCHAR,
    acronyme VARCHAR,
    adresse VARCHAR,
    CONSTRAINT pk_etablissement
        PRIMARY KEY (idEtablissement)
);

--Axel
CREATE TABLE Enseignant_Chercheur(
    idEnseignant INT NOT NULL,
    idEtablissement INT NOT NULL,
    echelon T_ECHELON,
    CONSTRAINT fk_etablissement
        FOREIGN KEY (idEtablissement)
            REFERENCES Etablissement(idEtablissement)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_enseignant
        FOREIGN KEY (idEnseignant)
            REFERENCES Personnel(idPersonnel)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT pk_enseignant
        PRIMARY KEY (idEnseignant)
);


-- Nathan
CREATE TABLE Evenement(
    idEvenement SERIAL NOT NULL,
    dateDebut DATE,
    dateFin DATE,
    CONSTRAINT pk_evenement
        PRIMARY KEY (idEvenement)
);

-- Ronan
CREATE TABLE Congres(
    idCongres INT NOT NULL,
    nb_inscriptions INT NOT NULL,
    classe T_CLASSECONF,
    CONSTRAINT fk_congres
        FOREIGN KEY (idCongres) 
            REFERENCES Evenement(idEvenement) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT pk_congres
        PRIMARY KEY (idCongres)
);

-- Ronan
CREATE TABLE Labo_externe(
    idLabo SERIAL NOT NULL,
    nom VARCHAR(255),
    pays VARCHAR(255),
    CONSTRAINT pk_laboo
        PRIMARY KEY (idLabo)
);

-- Ronan
CREATE TABLE Journee_Portes_Ouvertes(
    idPorteOuverte INT NOT NULL,
    CONSTRAINT fk_porteOuverte
        FOREIGN KEY (idPorteOuverte) 
            REFERENCES Evenement(idEvenement) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT pk_porteOuverte
        PRIMARY KEY (idPorteOuverte)
);

-- Nathan
CREATE TABLE Auteur_Externe (
    idAuteur SERIAL NOT NULL,
    nom VARCHAR,
    prenom VARCHAR,
    adresseMail VARCHAR,
    idLabo INT NOT NULL,
    CONSTRAINT fk_labo
        FOREIGN KEY (idLabo)
            REFERENCES Labo_Externe(idLabo)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT pk_auteur
        PRIMARY KEY (idAuteur)
);

-- Nathan
CREATE TABLE Publication(
    idPublication SERIAL NOT NULL,
    titre VARCHAR,
    annee DATE,
    nomConf VARCHAR,
    classeConf T_CLASSECONF,
    nbPages INT,
    CONSTRAINT pk_publication
        PRIMARY KEY (idPublication)
);

--Yasmine
CREATE TABLE Projet (
    idProjet SERIAL NOT NULL,
    titre VARCHAR,
    acronyme VARCHAR,
    annee_debut DATE,
    annee_fin DATE,
    duree INT NOT NULL,
    budget_Laas INT NOT NULL,
    cout INT NOT NULL,
    idMeneurProjet INT NOT NULL,
    CONSTRAINT fk_idMeneurProjet
        FOREIGN KEY (idMeneurProjet)
            REFERENCES Scientifique(idScientifique)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT pk_projet
        PRIMARY KEY(idProjet)
);

-- Ronan
CREATE TABLE Participe(
    idProjet INT NOT NULL,
    idScientifique INT NOT NULL,
    CONSTRAINT fk_Projet
        FOREIGN KEY (idProjet) 
            REFERENCES Projet(idProjet) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_Scientifique
        FOREIGN KEY (idScientifique) 
            REFERENCES Scientifique(idScientifique) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT pk_participe
        PRIMARY KEY (idProjet, idScientifique)
);

-- Ronan
CREATE TABLE Preside(
    idCongres INT NOT NULL,
    idScientifique INT NOT NULL,
    CONSTRAINT fk_Congres
        FOREIGN KEY (idCongres) 
            REFERENCES Congres(idCongres) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_Scientifique
        FOREIGN KEY (idScientifique) 
            REFERENCES Scientifique(idScientifique)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT pk_preside
        PRIMARY KEY (idCongres, idScientifique)
);

-- Ronan
CREATE TABLE Publie_Scientifique(
    idPublication INT NOT NULL,
    idScientifique INT NOT NULL,
    CONSTRAINT fk_Publication
        FOREIGN KEY (idPublication) 
            REFERENCES Publication(idPublication) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_Scientifique
        FOREIGN KEY (idScientifique) 
            REFERENCES Scientifique(idScientifique) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT pk_publieScientifique
        PRIMARY KEY (idPublication, idScientifique)
);

-- Ronan
CREATE TABLE Publie_Doctorant(
    idPublication INT NOT NULL,
    idDoctorant INT NOT NULL,
    CONSTRAINT fk_Publication
        FOREIGN KEY (idPublication) 
            REFERENCES Publication(idPublication) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_Doctorant
        FOREIGN KEY (idDoctorant) 
            REFERENCES Doctorant(idDoctorant) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT pk_publieDoctorant
        PRIMARY KEY (idPublication, idDoctorant)
);

-- Ronan
CREATE TABLE Publie_Externe(
    idPublication INT NOT NULL,
    idAuteurExterne INT NOT NULL,
    CONSTRAINT fk_Publication
        FOREIGN KEY (idPublication) 
            REFERENCES Publication(idPublication) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_AuteurExterne
        FOREIGN KEY (idAuteurExterne) 
            REFERENCES Auteur_Externe(idAuteur) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT pk_publieExterne
        PRIMARY KEY (idPublication, idAuteurExterne)
);

--Yasmine
CREATE TABLE Partenaire(
    idPartenaire SERIAL NOT NULL,
    nom VARCHAR,
    pays VARCHAR,
    CONSTRAINT pk_partenaire
        PRIMARY KEY(idPartenaire)
);

-- Ronan
CREATE TABLE Participe_Externe(
    idProjet INT NOT NULL,
    idPartenaire INT NOT NULL,
    CONSTRAINT fk_Projet
        FOREIGN KEY (idProjet) 
            REFERENCES Projet(idProjet) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_Partenaire
        FOREIGN KEY (idPartenaire) 
            REFERENCES Partenaire(idPartenaire) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT pk_participeExterne
        PRIMARY KEY (idProjet, idPartenaire)
);

-- Ronan
CREATE TABLE Organise (
    idPortesOuverte INT NOT NULL,
    idPersonnel INT NOT NULL,
    PRIMARY KEY(idPortesOuverte, idPersonnel),
    CONSTRAINT fk_jpo
        FOREIGN KEY (idPortesOuverte) 
            REFERENCES Journee_Portes_Ouvertes(idPorteOuverte) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_Personnel
        FOREIGN KEY (idPersonnel) 
            REFERENCES Personnel(idPersonnel) 
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

--Yasmine
CREATE TABLE Encadrement (
    idDoctorant INT NOT NULL,
    idScientifique INT NOT NULL,
    CONSTRAINT fk_doctorant
        FOREIGN KEY (idDoctorant)
            REFERENCES Doctorant(idDoctorant)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_scientifique
        FOREIGN KEY (idScientifique)
            REFERENCES Scientifique(idScientifique)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT pk_encadrement
        PRIMARY KEY(idScientifique,idDoctorant)
);

