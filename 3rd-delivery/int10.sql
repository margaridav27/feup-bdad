SELECT Repository.name, COUNT(*)
FROM Repository, (SELECT Contribution.ID, Contribution.repository FROM Contribution JOIN Issue ON Contribution.ID = Issue.ID) AS Issues
WHERE Repository.ID = Issues.repository
GROUP BY Repository

EXCEPT

SELECT OwnerRepository.repository
FROM OwnerRepository, (SELECT Team.ID FROM Team UNION SELECT Organization.ID FROM Organization) as ColectiveEntityOwners
WHERE OwnerRepository.entity = ColectiveEntityOwners.ID;
