.mode	columns
.headers	ON
.nullvalue	NULL

-- SELECT Entity.name AS EntityName, Repository.name AS RepositoryName 
-- FROM Entity  JOIN Repository ON Entity.ID = Repository."owner"
-- ORDER BY Entity.name ASC;
 
SELECT Repository.name AS RepositoryName, Entity.name AS EntityName, MIN(mostRecentContribution.date) AS ContributionDate 
FROM Repository, Entity, (SELECT Contribution.user, Contribution.repository, MAX(Contribution.date) AS date
                          FROM Contribution
                          GROUP BY Contribution.user) AS mostRecentContribution
WHERE repository.ID = mostRecentContribution.repository AND Entity.ID = mostRecentContribution.user;