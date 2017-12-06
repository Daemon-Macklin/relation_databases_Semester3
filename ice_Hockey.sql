--Drop table tables
DROP TABLE COACHES;
DROP TABLE PLAYERS;
DROP TABLE GAMES;
DROP TABLE TEAMS;
DROP TABLE DIVISIONS;
DROP TABLE CONFERENCES;


--Create tables
CREATE TABLE CONFERENCES (
  conference_ID NUMBER(5) NOT NULL,
  conference_name VARCHAR2(20),
  PRIMARY KEY (conference_ID)
);

CREATE TABLE DIVISIONS (
  division_ID NUMBER(5) NOT NULL,
  division_name VARCHAR2(20),
  conference_ID NOT NULL,
  PRIMARY KEY (division_ID),
  FOREIGN KEY (conference_ID) REFERENCES CONFERENCES(conference_ID)
); 

CREATE TABLE TEAMS (
  team_ID NUMBER(5) NOT NULL,
  team_Name VARCHAR2(20) NOT NULL,
  team_Location VARCHAR2(20) NOT NULL,
  team_Record VARCHAR2(8),
  points NUMBER(3),
  conference_ID NOT NULL,
  division_ID NOT NULL,
  PRIMARY KEY ( team_ID ),
  FOREIGN KEY (conference_ID) REFERENCES CONFERENCES(conference_ID),
  FOREIGN KEY (division_ID) REFERENCES DIVISIONS(division_ID)
);

CREATE TABLE COACHES (
  coach_ID NUMBER(5) NOT NULL,
  first_name VARCHAR2(20) NOT NULL,
  last_name VARCHAR2(20) NOT NULL,
  date_of_birth date NOT NULL,
  career_Record VARCHAR2(14) NOT NULL,
  team_ID,
  PRIMARY KEY (coach_ID),
  FOREIGN KEY (team_ID) REFERENCES TEAMS(team_ID)
);

CREATE TABLE PLAYERS (
  player_ID NUMBER(5) NOT NULL,
  player_first_name VARCHAR2(20) NOT NULL,
  player_last_name VARCHAR2(20) NOT NULL,
  draft_year NUMBER(4),
  player_dob date NOT NULL,
  height NUMBER(3),
  weight NUMBER(3),
  player_Type VARCHAR2(6) NOT NULL,
  --players
  goals NUMBER(2),
  assists NUMBER(2),
  points NUMBER(3),
  pim NUMBER(4),
  p_m NUMBER(2),
  --goalies
  save_percentage NUMBER(3),
  gaa NUMBER(3),
  shots_against NUMBER(4),
  goals_against NUMBER(4),
  shutouts NUMBER(2),
  team_ID,
  PRIMARY KEY (player_ID),
  FOREIGN KEY (team_ID) REFERENCES TEAMS(team_ID),
   CONSTRAINT ck_player_type CHECK(player_Type = 'skater' AND goals is NOT NULL AND assists is NOT NULL AND points is NOT NULL AND pim is NOT NULL AND p_m is NOT NULL AND gaa is NULL AND shots_against is NULL AND goals_against is NULL AND shutouts is NULL and save_percentage is NULL OR player_Type = 'goalie' AND goals is NULL AND assists is NULL AND points is NULL AND pim is NULL AND p_m is NULL and save_percentage is NOT NULL AND gaa is NOT NULL AND shots_against is NOT NULL and goals_against is NOT NULL and shutouts is NOT NULL)
);

CREATE TABLE GAMES (
  game_ID NUMBER(5) NOT NULL,
  away_Team VARCHAR(20) NOT NULL,
  final_Score VARCHAR(5) NOT NULL,
  location VARCHAR(4) NOT NULL,
  team,
  PRIMARY KEY (game_ID),
  FOREIGN KEY (team) REFERENCES TEAMS(team_ID),
  CONSTRAINT ck_location CHECK(location = 'home' OR location = 'away')
);

--Insert statements

INSERT INTO CONFERENCES (conference_id, conference_name)
VALUES (1,'Eastern Conference');

