.mode	columns
.headers	ON
.nullvalue	NULL

-- Obter, para cada um dos repositórios, o respetivo número de contribuidores. 

SELECT repository.name AS RepositoryName, count(*) AS NumberContributors 
FROM ContributorRepository JOIN Repository ON ContributorRepository.repository = Repository.id 
GROUP BY repository;
