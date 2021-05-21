.mode	columns
.headers	ON
.nullvalue	NULL

-- Obter, para cada repositório, a linguagem de programaçao mais utilizada.

-- Create the tree where for each folder we have the corresponding parent folder
-- Just a small change to manipulate more easily each rootDirectory
DROP VIEW IF EXISTS FolderRelations;
CREATE VIEW FolderRelations AS
    SELECT FolderRelationship.child AS childFolder, FolderRelationship.parent AS parentFolder
    FROM FolderRelationship

    UNION ALL

    SELECT Repository.rootDirectory, NULL
    FROM Repository;


-- Simple query to calculate which is the most used language for each folder
DROP VIEW IF EXISTS MostUsedProgrammingLanguage;
CREATE VIEW MostUsedProgrammingLanguage AS
    SELECT "File".directory AS directory, "File".programmingLanguage AS programmingLanguage
    FROM "File"
    GROUP BY "File".directory, "File".programmingLanguage
    HAVING COUNT("File".programmingLanguage)

    UNION

    SELECT "File".directory, NULL AS programmingLanguage
    FROM "File"
    WHERE "File".directory NOT IN (SELECT "File".directory
                                   FROM "File"
                                   GROUP BY "File".directory
                                   HAVING COUNT("File".programmingLanguage));


-- Now it's time for the recursive query, using a CTE
    -- This type of queries is only available for SQLite 3.8.3 or newer 

-- In other words we will simply discover which is the folder
-- in the top hierarchy for that folder
WITH RECURSIVE DirectoryRootFolder (childFolder, parentFolder, folderPath) AS
(
    SELECT FolderRelations.childFolder, 
           FolderRelations.parentFolder,
           CAST(FolderRelations.childFolder AS TEXT) AS folderPath
    FROM FolderRelations
    WHERE FolderRelations.parentFolder IS NULL

    UNION ALL

    SELECT FolderRelations.childFolder, 
           FolderRelations.parentFolder,
           DirectoryRootFolder.folderPath || '/' || CAST(FolderRelations.childFolder AS TEXT)
    FROM FolderRelations JOIN DirectoryRootFolder ON FolderRelations.parentFolder = DirectoryRootFolder.childFolder
)

-- Here's the main query
    -- First we must map all the directories to the corresponding repository
    -- Then group the directories to their repositories and inside each repository we must order them by the most used language
    -- To calculate the most used language in repository we use the following method:
        -- First we calculate for each folder which is the most used language inside that folder
        -- After that, we associate each folder with the correct repository
        -- Ultimately, the most used language is the one that has the most directories whose the most used language is the same
        -- In other words is like calculating the mode of the programming languges used inside each repository
    -- Finally we just need to group everything again and retrieve the first tuple for each repository
    -- that tuple contains the name of the repository and the name of the most used programming language for the corresponding repository
SELECT RepositoryMostUsedLanguage.repositoryName AS repositoryName,
       RepositoryMostUsedLanguage.programmingLanguage AS programmingLanguage
FROM (
        SELECT RepositoryFolder.Name AS repositoryName, MostUsedProgrammingLanguage.programmingLanguage
        FROM MostUsedProgrammingLanguage NATURAL JOIN 
        -- The Cast in both subqueries allows the DBMS to join both tables properly - by the directories ID
            -- Retrive all the root directories
            (SELECT Repository.Name, CAST(Repository.rootDirectory AS INTEGER) AS folderPath
             FROM Repository
             GROUP BY Repository.Name

             UNION ALL

             -- Retrieve all the subdirectories
             SELECT Repository.Name,
                    -- This is just a bunch of tricks and string manipulation to get the proper directory ID
                    CAST(REPLACE(DirectoryRootFolder.folderPath, RTRIM(DirectoryRootFolder.folderPath, REPLACE(DirectoryRootFolder.folderPath, '/', '')), '') AS INTEGER)
             FROM Repository JOIN DirectoryRootFolder ON DirectoryRootFolder.folderPath LIKE CAST(Repository.rootDirectory AS TEXT) || '/%'
            ) AS RepositoryFolder
        WHERE RepositoryFolder.folderPath = MostUsedProgrammingLanguage.directory
        GROUP BY RepositoryFolder.name, MostUsedProgrammingLanguage.programmingLanguage
        -- In SQLite NULL values are smaller than any other non-NULL value, hence the use of the DESC
        ORDER BY COUNT(MostUsedProgrammingLanguage.ProgrammingLanguage) DESC
        ) AS RepositoryMostUsedLanguage
GROUP BY RepositoryMostUsedLanguage.repositoryName;
