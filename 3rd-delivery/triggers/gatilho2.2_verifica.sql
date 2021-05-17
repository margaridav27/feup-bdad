.mode       columns
.headers    on
.nullvalue  NULL

SELECT ID AS contributionID,
       user AS contributor,
       repository AS repositoryID,
       "date" AS contributionDate
FROM Contribution;

-- TEAM REPOSITORIES 
-- team: UniApp | repository: website-NIAEFEU
INSERT INTO Contribution (ID, user, repository, "date") VALUES (97, 1, 12, "2021-05-13"); -- works (member)
INSERT INTO Contribution (ID, user, repository, "date") VALUES (98, 7, 12, "2021-05-14"); 
INSERT INTO Contribution (ID, user, repository, "date") VALUES (99, 3, 12, "2021-05-15");
-- team: NIJobs | repository: nijobs-nbe
INSERT INTO Contribution (ID, user, repository, "date") VALUES (100, 1, 13, "2021-05-10");
INSERT INTO Contribution (ID, user, repository, "date") VALUES (101, 2, 13, "2021-05-11"); -- works (member)
INSERT INTO Contribution (ID, user, repository, "date") VALUES (102, 5, 13, "2021-05-12"); -- works (member)
-- team: NIJobs | repository: nijobs-fe
INSERT INTO Contribution (ID, user, repository, "date") VALUES (103, 3, 14, "2021-05-13");
INSERT INTO Contribution (ID, user, repository, "date") VALUES (104, 5, 14, "2021-05-14"); -- works (member)
INSERT INTO Contribution (ID, user, repository, "date") VALUES (105, 9, 14, "2021-05-15"); 

SELECT ID AS contributionID,
       user AS contributor,
       repository AS repositoryID,
       "date" AS contributionDate
FROM Contribution;
