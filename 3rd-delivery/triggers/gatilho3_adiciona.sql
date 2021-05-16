DROP TRIGGER IF EXISTS CheckUniqueTagNameWithinRepository;
CREATE TRIGGER CheckUniqueTagNameWithinRepository
BEFORE INSERT ON Tag
WHEN 
    NEW."name" IN (SELECT "name" FROM Tag)

    AND

    (SELECT repository
    FROM Contribution
    WHERE NEW."commit" = Contribution.ID)
    IN
    (SELECT repository
     FROM Tag JOIN Contribution ON Tag."commit" = Contribution.ID) 

BEGIN
    SELECT RAISE(IGNORE);
END;