INSERT INTO CONFERENCES (conference_id, conference_name)
VALUES (2,'Western Conference');

INSERT INTO DIVISIONS (division_name, division_id, conference_id)
VALUES ('Atlantic',1,'1'); 

INSERT INTO DIVISIONS (division_name, division_id, conference_id)
VALUES ('Metropolitan',2,'1');

INSERT INTO DIVISIONS (division_name, division_id, conference_id)
VALUES ('Central',3,'2');

INSERT INTO DIVISIONS (division_name, division_id, conference_id)
VALUES ('Pacific',4,'2');

INSERT INTO TEAMS ( team_id, team_name, team_location, team_record, conference_id, division_id, points)
VALUES (1, 'Senators', 'Ottawa, Canada', '14-0-0', 1,1, 28);

INSERT INTO TEAMS ( team_id, team_name, team_location, team_record, conference_id, division_id, points)
VALUES (2, 'Maple Leafs', 'Toronto, Canada', '0-14-0', 1,1, 0);

INSERT INTO TEAMS ( team_id, team_name, team_location, team_record, conference_id, division_id, points)
VALUES (3, 'Penguins', 'Pittisburg, USA', '7-6-1', 1,2, 15);

INSERT INTO TEAMS ( team_id, team_name, team_location, team_record, conference_id, division_id, points)
VALUES (4, 'Devils', 'New Jersey, USA', '2-12-0', 1,2, 4);

INSERT INTO TEAMS ( team_id, team_name, team_location, team_record, conference_id, division_id, points)
VALUES (5, 'Jets', 'Winnipeg, Canada', '7-5-2', 2,3, 16);

INSERT INTO TEAMS ( team_id, team_name, team_location, team_record, conference_id, division_id, points)
VALUES (6, 'Wild', 'Minnesota, USA', '6-7-1', 2,3, 13);

INSERT INTO TEAMS ( team_id, team_name, team_location, team_record, conference_id, division_id, points)
VALUES (7, 'Oilers', 'Edmonton, Canada', '6-5-2', 2,4, 14);

INSERT INTO TEAMS ( team_id, team_name, team_location, team_record, conference_id, division_id, points)
VALUES (8, 'Flames', 'Calgary, Canada', '7-4-3', 2,4, 17);

INSERT INTO COACHES (coach_id, first_name, last_name, date_of_birth, career_record, team_id)
VALUES(1, 'Guy', 'Boucher', '03-08-1971' , '141-107-30', 1);

INSERT INTO COACHES (coach_id, first_name, last_name, date_of_birth, career_record, team_id)
VALUES(2, 'Mike', 'Babcock', '05-29-1963' , '1114-596-354', 2);

INSERT INTO COACHES (coach_id, first_name, last_name, date_of_birth, career_record, team_id)
VALUES(3, 'Mike', 'Sullivan', '02-27-1968' , '300-153-93', 3);

INSERT INTO COACHES (coach_id, first_name, last_name, date_of_birth, career_record, team_id)
VALUES(4, 'John', 'Hynes', '10-02-1975' , '164-66-76', 4);

INSERT INTO COACHES (coach_id, first_name, last_name, date_of_birth, career_record, team_id)
VALUES(5, 'Paul', 'Maurice', '01-30-1967' , '596-569-99', 5);

INSERT INTO COACHES (coach_id, first_name, last_name, date_of_birth, career_record, team_id)
VALUES(6, 'Bruce', 'Boudreau', '09-01-1955' , '763-458-217', 6);

INSERT INTO COACHES (coach_id, first_name, last_name, date_of_birth, career_record, team_id)
VALUES(7, 'Todd', 'McLellan', '03-10-1967' , '704-389-83', 7);

