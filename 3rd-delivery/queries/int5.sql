.mode	columns
.headers	ON
.nullvalue	NULL

-- Easier to make comparisons between strings in the ASCII range
PRAGMA case_sensitive_like = 1;

-- 5. Para cada organização, listar o nome dos diretórios de cada um dos seus repositórios.

-- Retrives all the repositories from Organizations
DROP VIEW IF EXISTS OrganizationRepositories;
CREATE VIEW OrganizationRepositories AS
    SELECT Repository.name AS "name", Repository.owner AS "owner"
    FROM Repository JOIN Organization ON Repository."owner" = Organization.ID;

-- This query is the same made in int4.sql
DROP VIEW IF EXISTS FolderRelations;
CREATE VIEW FolderRelations AS
    SELECT FolderRelationship.child AS childFolder, 
           FolderRelationship.parent AS parentFolder,
           directory.name AS childName
    FROM FolderRelationship, directory
    WHERE FolderRelationship.child = directory.id

    UNION ALL

    SELECT Repository.rootDirectory, NULL, directory.name
    FROM Repository, directory
    WHERE Repository.rootDirectory = directory.id;


-- Once again we will use a CTE to make the full paths
-- Note that the strategy here is very similiar to the one in int4.sql
WITH RECURSIVE FolderTree (childFolder, parentFolder, folderPath) AS
(
    SELECT FolderRelations.childFolder, 
           FolderRelations.parentFolder,
           FolderRelations.childName AS folderPath
    FROM FolderRelations
    WHERE FolderRelations.parentFolder IS NULL

    UNION ALL

    SELECT FolderRelations.childFolder, 
           FolderRelations.parentFolder,
           FolderTree.folderPath || '/' || FolderRelations.childName
    FROM FolderRelations JOIN FolderTree ON FolderRelations.parentFolder = FolderTree.childFolder
)

-- The main query now retrieves all the folders of Organizations' repositories
SELECT Entity.name AS organizationName,
       OrganizationRepositories.name AS repositoryName, 
       FolderTree.folderPath As folderPath
FROM (Entity JOIN OrganizationRepositories ON Entity.id = OrganizationRepositories.owner), FolderTree
WHERE FolderTree.folderPath LIKE (OrganizationRepositories.name || '%');

-- Turning this off to the default value again
PRAGMA case_sensitive_like = 0;
