/* Aquando da criação de um repositório, criar o respetivo root directory*/
DROP TRIGGER IF EXISTS CreateRootDirectoryForRepository;
CREATE TRIGGER CreateRootDirectoryForRepository
BEFORE INSERT ON Repository
BEGIN
    SELECT MAX(Directory.ID) FROM Directory AS lastDirectoryID;
    INSERT INTO Directory (ID, "name") VALUES (lastDirectoryID + 1, New."name");

    SELECT MAX(Directory.ID) FROM Directory AS lastDirectoryID;
    UPDATE Repository SET rootDirectory = lastDirectoryID;
END;
