INSERT INTO User (userName)
VALUES
    ("beatriz-ag"),
    ("margaridav27"),
    ("mikRodrigues"),
    ("arestivo"),
    ("filipepcampos"),
    ("sofiagermer"),
    ("Retchup"),
    ("rodrigotuna"),
    ("BiguelBodrigues"),
    ("brunogomes30"),
    ("Jumaruba"),
    ("JoaoAMarinho"),
    ("jfbaltazar"),
    ("tmv11"),
    ("beatrizlopesdossantos"),
    ("DTPreda"),
    ("miguelpduarte"),
    ("TiagoCaldaSilva"),
    ("maildejoliveira"),
    ("Andrepereira2001"),
    ("RuiVieira456"),
    ("reeckset"),
    ("anaMendes123"),
    ("xico2001pt"),
    ("francisco-rente"),
    ("Rickyfer205"),
    ("caduonrails"),
    ("FlyHigh1111"),
    ("Goncalerta"),
    ("leonormgomes"),
    ("eukia"),
    ("amargaridarl"),
    ("AntoniooCruz"),
    ("Ca-moes"),
    ("SALajes"),
    ("antbz"),
    ("nunottlopes"),
    ("ferrolho"),
    ("DoStini"),
    ("torvalds");


INSERT INTO Organization (organizationName)
VALUES
    ("developful"),
    ("weba"),
    ("codes"),
    ("IBASE"),
    ("WEBC"),
    ("WEBITS"),
    ("NIAEFEUP"),
    ("dalux"),
    ("microsoft"),
    ("google"),
    ("linux"),
    ("netflix"),
    ("NEEC"),
    ("NEEM"),
    ("adobe"),
    ("square"),
    ("twitter"),
    ("instagram"),
    ("facebook"),
    ("sonic"),
    ("discordapi"),
    ("apple"),
    ("webappDist"),
    ("youtube"),
    ("mmarket"),
    ("JuniFEUP"),
    ("OnlyFans");


INSERT INTO OrganizationMemberVisibility (user, organization, isPrivate)
VALUES
    ("margaridav27", "BDAD", 0),
    ("margaridav27", "NIAEFEUP", 0),
    ("margaridav27", "linux", 1),
    ("beatriz-ag", "JuniFEUP", 0),
    ("beatriz-ag", "BDAD", 1),
    ("beatriz-ag", "apple", 1),
    ("mikRodrigues", "linux", 0),
    ("mikRodrigues", "twitter", 1),
    ("mikRodrigues", "mmarket", 1),
    ("mikRodrigues", "LCOM", 1),
    ("mikRodrigues", "BDAD", 1),
    ("BiguelBodrigues", "twitter", 0),
    ("torvalds", "linux", 0),
    ("arestivo", "adobe", 0),
    ("arestivo", "codes", 0),
    ("arestivo", "developful", 0),
    ("rodrigotuna", "LCOM", 1),
    ("Jumaruba", "NEEC", 0),
    ("jfbaltazar", "google", 0),
    ("jfbaltazar", "square", 1),
    ("tmv11", "linux", 0),
    ("tmv11", "microsoft", 0),
    ("beatrizlopesdossantos", "instagram", 0),
    ("beatrizlopesdossantos", "OnlyFans", 0),
    ("DTPreda", "discordapi", 0),
    ("DTPreda", "netflix", 0),
    ("miguelpduarte", "NIAEFEUP", 0),
    ("miguelpduarte", "discordapi", 0),
    ("miguelpduarte", "sonic", 0),
    ("TiagoCaldaSilva", "NIAEFEUP", 0),
    ("TiagoCaldaSilva", "LCOM", 0),
    ("Andrepereira2001", "youtube", 0),
    ("Andrepereira2001", "CGRA", 0),
    ("RuiVieira456", "facebook", 1),
    ("Rickyfer205", "mmarket", 0),
    ("Rickyfer205", "NEEM", 0),
    ("Rickyfer205", "sonic", 0),
    ("Goncalerta", "weba", 0),
    ("Goncalerta", "IBASE", 0),
    ("leonormgomes", "WEBC", 0),
    ("leonormgomes", "WEBITS", 0),
    ("AntoniooCruz", "dalux", 0),
    ("SALajes", "apple", 0),
    ("SALajes", "WEBC", 0),
    ("antbz", "square", 0),
    ("DoStini", "discordapi", 0),
    ("DoStini", "NIAEFEUP", 0),
    ("DoStini", "microsoft", 0),
    ("DoStini", "LCOM", 0),
    ("ferrolho", "apple", 0),
    ("ferrolho", "adobe", 0),
    ("ferrolho", "square", 0),
    ("nunottlopes", "facebook", 1),
    ("nunottlopes", "webappDist", 0);