INSERT INTO COACHES (coach_id, first_name, last_name, date_of_birth, career_record, team_id)
VALUES(8, 'Glen', 'Gulutzan', '03-08-1971' , '212-109-90', 8);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(1 ,'Erik' ,'Karlsson' ,2008 ,'05-31-1990' ,181 ,87 ,'skater' ,7 ,30, 37 ,4 ,25 ,null ,null ,null ,null ,null ,1);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(2 ,'Mark' ,'Stone' ,2010 ,'02-22-1992' ,178 ,80 ,'skater' ,15 ,10, 25 ,8 ,15 , null,null ,null ,null ,null ,1);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points,pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(3 ,'Mike' ,'Hoffman' ,2011 ,'12-01-1993' ,179 ,85 ,'skater' ,17 ,5 , 22 ,10 ,9 ,null ,null ,null ,null , null,1);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(4 ,'Chris' ,'Phillips' , 1997 , '03-25-1979' ,185 ,90 ,'skater' ,3 ,7 ,10 ,22 ,17 ,null ,null ,null ,null ,null ,1);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(5 ,'Matt' , 'Duchene', 2009 , '01-01-1991', 179 ,83 ,'skater' ,25 , 16, 41, 8, 20,null ,null ,null ,null ,null ,1);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(6 ,'Craig' , 'Anderson', 2001 ,'05-21-1980' ,188 ,85 ,'goalie' ,null ,null,null ,null ,null ,956 ,1.16 ,560 ,25 ,3 ,1);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(9 ,'Auston' ,'Matthews' ,2016 ,'05-31-1996' ,181 ,87 ,'skater' ,7 ,5, 12 ,4 ,-2 ,null ,null ,null ,null ,null ,2);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(10 ,'Mitchell' ,'Marner' ,2015 ,'02-22-1995' ,178 ,80 ,'skater' ,5 ,2, 7 ,8 ,16 , null,null ,null ,null ,null ,2);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points,pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(11 ,'William' ,'Nylander' ,2013 ,'12-01-1995' ,179 ,85 ,'skater' ,17 ,5 , 22 ,10 ,9 ,null ,null ,null ,null , null,2);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(12 ,'Nazem' ,'Kadri' , 2007 , '03-25-1990' ,185 ,90 ,'skater' ,3 ,7 ,10 ,22 ,-5 ,null ,null ,null ,null ,null ,2);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(13 ,'James' , 'Van Riemsdyk', 2013 , '01-01-1995', 179 ,83 ,'skater' ,15 , 6, 21, 8, 20,null ,null ,null ,null ,null ,2);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(14 ,'Frederik' , 'Andersen', 2001 ,'05-21-1980' ,188 ,85 ,'goalie' ,null ,null,null ,null ,null ,893 ,3.16 ,700 ,75 ,0 ,2);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(15 ,'Sidney' ,'Crosby' ,2005 ,'05-31-1986' ,181 ,87 ,'skater' ,15 ,13, 28 ,14 ,2 ,null ,null ,null ,null ,null ,3);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(16 ,'Evgeni' ,'Malkin' ,2004 ,'02-22-1985' ,169 ,91 ,'skater' ,13 ,7, 20 ,15 ,15 , null,null ,null ,null ,null ,3);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points,pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(17 ,'Kris' ,'Letang' ,2008 ,'12-01-1991' ,185 ,95 ,'skater' ,3 ,15 , 18 ,10 ,20 ,null ,null ,null ,null , null,3);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(18 ,'Phill' ,'Kessel' , 2003 , '03-25-1987' ,185 ,90 ,'skater' ,13 ,7 ,10 ,6 ,17 ,null ,null ,null ,null ,null ,3);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(19 ,'Olli' , 'Maatta', 2013 , '01-01-1994', 179 ,83 ,'skater' ,5 , 6, 11, 8, -5 ,null ,null ,null ,null ,null ,3);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(20 ,'Matt' , 'Murray', 2015 ,'05-21-1994' ,188 ,85 ,'goalie' ,null ,null,null ,null ,null ,923 ,2.22 ,540 ,42 ,0 ,3);

