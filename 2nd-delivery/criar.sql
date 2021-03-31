PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS User (
    userName TEXT UNIQUE NOT NULL,
    CONSTRAINT UserPK PRIMARY KEY (userName) 
);

CREATE TABLE IF NOT EXISTS Organization (
    organizationName TEXT UNIQUE NOT NULL,
    CONSTRAINT OrganizationPK PRIMARY KEY (organizationName)
);

CREATE TABLE IF NOT EXISTS OrganizationMemberVisibility (
    user TEXT,
    organization TEXT,
    isPrivate INTEGER CHECK (isPrivate >= 0 AND isPrivate <= 1),
    CONSTRAINT OrganizationMemberVisibilityPK PRIMARY KEY (user, organization),
    CONSTRAINT OrganizationMemberVisibilityUserFK FOREIGN KEY (user) REFERENCES User(userName),
    CONSTRAINT OrganizationMemberVisibilityOrganizationFK FOREIGN KEY (organization) REFERENCES Organization(organizationName)
);

CREATE TABLE IF NOT EXISTS OrganizationUserOwner (
    user TEXT,
    organization TEXT,
    CONSTRAINT OrganizationUserOwnerPK PRIMARY KEY (user, organization),
    CONSTRAINT OrganizationUserOwnerUserFK FOREIGN KEY (user) REFERENCES User(userName),
    CONSTRAINT OrganizationUserOwnerOrganizationFK FOREIGN KEY (organization) REFERENCES Organization(organizationName)
);

CREATE TABLE IF NOT EXISTS OrganizationUserMember (
    user TEXT,
    organization TEXT,
    CONSTRAINT OrganizationUserMemberPK PRIMARY KEY (user, organization),
    CONSTRAINT OrganizationUserMemberUserFK FOREIGN KEY (user) REFERENCES User(userName),
    CONSTRAINT OrganizationUserMemberOrganizationFK FOREIGN KEY (organization) REFERENCES Organization(organizationName)
);

CREATE TABLE IF NOT EXISTS Team (
    teamName TEXT NOT NULL,
    description TEXT,
    CONSTRAINT TeamPK PRIMARY KEY (teamName)
);

CREATE TABLE IF NOT EXISTS TeamRole (
    user TEXT,
    team TEXT,
    isMaintainer INTEGER CHECK (isMaintainer >= 0 AND isMaintainer <= 1),
    CONSTRAINT TeamRolePK PRIMARY KEY (user, team),
    CONSTRAINT TeamRoleUserFK FOREIGN KEY (user) REFERENCES User(userName),
    CONSTRAINT TeamRoleTeamFK FOREIGN KEY (team) REFERENCES Team(teamName)
);


/* Repos & Stuff */

CREATE TABLE IF NOT EXISTS Repository (
    ID INTEGER UNIQUE CHECK (ID >= 1),
    name TEXT NOT NULL,
    rootDirectory INTEGER,
    isVisible INTEGER CHECK (isVisible >= 0 AND isVisible <= 1),
    CONSTRAINT RepositoryPK PRIMARY KEY (ID),
    CONSTRAINT RepositoryRootFK FOREIGN KEY (rootDirectory) REFERENCES Directory(ID)
);

CREATE TABLE IF NOT EXISTS Submodule (
    source INTEGER,
    destination INTEGER, 
    CONSTRAINT SubmodulePK PRIMARY KEY (source, destination),
    CONSTRAINT SubmoduleSourceFK FOREIGN KEY (source) REFERENCES Repository(ID),
    CONSTRAINT SubmoduleDestinationFK FOREIGN KEY (destination) REFERENCES Repository(ID)
);

CREATE TABLE IF NOT EXISTS OwnerRepository (
    user TEXT,
    repository INTEGER,
    CONSTRAINT OwnerRepositoryPK PRIMARY KEY (user, repository),
    CONSTRAINT OwnerRepositoryUserFK FOREIGN KEY (user) REFERENCES User(userName),
    CONSTRAINT OwnerRepositoryRepositoryFK FOREIGN KEY (repository) REFERENCES Repository(ID)
);

CREATE TABLE IF NOT EXISTS ContributorRepository (
    user TEXT,
    repository INTEGER,
    CONSTRAINT ContributorRepositoryPK PRIMARY KEY (user, repository),
    CONSTRAINT ContributorRepositoryUserFK FOREIGN KEY (user) REFERENCES User(userName),
    CONSTRAINT ContributorRepositoryRepositoryFK FOREIGN KEY (repository) REFERENCES Repository(ID)
);

CREATE TABLE IF NOT EXISTS TeamRepository (
    team TEXT,
    repository INTEGER,
    CONSTRAINT TeamRepositoryPK PRIMARY KEY (team, repository),
    CONSTRAINT TeamRepositoryTeamFK FOREIGN KEY (team) REFERENCES Team(teamName),
    CONSTRAINT TeamRepositoryRepositoryFK FOREIGN KEY (repository) REFERENCES Repository(ID)
);

CREATE TABLE IF NOT EXISTS OrganizationRepository (
    organization TEXT,
    repository INTEGER,
    CONSTRAINT OrganizationRepositoryPK PRIMARY KEY (organization, repository),
    CONSTRAINT OrganizationRepositoryOrganizationFK FOREIGN KEY (organization) REFERENCES Organization(organizationName),
    CONSTRAINT OrganizationRepositoryRepositoryFK FOREIGN KEY (repository) REFERENCES Repository(ID)
);


