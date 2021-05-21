.mode	columns
.headers	ON
.nullvalue	NULL

-- Obter o utilizador que, considerando todos os repositórios, fez uma contribuição mais recentemente 
-- e mostrar o seu nome, o nome do repositório para o qual foi efetuada a contribuição e a data da ocorrência da mesma.

SELECT Repository.name AS RepositoryName, Entity.name AS EntityName, MAX(mostRecentContribution.date) AS ContributionDate 
FROM Repository, Entity, (SELECT Contribution.user, Contribution.repository, MAX(Contribution.date) AS date
                          FROM Contribution
                          GROUP BY Contribution.user) AS mostRecentContribution
WHERE repository.ID = mostRecentContribution.repository AND Entity.ID = mostRecentContribution.user;