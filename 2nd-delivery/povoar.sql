PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

INSERT INTO Entity (ID,"name")
VALUES
    (1,"beatriz-ag"),
    (2,"andrefmrocha"),
    (3,"GambuzX"),
    (4,"margaridav27"),
    (5,"AndrePereira2001"),
    (6,"tmv11"),
    (7,"francisco-rente"),
    (8,"pemesteves"),
    (9,"mikRodrigues"),
    (10,"NIAEFEUP"),
    (11,"NECG"),
    (12,"UniApp"),
    (13,"NIJobs");

INSERT INTO User (ID)
VALUES
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9);

INSERT INTO Organization (ID)
VALUES
    (10),
    (11);

INSERT INTO Team (ID, organization, "description")
VALUES
    (12,10,"This is a description for UniApp"),
    (13,10, "This is a description for NIJOBS");

INSERT INTO Directory (ID, "name")
VALUES
    (1, "feup-lpoo"), 
    (2, "feup-sope"),
    (3, "feup-bdad"),
    (4, "feup-cgra"),
    (5, "feup-lcom"),
    (6, "feup-mnum"),
    (7, "Projs"),
    (8, "Proj1"),
    (9, "Proj2"),
    (10, "Proj3"),
    (11, "TPS"),
    (12, "TPS"),
    (13, "TP1"),  
    (14, "TP2"),
    (15, "TP3"),
    (16, "TP4"),
    (17, "TP5"),
    (18, "TP6"),
    (19, "TP7"),
    (20, "TP8"),
    (21, "QUIZZ"),
    (22, "PROJS"),
    (23, "PROJ1"),
    (24, "PROJ2"),
    (25, "TPS"),
    (26, "TP1"),
    (27, "TP2"),
    (28, "TP3"),
    (29, "TP4"),
    (30, "PROJ1"),
    (31, "PROJ2"),
    (32, "METHODS"),
    (33, "EXAMS"),
    (34, "EXAM2018"),
    (35, "TP1"),
    (36, "TP2"),
    (38, "TP3"),
    (39, "TP4"),
    (37, "TP5"),
    (40, "TP6"),
    (41, "TP7"),
    (42, "TP8"),
    (43, "TP9"),
    (44, "TP10"),
    (45, "QUIZZ"),
    (46, "src"),
    (47, "build"),
    (48, "bin"),
    (49, "Graddle"),
    (50, "Proj"),
    (51, "PROJS"),
    (52, "PROJ1"),
    (53, "PROJ2"),
    (54, "PROJ3"),
    (55, "PROJ4"),
    (56, "projectSchrodinger"),
    (57, "Appfeup"),
    (58, "LICENSES"),
    (59, "ASSETS"),
    (60, "IOS"),
    (61, "lib"),
    (62, "tests"),
    (63, "CV_WEBSITE"),
    (64, "rules_scala"),
    (65, "NativeBase"),
    (66, "Space-Wars"),
    (67, "Advent_of_code_2019"),
    (68, "FirstWeek"),
    (69, "SecondWeek"),
    (70, "ThirdWeek"),
    (71, "ForthWeek"),
    (72, "src"),
    (73, "images"),
    (74, "fonts"),
    (75, "src"),
    (76, "src"),
    (77, "nijobs-nbe"),
    (78, "nijobs-fe"),
    (79, "test"),
    (80, "test"),
    (81, "uniAPPdev"),
    (82, "LeetCode"),
    (83, "algorithms"),
    (84, "database"),
    (85, "0023_merge_k_sorted_lists"),
    (86, "0024_swap_nodes_in_pairs"),
    (87, "0036_valid_sudoku"),
    (88, "0042_trapping_rain_water"),
    (89, "0044_wildcard_matching"),
    (90, "0046_permutations"),
    (91, "0047_permutations_II"),
    (92, "0053_maximum_subarray"),
    (93, "0076_minimum_window_substring"),
    (94, "feup-sope"),
    (95, "feup-sope-xmod"),
    (96, "project"),
    (97, "doc"),
    (98, "include"),
    (99, "src"),
    (100, "exercicios_TPs"),
    (101, "website-NIAEFEUP"),
    (102, "NI");

INSERT INTO Repository (ID, "name", rootDirectory, isVisible)
VALUES
    (1, "feup-lpoo", 1, 0),
    (2, "feup-sope", 2, 0),
    (3, "feup-bdad", 3, 0),
    (4, "feup-cgra", 4, 0),
    (5, "feup-lcom", 5, 0),
    (6, "feup-mnum", 6, 1),
    (7, "projectSchrodinger", 56, 1),
    (8, "CV_WEBSITE", 63, 1),
    (9, "NativeBase", 65, 1),
    (10, "Space-Wars", 66, 1),    
    (11, "Advent_of_code_2019", 67, 1),
    (12, "website-NIAEFEUP", 101, 1),
    (13, "nijobs-nbe", 77, 1),
    (14, "nijobs-fe", 78, 1),
    (15, "NI", 102, 1),
    (16, "LeetCode", 82, 0),
    (17, "feup-sope", 94, 1),
    (18, "feup-sope-xmod", 95, 1);