---
INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(21 ,'Taylor' ,'Hall' ,2011 ,'05-31-1993' ,181 ,87 ,'skater' ,11 ,7, 18 ,12 ,0 ,null ,null ,null ,null ,null ,4);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(22 ,'Nico' ,'Hischier' ,2017 ,'02-22-1998' ,173 ,84 ,'skater' ,5 ,8, 13 ,16 ,-4 , null,null ,null ,null ,null ,4);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points,pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(23 ,'Kyle' ,'Palmieri' ,2006 ,'12-01-1988' ,172 ,76 ,'skater' ,1 ,5 , 6 ,10 ,-9 ,null ,null ,null ,null , null,4);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(24 ,'Will' ,'Btcher' , 2017 , '03-25-1998' ,182 ,80 ,'skater' ,1 ,2 ,3 ,4 ,-7 ,null ,null ,null ,null ,null ,4);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(25 ,'Andy' , 'Greene', 2007 , '01-01-1989', 182 ,93 ,'skater' ,1 , 6, 7, 8, 2,null ,null ,null ,null ,null ,4);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(26 ,'Cory' , 'Schneider', 2009 ,'05-21-1991' ,185 ,87 ,'goalie' ,null ,null,null ,null ,null ,903 ,2.83 ,643 ,62 ,1 ,4);

----

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(27 ,'Patrik' ,'Laine' ,2016 ,'05-31-1994' ,185 ,88 ,'skater' ,8 ,13, 21 ,4 ,5 ,null ,null ,null ,null ,null ,5);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(28 ,'Dustin' ,'Byfuglien' ,2007 ,'02-22-1989' ,190 ,98 ,'skater' ,5 ,5, 10 ,30 ,7 , null,null ,null ,null ,null ,5);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points,pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(29 ,'Mark' ,'Scheifele' ,2013 ,'12-01-199' ,179 ,85 ,'skater' ,17 ,5 , 22 ,10 ,9 ,null ,null ,null ,null , null,5);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(30 ,'Blake' ,'Wheller' , 2007 , '03-25-1989' ,185 ,87 ,'skater' ,8 ,5 ,13 ,22 ,1 ,null ,null ,null ,null ,null ,5);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(31 ,'Jacob' , 'Trouba', 2009 , '01-01-1991', 186 ,89 ,'skater' ,2 , 6, 11, 18, 8,null ,null ,null ,null ,null ,5);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(32 ,'Connor' , 'Hellebuyck', 2013 ,'05-21-1995' ,188 ,83 ,'goalie' ,null ,null,null ,null ,null ,924 ,2.27 ,530 ,40 ,0 ,5);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(33 ,'Zach' ,'Parise' ,2006 ,'05-31-1988' ,181 ,82 ,'skater' ,14 ,13, 27 ,4 ,5 ,null ,null ,null ,null ,null ,6);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(34 ,'Mikael' ,'Granlund' ,2015 ,'02-22-1996' ,178 ,78 ,'skater' ,5 ,10, 15 ,8 ,1 , null,null ,null ,null ,null ,6);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points,pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(35 ,'Nino' ,'Niederreiter' ,2013 ,'12-01-1995' ,169 ,75 ,'skater' ,16 ,6 , 22 ,10 ,9 ,null ,null ,null ,null , null,6);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(36 ,'Ryan' ,'Sutter' , 2010 , '03-25-1992' ,185 ,90 ,'skater' ,13 ,17 ,30 ,22 ,17 ,null ,null ,null ,null ,null ,6);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(37 ,'Charlie' , 'Coyle', 2013 , '01-01-1996', 185 ,88 ,'skater' ,5 , 3, 8, 20, 2,null ,null ,null ,null ,null ,6);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(38 ,'Devan' , 'Dubnyk', 2006 ,'05-21-1988' ,188 ,85 ,'goalie' ,null ,null,null ,null ,null ,924 ,2.14 ,689 ,54 ,1 ,6);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(39 ,'Connor' ,'McDavid' ,2016 ,'05-31-1997' ,181 ,87 ,'skater' ,22 ,18, 40 ,6 ,23 ,null ,null ,null ,null ,null ,7);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(40 ,'Leon' ,'Draisaitl' ,2015 ,'02-22-1996' ,173 ,82 ,'skater' ,8 ,10, 18 ,8 ,5 , null,null ,null ,null ,null ,7);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points,pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(41 ,'Ryan' ,'Nugent-Hopkins' ,2011 ,'12-01-1993' ,186 ,87 ,'skater' ,18 ,4 , 22 ,10 ,2 ,null ,null ,null ,null , null,7);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(42 ,'Oscar' ,'Klefbom' , 2005 , '03-25-1987' ,185 ,94 ,'skater' ,3 ,4 ,7 ,28 ,1 ,null ,null ,null ,null ,null ,7);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(43 ,'Darnell' , 'Nurse', 2013 , '01-01-1995', 185 ,83 ,'skater' ,5 , 6, 11, 8, 7,null ,null ,null ,null ,null ,7);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(44 ,'Cam' , 'Talbot', 2010 ,'05-21-1992' ,184 ,88 ,'goalie' ,null ,null,null ,null ,null ,921 ,2.16 ,721 ,59 ,2 ,7);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(45 ,'Jaromir' ,'Jager' ,1990 ,'05-31-1972' ,187 ,88 ,'skater' ,1 ,5, 6 ,2 ,4 ,null ,null ,null ,null ,null ,8);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(46 ,'Johnny' ,'Gaudreau' ,2013 ,'02-22-1996' ,168 ,83 ,'skater' ,5 ,10, 15 ,8 ,5 , null,null ,null ,null ,null ,8);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points,pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(47 ,'Sean' ,'Monahan' ,2014 ,'12-01-1997' ,175 ,85 ,'skater' ,7 ,8 , 15 ,10 ,1 ,null ,null ,null ,null , null,8);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(48 ,'Mark' ,'Giordano' , 2000 , '03-25-1982' ,185 ,90 ,'skater' ,3 ,7 ,10 ,22 ,7 ,null ,null ,null ,null ,null ,8);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(49 ,'Dougie' , 'Hamilton', 2009 , '01-01-1991', 178 ,82 ,'skater' ,10 , 11, 21, 4, 10,null ,null ,null ,null ,null ,8);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(50 ,'Mike' , 'Smith', 2000 ,'03-22-1982' ,188 ,85 ,'goalie' ,null ,null,null ,null ,null ,921 ,2.67 ,580 ,46 ,0 ,8);

