
--         | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 |
-- --------+---+---+---+---+---+---+---+---+---+----+----+----+----+----+----+----+----+----+----+----+----+
-- Axel    |   |   | O | O |   |   |   |   |   |    |    | O  | O  |    |    |    |    |    |    | 0  |    |
-- --------+---+---+---+---+---+---+---+---+---+----+----+----+----+----+----+----+----+----+----+----+----+
-- Ronan   |   | O |   |   |   | O |   |   |   | O  |    |    |    |    |    | x  |    |  O |    |    |    |
-- --------+---+---+---+---+---+---+---+---+---+----+----+----+----+----+----+----+----+----+----+----+----+
-- Yasmine |   |   |   |   | O |   |   | O |   |    |    |    |    | O  | O  |    |    |    | O  |    | O  |
-- --------+---+---+---+---+---+---+---+---+---+----+----+----+----+----+----+----+----+----+----+----+----+
-- Nathan  | O |   |   |   |   |   | O |   | O |    | O  |    |    |    |    |    | O  |    |    |    |    |
-- --------+---+---+---+---+---+---+---+---+---+----+----+----+----+----+----+----+----+----+----+----+----+
--                                                              ^                        ^         ^
--                                                              |                        |         |


--          x = écrit
--          O = écrit + testé





-- Nathan Q1 tested
SELECT Personnel.nom, Scientifique.grade FROM Personnel, Scientifique
WHERE idPersonnel = idScientifique AND idPersonnel IN (
    SELECT idScientifique FROM Encadrement
    WHERE idDoctorant = 4
);

-- Ronan Q2 tested
SELECT ae.nom, ae.prenom, le.pays FROM Personnel AS perso
JOIN Publie_Scientifique ps ON perso.idPersonnel = ps.idScientifique
RIGHT JOIN Publication publi ON publi.idPublication = ps.idPublication
RIGHT JOIN Publie_Externe pe ON publi.idPublication = pe.idPublication
JOIN Auteur_Externe ae ON ae.idAuteur = pe.idAuteurExterne
JOIN Labo_Externe le ON ae.idLabo = le.idLabo
WHERE perso.nom = 'Azi'
    AND perso.prenom = 'Jean'
    AND annee >= '2016-01-01'
    AND annee <= '2020-01-01';


--Axel Q3 tested
SELECT COUNT(DISTINCT idAuteurExterne) AS nbCollab FROM Publie_Externe pe
JOIN Publie_Scientifique ps ON pe.idPublication = ps.idPublication
--RIGHT JOIN Publie_Doctorant pdoc ON pe.idPublication = pdoc.idPublication
RIGHT JOIN Enseignant_Chercheur ec ON ec.idEnseignant = ps.idScientifique
WHERE idScientifique = 2;


-- Axel Q4 tested
SELECT COUNT(DISTINCT pays) AS nbPaysCollab FROM Labo_Externe le
RIGHT JOIN Auteur_Externe ae ON ae.idLabo = le.idLabo
RIGHT JOIN Publie_Externe pe ON pe.idAuteurExterne = ae.idAuteur
JOIN Publication pub ON pub.idPublication = pe.idPublication
WHERE pub.classeConf = 'A';

--Yasmine QUESTION 5 Testé

SELECT iddoctorant, count(distinct idPublication) as NombrePublication
FROM publie_doctorant
GROUP BY idDoctorant;

-- Ronan Q6 tested
SELECT COUNT(*) FROM Doctorant
WHERE date_soutenance < NOW();

--Nathan Q7 tested
SELECT nom, prenom FROM Personnel
WHERE idPersonnel IN (
    SELECT idScientifique FROM Scientifique
    WHERE idScientifique NOT IN (
    SELECT idScientifique FROM Encadrement
    )
);

--Yasmine QUESTION 8 tested
SELECT P.nom,P.prenom
FROM enseignant_chercheur EC, Personnel P
WHERE P.idPersonnel=EC.idEnseignant and idEnseignant 
NOT IN ( (SELECT idScientifique
          FROM Publie_scientifique)
          UNION
    (SELECT idScientifique
          FROM Encadrement)
);


-- Nathan Q9 tested
SELECT nom, prenom FROM Personnel
WHERE idPersonnel IN (
    SELECT idScientifique FROM Scientifique
    WHERE idScientifique IN (
        SELECT idScientifique FROM Encadrement
        WHERE idDoctorant IN (
            SELECT idDoctorant FROM Doctorant
            WHERE date_soutenance < NOW()
        )
    )
);

