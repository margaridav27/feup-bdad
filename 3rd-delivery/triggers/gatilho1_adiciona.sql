/* Aquando da criação de um repositório, criar o respetivo rootDirectory */

CREATE TRIGGER CreateRootDirectoryForRepository
AFTER INSERT ON Repository
WHEN NEW.rootDirectory IS NULL
BEGIN
    INSERT INTO Directory (ID, "name") VALUES ((SELECT MAX(ID) FROM Directory) + 1, NEW."name");
    UPDATE Repository SET rootDirectory = (SELECT MAX(ID) FROM Directory) WHERE ID = NEW.ID;
END;