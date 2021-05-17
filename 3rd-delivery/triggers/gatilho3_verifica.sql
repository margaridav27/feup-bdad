SELECT Tag.ID AS tagID, 
       Tag."name" AS tagName, 
       Tag."commit" AS tagCommit, 
       repository AS tagRepository
FROM Tag JOIN Contribution ON Tag."commit" = Contribution.ID;

-- does not work
INSERT INTO Tag (ID, "name", "commit") VALUES (10, "tp3", 18); 
INSERT INTO Tag (ID, "name", "commit") VALUES (11, "tp5", 22);
INSERT INTO Tag (ID, "name", "commit") VALUES (12, "tp6", 32);
INSERT INTO Tag (ID, "name", "commit") VALUES (13, "tp7", 64);

-- works
INSERT INTO Tag (ID, "name", "commit") VALUES (14, "nijobs-2", 27); 
INSERT INTO Tag (ID, "name", "commit") VALUES (15, "game-v1", 49);
INSERT INTO Tag (ID, "name", "commit") VALUES (16, "hotfix-game-v1.1", 51);

SELECT Tag.ID AS tagID, 
       Tag."name" AS tagName, 
       Tag."commit" AS tagCommit, 
       repository AS tagRepository
FROM Tag JOIN Contribution ON Tag."commit" = Contribution.ID;