----------------------------------------------------------------------
--                                                                  --
--                    Personnel                                     --
--                                                                  --
----------------------------------------------------------------------

-- Nathan
INSERT INTO Personnel(nom, prenom, date_de_naissance, adress, date_de_recrutement) VALUES (
    'Billard',
    'Nathan',
    DATE '2000-12-25',
    '15 avenue du Colonel Roche',
    DATE '2020-9-15'
);

INSERT INTO Personnel(nom, prenom, date_de_naissance, adress, date_de_recrutement) VALUES (
    'Bonnet',
    'Ronan',
    DATE '2002-12-25',
    'chez Ronan',
    '2020-9-15'
);

INSERT INTO Personnel(nom, prenom, date_de_naissance, adress, date_de_recrutement) VALUES (
    'Olougouna',
    'Axel',
    DATE '2001-12-25',
    'chez Axel',
    '2020-9-15'
);

INSERT INTO Personnel(nom, prenom, date_de_naissance, adress, date_de_recrutement) VALUES (
    'Grane',
    'Yasmine',
    DATE '2001-12-25',
    'chez Yasmine',
    '2020-9-15'
);

INSERT INTO Personnel(nom, prenom, date_de_naissance, adress, date_de_recrutement) VALUES (
    'Wonderland',
    'Alice',
    DATE '1978-12-25',
    'chez les lapins',
    '2020-9-15'
);

INSERT INTO Personnel(nom, prenom, date_de_naissance, adress, date_de_recrutement) VALUES (
    'Le Bricoleur',
    'Bob',
    DATE '1878-12-25',
    'au chantier',
    '2020-9-15'
);

INSERT INTO Personnel(nom, prenom, date_de_naissance, adress, date_de_recrutement) VALUES (
    'Romilly',
    'Étienne',
    DATE '1995-03-17',
    '32 avenue des Maronnais',
    DATE '2013-09-01'
);

INSERT INTO Personnel(nom, prenom, date_de_naissance, adress, date_de_recrutement) VALUES (
    'Jacques',
    'Léonne',
    DATE '2002-01-07',
    '158 rue de la passion',
    DATE '2021-08-25'
);

----------------------------------------------------------------------
--                                                                  --
--                    Doctorant                                     --
--                                                                  --
----------------------------------------------------------------------

INSERT INTO Doctorant(idDoctorant, date_debut_these, date_soutenance) VALUES (
    1,
    DATE '2020-06-23',
    DATE '2023-08-03'
);

INSERT INTO Doctorant(idDoctorant, date_debut_these, date_soutenance) VALUES (
    3,
    DATE '2019-07-13',
    DATE '2020-11-08'
);

INSERT INTO Doctorant(idDoctorant, date_debut_these, date_soutenance) VALUES (
    4,
    DATE '2021-07-30',
    DATE '2022-09-29'
);

----------------------------------------------------------------------
--                                                                  --
--                    Scientifique                                  --
--                                                                  --
----------------------------------------------------------------------


INSERT INTO Scientifique(idScientifique, grade) VALUES (
    5,
    'cr1'
);

INSERT INTO Scientifique(idScientifique, grade) VALUES (
    2,
    'mcf'
);

----------------------------------------------------------------------
--                                                                  --
--                    Etablissement                                 --
--                                                                  --
----------------------------------------------------------------------

--Axel
INSERT INTO Etablissement VALUES (
    01,
    'Institut National des Sciences Appliquées',
    'INSA',
    'Toulouse'
);

--Axel
INSERT INTO Etablissement VALUES (
    02,
    'Ecole Nationale de l Aviation Civile',
    'ENAC',
    'Toulouse'
);


--Axel
INSERT INTO Etablissement VALUES (
    03,
    'Ecole Polytechnique',
    'X',
    'Paris'    
);

----------------------------------------------------------------------
--                                                                  --
--                    Enseignant Chercheur                          --
--                                                                  --
----------------------------------------------------------------------

----------------------------------------------------------------------
--                                                                  --
--                    Evenement                                     --
--                                                                  --
----------------------------------------------------------------------

--Yasmine
INSERT INTO Evenement VALUES (
    0001,
    DATE '2022-07-07',
    DATE '2023-07-07'
);

--Yasmine
INSERT INTO Evenement VALUES (
    0002,
    DATE '2022-01-07',
    DATE '2023-07-12'
);

--Yasmine

INSERT INTO Evenement VALUES (
    0003,
    DATE '2022-02-10',
    DATE '2023-03-12'
);

----------------------------------------------------------------------
--                                                                  --
--                    Congres                                       --
--                                                                  --
----------------------------------------------------------------------


----------------------------------------------------------------------
--                                                                  --
--                    Labo externe                                  --
--                                                                  --
----------------------------------------------------------------------
-- Ronan
INSERT INTO Labo_externe VALUES (
    6,
    'BRBN',
    'Bresil'
);


INSERT INTO Labo_externe VALUES (
    0,
    'LAAS',
    'France'
);

INSERT INTO Labo_externe VALUES (
    1,
    'CNES',
    'France'
);

INSERT INTO Labo_externe VALUES (
    2,
    'GEAS',
    'Allemagne'
);

INSERT INTO Labo_externe VALUES (
    3,
    'RUAF',
    'Russie'
);

INSERT INTO Labo_externe VALUES (
    4,
    'ENFD',
    'Angleterre'
);

INSERT INTO Labo_externe VALUES (
    5,
    'LUBN',
    'Luxembourg'
);

----------------------------------------------------------------------
--                                                                  --
--                    Journees porte ouvertes                       --
--                                                                  --
----------------------------------------------------------------------

