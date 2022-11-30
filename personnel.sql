CREATE TABLE Personnel
(
    idPersonnel int CONSTRAINT UnePersonne PRIMARY KEY,
    nom char,
    prenom char,
    date_de_naissance date,
    adress char,
    date_de_recrutement date,
);

CREATE Preside(
    idCongres INT NOT NULL,
    idScientifique INT NOT NULL,
    FOREIGN KEY (idCongres) REFERENCES Congres(idCongres),
    FOREIGN KEY (idScientifique) REFERENCES Scientifique(idScientifique)
);

CREATE Publie_Scientifique(
    idPublication INT NOT NULL,
    idScientifique INT NOT NULL,
    FOREIGN KEY (idPublication) REFERENCES Publication(idPublication),
    FOREIGN KEY (idScientifique) REFERENCES Scientifique(idScientifique)
);

CREATE Publie_Doctorant(
    idPublication INT NOT NULL,
    idDoctorant INT NOT NULL,
    FOREIGN KEY (idPublication) REFERENCES Publication(idPublication),
    FOREIGN KEY (idDoctorant) REFERENCES Doctorant(idDoctorant)
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