/*
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
    NEW.user <> (SELECT "owner" FROM Repository WHERE ID = NEW.repository)
            
    AND

    -- is not a repository's contributor
    NEW.user NOT IN (SELECT user FROM ContributorRepository WHERE repository = NEW.repository)
BEGIN
    SELECT RAISE(FAIL, 'Regular Repository: a contribution must be made by the owner or by a contributor of the repository.');
END;*/

/*
-- Só membros de uma organização podem fazer uma contribuição para um repositório da mesma. 
CREATE TRIGGER CheckContributionAvailabilityForTeamRepo
BEFORE INSERT ON Contribution
WHEN 
    -- team repository
    NEW.repository IN (SELECT "owner" FROM Repository INTERSECT SELECT ID FROM Team)

    AND 

    -- is not the repository's owner
    NEW.user <> (SELECT "owner" FROM Repository WHERE ID = NEW.repository)
            
    AND

    -- is not a member of the team to which the repository belongs
    NEW.user NOT IN (SELECT user FROM TeamUserMember WHERE team = (SELECT "owner" FROM Repository WHERE ID = NEW.repository))
BEGIN
    SELECT RAISE(FAIL, 'Team Repository: a contribution must be made by the owner or by a team member.');
END;
*/


-- Só membros de uma equipa podem fazer uma contribuição para um repositório da mesma.  
CREATE TRIGGER CheckContributionAvailabilityForOrgRepo
BEFORE INSERT ON Contribution
WHEN 
    -- organization repository
    NEW.repository IN (SELECT "owner" FROM Repository INTERSECT SELECT ID FROM Organization)

    AND 

    -- is not the repository's owner
    NEW.user <> (SELECT "owner" FROM Repository WHERE ID = NEW.repository)
            
    AND

    -- is not a member of the organization to which the repository belongs
    -- finish
BEGIN
    SELECT RAISE(FAIL, 'Organization Repository: a contribution must be made by the owner or by an organization member.');
END;
