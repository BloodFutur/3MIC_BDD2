-- Nathan
SELECT Personnel.nom, Scientifique.grade FROM Personnel, Scientifique
WHERE idPersonnel = idScientifique AND idPersonnel IN (
    SELECT idScientifique FROM Encadrement
    WHERE idDoctorant = 4
);
