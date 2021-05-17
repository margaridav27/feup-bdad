.mode	columns
.headers	ON
.nullvalue	NULL

PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS Entity;
CREATE TABLE Entity (
    ID INTEGER,
    "name" TEXT       CONSTRAINT nameNN NOT NULL,
    CONSTRAINT entityPK PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS User;
CREATE TABLE User (
    ID INTEGER,
    CONSTRAINT userPK PRIMARY KEY (ID),
    CONSTRAINT userFK FOREIGN KEY (ID) REFERENCES Entity(ID)
);

DROP TABLE IF EXISTS Team;
CREATE TABLE Team (
    ID INTEGER,
    organization INTEGER,
    "description" TEXT,
    CONSTRAINT teamPK PRIMARY KEY (ID),
    CONSTRAINT teamFK FOREIGN KEY (ID) REFERENCES Entity(ID),
    CONSTRAINT teamOrganizationFK FOREIGN KEY (organization) REFERENCES Organization(ID)
);

DROP TABLE IF EXISTS Organization;
CREATE TABLE Organization (
    ID INTEGER,
    CONSTRAINT organizationPK PRIMARY KEY (ID),
    CONSTRAINT organizationFK FOREIGN KEY (ID) REFERENCES Entity(ID)
);

DROP TABLE IF EXISTS Directory;
CREATE TABLE Directory (
    -- Limit the number of chars for a directory imposed in UNIX
    ID INTEGER CONSTRAINT DirectoryIdValid CHECK (ID >= 1),
    "name" TEXT CONSTRAINT DirectoryNameNN NOT NULL 
                CONSTRAINT DirectoryNameMaxLen CHECK (LENGTH("name") <= 255),

    CONSTRAINT DirectoryPK PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS Repository;
CREATE TABLE Repository (
    ID INTEGER CONSTRAINT RepositoryIdValid CHECK (ID >= 1),
    "name" TEXT CONSTRAINT RepositoryNameNN NOT NULL,
    "owner" INTEGER,
    rootDirectory INTEGER CONSTRAINT rootDirectoryValid CHECK(rootDirectory >= 1),
    isVisible INTEGER CONSTRAINT RepositoryisVisibleValid CHECK (isVisible >= 0 AND isVisible <= 1),
    CONSTRAINT RepositoryOwnerFK FOREIGN KEY ("owner") REFERENCES Entity(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT RepositoryPK PRIMARY KEY (ID),
    CONSTRAINT RepositoryRootFK FOREIGN KEY (rootDirectory) REFERENCES Directory(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS Branch;
CREATE TABLE Branch (
    "name" TEXT         CONSTRAINT BranchNameDEFAULT DEFAULT "main" 
                        CONSTRAINT BranchNameNN NOT NULL,
    repository INTEGER  CONSTRAINT repositoryValid CHECK (repository >= 1),
    isDefault INTEGER   CONSTRAINT BranchisDafaultValid CHECK (isDefault >= 0 AND isDefault <= 1),

    CONSTRAINT BranchPK PRIMARY KEY ("name", repository),
    CONSTRAINT BranchRepositoryFK FOREIGN KEY (repository) REFERENCES Repository(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS Contribution;
CREATE TABLE Contribution (
    ID INTEGER  CONSTRAINT ContributionIdUNIQUE UNIQUE
                CONSTRAINT ContributionIdValid CHECK (ID >= 1),
    user INTEGER,
    repository INTEGER CONSTRAINT repositoryValid CHECK (repository >= 1),
    "date" DATE CONSTRAINT dateNN NOT NULL,
    CONSTRAINT ContributionPK PRIMARY KEY (ID),
    -- Contribution should remain even if User is deleted
    CONSTRAINT ContributionUserFK FOREIGN KEY (user) REFERENCES User(ID)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    CONSTRAINT ContributionRepositoryFK FOREIGN KEY (repository) REFERENCES Repository(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS "Commit";
CREATE TABLE "Commit" (
    ID INTEGER          CONSTRAINT idValid CHECK(ID >= 1), 
    commitHash TEXT     CONSTRAINT commitHashNN NOT NULL
                        CONSTRAINT commitHashSHAFormat CHECK (LENGTH(commitHash) == 40),
    "message" TEXT      CONSTRAINT defaultMessage DEFAULT "No commit message provided"
                        CONSTRAINT messageNN NOT NULL,

    CONSTRAINT CommitPK PRIMARY KEY (ID),
    CONSTRAINT CommitContributionFK FOREIGN KEY (ID) REFERENCES Contribution(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS Tag;
CREATE TABLE Tag (
    ID INTEGER          CONSTRAINT idValid CHECK(ID >= 1),
    "name" TEXT         CONSTRAINT TagNameNN NOT NULL,
    "commit" INTEGER    CONSTRAINT commitValid CHECK("commit" >= 1),

    CONSTRAINT TagPK PRIMARY KEY (ID),
    CONSTRAINT TagCommitFK FOREIGN KEY ("commit") REFERENCES "Commit"(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS PullRequest;
CREATE TABLE PullRequest (
    ID INTEGER          CONSTRAINT idValid CHECK(ID >= 1),
    pullRequestNumber INTEGER   CONSTRAINT PullRequestNumberValid CHECK (pullRequestNumber >= 1),
    "status" INTEGER            CONSTRAINT PullRequestStatusValid CHECK ("status" >= 0 AND "status" <= 1),
    "message" TEXT              CONSTRAINT defaultMessage DEFAULT "No pull request message provided",
                                CONSTRAINT messageNN CHECK("message" >= 1),

    CONSTRAINT PullRequestPK PRIMARY KEY (ID),
    CONSTRAINT PullRequestContributionFK FOREIGN KEY (ID) REFERENCES Contribution(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS Issue;
CREATE TABLE Issue (
    ID INTEGER          CONSTRAINT idValid CHECK(ID >= 1),
    issueNumber INTEGER     CONSTRAINT IssueNumberValid CHECK (issueNumber >= 1),
    "message" TEXT          CONSTRAINT defaultMessage DEFAULT "No issue message provided"
                            CONSTRAINT messageNN NOT NULL,

    CONSTRAINT IssuePK PRIMARY KEY (ID),
    CONSTRAINT IssueContributionFK FOREIGN KEY (ID) REFERENCES Contribution(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS "Merge";
CREATE TABLE "Merge" (
    ID INTEGER              CONSTRAINT idValid CHECK(ID >= 1),
    oursName TEXT           CONSTRAINT oursNameNN NOT NULL,
    oursRepository INTEGER  CONSTRAINT oursRepositoryValid CHECK(oursRepository >= 1),
    theirsName TEXT         CONSTRAINT theirsNameNN NOT NULL,
    theirsRepository INTEGER CONSTRAINT theirsRepositoryValid CHECK(theirsRepository >= 1),

    CONSTRAINT MergePK PRIMARY KEY (ID),
    CONSTRAINT MergeCommitFK FOREIGN KEY (ID) REFERENCES "Commit"(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT MergeBranchOursFK FOREIGN KEY (oursName, oursRepository) REFERENCES Branch("name", repository) 
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT MergeBranchTheirsFK FOREIGN KEY (theirsName, theirsRepository) REFERENCES Branch("name", repository)
        ON UPDATE CASCADE 
        ON DELETE CASCADE,
    CONSTRAINT MergeSameRepository CHECK (oursRepository == theirsRepository),
    CONSTRAINT MergeDifferentBranches CHECK (oursName != theirsName)
);

DROP TABLE IF EXISTS ProgrammingLanguage;
CREATE TABLE ProgrammingLanguage (
    "name" TEXT     CONSTRAINT ProgrammingLanguageNameUNIQUE UNIQUE,

    CONSTRAINT ProgrammingLanguagePK PRIMARY KEY ("name")
);

DROP TABLE IF EXISTS "File";
CREATE TABLE "File" (
    -- Limit the number of chars for a file imposed in UNIX
    "name" TEXT         CONSTRAINT FileNameNN NOT NULL 
                        CONSTRAINT FileNameMaxLen CHECK(LENGTH("name") <= 255),
    directory INTEGER   CONSTRAINT DirectoryValid CHECK(directory >= 1),
    content TEXT        CONSTRAINT contentNN NOT NULL,
    programmingLanguage TEXT,

    CONSTRAINT FilePK PRIMARY KEY ("name", directory),
    CONSTRAINT FileDirectoryFK FOREIGN KEY (directory) REFERENCES Directory(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    -- Once a programming language is instatiated and associated with a file it can't be removed anymore
    CONSTRAINT FileProgrammingLanguageFK FOREIGN KEY (programmingLanguage) REFERENCES ProgrammingLanguage("name")
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);


DROP TABLE IF EXISTS ContributorRepository;
CREATE TABLE ContributorRepository (
    user INTEGER,
    repository INTEGER CONSTRAINT repositoryValid CHECK(repository >= 1),
    CONSTRAINT ContributorRepositoryPK PRIMARY KEY (user, repository),
    /* Contribution should remain even if User is deleted */
    CONSTRAINT ContributorRepositoryUserFK FOREIGN KEY (user) REFERENCES User(ID)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    CONSTRAINT ContributorRepositoryRepositoryFK FOREIGN KEY (repository) REFERENCES Repository(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


DROP TABLE IF EXISTS OrganizationUserOwner;
CREATE TABLE OrganizationUserOwner (
    user INTEGER,
    organization INTEGER       CONSTRAINT organizationNN NOT NULL,
    CONSTRAINT OrganizationUserOwnerPK PRIMARY KEY (user, organization),
    CONSTRAINT OrganizationUserOwnerUserFK FOREIGN KEY (user) REFERENCES User(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT OrganizationUserOwnerOrganizationFK FOREIGN KEY (organization) REFERENCES Organization(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS OrganizationUserMember;
CREATE TABLE OrganizationUserMember (
    user INTEGER,
    organization INTEGER       CONSTRAINT organizationNN NOT NULL,
    isPrivate INTEGER       CONSTRAINT OrganizationUserMemberisPrivateValid CHECK (isPrivate >= 0 AND isPrivate <= 1),
    CONSTRAINT OrganizationUserMemberPK PRIMARY KEY (user, organization),
    CONSTRAINT OrganizationUserMemberUserFK FOREIGN KEY (user) REFERENCES User(ID),
    CONSTRAINT OrganizationUserMemberOrganizationFK FOREIGN KEY (organization) REFERENCES Organization(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS TeamUserMember;
CREATE TABLE TeamUserMember (
    user INTEGER,
    team INTEGER,
    isMaintainer INTEGER CONSTRAINT TeamRoleisMaintainerValid CHECK (isMaintainer >= 0 AND isMaintainer <= 1),
    CONSTRAINT TeamRolePK PRIMARY KEY (user, team),
    CONSTRAINT TeamRoleUserFK FOREIGN KEY (user) REFERENCES User(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT TeamRoleTeamFK FOREIGN KEY (team) REFERENCES Team(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS Submodule;
CREATE TABLE Submodule (
    source INTEGER          CONSTRAINT sourceValid CHECK(source >= 1),
    destination INTEGER     CONSTRAINT destinationValid CHECK(destination >= 1), 

    CONSTRAINT SubmodulePK PRIMARY KEY (source, destination),
    CONSTRAINT SubmoduleSourceFK FOREIGN KEY (source) REFERENCES Repository(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT SubmoduleDestinationFK FOREIGN KEY (destination) REFERENCES Repository(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS FolderRelationship;
CREATE TABLE FolderRelationship (
    child INTEGER           CONSTRAINT childValid CHECK(child >= 1),
    parent INTEGER          CONSTRAINT parentValid CHECK(parent >= 1),

    CONSTRAINT FolderRelationshipPK PRIMARY KEY (child, parent),
    CONSTRAINT FolderRelationshipParentFK FOREIGN KEY (parent) REFERENCES Directory(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT FolderRelationshipChildFK FOREIGN KEY (child) REFERENCES Directory(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

COMMIT TRANSACTION;
PRAGMA foreign_keys = ON;