INSERT INTO Branch ("name", repository, isDefault)
VALUES
    ("main", 1, 1),
    ("main", 2, 1),
    ("main", 3, 1),
    ("main", 4, 1),
    ("main", 5, 1),
    ("main", 6, 1),
    ("main", 8, 1),
    ("main", 7, 1),
    ("main", 9, 1),
    ("main", 10, 1),    
    ("main", 12, 1),
    ("main", 11, 1),
    ("main", 13, 1),
    ("main", 14, 1),
    ("main", 15, 1),
    ("main", 16, 1),
    ("main", 17, 1),
    ("main", 18, 1),
    ("development", 1, 0),
    ("development", 2, 0),
    ("development", 3, 0),
    ("development", 4, 0),
    ("development", 5, 0),
    ("development", 6, 0),
    ("development", 7, 0),
    ("development", 8, 0),
    ("development", 9, 0),
    ("development", 10, 0),    
    ("development", 11, 0),
    ("development", 12, 0),
    ("development", 13, 0),
    ("development", 14, 0),
    ("development", 15, 0),
    ("feature-api", 3, 0),
    ("feature/kernel", 7, 0),
    ("testing/generator", 7, 0),
    ("testing-xmod", 1, 0),
    ("feature-getFlags", 1, 0),
    ("testing-bitcoin", 9, 0),
    ("feature-bits", 2, 0),
    ("feature/spaceship", 10, 0),
    ("testing/fly", 10, 0),
    ("feature-coviddata", 13, 0),
    ("testing-bulletproff", 13, 0),
    ("testing-timetableOverlaps", 12, 0),
    ("testing-tests", 8, 0),
    ("feature-dataOrganizer", 8, 0),
    ("feature-compiler", 2, 0),
    ("testing-growth", 9, 0),
    ("testing/AI", 7, 0),
    ("testing/randomgenerator", 7, 0),
    ("testing-move", 1, 0),
    ("feature-jumpLoop", 1, 0),
    ("feature-gbfST", 9, 0),
    ("testing-display", 1, 0),
    ("testing-shaders", 4, 0),
    ("testing/usrLe", 10, 0),
    ("testing/robotsL", 10, 0),
    ("feature-mindT", 9, 0),
    ("feature-signal_handling", 18, 0),
    ("feature-logging", 18, 0),
    ("feature-proc_creation", 18, 0),
    ("feature-recursive_mode", 18, 0),
    ("testing-signal_handling", 18, 0),
    ("testing-recursive_mode", 18, 0),
    ("testing-change_permissions", 18, 0);

INSERT INTO Contribution (ID, user, repository, "date")
VALUES
    (1, 1, 1, "2016-05-23"),
    (2, 1, 1, "2016-06-22"),
    (3, 1, 2, "2016-06-30"),
    (4, 1, 4, "2016-07-06"),
    (5, 1, 5, "2016-08-04"),
    (6, 1, 5, "2016-09-08"),
    (7, 1, 6, "2016-09-21"),
    (8, 1, 3, "2016-09-23"),
    (9, 1, 3, "2016-12-15"),
    (10, 1, 12, "2017-01-10"),
    (11, 1, 12, "2017-02-10"),
    (12, 1, 12, "2017-02-20"),
    (13, 1, 12, "2017-05-30"),
    (14, 1, 12, "2017-06-15"),
    (15, 1, 12, "2017-07-18"),
    (16, 2, 12, "2017-09-22"),
    (17, 2, 12, "2017-09-29"),
    (18, 2, 12, "2017-10-19"),
    (19, 2, 8, "2018-01-01"),
    (20, 2, 8, "2018-01-12"),
    (21, 2, 10, "2018-02-06"),
    (22, 2, 10, "2018-02-08"),
    (23, 2, 13, "2018-02-19"),
    (24, 2, 7, "2018-09-03"),
    (25, 2, 10, "2018-09-19"),
    (26, 2, 10, "2018-09-28"),
    (27, 2, 11, "2018-10-16"),
    (28, 2, 11, "2018-11-06"),
    (29, 2, 9, "2018-11-19"),
    (30, 2, 9, "2018-12-25"),
    (31, 2, 10,"2019-01-10"),
    (32, 2, 10,"2019-01-15"),
    (33, 2, 11,"2019-01-22"),
    (34, 2, 11,"2019-01-28"),
    (35, 2, 9,"2019-04-22"),
    (36, 2, 9,"2019-04-26"),
    (37, 3, 16, "2020-02-19"),
    (38, 3, 16, "2020-02-27"),
    (39, 3, 16, "2020-03-05"),
    (40, 3, 16, "2020-03-13"),
    (41, 3, 16, "2020-03-27"),
    (42, 3, 16, "2020-04-08"),
    (43, 3, 16, "2020-04-28"),
    (44, 3, 16, "2020-05-12"),
    (45, 3, 16, "2020-06-08"),
    (46, 3, 16, "2020-08-12"),
    (47, 3, 16, "2020-08-19"),
    (48, 3, 16, "2020-10-29"),
    (49, 3, 16, "2020-11-03"),
    (50, 3, 16, "2020-11-18"),
    (51, 3, 16, "2020-12-18"),
    (52, 4, 18, "2021-02-01"),
    (53, 4, 18, "2021-02-02"),
    (54, 4, 18, "2021-02-04"),
    (55, 5, 18, "2021-02-05"),
    (56, 5, 18, "2021-02-06"), 
    (57, 6, 18, "2021-02-07"), 
    (58, 6, 18, "2021-02-08"), 
    (59, 6, 18, "2021-02-09"), 
    (60, 6, 18, "2021-02-10"), 
    (61, 6, 18, "2021-02-11"),
    (62, 6, 18, "2021-02-12"),
    (63, 6, 18, "2021-02-13"),
    (64, 6, 18, "2021-02-14"),
    (65, 6, 18, "2021-02-15"),
    (66, 6, 18, "2021-02-16"),
    (67, 6, 18, "2021-02-17"),
    (68, 6, 18, "2021-02-18"), 
    (69, 4, 18, "2021-02-19"),
    (70, 4, 18, "2021-02-20"),
    (71, 4, 18, "2021-02-20"),
    (72, 7, 18, "2021-02-20"),
    (73, 7, 18, "2021-02-20"),
    (74, 5, 18, "2021-02-21"),
    (75, 5, 18, "2021-02-21"),
    (76, 5, 18, "2021-02-21"),
    (77, 5, 18,"2021-02-21"),
    (78, 5, 18,"2021-02-21"), 
    (79, 4, 18, "2021-02-23"),
    (80, 4, 18, "2021-02-23"), 
    (81, 4, 18, "2021-02-23"),
    (82, 7, 18, "2021-02-23"),
    (83, 7, 18, "2021-02-23"),
    (84, 6, 18, "2021-02-23"), 
    (85, 6, 18, "2021-02-23"),
    (86, 6, 18, "2021-02-24"),
    (87, 6, 18, "2021-02-24"),
    (88, 6, 18, "2021-02-24"),
    (89, 6, 18, "2021-02-24");

