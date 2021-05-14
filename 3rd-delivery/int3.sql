SELECT Entity.name , count(*) AS numberCommits
FROM (SELECT user, "Commit".message AS message 
      FROM Contribution NATURAL JOIN "Commit"
      WHERE "Commit".message LIKE "%indeed%") AS Data, Entity
WHERE Entity.ID = Data.user
GROUP BY Data.user;
