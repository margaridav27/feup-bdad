.mode	columns
.headers	ON
.nullvalue	NULL

-- Obter o número de contribuições do tipo Merge que foram feitas por cada utilizador, no âmbito de cada uma das equipas às quais pertença.

DROP View IF EXISTS MergeContributions;
CREATE View MergeContributions AS
    SELECT Contribution.ID, Contribution.user, Contribution.repository
    FROM Contribution, "Merge"
    WHERE Contribution.ID = "Merge".ID;


DROP View IF EXISTS MergeContributionsByRepo;
CREATE View MergeContributionsByRepo AS
    SELECT Repository.ID AS repository, MergeContributions.user, COUNT(MergeContributions.user) AS merges
    FROM Repository, MergeContributions
    WHERE Repository.id = MergeContributions.repository
    GROUP BY MergeContributions.repository, MergeContributions.user;

SELECT  DISTINCT User.name, Repository.name, MergeContributionsByRepo.merges
FROM (Entity NATURAL JOIN User) AS User, Repository, MergeContributionsByRepo, TeamUserMember
WHERE User.ID = MergeContributionsByRepo.user AND MergeContributionsByRepo.repository = Repository.ID AND MergeContributionsByRepo.repository = Repository.ID AND TeamUserMember.user = MergeContributionsByRepo.user AND Repository."owner" = TeamUserMember.team;

-- every repo, not only team repo:
-- WHERE User.ID = MergeContributionsByRepo.user AND MergeContributionsByRepo.repository = Repository.ID AND MergeContributionsByRepo.repository = Repository.ID;
