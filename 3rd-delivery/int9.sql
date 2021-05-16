-- número de contribuições do tipo merge que foram feitas por cada utilizador no ambito de cada uma das suas equipas

DROP View if exists MergeContributions;
CREATE View MergeContributions AS
    SELECT Contribution.ID, Contribution.user, Contribution.repository
    FROM Contribution, "Merge"
    WHERE Contribution.ID = "Merge".ID;


DROP View if exists MergeContributionsByRepo;
CREATE View MergeContributionsByRepo AS
    SELECT Repository.ID as repository, MergeContributions.user, count(MergeContributions.user) as merges
    FROM Repository, MergeContributions
    WHERE Repository.id = MergeContributions.repository
    GROUP BY MergeContributions.repository, MergeContributions.user;

SELECT  DISTINCT User.name, Repository.name, MergeContributionsByRepo.merges
FROM (Entity NATURAL JOIN User) AS User, Repository, MergeContributionsByRepo, TeamUserMember
WHERE User.ID = MergeContributionsByRepo.user AND MergeContributionsByRepo.repository = Repository.ID AND MergeContributionsByRepo.repository = Repository.ID AND TeamUserMember.user = MergeContributionsByRepo.user AND Repository."owner" = TeamUserMember.team;

-- every repo, not only team repo:
-- WHERE User.ID = MergeContributionsByRepo.user AND MergeContributionsByRepo.repository = Repository.ID AND MergeContributionsByRepo.repository = Repository.ID ;
