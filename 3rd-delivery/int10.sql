DROP View if exists "Group";
CREATE View "Group" AS 
    SELECT Team.ID 
    FROM Team 
            
    UNION 
            
    SELECT Organization.ID 
    FROM Organization;

DROP View if exists UsersRepository;
CREATE View UsersRepository AS
    SELECT Repository.ID, Repository.name
    FROM Repository 

    EXCEPT

    SELECT Repository.ID, Repository.name
    FROM Repository, "Group"
    WHERE Repository."owner" = "Group".ID;

SELECT UsersRepository.name, count(Issue.ID) as openIssues
FROM UsersRepository, Issue, Contribution
WHERE UsersRepository.ID = Contribution.repository and Contribution.ID = Issue.ID 
GROUP BY UsersRepository.ID;

