SELECT Entity.name AS EntityName, Repository.name AS RepositoryName 
FROM (Entity JOIN OwnerRepository ON Entity.ID = OwnerRepository.entity) JOIN Repository ON OwnerRepository.repository = Repository.ID
ORDER BY Entity.name ASC;