INSERT INTO PLAYERS (player_id, player_first_name, player_last_name, draft_year, player_dob, height, weight, player_type, goals, assists, points, pim, p_m, save_percentage, gaa, shots_against, goals_against, shutouts, team_id)
VALUES(51, 'Jarome', 'Iginla', 1995, '07-01-1977', 177, 87, 'skater', 0, 0, 0, 0, 0 ,null, null, null, null, null, null); 

--Senators

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(1,1,'Maple Leafs', 'home', '5-0');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(2,1,'Maple Leafs', 'away', '3-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(3,1,'Penguins', 'home', '3-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(4,1,'Penguins', 'away', '1-0');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(5,1,'Devils', 'home', '5-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(6,1,'Devils', 'away', '2-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(7,1,'Jets', 'home', '5-4');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(8,1,'Jets', 'away', '3-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(9,1,'Wild', 'home', '2-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(10,1,'Wild', 'away', '10-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(11,1,'Oilers', 'home', '3-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(12,1,'Oilers', 'away', '3-0');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(13,1,'Flames', 'home', '1-0');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(14,1,'FLames', 'away', '2-0');

--Leafs

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(15,2,'Senators', 'home', '0-5');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(16,2,'Senators', 'away', '1-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(17,2,'Penguins', 'home', '0-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(18,2,'Penguins', 'away', '2-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(19,2,'Devils', 'home', '0-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(20,2,'Devils', 'away', '2-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(21,2,'Jets', 'home', '2-4');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(22,2,'Jets', 'away', '0-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(23,2,'Wild', 'home', '0-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(24,2,'Wild', 'away', '3-7');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(25,2,'Oilers', 'home', '1-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(26,2,'Oilers', 'away', '1-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(27,2,'Flames', 'home', '1-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(28,2,'FLames', 'away', '2-5');

--Penguins

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(29,3,'Maple Leafs', 'home', '2-0');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(30,3,'Maple Leafs', 'away', '6-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(31,3,'Senators', 'home', '2-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(32,3,'Senators', 'away', '0-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(33,3,'Devils', 'home', '5-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(34,3,'Devils', 'away', '1-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(35,3,'Jets', 'home', '5-4');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(36,3,'Jets', 'away', '4-5');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(37,3,'Wild', 'home', '2-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(38,3,'Wild', 'away', '10-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(39,3,'Oilers', 'home', '3-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(40,3,'Oilers', 'away', '3-0');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(41,3,'Flames', 'home', '1-0');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(42,3,'FLames', 'away', '2-0');

--Devils

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(43,4,'Maple Leafs', 'home', '3-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(44,4,'Maple Leafs', 'away', '2-0');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(45,4,'Penguins', 'home', '1-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(46,4,'Penguins', 'away', '2-5');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(47,4,'Senators', 'home', '1-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(48,4,'Senators', 'away', '2-5');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(49,4,'Jets', 'home', '2-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(50,4,'Jets', 'away', '1-6');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(51,4,'Wild', 'home', '2-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(52,4,'Wild', 'away', '1-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(53,4,'Oilers', 'home', '0-5');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(54,4,'Oilers', 'away', '3-6');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(55,4,'Flames', 'home', '1-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(56,4,'FLames', 'away', '2-4');

--Jets

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(113,5,'Maple Leafs', 'home', '2-0');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(57,5,'Maple Leafs', 'away', '4-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(58,5,'Penguins', 'home', '4-5');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(59,5,'Penguins', 'away', '5-4');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(60,5,'Devils', 'home', '6-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(61,5,'Devils', 'away', '3-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(62,5,'Senators', 'home', '4-5');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(63,5,'Senators', 'away', '2-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(64,5,'Wild', 'home', '2-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(65,5,'Wild', 'away', '0-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(66,5,'Oilers', 'home', '3-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(67,5,'Oilers', 'away', '3-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(68,5,'Flames', 'home', '1-0');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(69,5,'FLames', 'away', '2-0');

--Wild

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(70,6,'Maple Leafs', 'home', '5-0');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(71,6,'Maple Leafs', 'away', '3-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(72,6,'Penguins', 'home', '1-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(73,6,'Penguins', 'away', '3-10');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(74,6,'Devils', 'home', '3-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(75,6,'Devils', 'away', '3-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(76,6,'Jets', 'home', '3-0');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(77,6,'Jets', 'away', '1-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(78,6,'Senators', 'home', '1-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(79,6,'Senators', 'away', '3-10');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(80,6,'Oilers', 'home', '2-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(81,6,'Oilers', 'away', '3-4');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(82,6,'Flames', 'home', '1-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(83,6,'FLames', 'away', '2-3');

--Oilers

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(84,7,'Maple Leafs', 'home', '3-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(85,7,'Maple Leafs', 'away', '2-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(86,7,'Penguins', 'home', '0-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(87,7,'Penguins', 'away', '2-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(88,7,'Devils', 'home', '6-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(89,7,'Devils', 'away', '5-0');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(90,7,'Jets', 'home', '1-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(91,7,'Jets', 'away', '2-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(92,7,'Senators', 'home', '0-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(93,7,'Senators', 'away', '2-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(94,7,'Wild', 'home', '4-3');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(95,7,'Wild', 'away', '1-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(96,7,'Flames', 'home', '1-0');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(98,7,'FLames', 'away', '0-2');


--Flames

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(99,8,'Maple Leafs', 'home', '2-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(100,8,'Maple Leafs', 'away', '5-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(101,8,'Penguins', 'home', '0-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(102,8,'Penguins', 'away', '0-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(103,8,'Devils', 'home', '4-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(104,8,'Devils', 'away', '2-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(105,8,'Jets', 'home', '0-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(106,8,'Jets', 'away', '0-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(107,8,'Senators', 'home', '0-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(108,8,'Senators', 'away', '0-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(109,8,'Oilers', 'home', '2-0');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(110,8,'Oilers', 'away', '0-1');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(111,8,'Wild', 'home', '3-2');

INSERT INTO GAMES (game_id, team, away_team, location, final_score)
VALUES(112,8,'Wild', 'away', '2-1');



