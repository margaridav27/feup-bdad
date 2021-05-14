SELECT Tag.name, "Commit".message, "Commit".commitHash
FROM Tag NATURAL JOIN "Commit";
