-- Garantir que, no que diz respeito a repositórios pertencentes a organizações, 
-- apenas membros da respetiva organização podem fazer uma contribuição.

CREATE TRIGGER CheckContributionAvailabilityForOrgRepo
BEFORE INSERT ON Contribution
WHEN 
    -- is an organization's repository
    (SELECT "owner" 
    FROM Repository
    WHERE ID = NEW.repository) IN (SELECT ID
                                   FROM Organization)
    AND
    -- is not the repository's owner
    NEW.user NOT IN (SELECT user
                     FROM OrganizationUserOwner
                     WHERE organization = (SELECT "owner" 
                                           FROM Repository 
                                           WHERE ID = NEW.repository))
    AND
    -- is not a member of the organization to which the repository belongs
    NEW.user NOT IN (SELECT user 
                     FROM OrganizationUserMember 
                     WHERE organization = (SELECT "owner" 
                                           FROM Repository 
                                           WHERE ID = NEW.repository))
BEGIN
    SELECT RAISE(FAIL, 'Organization Repository: a contribution must be made by the owner or by an organization member.');
END;