INSERT INTO "Commit" (ID, commitHash, "message")
VALUES
    (1, "9b6082773657656c58fa176e0d009c6a6b781823", "a relevant commit indeed"),
    (2, "852d7645e2c7fa6b37309d26def2b22873f75e2b", "a relevant commit indeed"),
    (3, "b5ac2402d9d6ff467cb42409e35c77760fff655a", "a relevant commit indeed"),
    (4, "3e4410a6cd029af777dccb9bc916c885c9a82885", "a relevant commit indeed"),
    (5, "0238a3fc97b94091762718e8c531993ae10b4ae8", "a relevant commit indeed"),
    (6, "e12f86a52044497d6d2f59955a409f6b120e997d", "a relevant commit indeed"),
    (7, "f4498ed09f11766abc2d505164788d8abbce40ca", "a relevant commit indeed"),
    (8, "ed5eaa758aa76d0617d06eb1f0372739c2a7f171", "a relevant commit indeed"),
    (9, "627da519c6328802ae7e1be4e6236145fa72b832", "a relevant commit indeed"),
    (10, "2733a19329dae834ff86315cfde0a860f6b102f6", "a relevant commit indeed"),
    (11, "52cc229d78d4674c9c269de134806676f8c43f79", "a relevant commit indeed"),
    (12, "47df8237b9a7b9f62d6afbaa98448cb18d48ed56", "a relevant commit indeed"),
    (17, "a0b7c136ca910115c0cf4df36e1f36cdd8670752", "a relevant commit indeed"),
    (18, "157ec8d191dc9f1e57f6609c9b6e859098e0b471", "a relevant commit indeed"),
    (19, "d20d3b416c92df23ad3f521cee8c4fbda72d5a45", "a relevant commit indeed"),
    (21, "8e2300d2d21ee511b27a4678857f4c08bcb349cd", "a relevant commit indeed"),
    (22, "0e874f48c01ab402637da187c48626d71f982b25", "a relevant commit indeed"),
    (23, "a3d514030a1d836809623d32dd02d6d98f488acd", "a relevant commit indeed"),
    (25, "17e51eb14374635e48b9806e01ca38ae430ef6a7", "a relevant commit indeed"),
    (26, "ec70991d1671da943126db8a0902b08db53c741c", "a relevant commit indeed"),
    (27, "477f700573be2b3d0e8f9260832b60e932e9ae1a", "a relevant commit indeed"),
    (28, "0eccc407eb14e7577b97caacc9dc6669c9bf02f8", "a relevant commit indeed"),
    (29, "04237b469ca61045c2ed7e769d292d8663216194", "a relevant commit indeed"),
    (31, "4d3fdb0b877eb5248464cc62d8acf37fb52fc1bf", "a relevant commit indeed"),
    (32, "fa4de33502023b4107ea6fd414d48f767279be0d", "a relevant commit indeed"),
    (33, "817321a39c40a6bab59a6dceed4c552d7e5cb2ec", "a relevant commit indeed"),
    (34, "747fd8e2fb0fe98ed53d00a73de53e6ee1ac7806", "a relevant commit indeed"),
    (35, "383f5f5da77bf3bc75680968025714d0fec9c74a", "a relevant commit indeed"),
    (36, "aa5cba1041e38d754ca16502fc322702901dfc9d", "a relevant commit indeed"),
    (37, "c6de2bcad657647e3bc6d9187b3dfd8f1fa6e6a0", "a relevant commit indeed"),
    (38, "cf463a838d702f78b76021225913cd3195d14bed", "a relevant commit indeed"),
    (39, "c5d6b60352c6aebd677590fe0d80a3613e246fa9", "a relevant commit indeed"),
    (40, "c5d6b60352c6aebd677590fe0d80a3613e246fa9", "a relevant commit indeed"),
    (41, "2ccdf93805fcb8b06a87cae6aefc661c307ced1b", "a relevant commit indeed"),
    (42, "73a3344b1ba112fbe6dc7866905667c2adb4a1fe", "a relevant commit indeed"),
    (43, "38f361a87a74c61dee2a6c5d48cb2f649f9410ae", "a relevant commit indeed"),
    (44, "5b086fc4a2dc647f2ee79f7f59c7a767efec7e32", "a relevant commit indeed"),
    (45, "575c43912875aff945e50ff341634384516db5ec", "a relevant commit indeed"),
    (46, "8deaa90c05f2b600b9fea4c02afbfa7c6da47e19", "a relevant commit indeed"),
    (47, "0f54d51bd11b831a8f64ecb6bffe2e8e042b8715", "a relevant commit indeed"),
    (48, "d9fe666b212cad7aea1e0741517755b52175d3d5", "a relevant commit indeed"),
    (49, "b80b8fb8f193e0ada8ee8ceae2127f4f7d34b1e0", "a relevant commit indeed"),
    (50, "a4a73c756baccb5d1f05fa5a816f368a2056c4eb", "a relevant commit indeed"),
    (51, "1fe9070bb46d27178fc735c7b9a171fe6786dda2", "a relevant commit indeed"),
    (52, "2e5c6f91b735576124785c9341d4faf94ca5f5e4", "a relevant commit indeed"),
    (53, "c4f8dd60077d0180413c26d3d5b89c2fb6108f5a", "a relevant commit indeed"),
    (54, "1d509d991144c1285ad8f35eb7a1425b61a608f3", "a relevant commit indeed"),
    (55, "93a61bf9bf15e2395e87f832b6b87d82444d2dec", "a relevant commit indeed"),
    (61, "622a67c75926c710dc3898ec9563edfd777c8555", "a relevant commit indeed"),
    (62, "f91224311c29790ceac56c2a5a2b7c72a81cbdf2", "a relevant commit indeed"),
    (63, "ce913bd76cf1b6fac450860fcdfcfbedbb00785a", "a relevant commit indeed"),
    (64, "0d32bf03a46a318ca515bbd777bb3b70a26a2e84", "a relevant commit indeed"),
    (65, "1718599400280f350b3a7ba8d963d41ad2afcd57", "professora, se está a ler isto"),
    (66, "72f18ff02bee0a08d4998b60f12a2ad5f8efc6e5", "só queriamos dizer algo"),
    (67, "6e7252c7dad5ea60367c16bd5ae5c3a7af54bac6", "isto deu imenso trabalho"),
    (69, "f54f25d0e7b7499d7997007ffb324f20421348c9", "e portanto não pedimos nada mais"),
    (70, "84817be361b5173b0ea1c9796e48219a9dd9ee38", "do que um 20 nesta entrega"),
    (71, "792714d01d5a80fd2601a7f4c57d75ce1dfecdae", "Obrigado e uma ótima páscoa!"),
    (72, "747faf84cc2e9c924a8fdd52c0a86a8f92dda3cd", "a relevant commit indeed"),
    (73, "3b8d55a1f26091cc7863d94530309dd90b7cbea1", "a relevant commit indeed"),
    (74, "486fb2e21427a201f354cf9d906fb13abdca6c1d", "a relevant commit indeed"),
    (75, "4035d189f77bcfe3892d345d3a73a1ce32d9f659", "a relevant commit indeed"),
    (76, "de5a9d0593f62234988b91fc3ad21fef89a07c12", "a relevant commit indeed"),
    (77, "62e2fff08f2cad689c433367af8d9846ad459257", "a relevant commit indeed"),
    (79, "5f044af325fb5e66d270520e0493ca6ac8a22541", "a relevant commit indeed"),
    (81, "896149aed99f1de783ac595bb294e4ba5d9a3c65", "a relevant commit indeed"),
    (82, "ee291738ac4d61c2226275ac41a67aaf8de00a37", "a relevant commit indeed"),
    (83, "1fa006e5c35bfdbfc740cf4d4b2eaf9832507c09", "a relevant commit indeed"),
    (85, "d63ae94d164e4cb5f057f15bfa4f60360afa5369", "a relevant commit indeed"),
    (86, "590bc5f97d21cbde421a177c8b74fd2d5154eb56", "a relevant commit indeed"),
    (87, "2d564f5f8a2132bc520b7ea592da219fa4e5f918", "a relevant commit indeed"),
    (88, "79bad431a0cbce2d4a526f44b98210bd989b8872", "a relevant commit indeed"),
    (89, "37f055a5434cdda3f18793218ca66b28e6555f52", "a relevant commit indeed");

