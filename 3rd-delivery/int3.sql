SELECT UserNames.name, COUNT(*) AS numberCommits
FROM (SELECT Entity.name, Entity.ID FROM User, Entity WHERE User.ID = Entity.ID) AS UserNames,
     (SELECT Contribution.id, Contribution.user FROM Contribution, "Commit" WHERE Contribution.ID = "Commit".ID AND "Commit".message LIKE '%indeed%') AS Commits
GROUP BY UserNames.name;


SELECT UserNames.name, Contributions.numberCommits
FROM (SELECT Entity.name, Entity.ID FROM User, Entity WHERE User.ID = Entity.ID) as UserNames, 
     (SELECT Contribution.user, COUNT(Contribution.id) as numberCommits
      FROM Contribution NATURAL JOIN "Commit"
      WHERE "Commit".message LIKE '%indeed%'
      GROUP BY Contribution.user) AS Contributions
WHERE Contribution.user = Entity.ID;
