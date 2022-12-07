-- Nathan


--Axel, question 3 et 4
--SELECT COUNT(id) 
--FROM SELECT idScientifique FROM Enseignant_Chercheur
--    WHERE idScientifique = 01;

SELECT COUNT(idPublication) as nbCollab FROM Publication
WHERE classeConf = 'A';