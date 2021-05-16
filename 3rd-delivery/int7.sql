SELECT Repository.name AS RepositoryName, Entity.name AS EntityName, MIN(mostRecentContribution.date) AS ContributionDate 
FROM Repository, Entity, (SELECT Contribution.user, Contribution.repository, MAX(Contribution.date) AS date
                          FROM Contribution
                          GROUP BY Contribution.user) AS mostRecentContribution
WHERE repository.ID = mostRecentContribution.repository AND Entity.ID = mostRecentContribution.user;
 -- isto deixaria de existir [ler query 1]