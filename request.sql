-- Nathan


--Axel, question 3 et 4
--SELECT COUNT(id) 
--FROM SELECT idScientifique FROM Enseignant_Chercheur
--    WHERE idScientifique = 01;

SELECT COUNT(idPublication) as nbCollab FROM Publication
WHERE classeConf = 'A';
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

-- Ronan Q6
SELECT COUNT(*) FROM Doctorant
WHERE date_soutenance IS NOT NULL;

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

