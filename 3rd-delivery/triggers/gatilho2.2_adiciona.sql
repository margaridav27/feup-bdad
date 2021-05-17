/* Só membros de uma organização podem fazer uma contribuição para um repositório da mesma. */

CREATE TRIGGER CheckContributionAvailabilityForTeamRepo
BEFORE INSERT ON Contribution
WHEN 
    -- is not a member of the team to which the repository belongs
    NEW.user NOT IN (SELECT user 
                     FROM TeamUserMember 
                     WHERE team = (SELECT "owner" 
                                   FROM Repository 
                                   WHERE ID = NEW.repository))
BEGIN
    SELECT RAISE(FAIL, 'Team Repository: a contribution must be made by a team member.');
END;