INSERT INTO Tag (ID, "name", "commit")
VALUES
    (1, "tp1", 1),
    (2, "tp2", 1),
    (3, "tp3", 1),
    (4, "tp4", 1),
    (5, "tp5", 1),
    (6, "tp6", 1),
    (7, "tp7", 1),
    (8, "nijobs-1", 23),
    (9, "adventCode-hard", 34);

INSERT INTO PullRequest (ID, pullRequestNumber, "status", "message")
VALUES 
    (13, 1, 1, "pull request xyz"),
    (18, 2, 0, "pull request xyz"),
    (24, 1, 0, "pull request xyz"),
    (56, 1, 0, "pull request xyz"),
    (68, 2, 0, "pull request xyz"),
    (78, 3, 0, "pull request xyz"),
    (84, 4, 0, "pull request xyz");

INSERT INTO Issue (ID, issueNumber, "message")
VALUES  
    (24, 1, "Issue xx"),
    (14, 1, "Issue xx"),
    (57, 1, "Issue xx"),
    (58, 2, "Issue xx"),
    (59, 3, "Issue xx"),
    (60, 4, "Issue xx"),
    (80, 5, "Issue xx");

INSERT INTO "Merge" (ID, oursName, oursRepository, theirsName, theirsRepository)
VALUES  
    (31, "main", 10, "development", 10),
    (70, "main", 18, "feature-signal_handling", 18),
    (72, "main", 18, "feature-logging", 18),
    (77, "main", 18, "feature-proc_creation", 18),
    (79, "main", 18, "feature-recursive_mode", 18),
    (81, "main", 18, "testing-signal_handling", 18),
    (86, "main", 18, "testing-recursive_mode", 18),
    (89, "main", 18, "testing-change_permissions", 18);

INSERT INTO ProgrammingLanguage ("name")
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
    ("PowerShell"),
    ("Perl"),
    ("Ruby"),
    ("Rust"),
    ("Scala"),
    ("SWIFT"),
    ("SQL"),
    ("Shell");

