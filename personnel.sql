CREATE TABLE Personnel
(
    idPersonnel INT CONSTRAINT UnePersonne PRIMARY KEY,
    nom CHAR,
    prenom CHAR,
    date_de_naissance DATE,
    adress CHAR,
    date_de_recrutement DATE,
);

CREATE 


CREATE TABLE Scientifique(
    idScientique INT NOT NULL,
    idPersonnel INT NOT NULL,
    grade CHAR,
    PRIMARY KEY(idPersonnel)
);

CREATE TABLE Publie_Externe(
    idPublication INT NOT NULL,
    idAuteurExterne INT NOT NULL,
    FOREIGN KEY (idPublication) REFERENCES Publication(idPublication),
    FOREIGN KEY (idAuteurExterne) REFERENCES Auteur_Externe(idAuteur)

);

CREATE TABLE Participe_Externe(
    idProjet INT NOT NULL,
    idPartenaire INT NOT NULL,
    FOREIGN KEY (idProjet) REFERENCES Projet(idProjet),
    FOREIGN KEY (idPartenaire) REFERENCES Partenaire(idPartenaire)
);

CREATE TABLE Organise (
    idPortesOuverte INT NOT NULL,
    idPersonnel INT NOT NULL,
    FOREIGN KEY (idPortesOuverte) REFERENCES Journee_Portes_Ouvertes(idPorte_Ouverte),
    FOREIGN KEY (idPersonnel) REFERENCES Personnel(idPersonnel),
    PRIMARY KEY(idPortesOuverte, idPersonnel)
);