CREATE TABLE Personnel
(
    idPersonnel INT CONSTRAINT UnePersonne PRIMARY KEY,
    nom CHAR,
    prenom CHAR,
    date_de_naissance DATE,
    adress CHAR,
    date_de_recrutement DATE,
);

CREATE TABLE Doctorant(
    idDoctorant INT NOT NULL,
    date_debut_these DATE,
    date_soutenance DATE
    FOREIGN KEY (idPersonnel) REFERENCES Personnel(idPersonnel),
    PRIMARY KEY(idPersonnel)
);

CREATE TABLE Scientifique(
    idScientique INT NOT NULL,
    idPersonnel INT NOT NULL,
    grade CHAR,
    FOREIGN KEY (idPersonnel) REFERENCES Personnel(idPersonnel),
    PRIMARY KEY(idPersonnel)
);

CREATE Publication (
    idPublication SERIAL NOT NULL,
    titre TEXT,

);

CREATE Participe(
    idProjet INT NOT NULL,
    idScientifique INT NOT NULL,
    FOREIGN KEY (idProjet) REFERENCES Projet(idProjet),
    FOREIGN KEY (idScientifique) REFERENCES Scientifique(idScientifique),
    PRIMARY KEY (idProjet, idScientifique)
);

CREATE Preside(
    idCongres INT NOT NULL,
    idScientifique INT NOT NULL,
    FOREIGN KEY (idCongres) REFERENCES Congres(idCongres),
    FOREIGN KEY (idScientifique) REFERENCES Scientifique(idScientifique),
    PRIMARY KEY (idCongres, idScientifique)
);

CREATE Publie_Scientifique(
    idPublication INT NOT NULL,
    idScientifique INT NOT NULL,
    FOREIGN KEY (idPublication) REFERENCES Publication(idPublication),
    FOREIGN KEY (idScientifique) REFERENCES Scientifique(idScientifique),
    PRIMARY KEY (idPublication, idScientifique)
);

CREATE Publie_Doctorant(
    idPublication INT NOT NULL,
    idDoctorant INT NOT NULL,
    FOREIGN KEY (idPublication) REFERENCES Publication(idPublication),
    FOREIGN KEY (idDoctorant) REFERENCES Doctorant(idDoctorant),
    PRIMARY KEY (idPublication, idDoctorant)
);

CREATE TABLE Publie_Externe(
    idPublication INT NOT NULL,
    idAuteurExterne INT NOT NULL,
    FOREIGN KEY (idPublication) REFERENCES Publication(idPublication),
    FOREIGN KEY (idAuteurExterne) REFERENCES Auteur_Externe(idAuteur),
    PRIMARY KEY (idPublication, idAuteurExterne)

);

CREATE TABLE Participe_Externe(
    idProjet INT NOT NULL,
    idPartenaire INT NOT NULL,
    FOREIGN KEY (idProjet) REFERENCES Projet(idProjet),
    FOREIGN KEY (idPartenaire) REFERENCES Partenaire(idPartenaire),
    PRIMARY KEY (idProjet, idPartenaire)
);

CREATE TABLE Organise (
    idPortesOuverte INT NOT NULL,
    idPersonnel INT NOT NULL,
    FOREIGN KEY (idPortesOuverte) REFERENCES Journee_Portes_Ouvertes(idPorte_Ouverte),
    FOREIGN KEY (idPersonnel) REFERENCES Personnel(idPersonnel),
    PRIMARY KEY(idPortesOuverte, idPersonnel)
);
