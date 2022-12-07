-- Axel ou Yasmine
CREATE TABLE Personnel
(
    idPersonnel INT CONSTRAINT UnePersonne PRIMARY KEY,
    nom VARCHAR,
    prenom VARCHAR,
    date_de_naissance DATE,
    adress VARCHAR,
    date_de_recrutement DATE,
);

-- Axel ou Yasmine
CREATE TABLE Scientifique(
    idScientique INT NOT NULL,
    idPersonnel INT NOT NULL,
    grade VARCHAR,
    PRIMARY KEY(idPersonnel)
);

-- Nathan
CREATE Evenement(
    idEvenement INT NOT NULL,
    dateDebut DATE,
    dateFin DATE,
    PRIMARY KEY (idEvenement)
);

-- Nathan
CREATE Journee_Porte_Ouvertes(
    idPorteOuverte INT NOT NULL,
    FOREIGN KEY (idPorteOuverte) REFERENCES Evenement(idEvenement),
    PRIMARY KEY (idPorteOuverte)
);

-- Nathan
CREATE Auteur_Externe (
    idAuteur INT NOT NULL,
    nom VARCHAR,
    prenom VARCHAR,
    adresseMail VARCHAR,
    idLabo INT NOT NULL,
    FOREIGN KEY (idLabo) REFERENCES LaboExterne(idLabo),
    PRIMARY KEY (idAuteur)

);

CREATE Labo_externe(
    idLabo INT NOT NULL,
    nom VARCHAR,
    pays VARCHAR,
    PRIMARY KEY(idLabo)
);

-- Nathan
CREATE Publication (
    idPublication INT NOT NULL,
    titre VARCHAR,
    annee DATE,
    nomConf VARCHAR,
    classeConf VARCHAR,
    nbPages INT,
    PRIMARY KEY (idPublication)
);

-- Ronan
CREATE Participe(
    idProjet INT NOT NULL,
    idScientifique INT NOT NULL,
    FOREIGN KEY (idProjet) REFERENCES Projet(idProjet),
    FOREIGN KEY (idScientifique) REFERENCES Scientifique(idScientifique),
    PRIMARY KEY (idProjet, idScientifique)
);

-- Ronan
CREATE Preside(
    idCongres INT NOT NULL,
    idScientifique INT NOT NULL,
    FOREIGN KEY (idCongres) REFERENCES Congres(idCongres),
    FOREIGN KEY (idScientifique) REFERENCES Scientifique(idScientifique),
    PRIMARY KEY (idCongres, idScientifique)
);

-- Ronan
CREATE Publie_Scientifique(
    idPublication INT NOT NULL,
    idScientifique INT NOT NULL,
    FOREIGN KEY (idPublication) REFERENCES Publication(idPublication),
    FOREIGN KEY (idScientifique) REFERENCES Scientifique(idScientifique),
    PRIMARY KEY (idPublication, idScientifique)
);

-- Ronan
CREATE Publie_Doctorant(
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
