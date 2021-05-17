.mode	columns
.headers	ON
.nullvalue	NULL

SELECT Tag.name, "Commit".message, "Commit".commitHash
FROM Tag NATURAL JOIN "Commit";