INSERT INTO OrganizationUserOwner (user, organization)
VALUES
    ("developful", "arestivo"),
    ("weba", "Goncalerta"),
    ("codes", "arestivo"),
    ("IBASE", "Goncalerta"),
    ("WEBC", "SALajes"),
    ("WEBITS", "leonormgomes"),
    ("NIAEFEUP", "miguelpduarte"),
    ("dalux", "AntoniooCruz"),
    ("microsoft", "tmv11"),
    ("google", "jfbaltazar"),
    ("linux", "torvalds"),
    ("netflix", "DTPreda"),
    ("NEEC", "Jumaruba"),
    ("NEEM", "Rickyfer205"),
    ("LCOM", "DoStini"),
    ("CGRA", "Andrepereira2001"),
    ("BDAD", "margaridav27"),
    ("adobe", "arestivo"),
    ("square", "antbz"),
    ("twitter", "BiguelBodrigues"),
    ("instagram", "beatrizlopesdossantos"),
    ("facebook", "nunottlopes"),
    ("sonic", "miguelpduarte"),
    ("discordapi", "DTPreda"),
    ("apple", "ferrolho"),
    ("webappDist", "nunottlopes"),
    ("youtube", "Andrepereira2001"),
    ("mmarket", "Rickyfer205"),
    ("JuniFEUP", "beatriz-ag"),
    ("OnlyFans", "beatrizlopesdossantos");


INSERT INTO OrganizationUserMember (user, organization)
VALUES
    ("margaridav27", "BDAD"),
    ("margaridav27", "NIAEFEUP"),
    ("margaridav27", "linux"),
    ("beatriz-ag", "JuniFEUP"),
    ("beatriz-ag", "BDAD"),
    ("beatriz-ag", "apple"),
    ("mikRodrigues", "linux"),
    ("mikRodrigues", "twitter"),
    ("mikRodrigues", "mmarket"),
    ("mikRodrigues", "LCOM"),
    ("mikRodrigues", "BDAD"),
    ("BiguelBodrigues", "twitter"),
    ("torvalds", "linux"),
    ("arestivo", "adobe"),
    ("arestivo", "codes"),
    ("arestivo", "developful"),
    ("rodrigotuna", "LCOM"),
    ("Jumaruba", "NEEC"),
    ("jfbaltazar", "google"),
    ("jfbaltazar", "square"),
    ("tmv11", "linux"),
    ("tmv11", "microsoft"),
    ("beatrizlopesdossantos", "instagram"),
    ("beatrizlopesdossantos", "OnlyFans"),
    ("DTPreda", "discordapi"),
    ("DTPreda", "netflix"),
    ("miguelpduarte", "NIAEFEUP"),
    ("miguelpduarte", "discordapi"),
    ("miguelpduarte", "sonic"),
    ("TiagoCaldaSilva", "NIAEFEUP"),
    ("TiagoCaldaSilva", "LCOM"),
    ("Andrepereira2001", "youtube"),
    ("Andrepereira2001", "CGRA"),
    ("RuiVieira456", "facebook"),
    ("Rickyfer205", "mmarket"),
    ("Rickyfer205", "NEEM"),
    ("Rickyfer205", "sonic"),
    ("Goncalerta", "weba"),
    ("Goncalerta", "IBASE"),
    ("leonormgomes", "WEBC"),
    ("leonormgomes", "WEBITS"),
    ("AntoniooCruz", "dalux"),
    ("SALajes", "apple"),
    ("SALajes", "WEBC"),
    ("antbz", "square"),
    ("DoStini", "discordapi"),
    ("DoStini", "NIAEFEUP"),
    ("DoStini", "microsoft"),
    ("DoStini", "LCOM"),
    ("ferrolho", "apple"),
    ("ferrolho", "adobe"),
    ("ferrolho", "square"),
    ("nunottlopes", "facebook"),
    ("nunottlopes", "webappDist");


