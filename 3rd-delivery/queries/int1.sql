.mode	columns
.headers	ON
.nullvalue	NULL

-- 1. O utilizador que fez uma contribuição mais recentemente
 
SELECT Repository.name AS RepositoryName, Entity.name AS EntityName, MAX(mostRecentContribution.date) AS ContributionDate 
FROM Repository, Entity, (SELECT Contribution.user, Contribution.repository, MAX(Contribution.date) AS date
                          FROM Contribution
                          GROUP BY Contribution.user) AS mostRecentContribution
WHERE repository.ID = mostRecentContribution.repository AND Entity.ID = mostRecentContribution.user;