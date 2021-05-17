.mode	columns
.headers	ON
.nullvalue	NULL

DROP View if exists TeamRepo;
CREATE View TeamRepo AS
    SELECT Repository.ID as RepositoryID, Repository.name as RepositoryName,  Teams.ID as EntityID, Teams.name as EntityName 
    FROM Repository JOIN
        (SELECT Entity.name, Entity.ID 
        FROM (Entity NATURAL JOIN Team)) AS Teams 
    ON Repository."owner" = Teams.ID;

DROP View if exists TeamMembers;
CREATE View TeamMembers AS
    SELECT Entity.ID AS EntityID, Entity.name as EntityName, count(*) as "number"
    FROM Team natural join Entity, TeamUserMember 
    WHERE Team.ID = teamUserMember.team 
    GROUP BY team;

DROP View if exists TeamRepoContributions;
CREATE View TeamRepoContributions AS
    SELECT EntityID, TeamRepo.RepositoryName as RepositoryName, count(DISTINCT user) as contributors
    FROM TeamRepo, Contribution
    WHERE TeamRepo.RepositoryID = Contribution.repository
    GROUP BY Contribution.repository;

SELECT RepositoryName
FROM TeamMembers, TeamRepoContributions
WHERE TeamMembers.EntityID = TeamRepoContributions.EntityID
GROUP BY RepositoryName
HAVING TeamRepoContributions.contributors = TeamMembers.number;

