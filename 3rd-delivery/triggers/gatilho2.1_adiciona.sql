/* Só contribuidores de um repositório podem fazer uma contribuição para o mesmo. */

CREATE TRIGGER CheckContributionAvailabilityForRegularRepo
BEFORE INSERT ON Contribution
WHEN 
    -- is not the repository's owner
    NEW.user <> (SELECT "owner" 
                 FROM Repository 
                 WHERE ID = NEW.repository)
    AND
    -- is not a repository's contributor
    NEW.user NOT IN (SELECT user 
                     FROM ContributorRepository 
                     WHERE repository = NEW.repository)
BEGIN
    SELECT RAISE(FAIL, 'Regular Repository: a contribution must be made by the owner or by a contributor of the repository.');
END;
