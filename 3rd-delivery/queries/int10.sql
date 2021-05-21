.mode	columns
.headers	ON
.nullvalue	NULL

-- Obter o número médio, average, de issues abertos em repositórios cujo owner é um utilizador,
-- ou seja, repositórios pertencentes a organizações ou equipas não serão tidos em consideração.

DROP View IF EXISTS "Group";
CREATE View "Group" AS 
    SELECT Team.ID 
    FROM Team 
            
    UNION 
            
    SELECT Organization.ID 
    FROM Organization;

DROP View IF EXISTS UsersRepository;
CREATE View UsersRepository AS
    SELECT Repository.ID, Repository.name
    FROM Repository 

    EXCEPT

    SELECT Repository.ID, Repository.name
    FROM Repository, "Group"
    WHERE Repository."owner" = "Group".ID;

SELECT UsersRepository.name, COUNT(Issue.ID) AS openIssues
FROM UsersRepository, Issue, Contribution
WHERE UsersRepository.ID = Contribution.repository AND Contribution.ID = Issue.ID 
GROUP BY UsersRepository.ID;

