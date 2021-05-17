.mode       columns
.headers    on
.nullvalue  NULL

SELECT ID AS contributionID,
       user AS contributor,
       repository AS repositoryID,
       "date" AS contributionDate
FROM Contribution;

-- ORGANIZATION REPOSITORIES 
-- organization: NIAEFEUP | repository: NI
INSERT INTO Contribution (ID, user, repository, "date") VALUES (106, 2, 15, "2021-05-10"); -- works (owner)
INSERT INTO Contribution (ID, user, repository, "date") VALUES (107, 8, 15, "2021-05-11"); 
INSERT INTO Contribution (ID, user, repository, "date") VALUES (108, 9, 15, "2021-05-12"); 
INSERT INTO Contribution (ID, user, repository, "date") VALUES (109, 5, 15, "2021-05-13"); -- works (member)
INSERT INTO Contribution (ID, user, repository, "date") VALUES (110, 6, 15, "2021-05-14"); 
INSERT INTO Contribution (ID, user, repository, "date") VALUES (111, 3, 15, "2021-05-15"); -- works (member)

SELECT ID AS contributionID,
       user AS contributor,
       repository AS repositoryID,
       "date" AS contributionDate
FROM Contribution;
