-- Garantir que o nome de uma tag é único no contexto de um repositório, ou seja, o mesmo repositório não pode ter duas tags com o mesmo nome.

CREATE TRIGGER CheckUniqueTagNameWithinRepository
BEFORE INSERT ON Tag
WHEN 
    NEW."name" IN (SELECT "name" FROM Tag)

    AND

    (SELECT repository FROM Contribution WHERE NEW."commit" = Contribution.ID)
    IN
    (SELECT repository FROM Tag JOIN Contribution ON Tag."commit" = Contribution.ID) 

BEGIN
    SELECT RAISE(FAIL, 'A Tag name must be unique within a repository.');
END;
