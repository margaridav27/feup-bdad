SELECT Entity.name, Repository.name 
FROM (Entity JOIN OwnerRepository ON Entity.ID = OwnerRepository.entity) JOIN Repository ON OwnerRepository.repository = Repository.ID
ORDER BY Entity.name ASC;