/* Git Stuff */

CREATE TABLE IF NOT EXISTS Branch (
    name TEXT DEFAULT "main" NOT NULL,
    isDefault INTEGER CHECK (isDefault >= 0 AND isDefault <= 1),
    repository INTEGER,
    CONSTRAINT BranchPK PRIMARY KEY (name, repository),
    CONSTRAINT BranchRepositoryFK FOREIGN KEY (repository) REFERENCES Repository(ID)
);

CREATE TABLE IF NOT EXISTS "Commit" (
    ID INTEGER, 
    commitHash TEXT NOT NULL CHECK (LENGTH(commitHash) == 40),
    message TEXT,
    CONSTRAINT CommitPK PRIMARY KEY (ID),
    CONSTRAINT CommitContributionFK FOREIGN KEY (ID) REFERENCES Contribution(ID)
);

CREATE TABLE IF NOT EXISTS Tag (
    name TEXT NOT NULL,
    "commit" INTEGER,
    CONSTRAINT TagPK PRIMARY KEY (name, "commit"),
    CONSTRAINT TagCommitFK FOREIGN KEY ("commit") REFERENCES "Commit"(ID)
);

/* Contributions */

CREATE TABLE IF NOT EXISTS Contribution (
    ID INTEGER UNIQUE CHECK (ID >= 1),
    user TEXT,
    repository INTEGER,
    date DATE,
    CONSTRAINT ContributionPK PRIMARY KEY (ID),
    CONSTRAINT ContributionUserFK FOREIGN KEY (user) REFERENCES User(userName),
    CONSTRAINT ContributionRepositoryFK FOREIGN KEY (repository) REFERENCES Repository(ID)
);

CREATE TABLE IF NOT EXISTS PullRequest (
    ID INTEGER,
    /* How to calculate this number based on the Date from Contribution? */
    pullRequestNumber INTEGER CHECK (pullRequestNumber >= 1),
    status INTEGER CHECK (status >= 0 AND status <= 1),
    message TEXT,
    CONSTRAINT PullRequestPK PRIMARY KEY (ID),
    CONSTRAINT PullRequestContributionFK FOREIGN KEY (ID) REFERENCES Contribution(ID)
);

CREATE TABLE IF NOT EXISTS Issue (
    ID INTEGER,
    /* How to calculate this number based on the Date from Contribution? */
    issueNumber INTEGER CHECK (issueNumber >= 1),
    message TEXT,
    CONSTRAINT IssuePK PRIMARY KEY (ID),
    CONSTRAINT IssueContributionFK FOREIGN KEY (ID) REFERENCES Contribution(ID)
);

CREATE TABLE IF NOT EXISTS Merge (
    ID INTEGER,
    oursName TEXT,
    oursRepository INTEGER,
    theirsName TEXT,
    theirsRepository INTEGER,
    CONSTRAINT MergePK PRIMARY KEY (ID),
    CONSTRAINT MergeCommitFK FOREIGN KEY (ID) REFERENCES "Commit"(ID),
    CONSTRAINT MergeBranchOursNameFK FOREIGN KEY (oursName, oursRepository) REFERENCES Branch(name, repository),
    CONSTRAINT MergeBranchTheirsNameFK FOREIGN KEY (theirsName, theirsRepository) REFERENCES Branch(name, repository),
    CONSTRAINT MergeSameRepository CHECK (oursRepository == theirsRepository),
    CONSTRAINT MergeDifferentBranches CHECK (oursName != theirsName)
);

/* Files And Directories */

/* Still Missing The Checks for prohibited chars in folders */

CREATE TABLE IF NOT EXISTS Directory (
    /* Limit the number of chars for a directory imposed in UNIX */
    ID INTEGER UNIQUE CHECK (ID >= 1),
    name TEXT NOT NULL CHECK (LENGTH(name) <= 255),
    CONSTRAINT DirectoryPK PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS File (
    /* Limit the number of chars for a file imposed in UNIX */
    name TEXT NOT NULL CHECK (LENGTH(name) <= 255),
    directory INTEGER,
    content TEXT,
    programmingLanguage TEXT,
    CONSTRAINT FilePK PRIMARY KEY (name, directory),
    CONSTRAINT FileDirectoryFK FOREIGN KEY (directory) REFERENCES Directory(ID),
    CONSTRAINT FileProgrammingLanguageFK FOREIGN KEY (programmingLanguage) REFERENCES ProgrammingLanguage(name)
);

CREATE TABLE IF NOT EXISTS ProgrammingLanguage (
    name TEXT UNIQUE NOT NULL,
    CONSTRAINT ProgrammingLanguagePK PRIMARY KEY (name)
);

CREATE TABLE IF NOT EXISTS FolderRelationship (
    parent INTEGER,
    child INTEGER,
    CONSTRAINT FolderRelationshipPK PRIMARY KEY (parent, child),
    CONSTRAINT FolderRelationshipParentFK FOREIGN KEY (parent) REFERENCES Directory(ID),
    CONSTRAINT FolderRelationshipChildFK FOREIGN KEY (child) REFERENCES Directory(ID)
);
