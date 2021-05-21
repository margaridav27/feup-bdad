-- Garantir que, no que diz respeito a repositórios pertencentes a equipas, 
-- apenas membros da respetiva equipa podem fazer uma contribuição.

CREATE TRIGGER CheckContributionAvailabilityForTeamRepo
BEFORE INSERT ON Contribution
WHEN 
    -- is a team's repository
    (SELECT "owner" 
    FROM Repository
    WHERE ID = NEW.repository) IN (SELECT ID
                                   FROM Team)
    AND
    -- is not a member of the team to which the repository belongs
    NEW.user NOT IN (SELECT user 
                     FROM TeamUserMember 
                     WHERE team = (SELECT "owner" 
                                   FROM Repository 
                                   WHERE ID = NEW.repository))
BEGIN
    SELECT RAISE(FAIL, 'Team Repository: a contribution must be made by a team member.');
END;
