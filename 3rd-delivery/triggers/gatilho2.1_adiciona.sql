-- Garantir que, no que diz respeito a repositórios não pertencentes a organizações ou equipas, designados no contexto do trigger como regular repositories, 
-- apenas contribuidores conseguem fazer uma contribuição.

CREATE TRIGGER CheckContributionAvailabilityForRegularRepo
BEFORE INSERT ON Contribution
WHEN 
    -- is a regular repository
    (SELECT "owner" 
    FROM Repository
    WHERE ID = NEW.repository) IN (SELECT ID
                                   FROM User)
    AND
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