----------------------------------------------------------------------
--                                                                  --
--                    Auteurs externes                              --
--                                                                  --
----------------------------------------------------------------------

INSERT INTO Auteur_Externe VALUES (
    0,
    'John',
    'Doe',
    'johndoe@mail.com',
    0
);

INSERT INTO Auteur_Externe VALUES (
    1,
    'Dmitri',
    'Alexandrovich',
    'alex@yandex.ru',
    3
);

INSERT INTO Auteur_Externe VALUES (
    2,
    'Paul',
    'Hugo',
    'paulo@mail.com',
    1
);

INSERT INTO Auteur_Externe VALUES (
    3,
    'Pascal',
    'Gerard',
    'gege@mail.com',
    1
);


----------------------------------------------------------------------
--                                                                  --
--                    Publication                                   --
--                                                                  --
----------------------------------------------------------------------

INSERT INTO Publication VALUES(
    001,
    'recherche scientifique sur la chimie organique',
    DATE '2022-07-07',
    'conference des sciences',
    'A*',
  	220
);

--Yasmine
INSERT INTO Publication VALUES(
    002,
    'Page rank',
    DATE '2022-07-07',
    'conference des sciences et technologies',
    'A',
  	220
);

--Yasmine

INSERT INTO Publication VALUES (
    003,
    'chaine de markov',
    DATE '2022-12-03',
    'Mathematiques appliqués',
    'B',
  	500
);

INSERT INTO Publication VALUES (
    004,
    'Physique quantique',
    DATE '2017-12-03',
    'Physique',
    'A',
  	1520
);

INSERT INTO Publication VALUES (
    005,
    'La nourriture en France',
    DATE '2022-12-03',
    'IEE',
    'A*',
  	20
);

----------------------------------------------------------------------
--                                                                  --
--                    Projet                                        --
--                                                                  --
----------------------------------------------------------------------

--Yasmine
INSERT INTO Projet VALUES(
    01,
    'BaseDeDonnee',
    'BDD',
    DATE '2022-12-07',
    DATE '2022-01-07',
    30,
    1000,
    500,
    5
);

--Yasmine
INSERT INTO Projet VALUES (
    02,
    'langC',
    'C',
    DATE '2022-11-07',
    DATE '2022-04-07',
    40,
    100,
    60,
    2
);

--Yasmine
INSERT INTO Projet VALUES (
    03,
    'Programation web',
    'ProgWeb',
    DATE '2022-04-07',
    DATE '2022-06-07',
    80,
    10000,
    6000,
    5
);

----------------------------------------------------------------------
--                                                                  --
--                    Participe                                     --
--                                                                  --
----------------------------------------------------------------------

----------------------------------------------------------------------
--                                                                  --
--                    Preside                                       --
--                                                                  --
----------------------------------------------------------------------

----------------------------------------------------------------------
--                                                                  --
--                    Publie Scientifique                           --
--                                                                  --
----------------------------------------------------------------------

INSERT INTO Publie_Scientifique VALUES (
    1,
    5
);

INSERT INTO Publie_Scientifique VALUES (
    2,
    2
);

INSERT INTO Publie_Scientifique VALUES (
    1,
    5
);

INSERT INTO Publie_Scientifique VALUES (
    4,
    2
);

INSERT INTO Publie_Scientifique VALUES (
    4,
    5
);

----------------------------------------------------------------------
--                                                                  --
--                    Publie Doctorant                              --
--                                                                  --
----------------------------------------------------------------------


INSERT INTO Publie_Doctorant VALUES (
    1,
    1
);

INSERT INTO Publie_Doctorant VALUES (
    2,
    3
);

INSERT INTO Publie_Doctorant VALUES (
    2,
    4
);


----------------------------------------------------------------------
--                                                                  --
--                    Publie Externe                                --
--                                                                  --
----------------------------------------------------------------------

INSERT INTO Publie_Externe VALUES (
    1,
    0
);

INSERT INTO Publie_Externe VALUES (
    1,
    3
);

INSERT INTO Publie_Externe VALUES (
    2,
    2
);

INSERT INTO Publie_Externe VALUES (
    3,
    1
);

INSERT INTO Publie_Externe VALUES (
    4,
    1
);

INSERT INTO Publie_Externe VALUES (
    4,
    3
);

----------------------------------------------------------------------
--                                                                  --
--                    Partenaire                                    --
--                                                                  --
----------------------------------------------------------------------

--Axel
INSERT INTO Partenaire(nom, pays) VALUES (
    'GFGH',
    'Allemagne'
);

--Axel
INSERT INTO Partenaire(nom, pays) VALUES (
    'LMC',
    'Australie'
);

--Axel
INSERT INTO Partenaire(nom, pays) VALUES (
    'ESHT',
    'USA'
);

--Axel
INSERT INTO Partenaire(nom, pays) VALUES (
    'HLMY',
    'Japon'
);

--Axel
INSERT INTO Partenaire(nom, pays) VALUES (
    'MAKL',
    'France'
);

----------------------------------------------------------------------
--                                                                  --
--                    Participe Externe                             --
--                                                                  --
----------------------------------------------------------------------

----------------------------------------------------------------------
--                                                                  --
--                    Organise                                      --
--                                                                  --
----------------------------------------------------------------------

----------------------------------------------------------------------
--                                                                  --
--                    Encadrement                                   --
--                                                                  --
----------------------------------------------------------------------

INSERT INTO Encadrement VALUES (
    4,
    2
);

INSERT INTO Encadrement VALUES (
    2,
    5
);

