.mode	columns
.headers	ON
.nullvalue	NULL

-- Obter, para cada um dos repositórios, o respetivo número de contribuidores que nunca efetuaram uma contribuição. 

SELECT CREPOS.name AS repositoryName, COUNT(DISTINCT CREPOS.user) AS numberOfContributorsThatNeverContributed
FROM (ContributorRepository JOIN Repository ON ContributorRepository.repository = Repository.ID) AS CREPOS, Contribution 
WHERE NOT EXISTS (SELECT * 
                  FROM Contribution 
                  WHERE CREPOS.user = Contribution.user AND CREPOS.repository = Contribution.repository)
GROUP BY CREPOS.repository;
