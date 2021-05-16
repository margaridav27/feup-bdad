SELECT Entity.name AS EntityName, Repository.name AS RepositoryName 
FROM Entity  JOIN Repository ON Entity.ID = Repository."owner"
ORDER BY Entity.name ASC;
 

 -- eu acho que esta query devia ser a query atual das datas e na das datas fazer o tal cenas sequencial porque isto deixa de fazer sentido agora que o repositori tem o seu owner