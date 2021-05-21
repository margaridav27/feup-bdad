.mode	columns
.headers	ON
.nullvalue	NULL

-- Considerando os repositórios pertencentes a equipas, listar aqueles para os quais todos os membros já contribuíram eventualmente.

DROP View IF EXISTS TeamRepo;
CREATE View TeamRepo AS
    SELECT Repository.ID AS RepositoryID, Repository.name AS RepositoryName, Teams.ID AS EntityID, Teams.name AS EntityName 
    FROM Repository JOIN
        (SELECT Entity.name, Entity.ID 
        FROM (Entity NATURAL JOIN Team)) AS Teams 
    ON Repository."owner" = Teams.ID;

DROP View IF EXISTS TeamMembers;
CREATE View TeamMembers AS
    SELECT Entity.ID AS EntityID, Entity.name AS EntityName, COUNT(*) AS "number"
    FROM Team NATURAL JOIN Entity, TeamUserMember 
    WHERE Team.ID = teamUserMember.team 
    GROUP BY team;

DROP View IF EXISTS TeamRepoContributions;
CREATE View TeamRepoContributions AS
    SELECT EntityID, TeamRepo.RepositoryName AS RepositoryName, COUNT(DISTINCT user) AS contributors
    FROM TeamRepo, Contribution
    WHERE TeamRepo.RepositoryID = Contribution.repository
    GROUP BY Contribution.repository;

SELECT RepositoryName
FROM TeamMembers, TeamRepoContributions
WHERE TeamMembers.EntityID = TeamRepoContributions.EntityID
GROUP BY RepositoryName
HAVING TeamRepoContributions.contributors = TeamMembers.number;
