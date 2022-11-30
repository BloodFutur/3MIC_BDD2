CREATE TABLE Personnel
(
    idPersonnel int CONSTRAINT UnePersonne PRIMARY KEY,
    nom char,
    prenom char,
    date_de_naissance date,
    adress char,
    date_de_recrutement date,
);


CREATE TABLE Organise (
    idPortesOuverte INT NOT NULL,
    idPersonnel INT NOT NULL,
    FOREIGN KEY (idPortesOuverte) REFERENCES Journee_Portes_Ouvertes(idPorte_Ouverte),
    FOREIGN KEY (idPersonnel) REFERENCES Personnel(idPersonnel),
    PRIMARY KEY(idPortesOuverte, idPersonnel)
);