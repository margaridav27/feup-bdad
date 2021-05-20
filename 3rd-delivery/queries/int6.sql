.mode	columns
.headers	ON
.nullvalue	NULL

-- 6.	O nr de repositorios/contribuidores que todos os users tem entre si 

SELECT repository.name AS RepositoryName, count(*) AS NumberContributors 
FROM ContributorRepository JOIN Repository ON ContributorRepository.repository = Repository.id 
GROUP BY repository;
