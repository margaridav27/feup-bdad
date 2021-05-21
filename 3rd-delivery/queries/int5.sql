.mode	columns
.headers	ON
.nullvalue	NULL

-- Para cada organização, listar o nome dos diretórios de cada um dos seus repositórios.

-- Retrives all the repositories from Organizations
DROP VIEW IF EXISTS OrganizationRepositories;
CREATE VIEW OrganizationRepositories AS
    SELECT Repository.name AS "name", Repository.owner AS "owner"
    FROM Repository JOIN Organization ON Repository."owner" = Organization.ID;

-- This query is very similar to the ine made in int4.sql
-- However this time we use the directory names instead of the IDs
DROP VIEW IF EXISTS FolderRelationsNames;
CREATE VIEW FolderRelationsNames AS
    SELECT childJoiner.name AS childName, parentJoiner.name AS parentName  
    FROM   (SELECT FolderRelationship.child AS childFolder, FolderRelationship.parent AS parentFolder
            FROM FolderRelationship) AS FldrRelations 
            JOIN Directory AS childJoiner ON FldrRelations.childFolder = childJoiner.ID
            JOIN Directory AS parentJoiner ON FldrRelations.parentFolder = parentJoiner.ID
            
    UNION ALL

    SELECT Directory.name AS childName, NULL AS parentName
    FROM Repository JOIN Directory ON Repository.rootDirectory = Directory.ID;


-- Once again we will use a CTE to make the full paths
WITH RECURSIVE FolderPath (folderPath) AS 
(
    SELECT FolderRelationsNames.childName AS folderPath
    FROM FolderRelationsNames
    WHERE FolderRelationsNames.parentName IS NULL

    UNION ALL

    SELECT FolderPath.folderPath || '/' || FolderRelationsNames.childName AS folderPath
    FROM FolderRelationsNames JOIN FolderPath ON FolderRelationsNames.parentName = FolderPath.folderPath
)

-- The main query now retrieves all the folders of Organizations' repositories 
SELECT OrgRepoName.name AS OrganizationName, 
       RepoPaths.name AS RepositoryName,
       RepoPaths.path AS DirectoryPath
FROM (SELECT Entity.name AS "name", Entity.ID AS ID
      FROM OrganizationRepositories JOIN Entity ON Entity.ID = OrganizationRepositories.owner) AS OrgRepoName, 
     (SELECT OrganizationRepositories.name AS "name", FolderPath.folderPath as "path"
      FROM OrganizationRepositories JOIN FolderPath
      WHERE OrganizationRepositories.name LIKE FolderPath.folderPath || '%') AS RepoPaths
ORDER BY OrganizationName, RepositoryName, DirectoryPath ASC;
