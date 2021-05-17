.mode       columns
.headers    on
.nullvalue  NULL

SELECT * FROM Directory;
SELECT * FROM Repository;

INSERT INTO Repository (ID, "name", "owner", isVisible) VALUES (19, "newRepository1", 4, 0);
INSERT INTO Repository (ID, "name", "owner", isVisible) VALUES (20, "newRepository2", 4, 0);
INSERT INTO Repository (ID, "name", "owner", isVisible) VALUES (21, "newRepository3", 4, 0);

SELECT * FROM Directory;
SELECT * FROM Repository;