INSERT INTO Team(teamName,description)
VALUES
    ("ubuntu-v9","Updates for ubuntu"),
    ("ProjetoTimeTable","Implement AI to generate timetables"),
    ("ProjetoShrodinger","Cat in the box project"),
    ("Browsers","Google browsers"),
    ("shadersHandler","Create shaders for sonic"),
    ("adobeConverter","Converter to pdf"),
    ("FollowersAlgorithmTwitter","Twitter follows advice"),
    ("ExplorerAlgorithm","Instagram explore feed"),
    ("FacebookLayout","New Facebook design"),
    ("AppleWatchFitness","Monitor heart rate AI"),
    ("JuniJobs","Organization candidatures site"),
    ("PopUpGenarator","Create popups for OnlyFans"),
    ("VirusInstaller","OnlyFans virtus add"),
    ("PauseMovie","Algorithm to register and save movies time"),

INSERT INTO TeamRole(user,team,isMaintainer)
VALUES
    ("margaridav27", "ProjetoShrodinger",0),
    ("margaridav27", "ubuntu-v9",1),
    ("beatriz-ag", "JuniJobs",0),
    ("beatriz-ag", "AppleWatchFitness",1),
    ("mikRodrigues", "ubuntu-v9",0),
    ("mikRodrigues", "FollowersAlgorithmTwitter",1),
    ("BiguelBodrigues", "FollowersAlgorithmTwitter",0),
    ("torvalds", "ubuntu-v9",0),
    ("arestivo", "adobeConverter",1),
    ("jfbaltazar", "Browsers",1),
    ("tmv11",  "ubuntu-v9",1),
    ("tmv11", "Browsers",1),
    ("beatrizlopesdossantos", "ExplorerAlgorithm",1),
    ("beatrizlopesdossantos", "PopUpGenarator",1),
    ("DTPreda", "PauseMovie",1),
    ("miguelpduarte", "ProjetoShrodinger",1),
    ("TiagoCaldaSilva", "ProjetoShrodinger",0),
    ("Andrepereira2001", "youtube"),
    ("RuiVieira456", "FacebookLayout",1),
    ("Rickyfer205", "shadersHandler",1),
    ("SALajes", "AppleWatchFitness",0),
    ("DoStini", "ProjetoShrodinger",0),
    ("ferrolho", "AppleWatchFitness",0),
    ("ferrolho", "adobeConverter",0),
    ("nunottlopes", "FacebookLayout",1)
  


