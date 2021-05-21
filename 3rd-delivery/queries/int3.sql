.mode	columns
.headers	ON
.nullvalue	NULL

-- 3.	Contar o nr de commits com palavra “indeed” para todos os utilizadores 

SELECT Entity.name, COUNT(*) AS NumberCommits
FROM (SELECT user, "Commit".message AS message 
      FROM Contribution NATURAL JOIN "Commit"
      WHERE "Commit".message LIKE "%indeed%") AS Data, Entity
WHERE Entity.ID = Data.user
GROUP BY Data.user;
