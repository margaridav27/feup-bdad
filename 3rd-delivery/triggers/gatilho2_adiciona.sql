--  Só contribuidores de um repositório podem fazer uma contribuição para o mesmo.
CREATE TRIGGER CheckContributionAvailabilityForRegularRepo
BEFORE INSERT ON Contribution
WHEN 
    -- regular repository
    (SELECT "onwer" FROM Repository WHERE New.repository = Repository.ID) 
    IN 
    (SELECT ID FROM User)

    AND 

    -- is not the repository's owner
    NEW.user NOT IN (SELECT "owner" FROM Repository)
            
    AND

    -- is not a repository's contributor
    NEW.user NOT IN (SELECT user FROM ContributorRepository)
BEGIN
    SELECT RAISE(FAIL, 'A contribution must be made by the owner or by a contributor of the repository.');
END;

/*
-- Só membros de uma organização podem fazer uma contribuição para um repositório da mesma. 
CREATE TRIGGER CheckContributionAvailability
BEFORE INSERT ON Contribution
WHEN 
    -- team's repository
    (SELECT "onwer" FROM Repository WHERE New.repository = Repository.ID) 
    IN 
    (SELECT ID FROM Team)

    AND 

    -- is not the repository's owner
    NEW.user NOT IN (SELECT "owner" FROM Repository)
            
    AND

    -- is not a repository's contributor
    NEW.user NOT IN (SELECT user FROM TeamUserMember WHERE )

    SELECT ""


BEGIN
    SELECT RAISE(FAIL, 'A contribution must be made by the owner or by a contributor of the repository.');
END;

-- Só membros de uma equipa podem fazer uma contribuição para um repositório da mesma.  
CREATE TRIGGER CheckContributionAvailability
BEFORE INSERT ON Contribution
WHEN 
    -- is not the repository's owner
    NEW.user NOT IN (SELECT "owner" 
                     FROM Repository)
            
    AND

    -- is not a repository's contributor
    NEW.user NOT IN (SELECT user
                     FROM ContributorRepository)

BEGIN
    SELECT RAISE(FAIL, 'A contribution must be made by the owner or by a contributor of the repository.');
END;
*/