INSERT INTO Directory (ID, name)
VALUES
    (1, "feup-lpoo"),
    (2, "feup-sope"),
    (3, "feup-bdad"),
    (4, "feup-cgra"),
    (5, "hero"),
    (6, "feup-comp"),
    (7, "MindAPI"),
    (8, "codejam2021"),
    (9, "bitcoin"),
    (10, "feup-aeda"),
    (11, "go-ethereum"),
    (12, "feup-lcom"),
    (13, "covid19-growth"),  
    (14, "advent-of-code-2019"),
    (15, "website-NIAEFEUP"),
    (16, "uporto-timetable-scrapper"),
    (17, "linux"),
    (18, "hackerrank-contest"),
    (19, "iio-oscilloscope"),
    (20, "feup-rcom"),
    (21, "feup-vcom"),
    (22, "project-schrodinger"),
    (23, "holidata.net"),
    (24, "timewarrior"),
    (25, "gbf.org"),
    (26, "GothenburgBitFactory"),
    (27, "cognitivebing"),
    (28, "feup-ltw"),  
    (29, "feup-fpro"),
    (30, "ModernRobotics.jl"),
    (31, "space-shuttle-reentry-trajectory"),
    (32, "corona"),
    (33, "workshop-LaTex"),
    (34, "feup-laig"),
    (35, "proj-xmod-tool");
    (35, "TP1");
    (36, "TP2");
    (38, "TP3";
    (39, "TP4");
    (37, "TP5");
    (40, "TP6");
    (41, "TP7");
    (42, "TP8");
    (43, "TP9");
    (44, "TP10");
    (45, "QUIZZ");
    (46, "src");
    (47, "build");
    (48, "bin");
    (49, "Graddle");
    (51, "PROJS");
    (52, "PROJ1");
    (53, "PROJ2");
    (54, "PROJ3");
    (55, "PROJ4");
    (56, "Timetables");
    (57, "tests");
    (58, "bitcoinslib");
    (59, "bitcoinArmory");
    (60, "security");
    (61, "sound");
    (62, "graphics");
    (63, "blocks");
    (64, "LICENSES");
    (65, "drivers");
    (66, "Docs");
    (67, "kernel");
    (68, "tools");
    (69, "scripts");
    (70, "proteins");
    (71, "vaccine");
    (72, "data");
    (73, "models");
    (74, "Systems");
    (75, "Shaders");
    (76, "Effects");
    (77, "Engines");
    (78, "quickstart");
    (79, "config");







INSERT INTO ProgrammingLanguage (name)
VALUES
    ("Assembly"),
    ("Bash"),
    ("C"),
    ("C++"),
    ("C#"),
    ("Curl"),
    ("Dart"),
    ("Go"),
    ("HTML"),
    ("Haskell"),
    ("Java"),
    ("JavaScript"),
    ("JSON"),
    ("Kotlin"),
    ("MATLAB"),
    ("Makefile"),
    ("Pascal"),
    ("PEARL"),
    ("PHP"),
    ("Prolog"),
    ("Python"),
    ("PowerShell")
    ("Perl"),
    ("Ruby"),
    ("Rust"),
    ("Scala"),
    ("Swift"),
    ("SQL"),
    ("Shell");


INSERT INTO Repository (ID, name, rootDirectory, isVisible)
VALUES
    (1, "feup-lpoo", 1, 0),
    (2, "feup-sope", 2, 0),
    (3, "feup-bdad", 3, 0),
    (4, "feup-cgra", 4, 0),
    (5, "hero", 5, 0),
    (6, "MindAPI", 7, 1),
    (7, "codejam2021", 8, 1),
    (8, "bitcoin", 9, 1),
    (9, "go-ethereum", 11, 1),
    (10, "covid19-growth", 13, 1),    
    (11, "advent-of-code-2019", 14, 1),
    (12, "website-NIAEFEUP", 15, 1),
    (13, "uporto-timetable-scrapper", 16, 1),
    (14, "linux", 17, 1),
    (15, "hackerrank-contest", 18, 1),
    (16, "iio-oscilloscope", 19, 1),
    (17, "project-schrodinger", 22, 1),
    (18, "holidata.net", 23, 1),
    (19, "timewarrior", 24, 1),
    (20, "gbf.org", 25, 1),
    (21, "GothenburgBitFactory", 26, 1),
    (22, "cognitivebing", 27, 1),
    (23, "ModernRobotics.jl", 30, 1),
    (24, "space-shuttle-reentry-trajectory", 31, 1),
    (25, "corona", 32, 1),
    (26, "workshop-LaTex", 33, 0),
    (27, "feup-comp", 6, 0),
    (28, "feup-aeda", 10, 0),
    (29, "feup-lcom", 12, 1),
    (30, "feup-rcom", 20, 1),
    (31, "feup-vcom", 21, 1),
    (32, "feup-ltw", 28, 0),
    (33, "feup-fpro", 29, 0),
    (34, "feup-laig", 34, 1),
    (35, "proj-xmod-tool", 35, 1);
    
INSERT INTO Submodule(source,destination)
VALUES
    (5,1)
    (35,2)
    (19,4)
    (26,12)
    (15,12)
    (17,12)
    (25,10)
    (24,23)

INSERT INTO OwnerRepository(user,repository)
VALUES
    ("beatriz-ag",1),
    ("beatriz-ag",2),
    ("beatriz-ag",3),
    ("beatriz-ag",4),
    ("beatriz-ag",5),
    ("beatriz-ag",35),
    ("margaridav27",27),
    ("margaridav27",28),
    ("margaridav27",29),
    ("margaridav27",30),
    ("mikRodrigues",31),
    ("mikRodrigues",32),
    ("mikRodrigues",33),
    ("arestivo",6),
    ("filipepcampos",7),
    ("sofiagermer",8),
    ("Retchup",9),
    ("rodrigotuna",10),
    ("BiguelBodrigues",11),
    ("brunogomes30",12),
    ("Jumaruba",13),
    ("JoaoAMarinho",23),
    ("jfbaltazar",15),


INSERT INTO Branch (name, repository, isDefault)
VALUES
    ("main", 1, 1),
    ("main", 2, 1),
    ("main", 3, 1),
    ("main", 4, 1),
    ("main", 5, 1),
    ("main", 6, 1),
    ("main", 7, 1),
    ("main", 8, 1),
    ("main", 9, 1),
    ("main", 10, 1),    
    ("main", 11, 1),
    ("main", 12, 1),
    ("main", 13, 1),
    ("main", 14, 1),
    ("main", 15, 1),
    ("main", 16, 1),
    ("main", 17, 1),
    ("main", 18, 1),
    ("main", 19, 1),
    ("main", 20, 1),
    ("main", 21, 1),
    ("main", 22, 1),
    ("main", 23, 1),
    ("main", 24, 1),
    ("main", 25, 1),
    ("main", 26, 1),
    ("main", 27, 1),
    ("main", 28, 1),
    ("main", 29, 1),
    ("main", 30, 1),
    ("main", 31, 1),
    ("main", 32, 1),
    ("main", 33, 1),
    ("main", 34, 1),
    ("main", 35, 1);
    ("main", 36, 1);
    ("main", 37, 1);
    ("main", 38, 1);
    ("main", 39, 1);
    ("main", 40, 1);
    ("main", 41, 1);
    ("main", 42, 1);
    ("main", 43, 1);
    ("main", 44, 1);
    ("main", 45, 1);
    ("main", 46, 1);
    ("main", 47, 1);
    ("main", 48, 1);
    ("main", 49, 1);
    ("main", 50, 1);
    ("main", 51, 1);
    ("main", 52, 1);
    ("main", 53, 1);
    ("main", 54, 1);
    ("main", 55, 1);
    ("main", 56, 1);
    ("main", 57, 1);
    ("main", 58, 1);
    ("main", 59, 1);
    ("main", 60, 1);
    ("main", 61, 1);
    ("main", 62, 1);
    ("main", 63, 1);
    ("main", 64, 1);
    ("main", 65, 1);
    ("main", 66, 1);
    ("main", 67, 1);
    ("main", 68, 1);
    ("main", 69, 1);
    ("main", 70, 1);
    ("main", 71, 1);
    ("main", 72, 1);
    ("main", 73, 1);
    ("main", 74, 1);
    ("main", 75, 1);
    ("main", 76, 1);
    ("main", 77, 1);
    ("main", 78, 1);
    ("main", 79, 1);
    ("main", 80, 1);
    ("development", 1, 1),
    ("development", 2, 1),
    ("development", 3, 1),
    ("development", 4, 1),
    ("development", 5, 1),
    ("development", 6, 1),
    ("development", 7, 1),
    ("development", 8, 1),
    ("development", 9, 1),
    ("development", 10, 1),    
    ("development", 11, 1),
    ("development", 12, 1),
    ("development", 13, 1),
    ("development", 14, 1),
    ("development", 15, 1),
    ("development", 16, 1),
    ("development", 17, 1),
    ("development", 18, 1),
    ("development", 19, 1),
    ("development", 20, 1),
    ("development", 21, 1),
    ("development", 22, 1),
    ("development", 23, 1),
    ("development", 24, 1),
    ("development", 25, 1),
    ("development", 26, 1),
    ("development", 27, 1),
    ("development", 28, 1),
    ("development", 29, 1),
    ("development", 30, 1),
    ("development", 31, 1),
    ("development", 32, 1),
    ("development", 33, 1),
    ("development", 34, 1),
    ("development", 35, 1);
    ("development", 36, 1);
    ("development", 37, 1);
    ("development", 38, 1);
    ("development", 39, 1);
    ("development", 40, 1);
    ("development", 41, 1);
    ("development", 42, 1);
    ("development", 43, 1);
    ("development", 44, 1);
    ("development", 45, 1);
    ("development", 46, 1);
    ("development", 47, 1);
    ("development", 48, 1);
    ("development", 49, 1);
    ("development", 50, 1);
    ("development", 51, 1);
    ("development", 52, 1);
    ("development", 53, 1);
    ("development", 54, 1);
    ("development", 55, 1);
    ("development", 56, 1);
    ("development", 57, 1);
    ("development", 58, 1);
    ("development", 59, 1);
    ("development", 60, 1);
    ("development", 61, 1);
    ("development", 62, 1);
    ("development", 63, 1);
    ("development", 64, 1);
    ("development", 65, 1);
    ("development", 66, 1);
    ("development", 67, 1);
    ("development", 68, 1);
    ("development", 69, 1);
    ("development", 70, 1);
    ("development", 71, 1);
    ("development", 72, 1);
    ("development", 73, 1);
    ("development", 74, 1);
    ("development", 75, 1);
    ("development", 76, 1);
    ("development", 77, 1);
    ("development", 78, 1);
    ("development", 79, 1);
    ("development", 80, 1);
    ("feature-api", 3, 1);
    ("feature-kernel", 6, 1);
    ("testing-generator", 23, 1);
    ("testing-xmod", 53, 1);
    ("feature-getFlags", 65, 1);
    ("testing-bitcoin", 23, 1);
    ("feature-bits", 12, 1);
    ("feature-spaceship", 54, 1);
    ("testing-fly", 52, 1);
    ("feature-coviddata", 12, 1);
    ("testing-bulletproff", 76, 1);
    ("testing-timetableOverlaps", 4, 1);
    ("testing-tests", 8, 1);
    ("feature-dataOrganizer", 45, 1);
    ("feature-compiler", 98, 1);
    ("testing-growth", 23, 1);
    ("testing-AI", 12, 1);
    ("testing-randomgenerator", 1, 1);
    ("testing-move", 73, 1);
    ("feature-jumpLoop", 66, 1);
    ("feature-gbfST", 23, 1);
    ("testing-display", 87, 1);
    ("testing-shaders", 67, 1);
    ("testing-usrLe", 78, 1);
    ("testing-robotsL", 65, 1);
    ("feature-mindT", 49, 1);