INSERT INTO "File" ("name", directory,content,programmingLanguage)
VALUES
    ("code1.java", 8,"some content", "Java"),
    ("code2.java", 8, "some content", "Java"),
    ("code3.java", 8, "some content", "Java"),
    ("code4.java", 8, "some content", "Java"),
    ("code5.java", 8, "some content", "Java"),
    ("code6.java", 8, "some content", "Java"),
    ("code7.java", 8, "some content", "Java"),
    ("code8.java", 8, "some content", "Java"),
    ("code9.java", 8, "some content", "Java"),
    ("code1.java", 9, "some content", "Java"),
    ("code2.java", 9, "some content", "Java"),
    ("code3.java", 9, "some content", "Java"),
    ("code4.java", 9, "some content", "Java"),
    ("code5.java", 9, "some content", "Java"),
    ("code6.java", 9, "some content", "Java"),
    ("code7.java", 9, "some content", "Java"),
    ("code8.java", 9, "some content", "Java"),
    ("code9.java", 9, "some content", "Java"),
    ("code1.java", 10, "some content", "Java"),
    ("code2.java", 10, "some content", "Java"),
    ("code3.java", 10, "some content", "Java"),
    ("code4.java", 10, "some content", "Java"),
    ("code5.java", 10, "some content", "Java"),
    ("code6.java", 10, "some content", "Java"),
    ("code7.java", 10, "some content", "Java"),
    ("code8.java", 10, "some content", "Java"),
    ("code9.java", 10, "some content", "Java"),
    ("code1.java", 12, "some content", "Java"),
    ("code2.java", 12, "some content", "Java"),
    ("code3.java", 12, "some content", "Java"),
    ("code4.java", 12, "some content", "Java"),
    ("code5.java", 12, "some content", "Java"),
    ("code6.java", 12, "some content", "Java"),
    ("code7.java", 12, "some content", "Java"),
    ("code8.java", 12, "some content", "Java"),
    ("code9.java", 12, "some content", "Java"),
    ("code1.java", 14, "some content", "Java"),
    ("code2.java", 14, "some content", "Java"),
    ("code3.java", 14, "some content", "Java"),
    ("code4.java", 14, "some content", "Java"),
    ("code5.java", 14, "some content", "Java"),
    ("code6.java", 14, "some content", "Java"),
    ("code7.java", 14, "some content", "Java"),
    ("code8.java", 14, "some content", "Java"),
    ("code9.java", 14, "some content", "Java"),
    ("code1.java", 15, "some content", "Java"),
    ("code2.java", 15, "some content", "Java"),
    ("code3.java", 15, "some content", "Java"),
    ("code4.java", 15, "some content", "Java"),
    ("code5.java", 15, "some content", "Java"),
    ("code6.java", 15, "some content", "Java"),
    ("code7.java", 15, "some content", "Java"),
    ("code8.java", 15, "some content", "Java"),
    ("code9.java", 15, "some content", "Java"),
    ("code1.java", 16, "some content", "Java"),
    ("code2.java", 16, "some content", "Java"),
    ("code3.java", 16, "some content", "Java"),
    ("code4.java", 16, "some content", "Java"),
    ("code5.java", 16, "some content", "Java"),
    ("code6.java", 16, "some content", "Java"),
    ("code7.java", 16, "some content", "Java"),
    ("code8.java", 16, "some content", "Java"),
    ("code9.java", 16, "some content", "Java"),
    ("code1.java", 17, "some content", "Java"),
    ("code2.java", 17, "some content", "Java"),
    ("code3.java", 17, "some content", "Java"),
    ("code4.java", 17, "some content", "Java"),
    ("code5.java", 17, "some content", "Java"),
    ("code6.java", 17, "some content", "Java"),
    ("code7.java", 17, "some content", "Java"),
    ("code8.java", 17, "some content", "Java"),
    ("code9.java", 17, "some content", "Java"),
    ("code1.java", 18, "some content", "Java"),
    ("code2.java", 18, "some content", "Java"),
    ("code3.java", 18, "some content", "Java"),
    ("code4.java", 18, "some content", "Java"),
    ("code5.java", 18, "some content", "Java"),
    ("code6.java", 18, "some content", "Java"),
    ("code7.java", 18, "some content", "Java"),
    ("code8.java", 18, "some content", "Java"),
    ("code9.java", 18, "some content", "Java"),
    ("code1.java", 19, "some content", "Java"),
    ("code2.java", 19, "some content", "Java"),
    ("code3.java", 19, "some content", "Java"),
    ("code4.java", 19, "some content", "Java"),
    ("code5.java", 19, "some content", "Java"),
    ("code6.java", 19, "some content", "Java"),
    ("code7.java", 19, "some content", "Java"),
    ("code8.java", 19, "some content", "Java"),
    ("code9.java", 19, "some content", "Java"),
    ("code1.java", 20, "some content", "Java"),
    ("code2.java", 20, "some content", "Java"),
    ("code3.java", 20, "some content", "Java"),
    ("code4.java", 20, "some content", "Java"),
    ("code5.java", 20, "some content", "Java"),
    ("code6.java", 20, "some content", "Java"),
    ("code7.java", 20, "some content", "Java"),
    ("code8.java", 20, "some content", "Java"),
    ("code9.java", 20, "some content", "Java"),
    (".ignore", 1, "some content", NULL),
    (".ignore", 2, "some content", NULL),
    (".ignore", 3, "some content", NULL),
    (".ignore", 4, "some content", NULL),
    (".ignore", 5, "some content", NULL),
    (".ignore", 6, "some content", NULL),
    (".ignore", 56, "some content", NULL),
    (".ignore", 63, "some content", NULL),
    (".ignore", 65, "some content", NULL),
    (".ignore", 66, "some content", NULL),
    (".ignore", 67, "some content", NULL),
    (".ignore", 77, "some content", NULL),
    (".ignore", 78, "some content", NULL),
    (".ignore", 82, "some content", NULL),
    (".ignore", 94, "some content", NULL),
    (".ignore", 95, "some content", NULL),
    ("file1.txt", 97, "some content", NULL),
    ("file2.txt", 97, "some content", NULL),
    ("file3.txt", 97, "some content", NULL),
    ("file4.txt", 97, "some content", NULL),
    ("file5.txt", 97, "some content", NULL),
    ("file1.txt", 81, "some content", NULL),
    ("file1.txt", 100, "some content", NULL),
    ("file2.txt", 100, "some content", NULL),
    ("file3.txt", 100, "some content", NULL),
    ("file4.txt", 100, "some content", NULL),
    ("file5.txt", 100, "some content", NULL),
    ("code1.c", 23, "some content","C"),
    ("code2.c", 23, "some content" ,"C"),
    ("code3.c", 23, "some content", "C"),
    ("code4.c", 23, "some content", "C"),
    ("code5.c", 23, "some content", "C"),
    ("code6.c", 23, "some content", "C"),
    ("code7.c", 23, "some content", "C"),
    ("code8.c", 23, "some content", "C"),
    ("code9.c", 23, "some content", "C"),
    ("code1.c", 24, "some content", "C"),
    ("code2.c", 24, "some content", "C"),
    ("code3.c", 24, "some content", "C"),
    ("code4.c", 24, "some content", "C"),
    ("code5.c", 24, "some content", "C"),
    ("code6.c", 24, "some content", "C"),
    ("code7.c", 24, "some content", "C"),
    ("code8.c", 24, "some content", "C"),
    ("code9.c", 24, "some content", "C"),
    ("code1.c", 26, "some content", "C"),
    ("code2.c", 26, "some content", "C"),
    ("code3.c", 26, "some content", "C"),
    ("code4.c", 26, "some content", "C"),
    ("code5.c", 26, "some content", "C"),
    ("code6.c", 26, "some content", "C"),
    ("code7.c", 26, "some content", "C"),
    ("code8.c", 26, "some content", "C"),
    ("code9.c", 26, "some content", "C"),
    ("code1.c", 27, "some content", "C"),
    ("code2.c", 27, "some content", "C"),
    ("code3.c", 27, "some content", "C"),
    ("code4.c", 27, "some content", "C"),
    ("code5.c", 27, "some content", "C"),
    ("code6.c", 27, "some content", "C"),
    ("code7.c", 27, "some content", "C"),
    ("code8.c", 27, "some content", "C"),
    ("code9.c", 27, "some content", "C"),
    ("code1.c", 28, "some content", "C"),
    ("code2.c", 28, "some content", "C"),
    ("code3.c", 28, "some content", "C"),
    ("code4.c", 28, "some content", "C"),
    ("code5.c", 28, "some content", "C"),
    ("code6.c", 28, "some content", "C"),
    ("code7.c", 28, "some content", "C"),
    ("code8.c", 28, "some content", "C"),
    ("code1.c", 29, "some content", "C"),
    ("code2.c", 29, "some content", "C"),
    ("code3.c", 29, "some content", "C"),
    ("code4.c", 29, "some content", "C"),
    ("code5.c", 29, "some content", "C"),
    ("code6.c", 29, "some content", "C"),
    ("code7.c", 29, "some content", "C"),
    ("code8.c", 29, "some content", "C"),
    ("code1.c", 30, "some content", "C"),
    ("code2.c", 30, "some content", "C"),
    ("code3.c", 30, "some content", "C"),
    ("code4.c", 30, "some content", "C"),
    ("code5.c", 30, "some content", "C"),
    ("code6.c", 30, "some content", "C"),
    ("code7.c", 30, "some content", "C"),
    ("code8.c", 30, "some content", "C"),
    ("code6.c", 31, "some content", "C"),
    ("code7.c", 31, "some content", "C"),
    ("code8.c", 31, "some content", "C"),
    ("code1.c", 46, "some content", "C"),
    ("code2.c", 46, "some content", "C"),
    ("code3.c", 46, "some content", "C"),
    ("code1.c", 99, "some content", "C"),
    ("code2.c", 99, "some content", "C"),
    ("code3.c", 99, "some content", "C"),
    ("code4.c", 99, "some content", "C"),
    ("code5.c", 99, "some content", "C"),
    ("code6.c", 99, "some content", "C"),
    ("code7.c", 99, "some content", "C"),
    ("header1.h", 98, "some content", "C"),
    ("header2.h", 98, "some content", "C"),
    ("header3.h", 98, "some content", "C"),
    ("header4.h", 98, "some content", "C"),
    ("header5.h", 98, "some content", "C"),
    ("header6.h", 98, "some content", "C"),
    ("header7.h", 98, "some content", "C"),
    ("code1.c", 100, "some content", "C"),
    ("code2.c", 100, "some content", "C"),
    ("code3.c", 100, "some content", "C"),
    ("code4.c", 100, "some content", "C"),
    ("code5.c", 100, "some content", "C"),
    ("code6.c", 100, "some content", "C"),
    ("code7.c", 100, "some content", "C"),
    ("code8.c", 100, "some content", "C"),
    ("code9.c", 100, "some content", "C"),
    ("code10.c", 100, "some content", "C"),
    ("code1.cpp", 32, "some content", "C++"),
    ("code2.cpp", 32, "some content", "C++"),
    ("code3.cpp", 32, "some content", "C++"),
    ("code4.cpp", 32, "some content", "C++"),
    ("code5.cpp", 32, "some content", "C++"),
    ("code6.cpp", 32, "some content", "C++"),
    ("code7.cpp", 32, "some content", "C++"),
    ("code8.cpp", 32, "some content", "C++"),
    ("code1.cpp", 33, "some content", "C++"),
    ("code2.cpp", 33, "some content", "C++"),
    ("code3.cpp", 33, "some content", "C++"),
    ("code4.cpp", 33, "some content", "C++"),
    ("code5.cpp", 33, "some content", "C++"),
    ("code6.cpp", 33, "some content", "C++"),
    ("code7.cpp", 33, "some content", "C++"),
    ("code8.cpp", 33, "some content", "C++"),
    ("code1.cpp", 34, "some content", "C++"),
    ("code2.cpp", 34, "some content", "C++"),
    ("code3.cpp", 34, "some content", "C++"),
    ("code4.cpp", 34, "some content", "C++"),
    ("code5.cpp", 34, "some content", "C++"),
    ("code6.cpp", 34, "some content", "C++"),
    ("code7.cpp", 34, "some content", "C++"),
    ("code8.cpp", 34, "some content", "C++"),
    ("code1.js", 35, "some content", "JavaScript"),
    ("code2.js", 35, "some content", "JavaScript"),
    ("code3.js", 35, "some content", "JavaScript"),
    ("code4.js", 35, "some content", "JavaScript"),
    ("code5.js", 35, "some content", "JavaScript"),
    ("code6.js", 35, "some content", "JavaScript"),
    ("code7.js", 35, "some content", "JavaScript"),
    ("code8.js", 35, "some content", "JavaScript"),
    ("code1.js", 36, "some content", "JavaScript"),
    ("code2.js", 36, "some content", "JavaScript"),
    ("code3.js", 36, "some content", "JavaScript"),
    ("code4.js", 36, "some content", "JavaScript"),
    ("code5.js", 36, "some content", "JavaScript"),
    ("code6.js", 36, "some content", "JavaScript"),
    ("code7.js", 36, "some content", "JavaScript"),
    ("code8.js", 36, "some content", "JavaScript"),
    ("code1.js", 37, "some content", "JavaScript"),
    ("code2.js", 37, "some content", "JavaScript"),
    ("code3.js", 37, "some content", "JavaScript"),
    ("code4.js", 37, "some content", "JavaScript"),
    ("code5.js", 37, "some content", "JavaScript"),
    ("code6.js", 37, "some content", "JavaScript"),
    ("code7.js", 37, "some content", "JavaScript"),
    ("code8.js", 37, "some content", "JavaScript"),
    ("code1.js", 38, "some content", "JavaScript"),
    ("code2.js", 38, "some content", "JavaScript"),
    ("code3.js", 38, "some content", "JavaScript"),
    ("code4.js", 38, "some content", "JavaScript"),
    ("code5.js", 38, "some content", "JavaScript"),
    ("code6.js", 38, "some content", "JavaScript"),
    ("code7.js", 38, "some content", "JavaScript"),
    ("code8.js", 38, "some content", "JavaScript"),
    ("code1.js", 39, "some content", "JavaScript"),
    ("code2.js", 39, "some content", "JavaScript"),
    ("code3.js", 39, "some content", "JavaScript"),
    ("code4.js", 39, "some content", "JavaScript"),
    ("code5.js", 39, "some content", "JavaScript"),
    ("code6.js", 39, "some content", "JavaScript"),
    ("code7.js", 39, "some content", "JavaScript"),
    ("code8.js", 39, "some content", "JavaScript"),
    ("code1.js", 40, "some content", "JavaScript"),
    ("code2.js", 40, "some content", "JavaScript"),
    ("code3.js", 40, "some content", "JavaScript"),
    ("code4.js", 40, "some content", "JavaScript"),
    ("code5.js", 40, "some content", "JavaScript"),
    ("code6.js", 40, "some content", "JavaScript"),
    ("code7.js", 40, "some content", "JavaScript"),
    ("code8.js", 40, "some content", "JavaScript"),
    ("code1.js", 41, "some content", "JavaScript"),
    ("code2.js", 41, "some content", "JavaScript"),
    ("code3.js", 41, "some content", "JavaScript"),
    ("code4.js", 41, "some content", "JavaScript"),
    ("code5.js", 41, "some content", "JavaScript"),
    ("code6.js", 41, "some content", "JavaScript"),
    ("code7.js", 41, "some content", "JavaScript"),
    ("code8.js", 41, "some content", "JavaScript"),
    ("code1.js", 42, "some content", "JavaScript"),
    ("code2.js", 42, "some content", "JavaScript"),
    ("code3.js", 42, "some content", "JavaScript"),
    ("code4.js", 42, "some content", "JavaScript"),
    ("code5.js", 42, "some content", "JavaScript"),
    ("code6.js", 42, "some content", "JavaScript"),
    ("code7.js", 42, "some content", "JavaScript"),
    ("code8.js", 42, "some content", "JavaScript"),
    ("code1.js", 43, "some content", "JavaScript"),
    ("code2.js", 43, "some content", "JavaScript"),
    ("code3.js", 43, "some content", "JavaScript"),
    ("code4.js", 43, "some content", "JavaScript"),
    ("code5.js", 43, "some content", "JavaScript"),
    ("code6.js", 43, "some content", "JavaScript"),
    ("code7.js", 43, "some content", "JavaScript"),
    ("code8.js", 43, "some content", "JavaScript"),
    ("code1.js", 44, "some content", "JavaScript"),
    ("code2.js", 44, "some content", "JavaScript"),
    ("code3.js", 44, "some content", "JavaScript"),
    ("code4.js", 44, "some content", "JavaScript"),
    ("code5.js", 44, "some content", "JavaScript"),
    ("code6.js", 44, "some content", "JavaScript"),
    ("code7.js", 44, "some content", "JavaScript"),
    ("code8.js", 44, "some content", "JavaScript"),
    ("code1.js", 45, "some content", "JavaScript"),
    ("code2.js", 45, "some content", "JavaScript"),
    ("code3.js", 45, "some content", "JavaScript"),
    ("code4.js", 45, "some content", "JavaScript"),
    ("code5.js", 45, "some content", "JavaScript"),
    ("code6.js", 45, "some content", "JavaScript"),
    ("code7.js", 45, "some content", "JavaScript"),
    ("code8.js", 45, "some content", "JavaScript"),
    ("makefile", 46, "some content", "Makefile"),
    ("code1.asm", 48, "some content", "Assembly"),
    ("code2.asm", 48, "some content", "Assembly"),
    ("code3.asm", 48, "some content", "Assembly"),
    ("code1.sql", 52, "some content", "SQL"),
    ("code2.sql", 52, "some content", "SQL"),
    ("code3.sql", 53, "some content", "SQL"),
    ("code4.sql", 53, "some content", "SQL"),
    ("code5.sql", 54, "some content", "SQL"),
    ("code6.sql", 54, "some content", "SQL"),
    ("code7.sql", 55, "some content", "SQL"),
    ("code1.php", 56, "some content", "PHP"),
    ("code2.php", 56, "some content", "PHP"),
    ("code3.php", 56, "some content", "PHP"),
    ("code4.php", 56, "some content", "PHP"),
    ("code5.php", 56, "some content", "PHP"),
    ("code1.php", 57, "some content", "PHP"),
    ("code2.php", 57, "some content", "PHP"),
    ("code3.php", 57, "some content", "PHP"),
    ("code4.php", 57, "some content", "PHP"),
    ("code1.SWIFT", 60, "some content", "SWIFT"),
    ("code2.SWIFT", 60, "some content", "SWIFT"),
    ("code3.SWIFT", 60, "some content", "SWIFT"),
    ("code4.SWIFT", 60, "some content", "SWIFT"),
    ("code5.SWIFT", 60, "some content", "SWIFT"),
    ("code6.SWIFT", 60, "some content", "SWIFT"),
    ("code1.py", 66, "some content", "Python"),
    ("code2.py", 66, "some content", "Python"),
    ("code3.py", 66, "some content", "Python"),
    ("code4.py", 66, "some content", "Python"),
    ("code5.py", 66, "some content", "Python"),
    ("code6.py", 66, "some content", "Python"),
    ("code1.py", 85, "some content", "Python"),
    ("code2.py", 85, "some content", "Python"),
    ("code3.py", 85, "some content", "Python"),
    ("code1.py", 86, "some content", "Python"),
    ("code2.py", 86, "some content", "Python"),
    ("code3.py", 86, "some content", "Python"),
    ("code1.py", 87, "some content", "Python"),
    ("code2.py", 87, "some content", "Python"),
    ("code3.py", 87, "some content", "Python"),
    ("code4.py", 87, "some content", "Python"),
    ("code5.py", 87, "some content", "Python"),
    ("code6.py", 87, "some content", "Python"),
    ("code1.py", 88, "some content", "Python"),
    ("code1.py", 89, "some content", "Python"),
    ("code2.py", 89, "some content", "Python"),
    ("code3.py", 89, "some content", "Python"),
    ("code4.py", 89, "some content", "Python"),
    ("code5.py", 89, "some content", "Python"),
    ("code1.py", 90, "some content", "Python"),
    ("code2.py", 90, "some content", "Python"),
    ("code1.py", 91, "some content", "Python"),
    ("code2.py", 91, "some content", "Python"),
    ("code1.py", 92, "some content", "Python"),
    ("code1.py", 93, "some content", "Python"),
    ("code1.go", 68, "some content", "Go"),
    ("code2.go", 68, "some content", "Go"),
    ("code3.go", 68, "some content", "Go"),
    ("code4.go", 68, "some content", "Go"),
    ("code5.go", 68, "some content", "Go"),
    ("code6.go", 68, "some content", "Go"),
    ("code1.rb", 69, "some content", "Ruby"),
    ("code2.rb", 69, "some content", "Ruby"),
    ("code3.rb", 69, "some content", "Ruby"),
    ("code4.rb", 69, "some content", "Ruby"),
    ("code5.rb", 69, "some content", "Ruby"),
    ("code6.rb", 69, "some content", "Ruby"),
    ("code1.cs", 70, "some content", "C#"),
    ("code2.cs", 70, "some content", "C#"),
    ("code3.cs", 70, "some content", "C#"),
    ("code4.cs", 70, "some content", "C#"),
    ("code5.cs", 70, "some content", "C#"),
    ("code6.cs", 70, "some content", "C#"),
    ("code1.pl", 71, "some content", "Prolog"),
    ("code2.pl", 71, "some content", "Prolog"),
    ("code3.pl", 71, "some content", "Prolog"),
    ("code4.pl", 71, "some content", "Prolog"),
    ("code5.pl", 71, "some content", "Prolog"),
    ("code6.pl", 71, "some content", "Prolog"),
    ("code1.pas", 72, "some content", "Pascal"),
    ("code2.pas", 72, "some content", "Pascal"),
    ("code3.pas", 72, "some content", "Pascal"),
    ("code4.pas", 72, "some content", "Pascal"),
    ("code5.pas", 72, "some content", "Pascal"),
    ("code6.pas", 72, "some content", "Pascal"),
    ("code1.pas", 73, "some content", "Pascal"),
    ("code2.pas", 73, "some content", "Pascal"),
    ("code3.pas", 73, "some content", "Pascal"),
    ("code4.pas", 73, "some content", "Pascal"),
    ("code5.pas", 73, "some content", "Pascal"),
    ("code6.pas", 73, "some content", "Pascal"),
    ("code1.txt", 72, "some content", "HTML"),
    ("code2.txt", 72, "some content", "HTML"),
    ("code3.txt", 72, "some content", "HTML"),
    ("code4.txt", 72, "some content", "HTML"),
    ("code5.txt", 72, "some content", "HTML"),
    ("code6.txt", 72, "some content", "HTML"),
    ("code1.json", 75, "some content", "JSON"),
    ("code2.json", 75, "some content", "JSON"),
    ("code3.json", 75, "some content", "JSON"),
    ("code4.json", 75, "some content", "JSON"),
    ("code5.json", 75, "some content", "JSON"),
    ("code6.json", 75, "some content", "JSON"),
    ("code1.CURL", 76, "some content", "Curl"),
    ("code2.CURL", 76, "some content", "Curl"),
    ("code3.CURL", 76, "some content", "Curl"),
    ("code4.CURL", 76, "some content", "Curl"),
    ("code5.CURL", 76, "some content", "Curl"),
    ("code6.CURL", 76, "some content", "Curl"),
    ("code1.sc", 76, "some content", "Scala"),
    ("code2.sc", 76, "some content", "Scala"),
    ("code3.sc", 76, "some content", "Scala"),
    ("code4.sc", 76, "some content", "Scala"),
    ("code5.sc", 76, "some content", "Scala"),
    ("code6.sc", 76, "some content", "Scala"),
    ("script.sh", 77, "some content", "Shell"),
    ("script.sh", 78, "some content", "Shell");

