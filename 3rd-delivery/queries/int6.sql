.mode	columns
.headers	ON
.nullvalue	NULL

SELECT repository.name AS RepositoryName, count(*) AS NumberContributors 
FROM ContributorRepository JOIN Repository ON ContributorRepository.repository = Repository.id 
GROUP BY repository;
