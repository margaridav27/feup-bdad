.mode	columns
.headers	ON
.nullvalue	NULL

-- Para cada utilizador, contar o número de commits efetuados, cuja message do mesmo contempla a palavra “indeed”.

SELECT Entity.name, COUNT(*) AS NumberCommits
FROM (SELECT user, "Commit".message AS message 
      FROM Contribution NATURAL JOIN "Commit"
      WHERE "Commit".message LIKE "%indeed%") AS Data, Entity
WHERE Entity.ID = Data.user
GROUP BY Data.user;
