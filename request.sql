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
