
--Axel, question 3 et 4
--SELECT COUNT(id) 
--FROM SELECT idScientifique FROM Enseignant_Chercheur
--    WHERE idScientifique = 01;
--SELECT COUNT(idPublication) as nbCollab FROM Publication
--WHERE classeConf = 'A';

-- Nathan Q1
SELECT Personnel.nom, Scientifique.grade FROM Personnel, Scientifique
WHERE idPersonnel = idScientifique AND idPersonnel IN (
    SELECT idScientifique FROM Encadrement
    WHERE idDoctorant = 4
);

-- Ronan Q2
SELECT ae.nom, ae.prenom le.pays FROM Personnel AS perso 
JOIN Publie_Scientifique ps on perso.idPersonnel = ps.idPersonnel
RIGHT JOIN Publication publi on publi.idPublication = ps.idPublication
RIGHT JOIN Publie_Externe pe on publi.idPublication = pe.idPublication
JOIN Auteur_Externe ae on ae.idAuteur = pe.idAuteur
JOIN Labo_Externe le on ae.idLabo = le.idLabo
WHERE perso.nom = 'Azi'
    AND perso.prenom = 'Jean'
    AND annee >= '2016-01-01'
    AND annee <= '2020-01-01';

--Axel Q3
SELECT COUNT(DISTINCT idAuteurExterne) AS nbCollab FROM Publie_Externe pe
JOIN Publie_Scientifique ps ON pe.idPublication = ps.idPublication
RIGHT JOIN Publie_Doctorant pdoc ON pe.idPublication = pdoc.idPublication
JOIN Enseignant_Chercheur ec ON ec.idEnseignant = ps.idScientifique
WHERE idScientifique = '01';


-- Axel Q4
SELECT COUNT(DISTINCT pays) AS nbPaysCollab FROM Labo_Externe le
RIGHT JOIN Auteur_Externe ae ON ae.idLabo = le.idLabo
RIGHT JOIN Publie_Externe pe ON pe.idAuteurExterne = ae.idAuteurExterne
JOIN Publication pub ON pub.idPublication = pe.idPublication
WHERE pub.classeConf = 'A';

-- Nathan Q5
SELECT idDoctorant, COUNT(idPublication) FROM Publie_Doctorant
GROUP BY idDoctorant;

-- Ronan Q6
SELECT COUNT(*) FROM Doctorant
WHERE date_soutenance IS NOT NULL;

--Nathan Q7
SELECT nom, prenom FROM Personnel
WHERE idPersonnel IN (
    SELECT idScientifique FROM Scientifique
    WHERE idScientifique NOT IN (
    SELECT idScientifique FROM Encadrement
    )
);

-- Nathan Q9
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
SELECT e.idDoctorant, nom, prenom, COUNT(*) FROM Encadrement e
JOIN Scientifique s ON e.idScientifique=s.idScientifique
JOIN Doctorant d ON e.idDoctorant=d.idDoctorant
RIGHT JOIN Personnel p ON d.idDoctorant=p.idPersonnel
GROUP BY e.idDoctorant, nom, prenom
HAVING COUNT(DISTINCT s.idScientifique)=1;

-- Ronan Q16
SELECT pays, COUNT(*) nb_publi FROM Labo_Externe
JOIN Auteur_Externe ae on ae.idLabo = Labo_Externe.idLabo
JOIN Publie_Externe pe on pe.idAuteurExterne = ae.idAuteur
GROUP BY pays
ORDER BY nb_publi DESC LIMIT 1;

--Yasmine QUESTION 5 A tester enc

SELECT idDoctorant, count(distinct idPublication) as NombrePublication
FROM Doctorant D
LEFT JOIN Publie_Doctorant PD on PD.idDoctorant= D.idDoctorant
GROUP BY idDoctorant;


--Yasmine QUESTION 8

SELECT idEnseignant
FROM Enseignant_chercheur
NOT IN ( (SELECT idScientifique
               FROM Publie_scientifique)
               UNION
	      (SELECT idScientifique
               FROM Encadrement)
	) ;

<<<<<<< HEAD

-- Axel Q12
SELECT idEnseignant FROM Enseignant_Chercheur ec
RIGHT JOIN Publie_Scientifique ps ON ps.idScientifique = ec.idScientifique
RIGHT JOIN Publication pub ON pub.idPublication = ps.idScientifique
WHERE pub.classeConf = 'A';
--EXCEPT SELECT idEnseignant FROM Enseignant_Chercheur ec
--RIGHT JOIN Publie_Scientifique ps ON ps.idScientifique = ec.idScientifique
--RIGHT JOIN Publication pub ON pub.idPublication = ps.idScientifique
--WHERE pub.classeConf = 'A'
--    AND pub.classeConf IN  'A*' 'B';


-- Yasmine QUESTION 14
=======
-- Yasmine QUESTION 14 Testé
>>>>>>> af456634e468d2a6e5d3dbc4e169d73853af5baf

SELECT Count(Distinct idPublication)
FROM Publication
GROUP BY publication.annee;

-- Yasmine QUESTION 15 Testé PAS D'ERREUR DE SYNTAXE

SELECT Count(Distinct E.idEnseignant)
FROM Enseignant_chercheur E,Personnel P ,Scientifique S
WHERE P.idPersonnel=S.idScientifique
AND S.idScientifique=E.idEnseignant
GROUP BY idEtablissement;

-- Yasmine QUESTION 19 Testé PAS D'ERREUR DE SYNTAXE

SELECT idEtablissement, Count(Distinct idEnseignant)
FROM Enseignant_chercheur
GROUP BY idEtablissement
HAVING count(Distinct idEnseignant) >= 50;


--Yasmine QUESTION 21 Testé PAS D'ERREUR DE SYNTAXE

SELECT Distinct P.Pays
FROM Partenaire P, Participe_externe PEX
where P.idpartenaire=PEX.idpartenaire
and not exists (Select *

		 From Projet PR
		 Where not exists (Select *

				      From Participe_externe PEX2
				      Where PEX2.idPartenaire=P.idPartenaire and
                                                      PEX2.idProjet=PR.idProjet));