-- Ronan Q10 tested
SELECT idDoctorant, nom, prenom FROM (
  SELECT e.idDoctorant, nom, prenom, COUNT(*) FROM Encadrement e
  JOIN Scientifique s ON e.idScientifique=s.idScientifique
  JOIN Doctorant d ON e.idDoctorant=d.idDoctorant
  RIGHT JOIN Personnel p ON d.idDoctorant=p.idPersonnel
  GROUP BY e.idDoctorant, nom, prenom
  HAVING COUNT(DISTINCT s.idScientifique)=1
) DoctorantInfo;

-- Nathan Q11 tested
SELECT idPersonnel, nom, prenom, nbEtudiant FROM Personnel, (
    SELECT idScientifique, COUNT(DISTINCT idDoctorant) AS nbEtudiant FROM Encadrement
    GROUP BY idScientifique
) AS Classe
WHERE nbEtudiant >= 2 AND idPersonnel = idScientifique;

-- Axel Q12
SELECT DISTINCT idEnseignant FROM Enseignant_Chercheur ec
RIGHT JOIN Publie_Scientifique ps ON ps.idScientifique = ec.idEnseignant
RIGHT JOIN Publication pub ON pub.idPublication = ps.idScientifique
WHERE pub.classeConf = 'A' AND pub.classeConf NOT IN ('A*', 'B', 'C');

-- Axel Q13 tested
SELECT DISTINCT p.idPersonnel, p.nom, p.prenom FROM Personnel p
JOIN Enseignant_Chercheur ec ON ec.idEnseignant = p.idPersonnel
RIGHT JOIN Encadrement encad1 ON ec.idEnseignant = encad1.idScientifique
WHERE ec.idEnseignant = encad1.idScientifique
AND NOT EXISTS (SELECT * FROM Doctorant doc
                WHERE NOT EXISTS(SELECT * FROM Encadrement encad2
                                WHERE encad2.idScientifique = ec.idEnseignant
                                        AND encad2.idDoctorant = doc.idDoctorant));

-- Yasmine QUESTION 14 Testé

SELECT
  EXTRACT(YEAR FROM publication.annee) AS nbannee
  ,Count(Distinct idPublication)
FROM publication
GROUP BY nbannee;

-- Yasmine QUESTION 15 Testé

SELECT idetablissement,Count(Distinct E.idEnseignant)
FROM Enseignant_chercheur E,Personnel P ,Scientifique S
WHERE P.idPersonnel=S.idScientifique
AND S.idScientifique=E.idEnseignant
GROUP BY idEtablissement;

-- Ronan Q16
SELECT pays, COUNT(*) nb_publi FROM Labo_Externe
JOIN Auteur_Externe ae on ae.idLabo = Labo_Externe.idLabo
JOIN Publie_Externe pe on pe.idAuteurExterne = ae.idAuteur
GROUP BY pays
ORDER BY nb_publi DESC LIMIT 1;


-- Nathan Q17 tested
SELECT * FROM Scientifique
WHERE idScientifique IN (
    SELECT idScientifique FROM (
        SELECT idScientifique, COUNT(DISTINCT idProjet) AS nbProjets FROM Participe
        GROUP BY idScientifique
    ) AS Taux_Participation
    WHERE nbProjets = 1
);

-- Ronan QUESTION 18 tested
SELECT * from Scientifique
WHERE idScientifique IN (
    SELECT idScientifique FROM (
        SELECT idScientifique, COUNT(DISTINCT idProjet) AS nbProjets FROM Participe
        GROUP BY idScientifique
    ) AS ParticipationCount
    JOIN (
        SELECT COUNT(DISTINCT idProjet) AS nbTotalProjets FROM Projet
    ) AS ProjectCount
    ON ParticipationCount.nbProjets = ProjectCount.nbTotalProjets
);

-- Yasmine QUESTION 19 Testé AVEC 25 AU LIEU DE 50

SELECT idEtablissement, Count(Distinct idEnseignant)
FROM Enseignant_chercheur
GROUP BY idEtablissement
HAVING count(Distinct idEnseignant) >= 50;

-- Axel Question 20 ecrite et testée

SELECT idScientifique, nb_proj FROM 
    (SELECT idScientifique, COUNT(DISTINCT idProjet) AS nb_proj FROM Participe
    GROUP BY idScientifique) AS ScientPub
JOIN (SELECT MAX(nb_proj) AS nbmax FROM
    (SELECT idScientifique, COUNT(DISTINCT idProjet) AS nb_proj FROM Participe
    GROUP BY idScientifique) AS Scient) AS Sc
ON Sc.nbmax = ScientPub.nb_proj;


--Yasmine QUESTION 21 Testé

SELECT Distinct P.Pays
FROM Partenaire P, Participe_externe PEX
where P.idpartenaire=PEX.idpartenaire
and not exists (Select *
    From Projet PR
    Where not exists (Select *
        From Participe_externe PEX2
        Where PEX2.idPartenaire=P.idPartenaire and
            PEX2.idProjet=PR.idProjet));