INSERT INTO OwnerRepository (entity,repository)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (2, 7),
    (2, 8),
    (2, 9),
    (2, 10),
    (2, 11),
    (3, 16),
    (4, 17),
    (4, 18),
    (13, 13),
    (13, 14),
    (12, 12),
    (10, 15);

INSERT INTO ContributorRepository (user,repository)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (1, 9),
    (2, 9),
    (2, 10),
    (2, 11),
    (1, 12),
    (2, 13),
    (2, 14),
    (3, 16),
    (4, 17),
    (4, 18),
    (5, 18),
    (6, 18),
    (7, 18);


INSERT INTO TeamUserMember (user, team, isMaintainer)
VALUES  
    (1, 12, 0),
    (2, 12, 1),
    (2, 13, 1),
    (5, 13, 0);



INSERT INTO Submodule (source,destination)
VALUES
    (13, 14),
    (11, 9),
    (11, 10),
    (18, 17);

INSERT INTO FolderRelationship (child, parent)
VALUES
    (7, 1),
    (12, 1),
    (49, 1),
    (50, 1),
    (8, 7),
    (9, 7),
    (10, 7),
    (13, 12),
    (14, 12),
    (15, 12),
    (16, 12),
    (17, 12),
    (18, 12),
    (19, 12),
    (20, 12),
    (22, 5),
    (25, 5),
    (23, 22),
    (24, 22),
    (26, 25),
    (27, 25),
    (28, 25),
    (29, 25),
    (32, 6),
    (33, 6),
    (34, 33),
    (35, 4),
    (36, 4),
    (37, 4),
    (38, 4),
    (43, 4),
    (44, 4),
    (45, 4),
    (50, 2),
    (46, 50),
    (47, 50),
    (48, 50),
    (51, 3),
    (52, 51),
    (53, 51),
    (54, 51),
    (55, 51),
    (57, 56),
    (58, 56),
    (59, 56),
    (60, 56),
    (61, 56),
    (62, 56),
    (64, 63),
    (68, 67),
    (69, 67),
    (70, 67),
    (71, 67),
    (72, 77),
    (73, 77),
    (74, 77),
    (75, 78),
    (76, 81),
    (79, 77),
    (80, 81),
    (83, 82),
    (84, 82),
    (85, 83),
    (86, 83),
    (87, 83),
    (88, 83),
    (89, 83),
    (90, 83),
    (91, 83),
    (92, 83),
    (93, 83),
    (100, 94),
    (96, 95),
    (97, 96),
    (98, 96),
    (99, 96);

INSERT INTO OrganizationUserOwner (user, organization)
VALUES
    (2, 10),
    (8, 11);

INSERT INTO OrganizationUserMember (user, organization, isPrivate)
VALUES
    (2, 10, 1),
    (1, 10, 1),
    (3, 10, 0),
    (3, 11, 0),
    (4, 10, 0),
    (5, 10, 1),
    (8, 11, 1),
    (9, 11, 0);

COMMIT TRANSACTION;
PRAGMA foreign_keys = ON;
