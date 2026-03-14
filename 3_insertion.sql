USE projetdb;

INSERT INTO JEU (id_jeu, nom_jeu, genre, date_sortie) VALUES
(1,'League of Legends','MOBA','2009-10-27'),
(2,'Valorant','FPS','2020-06-02'),
(3,'Fortnite','Battle Royale','2017-07-21'),
(4,'Rocket League','Sport','2015-07-07'),
(5,'Minecraft','Sandbox','2011-11-18'),
(6,'Counter Strike 2','FPS','2023-09-27'),
(7,'Apex Legends','Battle Royale','2019-02-04'),
(8,'Overwatch 2','FPS','2022-10-04'),
(9,'EA FC 24','Sport','2023-09-29'),
(10,'Genshin Impact','RPG','2020-09-28');

INSERT INTO SIGNALEMENT VALUES
(1,'Langage offensant','2024-01-10 18:00:00'),
(2,'Spam vocal','2024-01-11 19:00:00'),
(3,'Triche suspectee','2024-01-12 20:30:00'),
(4,'Insultes dans le chat','2024-01-13 21:15:00'),
(5,'AFK volontaire','2024-01-14 17:20:00'),
(6,'Comportement toxique','2024-01-15 22:00:00'),
(7,'Usurpation pseudo','2024-01-16 18:40:00'),
(8,'Harcèlement','2024-01-17 19:30:00'),
(9,'Provocation','2024-01-18 20:10:00'),
(10,'Spam message','2024-01-19 21:20:00');

INSERT INTO JOUEUR VALUES
(1,'ShadowX','shadowx@mail.com','2023-01-01',25,NULL),
(2,'Dragon77','dragon77@mail.com','2023-01-02',18,NULL),
(3,'NovaFire','novafire@mail.com','2023-01-03',20,NULL),
(4,'BlazeFox','blazefox@mail.com','2023-01-04',30,NULL),
(5,'NightRider','nightrider@mail.com','2023-01-05',14,NULL),
(6,'AlphaStorm','alphastorm@mail.com','2023-01-06',22,NULL),
(7,'PixelKing','pixelking@mail.com','2023-01-07',19,NULL),
(8,'CyberMax','cybermax@mail.com','2023-01-08',17,NULL),
(9,'IronClaw','ironclaw@mail.com','2023-01-09',23,NULL),
(10,'LunaByte','lunabyte@mail.com','2023-01-10',26,NULL),
(11,'GhostAim','ghostaim@mail.com','2023-01-11',28,NULL),
(12,'TurboZen','turbozen@mail.com','2023-01-12',13,NULL),
(13,'Vortex','vortex@mail.com','2023-01-13',16,NULL),
(14,'SkyLash','skylash@mail.com','2023-01-14',21,NULL),
(15,'NeoSpark','neospark@mail.com','2023-01-15',27,NULL),
(16,'DarkHive','darkhive@mail.com','2023-01-16',20,NULL),
(17,'RapidOne','rapidone@mail.com','2023-01-17',15,NULL),
(18,'FrostZen','frostzen@mail.com','2023-01-18',12,NULL),
(19,'HexaCore','hexacore@mail.com','2023-01-19',29,NULL),
(20,'ZeroLag','zerolag@mail.com','2023-01-20',24,NULL);

INSERT INTO EQUIPE VALUES
(1,'Shadow Wolves','2023-07-01',NULL),
(2,'Nova Squad','2023-07-02',NULL),
(3,'Blue Titans','2023-07-03',NULL),
(4,'Red Orbit','2023-07-04',NULL),
(5,'Cyber Falcons','2023-07-05',NULL),
(6,'Storm Unit','2023-07-06',NULL);

UPDATE JOUEUR SET id_equipe = 1 WHERE id_joueur IN (1,2,3);
UPDATE JOUEUR SET id_equipe = 2 WHERE id_joueur IN (4,5,6);
UPDATE JOUEUR SET id_equipe = 3 WHERE id_joueur IN (7,8,9);
UPDATE JOUEUR SET id_equipe = 4 WHERE id_joueur IN (10,11,12);
UPDATE JOUEUR SET id_equipe = 5 WHERE id_joueur IN (13,14,15);
UPDATE JOUEUR SET id_equipe = 6 WHERE id_joueur IN (16,17,18);

UPDATE EQUIPE SET id_joueur=1 WHERE id_equipe=1;
UPDATE EQUIPE SET id_joueur=4 WHERE id_equipe=2;
UPDATE EQUIPE SET id_joueur=7 WHERE id_equipe=3;
UPDATE EQUIPE SET id_joueur=10 WHERE id_equipe=4;
UPDATE EQUIPE SET id_joueur=13 WHERE id_equipe=5;
UPDATE EQUIPE SET id_joueur=16 WHERE id_equipe=6;

INSERT INTO PARTIE VALUES
(1,'2024-02-01 18:00:00','2024-02-01 18:35:00','terminee',1,'solo',1,1,1),
(2,'2024-02-02 19:00:00','2024-02-02 19:40:00','terminee',1,'solo',4,2,2),
(3,'2024-02-03 20:00:00','2024-02-03 20:50:00','terminee',0,'equipe',7,3,3),
(4,'2024-02-04 17:30:00','2024-02-04 18:10:00','terminee',0,'equipe',10,4,4),
(5,'2024-02-05 21:00:00','2024-02-05 21:30:00','terminee',1,'solo',13,5,5),
(6,'2024-02-06 16:00:00','2024-02-06 16:45:00','en_cours',0,'equipe',16,6,6),
(7,'2024-02-07 18:20:00','2024-02-07 18:55:00','terminee',1,'solo',2,7,7),
(8,'2024-02-08 19:40:00','2024-02-08 20:15:00','terminee',0,'equipe',5,8,8),
(9,'2024-02-09 20:00:00',NULL,'planifiee',0,'solo',8,9,NULL),
(10,'2024-02-10 22:00:00',NULL,'annulee',0,'solo',11,10,NULL);

INSERT INTO AMITIE VALUES
(1,2,'acceptee','2024-01-01 10:00:00'),
(1,4,'acceptee','2024-01-02 11:00:00'),
(2,3,'en_attente','2024-01-03 12:00:00'),
(3,5,'refusee','2024-01-04 13:00:00'),
(4,6,'acceptee','2024-01-05 14:00:00'),
(5,7,'bloquee','2024-01-06 15:00:00'),
(6,8,'acceptee','2024-01-07 16:00:00'),
(7,9,'en_attente','2024-01-08 17:00:00'),
(8,10,'acceptee','2024-01-09 18:00:00'),
(9,11,'acceptee','2024-01-10 19:00:00');

INSERT INTO PARTICIPER VALUES
(1,1,1,1450,1,0),
(2,1,1,1200,2,0),
(3,1,1,980,3,0),
(4,2,2,1600,1,0),
(5,2,2,1100,2,0),
(6,2,2,700,3,1),
(7,3,3,900,1,0),
(8,3,3,850,2,0),
(9,3,3,620,3,0),
(10,4,4,770,1,0),
(11,4,4,630,2,0),
(12,4,4,500,3,1);
