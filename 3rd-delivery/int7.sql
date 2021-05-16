DROP VIEW IF EXISTS PopularRepos;
CREATE VIEW PopularRepos AS
    SELECT Repository.ID, Count(Contribution.id) as nrContributions
    FROM Repository, Contribution
    WHERE Repository.id = Contribution.repository
    GROUP BY Repository.id
    HAVING nrContributions > 1;



DROP VIEW IF EXISTS ContributionsByUser;
CREATE VIEW ContributionsByUser AS
    SELECT DISTINCT Contribution.ID AS ID, Entity.name, Contribution.repository, Contribution.date
    FROM Entity, Contribution, PopularRepos
    WHERE Contribution.user = Entity.ID AND Contribution.repository = PopularRepos.id
    GROUP BY Contribution.ID,Contribution.user, Contribution.repository
    ORDER BY Contribution.user, Contribution.date;



SELECT Repository.name, userName, max(MaxDaysWitoutContribution) as "DaysWindow"
FROM
    (SELECT userName, repo, max(TimeDifference) as MaxDaysWitoutContribution
    FROM
        (SELECT C1.name AS userName, C1.repository as repo, C1.date, C2.date, min(julianday(C2.date)-julianday(C1.date)) as TimeDifference
        FROM ContributionsByUser AS C1, ContributionsByUser AS C2
        WHERE C1.name = C2.name AND C1.date < C2.date AND C1.repository = C2.repository
        GROUP BY C1.repository, c1.name)
    GROUP BY repo, userName), Repository
WHERE repo = Repository.ID
GROUP BY repo;


select * from ContributionsByUser;
