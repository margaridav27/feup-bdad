PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS User;
CREATE TABLE User (
    userName TEXT       CONSTRAINT userNameNN NOT NULL,
    CONSTRAINT UserPK PRIMARY KEY (userName)
);

DROP TABLE IF EXISTS Organization;
CREATE TABLE Organization (
    organizationName TEXT   CONSTRAINT organizationNameNN  NOT NULL,
    CONSTRAINT OrganizationPK PRIMARY KEY (organizationName)
);

DROP TABLE IF EXISTS Team;
CREATE TABLE Team (
    teamName TEXT       CONSTRAINT teamNameNN NOT NULL,
    organization TEXT,
    CONSTRAINT TeamPK PRIMARY KEY (teamName, organization),
    CONSTRAINT TeamOrganizationFK FOREIGN KEY (organization) REFERENCES Organization(organizationName) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS Directory;
CREATE TABLE Directory (
    /* Limit the number of chars for a directory imposed in UNIX */
    ID INTEGER CONSTRAINT DirectoryIdValid CHECK (ID >= 1),
    "name" TEXT         CONSTRAINT DirectoryNameNN NOT NULL 
                        CONSTRAINT DirectoryNameMaxLen CHECK (LENGTH("name") <= 255),
    CONSTRAINT DirectoryPK PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS Repository;
CREATE TABLE Repository (
    ID INTEGER              CONSTRAINT RepositoryIdValid CHECK (ID >= 1),
    "name" TEXT             CONSTRAINT RepositoryNameNN NOT NULL,
    rootDirectory INTEGER   CONSTRAINT RepositoryRootDirectoryUNIQUE UNIQUE,
    isVisible INTEGER       CONSTRAINT RepositoryisVisibleValid CHECK (isVisible >= 0 AND isVisible <= 1),
    CONSTRAINT RepositoryPK PRIMARY KEY (ID),
    CONSTRAINT RepositoryRootFK FOREIGN KEY (rootDirectory) REFERENCES Directory(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS Branch;
CREATE TABLE Branch (
    "name" TEXT         CONSTRAINT BranchNameDEFAULT DEFAULT "main" 
                        CONSTRAINT BranchNameNN NOT NULL,
    repository INTEGER,
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
    user TEXT,
    repository INTEGER,
    "date" DATE,
    CONSTRAINT ContributionPK PRIMARY KEY (ID),
    /* Contribution should remain even if User is deleted */
    CONSTRAINT ContributionUserFK FOREIGN KEY (user) REFERENCES User(userName)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    CONSTRAINT ContributionRepositoryFK FOREIGN KEY (repository) REFERENCES Repository(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS "Commit";
CREATE TABLE "Commit" (
    ID INTEGER, 
    commitHash TEXT     CONSTRAINT commitHashNN NOT NULL
                        CONSTRAINT commitHashSHAFormat CHECK (LENGTH(commitHash) == 40),
    "message" TEXT,
    CONSTRAINT CommitPK PRIMARY KEY (ID),
    CONSTRAINT CommitContributionFK FOREIGN KEY (ID) REFERENCES Contribution(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS Tag;
CREATE TABLE Tag (
    "name" TEXT         CONSTRAINT TagNameNN NOT NULL,
    "commit" INTEGER,
    CONSTRAINT TagPK PRIMARY KEY ("name", "commit"),
    CONSTRAINT TagCommitFK FOREIGN KEY ("commit") REFERENCES "Commit"(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS PullRequest;
CREATE TABLE PullRequest (
    ID INTEGER,
    /* How to calculate this number based on the Date from Contribution? */
    pullRequestNumber INTEGER   CONSTRAINT PullRequestNumberValid CHECK (pullRequestNumber >= 1),
    "status" INTEGER            CONSTRAINT PullRequestStatusValid CHECK ("status" >= 0 AND "status" <= 1),
    "message" TEXT,
    CONSTRAINT PullRequestPK PRIMARY KEY (ID),
    CONSTRAINT PullRequestContributionFK FOREIGN KEY (ID) REFERENCES Contribution(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS Issue;
CREATE TABLE Issue (
    ID INTEGER,
    /* How to calculate this number based on the Date from Contribution? */
    issueNumber INTEGER     CONSTRAINT IssueNumberValid CHECK (issueNumber >= 1),
    "message" TEXT,
    CONSTRAINT IssuePK PRIMARY KEY (ID),
    CONSTRAINT IssueContributionFK FOREIGN KEY (ID) REFERENCES Contribution(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS "Merge";
CREATE TABLE "Merge" (
    ID INTEGER,
    oursName TEXT,
    oursRepository INTEGER,
    theirsName TEXT,
    theirsRepository INTEGER,
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
    "name" TEXT     CONSTRAINT ProgrammingLanguageNameUNIQUE UNIQUE 
                    CONSTRAINT ProgrammingLanguageNameNN NOT NULL,
    CONSTRAINT ProgrammingLanguagePK PRIMARY KEY ("name")
);

DROP TABLE IF EXISTS "File";
CREATE TABLE "File" (
    /* Limit the number of chars for a file imposed in UNIX */
    "name" TEXT     CONSTRAINT FileNameNN NOT NULL 
                    CONSTRAINT FileNameMaxLen CHECK (LENGTH("name") <= 255),
    directory INTEGER,
    content TEXT,
    programmingLanguage TEXT,
    CONSTRAINT FilePK PRIMARY KEY ("name", directory),
    CONSTRAINT FileDirectoryFK FOREIGN KEY (directory) REFERENCES Directory(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    /* Once a programming language is instatiated and associated with a file it can't be removed anymore */
    CONSTRAINT FileProgrammingLanguageFK FOREIGN KEY (programmingLanguage) REFERENCES ProgrammingLanguage("name")
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

DROP TABLE IF EXISTS OwnerRepository;
CREATE TABLE OwnerRepository (
    user TEXT,
    repository INTEGER,
    CONSTRAINT OwnerRepositoryPK PRIMARY KEY (user, repository),
    CONSTRAINT OwnerRepositoryUserFK FOREIGN KEY (user) REFERENCES User(userName)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT OwnerRepositoryRepositoryFK FOREIGN KEY (repository) REFERENCES Repository(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS ContributorRepository;
CREATE TABLE ContributorRepository (
    user TEXT,
    repository INTEGER,
    CONSTRAINT ContributorRepositoryPK PRIMARY KEY (user, repository),
    /* Contribution should remain even if User is deleted */
    CONSTRAINT ContributorRepositoryUserFK FOREIGN KEY (user) REFERENCES User(userName)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    CONSTRAINT ContributorRepositoryRepositoryFK FOREIGN KEY (repository) REFERENCES Repository(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS TeamRepository;
CREATE TABLE TeamRepository (
    teamName TEXT,
    teamOrganization TEXT,
    repository INTEGER,
    CONSTRAINT TeamRepositoryPK PRIMARY KEY (teamName, teamOrganization, repository),
    CONSTRAINT TeamRepositoryTeamFK FOREIGN KEY (teamName, teamOrganization) REFERENCES Team(teamName, organization)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT TeamRepositoryRepositoryFK FOREIGN KEY (repository) REFERENCES Repository(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS TeamRole;
CREATE TABLE TeamRole (
    user TEXT,
    teamName TEXT,
    teamOrganization TEXT,
    isMaintainer INTEGER CONSTRAINT TeamRoleisMaintainerValid CHECK (isMaintainer >= 0 AND isMaintainer <= 1),
    CONSTRAINT TeamRolePK PRIMARY KEY (user, teamName, teamOrganization),
    CONSTRAINT TeamRoleUserFK FOREIGN KEY (user) REFERENCES User(userName)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT TeamRoleTeamFK FOREIGN KEY (teamName, teamOrganization) REFERENCES Team(teamName, organization)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS OrganizationRepository;
CREATE TABLE OrganizationRepository (
    organization TEXT,
    repository INTEGER,
    CONSTRAINT OrganizationRepositoryPK PRIMARY KEY (organization, repository),
    CONSTRAINT OrganizationRepositoryOrganizationFK FOREIGN KEY (organization) REFERENCES Organization(organizationName)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT OrganizationRepositoryRepositoryFK FOREIGN KEY (repository) REFERENCES Repository(ID)
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS OrganizationUserOwner;
CREATE TABLE OrganizationUserOwner (
    user TEXT,
    organization TEXT,
    CONSTRAINT OrganizationUserOwnerPK PRIMARY KEY (user, organization),
    CONSTRAINT OrganizationUserOwnerUserFK FOREIGN KEY (user) REFERENCES User(userName)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT OrganizationUserOwnerOrganizationFK FOREIGN KEY (organization) REFERENCES Organization(organizationName)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS OrganizationUserMember;
CREATE TABLE OrganizationUserMember (
    user TEXT,
    organization TEXT,
    isPrivate INTEGER   CONSTRAINT OrganizationUserMemberisPrivateValid CHECK (isPrivate >= 0 AND isPrivate <= 1),
    CONSTRAINT OrganizationUserMemberPK PRIMARY KEY (user, organization),
    CONSTRAINT OrganizationUserMemberUserFK FOREIGN KEY (user) REFERENCES User(userName)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT OrganizationUserMemberOrganizationFK FOREIGN KEY (organization) REFERENCES Organization(organizationName)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS Submodule;
CREATE TABLE Submodule (
    source INTEGER,
    destination INTEGER, 
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
    child INTEGER,
    parent INTEGER,
    CONSTRAINT FolderRelationshipPK PRIMARY KEY (child, parent),
    CONSTRAINT FolderRelationshipParentFK FOREIGN KEY (parent) REFERENCES Directory(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT FolderRelationshipChildFK FOREIGN KEY (child) REFERENCES Directory(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
