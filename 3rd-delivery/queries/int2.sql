.mode	columns
.headers	ON
.nullvalue	NULL

-- Obter o commit, concretamente a commitHash e message, associado a uma determinada tag.

SELECT Tag.name, "Commit".message, "Commit".commitHash
FROM Tag NATURAL JOIN "Commit";
