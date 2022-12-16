
--         | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 |
-- --------+---+---+---+---+---+---+---+---+---+----+----+----+----+----+----+----+----+----+----+----+----+
-- Axel    |   |   | O | O |   |   |   |   |   |    |    | x  |    |    |    |    |    |    |    |    |    |
-- --------+---+---+---+---+---+---+---+---+---+----+----+----+----+----+----+----+----+----+----+----+----+
-- Ronan   |   | O |   |   |   | O |   |   |   | x  |    |    |    |    |    | x  |    |    |    |    |    |
-- --------+---+---+---+---+---+---+---+---+---+----+----+----+----+----+----+----+----+----+----+----+----+
-- Yasmine |   |   |   |   | O |   |   | x |   |    |    |    |    | O  | O  |    |    |    | O  |    | O  |
-- --------+---+---+---+---+---+---+---+---+---+----+----+----+----+----+----+----+----+----+----+----+----+
-- Nathan  | O |   |   |   |   |   | O |   | O |    | O  |    |    |    |    |    | O  |    |    |    |    |
-- --------+---+---+---+---+---+---+---+---+---+----+----+----+----+----+----+----+----+----+----+----+----+
--                                                              ^                        ^         ^
--                                                              |                        |         |


--          x = écrit
--          O = écrit + testé





--Axel, question 3 et 4
--SELECT COUNT(id) 
--FROM SELECT idScientifique FROM Enseignant_Chercheur
--    WHERE idScientifique = 01;
--SELECT COUNT(idPublication) as nbCollab FROM Publication
--WHERE classeConf = 'A';

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

-- Nathan Q5 tested
-- SELECT idDoctorant, COUNT(idPublication) FROM Publie_Doctorant
-- GROUP BY idDoctorant;

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

--Yasmine QUESTION 8
SELECT EC.idEnseignant,P.nom,P.prenom
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

-- Ronan Q10
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
SELECT idEnseignant FROM Enseignant_Chercheur ec
RIGHT JOIN Publie_Scientifique ps ON ps.idScientifique = ec.idScientifique
RIGHT JOIN Publication pub ON pub.idPublication = ps.idScientifique
WHERE pub.classeConf = 'A' AND pub.classeConf NOT IN 'A*', 'B', 'C';
--EXCEPT SELECT idEnseignant FROM Enseignant_Chercheur ec
--RIGHT JOIN Publie_Scientifique ps ON ps.idScientifique = ec.idScientifique
--RIGHT JOIN Publication pub ON pub.idPublication = ps.idScientifique
--WHERE pub.classeConf IN  'A*', 'A', 'B', 'C';

-- Axel Q13
SELECT p.idScientifique, p.nom, p.prenom FROM Personnel p
JOIN Enseignant_Chercheur ec ON ec.idEnseignant = p.idPersonnel
RIGHT JOIN Encadrement encad1 on encad1.idEnseignant = ec.idEnseignant
WHERE ec.idEnseignant = encad1.idScientifique
AND NOT EXISTS (SELECT * FROM Doctorant doc
                WHERE NOT EXISTS(SELECT * FROM Encadrement encad2
                                WHERE encad2.idScientifique = ec.idScientifique
                                        AND encad2.idDoctorant = doc.idDoctorant));

-- Yasmine QUESTION 14 Testé

SELECT Count(Distinct idPublication)
FROM Publication
GROUP BY publication.annee;

-- Yasmine QUESTION 15 Testé

SELECT Count(Distinct E.idEnseignant)
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


-- Yasmine QUESTION 19 Testé

SELECT idEtablissement, Count(Distinct idEnseignant)
FROM Enseignant_chercheur
GROUP BY idEtablissement
HAVING count(Distinct idEnseignant) >= 50;


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

