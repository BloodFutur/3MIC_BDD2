
--Axel, question 3 et 4
--SELECT COUNT(id) 
--FROM SELECT idScientifique FROM Enseignant_Chercheur
--    WHERE idScientifique = 01;
SELECT COUNT(idPublication) as nbCollab FROM Publication
WHERE classeConf = 'A';

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

-- Nathan Q5
SELECT idDoctorant, COUNT(idPublication) FROM Publie_Doctorant
GROUP BY idDoctorant;

-- Ronan Q6
SELECT COUNT(*) FROM Doctorant
WHERE date_soutenance IS NOT NULL;

--Nathan Q7
SELECT nom, prenom FROM Personnel
WHERE idPersonnel NOT IN (
    SELECT idScientifique FROM Encadrement
);

-- Ronan Q10
SELECT idDoctorant, nom, prenom, COUNT(*) FROM Encadrement
JOIN Scientifique on idPersonnel=idScientifique
GROUP BY idDoctorant, nom, prenom
HAVING COUNT(DISTINCT idScientifique)=1;

-- Ronan Q16
SELECT pays, COUNT(*) nb_publi
FROM Labo_Externe
JOIN Auteur_Externe ae on ae.idLabo = Labo_Externe.idLabo
JOIN Publie_Externe pe on pe.idAuteur = ae.idAuteur
GROUP BY pays
ORDER BY nb_publi DESC LIMIT 1;

--Yasmine QUESTION 5 A tester enc

SELECT idDoctorant, count(distinct idPublication) as NombrePublication
FROM Doctorant D
LEFT JOIN Publie_Doctorant PD on PD.idDoctorant= D.idDoctorant
GROUP BY idDoctorant;


--Yasmine QUESTION 8

SELECT idEnseignant
FROM Enseignant-chercheur
NOT IN ( (SELECT idScientifique
               FROM Publie_scientifique)
               UNION
	      (SELECT idScientifique
               FROM Encadrement)
	) ;

-- Yasmine QUESTION 14

SELECT Count(Distinct idPublication)
FROM Publication
GROUP BY annee ;

-- Yasmine QUESTION 15

SELECT Count(Distinct E,idEnseignant)
FROM Enseignant-chercheur E,Personnel P ,Scientifique S
WHERE P.idPersonnel=S.idScientifique
AND S.idScientifique=E.idEnseignant
GROUP BY idEtablissement  ;

-- Yasmine QUESTION 19

SELECT idEtablissement, Count(Distinct idEnseignant)
FROM Enseignant-chercheur
GROUP BY idEtablissement
HAVING count(Distinct idEnseignant) >= 50 ;


--Yasmine QUESTION 21

SELECT Distinct P.Pays
FROM Partenaire P, Participe_externe PEX
where P.idpartenaire=PEX.idpartenaire
and not exists (Select *

		 From Projet PR
		 Where not exists (Select *

				      From Participe_externe PEX2
				      Where PEX2.idPartenaire=P.idPartenaire and
                                                      PEX2.idPr=PR.idProjet));

