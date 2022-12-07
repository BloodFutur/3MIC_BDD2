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
    FOREIGN KEY (idDoctorant) REFERENCES Personnel(idPersonnel),
    PRIMARY KEY(idDoctorant)
);

--Yasmine
CREATE TABLE Scientifique(
    idScientique INT NOT NULL,
    idPersonnel INT NOT NULL,
    grade CHAR,
    FOREIGN KEY (idPersonnel) REFERENCES Personnel(idPersonnel),
    PRIMARY KEY(idPersonnel)
);


--Axel
CREATE TABLE Etablissement(
    idEtablissement INT CONSTRAINT UnEtablissement PRIMARY Key,
    nom VARCHAR,
    acronyme VARCHAR,
    adresse VARCHAR
);

--Axel
CREATE TABLE Enseignant_Chercheur(
    idEnseignant INT NOT NULL,
    echelon ECHELON,
    FOREIGN KEY (idEtablissement) REFERENCES UnEtablissement,
    FOREIGN KEY (idEnseignant) REFERENCES Personnel(idPersonnel),
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
    class VARCHAR,
    FOREIGN KEY (idCongres) REFERENCES Evenement(idEvenement),
    PRIMARY KEY (idCongres)
);

-- Ronan
CREATE TABLE Labo_externe(
    idLabo INT NOT NULL,
    nom VARCHAR,
    pays VARCHAR,
    PRIMARY KEY(idLabo)
);

-- Nathan
CREATE TABLE Evenement(
    PRIMARY KEY(idEvenement),
    date_debut DATE,
    date_fin DATE,
);

CREATE TABLE Journee_Porte_Ouvertes(
    idPorteOuverte INT NOT NULL,
    FOREIGN KEY (idPorteOuverte) REFERENCES Evenement(idEvenement),
    PRIMARY KEY (idPorteOuverte)
);

-- Nathan
CREATE TABLE Auteur_Externe (
    idAuteur INT NOT NULL,
    nom VARCHAR,
    prenom VARCHAR,
    adresseMail VARCHAR,
    idLabo INT NOT NULL,
    FOREIGN KEY (idLabo) REFERENCES Labo_Externe(idLabo),
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

-- Ronan
CREATE TABLE Participe(
    idProjet INT NOT NULL,
    idScientifique INT NOT NULL,
    FOREIGN KEY (idProjet) REFERENCES Projet(idProjet),
    FOREIGN KEY (idScientifique) REFERENCES Scientifique(idScientifique),
    PRIMARY KEY (idProjet, idScientifique)
);

-- Ronan
CREATE TABLE Preside(
    FOREIGN KEY (idCongres) REFERENCES Congres(idCongres),
    FOREIGN KEY (idScientifique) REFERENCES Scientifique(idScientifique),
    PRIMARY KEY (idCongres, idScientifique)
);

-- Ronan
CREATE TABLE Publie_Scientifique(
    idPublication INT NOT NULL,
    idScientifique INT NOT NULL,
    FOREIGN KEY (idPublication) REFERENCES Publication(idPublication),
    FOREIGN KEY (idScientifique) REFERENCES Scientifique(idScientifique),
    PRIMARY KEY (idPublication, idScientifique)
);

-- Ronan
CREATE TABLE Publie_Doctorant(
    idPublication INT NOT NULL,
    idDoctorant INT NOT NULL,
    FOREIGN KEY (idPublication) REFERENCES Publication(idPublication),
    FOREIGN KEY (idDoctorant) REFERENCES Doctorant(idDoctorant),
    PRIMARY KEY (idPublication, idDoctorant)
);

-- Ronan
CREATE TABLE Publie_Externe(
    idPublication INT NOT NULL,
    idAuteurExterne INT NOT NULL,
    FOREIGN KEY (idPublication) REFERENCES Publication(idPublication),
    FOREIGN KEY (idAuteurExterne) REFERENCES Auteur_Externe(idAuteur),
    PRIMARY KEY (idPublication, idAuteurExterne)
);

-- Ronan
CREATE TABLE Participe_Externe(
    idProjet INT NOT NULL,
    idPartenaire INT NOT NULL,
    FOREIGN KEY (idProjet) REFERENCES Projet(idProjet),
    FOREIGN KEY (idPartenaire) REFERENCES Partenaire(idPartenaire),
    PRIMARY KEY (idProjet, idPartenaire)
);

-- Ronan
CREATE TABLE Organise (
    idPortesOuverte INT NOT NULL,
    idPersonnel INT NOT NULL,
    FOREIGN KEY (idPortesOuverte) REFERENCES Journee_Portes_Ouvertes(idPorte_Ouverte),
    FOREIGN KEY (idPersonnel) REFERENCES Personnel(idPersonnel),
    PRIMARY KEY(idPortesOuverte, idPersonnel)
);
--Yasmine
CREATE TABLE Projet (
    titre char,
    acronyme char,
    annee_debut date,
    annee_fin char,
    duree INT NOT NULL,
    budget_Laas INT NOT NULL,
    cout INT NOT NULL,
    FOREIGN KEY (idScientifique) REFERENCES Scientifique(idScientifique),
    PRIMARY KEY(idProjet)
);
--Yasmine
CREATE TABLE Encadrement (
    idDoctorant INT NOT NULL,
    idScientifique INT NOT NULL,
    FOREIGN KEY (idDoctorant) REFERENCES Doctorant(idDoctorant),
    FOREIGN KEY (idScientifique) REFERENCES Scientifique(idScientifique),
    PRIMARY KEY(idScientifique,idDoctorant)
);

--Yasmine

CREATE TABLE Partenaire(
    PRIMARY KEY(idPartenaire),
    nom char,
    pays char
);




