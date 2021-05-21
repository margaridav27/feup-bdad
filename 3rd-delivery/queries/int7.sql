.mode	columns
.headers	ON
.nullvalue	NULL

-- 7.	Qual o utilizador que fez uma contribuição com maior intervalo de dias em todos os repositórios

DROP VIEW IF EXISTS ContributionsByUser;
CREATE VIEW ContributionsByUser AS
    SELECT DISTINCT Contribution.ID AS ID, Entity.name, Contribution.repository, Contribution.date
    FROM Entity, Contribution, (SELECT Repository.ID, Count(Contribution.id) AS nrContributions
                                FROM Repository, Contribution
                                WHERE Repository.id = Contribution.repository
                                GROUP BY Repository.id
                                HAVING nrContributions > 1) AS PopularRepos
    WHERE Contribution.user = Entity.ID AND Contribution.repository = PopularRepos.id
    GROUP BY Contribution.ID,Contribution.user, Contribution.repository
    ORDER BY Contribution.user, Contribution.date;

DROP VIEW IF EXISTS ContributionsByUserIndex;
CREATE VIEW ContributionsByUserIndex AS
    SELECT * , ROW_NUMBER() OVER (PARTITION BY repository, "name" ORDER BY "date" ASC) AS "index" FROM ContributionsByUser;

SELECT Repository.name, userName,  max(MaxDaysWitoutContribution) AS "DaysWindow"
FROM
    (SELECT userName, repo, max(TimeDifference) AS MaxDaysWitoutContribution
    FROM
        (SELECT C1.name AS userName, C1.repository AS repo, C1.date, C2.date, max(julianday(C2.date)-julianday(C1.date)) AS TimeDifference, C1."index", C2."index"
        FROM ContributionsByUserIndex AS C1, ContributionsByUserIndex AS C2
        WHERE C1.name = C2.name AND C1.date < C2.date AND C1.repository = C2.repository AND (C2."index" - C1."index") = 1
        GROUP BY C1.repository, userName)
    GROUP BY userName, repo), Repository
WHERE repo = Repository.ID
GROUP BY repo;
