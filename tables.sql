-- Nathan
CREATE TYPE echelon AS ENUM (
    'A*',
    'A',
    'B',
    'C'
);

-- Nathan
CREATE TYPE grade AS ENUM (
    'cr1',
    'cr2',
    'mcf',
    'mcf hors classe'
);

-- Axel
CREATE TABLE Personnel
(
    idPersonnel INT CONSTRAINT UnePersonne PRIMARY KEY,
    nom VARCHAR,
    prenom VARCHAR,
    date_de_naissance DATE,
    adress VARCHAR,
    date_de_recrutement DATE
);

--Axel
CREATE TABLE Doctorant(
    idDoctorant INT NOT NULL,
    date_debut_these DATE,
    date_soutenance DATE,
    FOREIGN KEY (idDoctorant) REFERENCES Personnel(idPersonnel) ON DELETE CASCADE,
    PRIMARY KEY(idDoctorant)
);

--Yasmine
CREATE TABLE Scientifique(
    idScientifique INT NOT NULL,
    grade VARCHAR,
    FOREIGN KEY (idScientifique) REFERENCES Personnel(idPersonnel) ON DELETE CASCADE,
    PRIMARY KEY (idScientifique)
);


--Axel
CREATE TABLE Etablissement(
    idEtablissement INT NOT NULL CONSTRAINT UnEtablissement PRIMARY Key,
    nom VARCHAR,
    acronyme VARCHAR,
    adresse VARCHAR
);

--Axel
CREATE TABLE Enseignant_Chercheur(
    idEnseignant INT NOT NULL,
    idEtablissement INT NOT NULL,
    echelon ECHELON,
    FOREIGN KEY (idEtablissement) REFERENCES Etablissement(idEtablissement) ON DELETE CASCADE,
    FOREIGN KEY (idEnseignant) REFERENCES Personnel(idPersonnel) ON DELETE CASCADE,
    PRIMARY KEY (idEnseignant)
);


-- Nathan
CREATE TABLE Evenement(
    idEvenement INT NOT NULL,
    dateDebut DATE,
    dateFin DATE,
    PRIMARY KEY (idEvenement)
);

-- Ronan
CREATE TABLE Congres(
    idCongres INT NOT NULL,
    nb_inscriptions INT NOT NULL,
    classe VARCHAR(15),
    PRIMARY KEY (idCongres),
    CONSTRAINT fk_congres
        FOREIGN KEY (idCongres) 
            REFERENCES Evenement(idEvenement) 
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

-- Ronan
CREATE TABLE Labo_externe(
    idLabo SERIAL PRIMARY KEY,
    nom VARCHAR(255),
    pays VARCHAR(255),
);

-- Ronan
CREATE TABLE Journee_Portes_Ouvertes(
    idPorteOuverte INT NOT NULL,
    PRIMARY KEY (idPorteOuverte),
    CONSTRAINT fk_jpo
        FOREIGN KEY (idPorteOuverte) 
            REFERENCES Evenement(idEvenement) 
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

-- Nathan
CREATE TABLE Auteur_Externe (
    idAuteur INT NOT NULL,
    nom VARCHAR,
    prenom VARCHAR,
    adresseMail VARCHAR,
    idLabo INT NOT NULL,
    FOREIGN KEY (idLabo) REFERENCES Labo_Externe(idLabo) ON DELETE CASCADE,
    PRIMARY KEY (idAuteur)
);

-- Nathan
CREATE TABLE Publication(
    idPublication INT NOT NULL,
    titre VARCHAR,
    annee DATE,
    nomConf VARCHAR,
    classeConf VARCHAR,
    nbPages INT,
    PRIMARY KEY (idPublication)
);

--Yasmine
CREATE TABLE Projet (
    idProjet INT NOT NULL,
    titre VARCHAR,
    acronyme VARCHAR,
    annee_debut DATE,
    annee_fin DATE,
    duree INT NOT NULL,
    budget_Laas INT NOT NULL,
    cout INT NOT NULL,
    idMeneurProjet INT NOT NULL,
    FOREIGN KEY (idMeneurProjet) REFERENCES Scientifique(idScientifique) ON DELETE CASCADE,
    PRIMARY KEY(idProjet)
);

-- Ronan
CREATE TABLE Participe(
    idProjet INT NOT NULL,
    idScientifique INT NOT NULL,
    PRIMARY KEY (idProjet, idScientifique),
    CONSTRAINT fk_Projet
        FOREIGN KEY (idProjet) 
            REFERENCES Projet(idProjet) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_Scientifique
        FOREIGN KEY (idScientifique) 
            REFERENCES Scientifique(idScientifique) 
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

-- Ronan
CREATE TABLE Preside(
    idCongres INT NOT NULL,
    idScientifique INT NOT NULL,
    PRIMARY KEY (idCongres, idScientifique),
    CONSTRAINT fk_Congres
        FOREIGN KEY (idCongres) 
            REFERENCES Congres(idCongres) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_Scientifique
        FOREIGN KEY (idScientifique) 
        REFERENCES Scientifique(idScientifique) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Ronan
CREATE TABLE Publie_Scientifique(
    idPublication INT NOT NULL,
    idScientifique INT NOT NULL,
    PRIMARY KEY (idPublication, idScientifique),
    
    CONSTRAINT fk_Publication
        FOREIGN KEY (idPublication) 
            REFERENCES Publication(idPublication) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_Scientifique
        FOREIGN KEY (idScientifique) 
            REFERENCES Scientifique(idScientifique) 
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

-- Ronan
CREATE TABLE Publie_Doctorant(
    idPublication INT NOT NULL,
    idDoctorant INT NOT NULL,
    PRIMARY KEY (idPublication, idDoctorant),
    CONSTRAINT fk_Publication
        FOREIGN KEY (idPublication) 
            REFERENCES Publication(idPublication) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_Doctorant
        FOREIGN KEY (idDoctorant) 
            REFERENCES Doctorant(idDoctorant) 
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

-- Ronan
CREATE TABLE Publie_Externe(
    idPublication INT NOT NULL,
    idAuteurExterne INT NOT NULL,
    PRIMARY KEY (idPublication, idAuteurExterne),
    CONSTRAINT fk_Publication
        FOREIGN KEY (idPublication) 
            REFERENCES Publication(idPublication) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_AuteurExterne
        FOREIGN KEY (idAuteurExterne) 
            REFERENCES Auteur_Externe(idAuteur) 
            ON DELETE CASCADE
            ON UPDATE
);

--Yasmine
CREATE TABLE Partenaire(
    idPartenaire INT NOT NULL,
    nom VARCHAR,
    pays VARCHAR,
    PRIMARY KEY(idPartenaire)
);

-- Ronan
CREATE TABLE Participe_Externe(
    idProjet INT NOT NULL,
    idPartenaire INT NOT NULL,
    PRIMARY KEY (idProjet, idPartenaire),
    CONSTRAINT fk_Projet
        FOREIGN KEY (idProjet) 
            REFERENCES Projet(idProjet) 
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_Partenaire
        FOREIGN KEY (idPartenaire) 
            REFERENCES Partenaire(idPartenaire) 
            ON DELETE CASCADE
            ON UPDATE CASCADE
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
    FOREIGN KEY (idDoctorant) REFERENCES Doctorant(idDoctorant) ON DELETE CASCADE,
    FOREIGN KEY (idScientifique) REFERENCES Scientifique(idScientifique) ON DELETE CASCADE,
    PRIMARY KEY(idScientifique,idDoctorant)
);

