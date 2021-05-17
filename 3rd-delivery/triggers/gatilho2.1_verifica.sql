.mode       columns
.headers    on
.nullvalue  NULL

SELECT ID AS contributionID,
       user AS contributor,
       repository AS repositoryID,
       "date" AS contributionDate
FROM Contribution;

-- REGULAR REPOSITORIES
INSERT INTO Contribution (ID, user, repository, "date") VALUES (91, 1, 9, "2021-05-10");
INSERT INTO Contribution (ID, user, repository, "date") VALUES (92, 2, 18, "2021-05-11");
INSERT INTO Contribution (ID, user, repository, "date") VALUES (93, 1, 2, "2021-05-12"); -- works
INSERT INTO Contribution (ID, user, repository, "date") VALUES (94, 3, 3, "2021-05-13");
INSERT INTO Contribution (ID, user, repository, "date") VALUES (95, 1, 4, "2021-05-14"); -- works
INSERT INTO Contribution (ID, user, repository, "date") VALUES (96, 8, 18, "2021-05-15"); 

SELECT ID AS contributionID,
       user AS contributor,
       repository AS repositoryID,
       "date" AS contributionDate
FROM Contribution;
