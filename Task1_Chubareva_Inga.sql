DROP SCHEMA

IF EXISTS chuing;
	CREATE SCHEMA chuing COLLATE = utf8_general_ci;

USE chuing;

/* *************************************************************** 
***************************CREATING TABLES************************
**************************************************************** */


/* 
***************************CREATING FIRST NORMAL FORM*************************
*/
CREATE TABLE 1NF (
	ID INT (11) UNSIGNED NOT NULL AUTO_INCREMENT,
	Film VARCHAR(25) NOT NULL,
    US_release_dateilm DATE NOT NULL,
    Director VARCHAR(35) NOT NULL,
	Screenwriter VARCHAR(35) NOT NULL, 
	Producer VARCHAR(35) NOT NULL,
	Box_office_gross_US_and_Canada int (20) NOT NULL,
	Box_office_gross_Other_territories int (20) UNSIGNED,
	Box_office_gross_Wordwide int (20) UNSIGNED,
	All_time_Ranking_US_and_Canada INT (20) UNSIGNED,
	All_time_Ranking_Worwide INT (5) UNSIGNED,
	Budget int (20),
	Rotten_Tomatoes VARCHAR(45) NOT NULL,
	Metacritic VARCHAR(45) NOT NULL,
	PRIMARY KEY (ID)
	);
    
    
    

CREATE TABLE 2NF (
	id INT (11) UNSIGNED NOT NULL AUTO_INCREMENT,
	id_f INT(25) NOT NULL,
    US_release_dateilm DATE NOT NULL,
	Director VARCHAR(35) NOT NULL,
	Screenwriter VARCHAR(35) NOT NULL, 
	Producer VARCHAR(35) NOT NULL,
	Budget int (20),
	Rotten_Tomatoes VARCHAR(45) NOT NULL,
	Metacritic VARCHAR(45) NOT NULL,
	PRIMARY KEY (id_f)
	);
    
    CREATE TABLE 2NF_id_film (
    ID_f INT(35) NOT NULL,
    film VARCHAR(25) NOT NULL,
	PRIMARY KEY (ID_f)
    );
	
    CREATE TABLE 2NF_Box_office_gross (
	ID_f INT(35) NOT NULL,
    US_and_Canada INT(20) NULL,
    Other_territories INT(20) NULL,
    Worlwide INT(20) NULL,
    PRIMARY KEY (ID_f)
    );
	
    
    CREATE TABLE 2NF_All_time_Ranking (
    ID_f INT(35) NOT NULL,
    US_and_Canada INT(20) NULL,
    Worlwide INT(20) NULL,
	PRIMARY KEY (ID_f)
    );
	


    
    CREATE TABLE 3NF_ID_F(
	ID INT(35) UNSIGNED NOT NULL AUTO_INCREMENT,
    Film VARCHAR(45) NOT NULL,
	PRIMARY KEY (ID)
	);
CREATE TABLE 3NF_ID_D(
	ID INT(35)  UNSIGNED NOT NULL AUTO_INCREMENT,
    dIRECTOR VARCHAR(25) NOT NULL,
    CONSTRAINT 3NF_phase_3NF_saga_saga_id FOREIGN KEY (saga_id) REFERENCES 3NF_saga(saga_id),
	PRIMARY KEY (ID)
	);
    CREATE TABLE 3NF_ID_P(
    ID INT(35)  UNSIGNED NOT NULL AUTO_INCREMENT,
    Producer VARCHAR(45) NOT NULL,
    PRIMARY KEY(ID)
    );
    CREATE TABLE 3NF_ID_S(
    ID INT(35)  UNSIGNED NOT NULL AUTO_INCREMENT,
    Screenwriter VARCHAR(45) NOT NULL,
    PRIMARY KEY(ID)
    );
CREATE TABLE 3NF (
	ID INT (11) UNSIGNED NOT NULL AUTO_INCREMENT,
	ID_f INT(35) NOT NULL,
    US_Release_dateilm DATE NOT NULL,
	id_d INT(35) NOT NULL,
    id_s INT(35) NOT NULL,
    id_p INT(35) NOT NULL,
	Budget INT(35) NOT NULL,
	Rotten_Tomatoes INT(35) NOT NULL,
    Metacritic INT(35) NOT NULL,
	3NF_ID_F_ID INT(35) NOT NULL,
    3NF_ID_D_ID INT(35) NOT NULL,
    3NF_ID_P_ID INT(35) NOT NULL,
    3NF_ID_S_ID INT(35) NOT NULL,
    
	CONSTRAINT fk_3NF_3NF_ID_F FOREIGN KEY (3NF_ID_F_ID) REFERENCES 3NF_ID_F(ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_3NF_3NF_ID_D1 FOREIGN KEY (3NF_ID_D_ID) REFERENCES 3NF_ID_D(ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_3NF_3NF_ID_P1 FOREIGN KEY (3NF_ID_P_ID) REFERENCES 3NF_ID_P(ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_3NF_3NF_ID_S1 FOREIGN KEY (3NF_ID_S_ID) REFERENCES 3NF_ID_S(ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
	PRIMARY KEY (ID, 3NF_ID_F_ID,3NF_ID_D_ID,3NF_ID_P_ID,3NF_ID_S_ID)
	);
    
    
    
CREATE TABLE 3NF_ALL_TIME_RANKING(
	ID_F INT (11) UNSIGNED NOT NULL AUTO_INCREMENT,
    US_Release_dateilm DATE NOT NULL,
    Worlwide INT(35) NOT NULL,
    3NF_ID INT(35) NOT NULL,
	ID_f INT(35) NOT NULL,
    ID_d INT(35) NOT NULL,
    ID_p INT(35) NOT NULL,
	ID_s INT(35) NOT NULL,
    3NF_ALL_TIME_RANKINGcol VARCHAR(55) NOT NULL,
    CONSTRAINT fk_3NF_ALL_TIME_RANKING_3NF1 FOREIGN KEY (3NF_ID, ID_f,id_d, id_p, id_s) REFERENCES 3NF(ID, 3NF_ID_F_ID, 3NF_ID_D_ID, 3NF_ID_P_ID, 3NF_ID_S_ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    PRIMARY KEY(ID_F, 3NF_ID, ID_f, id_d, id_p, id_s)
	);
    
    




INSERT INTO 1NF VALUES (
	1,
    'Iron Man',
    02-05-2008,
    'Jon Favreau',
    'Mark Fergus',
    'Avi Arad',
    318412101,
    266762121,
    585174222,
    66,
    158,
    140000000,
    '93% (274 reviews)',
    '79 (38 reviews)'
);

INSERT INTO 1NF VALUES (
    2,
    'Iron Man',
    '02.05.2008',
    'Jon Favreau',
    'Hawk Ostby ',
    'Avi Arad ',
    318412101,
    266762121,
    585174222,
    66,
    158,
    140000000,
    '93% (274 reviews)',
    '79 (38 reviews)'
    
);

INSERT INTO 1NF VALUES (
    3,
    'Iron Man',
    '02.05.2008',
    'Jon Favreau',
    'Art Marcum',
    'Avi Arad ',
    318412101,
    266762121,
    585174222,
    66,
    158,
    140000000,
    '93% (274 reviews)',
    '79 (38 reviews)'
    
);

INSERT INTO 1NF VALUES (
    4,
    'Iron Man',
    '02.05.2008',
    'Jon Favreau',
    'Matt Holloway ',
    'Avi Arad ',
    318412101,
    266762121,
    585174222,
    66,
    158,
    140000000,
    '93% (274 reviews)',
    '79 (38 reviews)'
    
);

INSERT INTO 1NF VALUES (
    5,
    'Iron Man',
    '02.05.2008',
    'Jon Favreau',
    'Mark Fergus',
    'Kevin Feige ',
    318412101,
    266762121,
    585174222,
    66,
    158,
    140000000,
    '93% (274 reviews)',
    '79 (38 reviews)'
    
);

INSERT INTO 1NF VALUES (
    6,
    'Iron Man',
    '02.05.2008',
    'Jon Favreau',
    'Hawk Ostby ',
    'Kevin Feige ',
    318412101,
    266762121,
    585174222,
    66,
    158,
    140000000,
    '93% (274 reviews)',
    '79 (38 reviews)'
    
);

INSERT INTO 1NF VALUES (
    7,
    'Iron Man',
    '02.05.2008',
    'Jon Favreau',
    'Art Marcum',
    'Kevin Feige ',
    318412101,
    266762121,
    585174222,
    66,
    158,
    140000000,
    '93% (274 reviews)',
    '79 (38 reviews)'
    
);

INSERT INTO 1NF VALUES (
    8,
    'Iron Man',
    '02.05.2008',
    'Jon Favreau',
    'Matt Holloway ',
    'Kevin Feige ',
    318412101,
    266762121,
    585174222,
    66,
    158,
    140000000,
    '93% (274 reviews)',
    '79 (38 reviews)'
    
);

INSERT INTO 1NF VALUES (
    9,
    'The Incredible Hulk',
    '13.06.2008',
    'Louis Leterrie',
    'Zak Penn ',
    'Avi Arad ',
    134806913,
    128620638,
    263427551,
    434,
    542,
    150000000,
    '67% (227 reviews)',
    '61 (38 reviews)'
    
);

INSERT INTO 1NF VALUES (
    10,
    'The Incredible Hulk',
    '13.06.2008',
    'Louis Leterrie',
    'Zak Penn ',
    'Gale Anne Hurd  ',
    134806913,
    128620638,
    263427551,
    434,
    542,
    150000000,
    '67% (227 reviews)',
    '61 (38 reviews)'
    
);

INSERT INTO 1NF VALUES (
    11,
    'The Incredible Hulk',
    '13.06.2008',
    'Louis Leterrie',
    'Zak Penn ',
    'Kevin Feige ',
    134806913,
    128620638,
    263427551,
    434,
    542,
    150000000,
    '67% (227 reviews)',
    '61 (38 reviews)'
    
);

INSERT INTO 1NF VALUES (
    12,
    'Iron Man 2',
    '07.05.2010',
    'Jon Favreau',
    'Justin Theroux',
    'Kevin Feige ',
    312433331,
    311500000,
    623933331,
    71,
    139,
    200000000,
    '73% (287 reviews)',
    '57 (40 reviews)'
    
);

INSERT INTO 1NF VALUES (
    13,
    'Thor',
    '06.05.2011',
    'Kenneth Branagh',
    'Ashley Edward Miller',
    'Kevin Feige ',
    181030624,
    268295994,
    449326618,
    246,
    241,
    150000000,
    '77% (281 reviews)',
    '57 (40 reviews)'
    
);
INSERT INTO 1NF VALUES (
    14,
    'Thor',
    '06.05.2011',
    'Kenneth Branagh',
    'Zack Stentz ',
    'Kevin Feige ',
    181030624,
    268295994,
    449326618,
    246,
    241,
    150000000,
    '77% (281 reviews)',
    '57 (40 reviews)'
    
);
INSERT INTO 1NF VALUES (
    15,
    'Thor',
    '06.05.2011',
    'Kenneth Branagh',
    'Don Payne',
    'Kevin Feige ',
    181030624,
    268295994,
    449326618,
    246,
    241,
    150000000,
    '77% (281 reviews)',
    '57 (40 reviews)'
    
);

INSERT INTO 1NF VALUES (
    16,
    'Captain America: The First Avenger',
    '22.07.2011',
    'Joe Johnston',
    'Stephen McFeely',
    'Kevin Feige ',
    176,654,505,
    193,915,269,
    370,569,774,
    262,
    324,
    140-216.700000,
    '80% (262 reviews)',
    '66 (43 reviews)'
    
);

INSERT INTO 1NF VALUES (
    17,
    'Captain America: The First Avenger',
    '22.07.2011',
    'Joe Johnston',
    'Christopher Markus',
    'Kevin Feige ',
    176,654,505,
    193,915,269,
    370,569,774,
    262,
    324,
    140-216.700000,
    '80% (262 reviews)',
    '66 (43 reviews)'
    
);

INSERT INTO 1NF VALUES (
    18,
    "Marvel's The Avengers",
    '04.05.2012',
    'Joss Whedon',
    'Joss Whedon',
    'Kevin Feige ',
    623357910,
    895455078,
    1518812988,
    7,
    6,
    220000000,
    '92% (342 reviews)',
    '69 (43 reviews)'
    
);

INSERT INTO 1NF VALUES (
    19,
    "Iron Man 3",
    '03.05.2013',
    'Shane Black',
    'Drew Pearce',
    'Kevin Feige ',
    409013994,
    805797258,
    1214811252,
    26,
    17,
    178400000,
    '79% (311 reviews)',
    '62 (44 reviews)'
    
);

INSERT INTO 1NF VALUES (
    20,
    "Iron Man 3",
   '03.05.2013',
    'Shane Black',
    'Shane Black',
    'Kevin Feige ',
    409013994,
    805797258,
    1214811252,
    26,
    17,
    178400000,
    '79% (311 reviews)',
    '62 (44 reviews)'
    
);

INSERT INTO 1NF VALUES (
    21,
    'Thor: The Dark World',
    '08.11.2013',
    'Alan Taylor',
    'Christopher L. Yost',
    'Kevin Feige ',
    206362140,
    438209262,
    644571402,
    193,
    130,
    152700000,
    '66% (265 reviews)',
    '54 (44 reviews)'
    
);

INSERT INTO 1NF VALUES (
    22,
    'Thor: The Dark World',
    '08.11.2013',
    'Alan Taylor',
    'Christopher Markus',
    'Kevin Feige ',
    206362140,
    438209262,
    644571402,
    193,
    130,
    152700000,
    '66% (265 reviews)',
    '54 (44 reviews)'
    
);

INSERT INTO 1NF VALUES (
    23,
    'Thor: The Dark World',
    '08.11.2013',
    'Alan Taylor',
    'Stephen McFeely',
    'Kevin Feige ',
    206362140,
    438209262,
    644571402,
    193,
    130,
    152700000,
    '66% (265 reviews)',
    '54 (44 reviews)'
    
);

INSERT INTO 1NF VALUES (
    24,
    'Captain America: The Winter Soldier',
    '04.04.2014',
    'Joe Russo',
    'Christopher Markus',
    'Kevin Feige ',
    259766572,
    454497695,
    714264267,
    110,
    105,
    177000000,
    '90% (287 reviews)',
    '70 (48 reviews)'
    
);

INSERT INTO 1NF VALUES (
    25,
    'Captain America: The Winter Soldier',
    '04.04.2014',
    'Joe Russo',
    'Stephen McFeely',
    'Kevin Feige ',
    259766572,
    454497695,
    714264267,
    110,
    105,
    177000000,
    '90% (287 reviews)',
    '70 (48 reviews)'
    
);

INSERT INTO 1NF VALUES (
    26,
    'Captain America: The Winter Soldier',
    '04.04.2014',
    'Anthony Russo',
    'Christopher Markus',
    'Kevin Feige ',
    259766572,
    454497695,
    714264267,
    110,
    105,
    177000000,
    '90% (287 reviews)',
    '70 (48 reviews)'
    
);

INSERT INTO 1NF VALUES (
    27,
    'Captain America: The Winter Soldier',
    '04.04.2014',
    'Anthony Russo',
    'Stephen McFeely',
    'Kevin Feige ',
    259766572,
    454497695,
    714264267,
    110,
    105,
    177000000,
    '90% (287 reviews)',
    '70 (48 reviews)'
    
);

INSERT INTO 1NF VALUES (
    28,
    'Guardians of the Galaxy',
   '01.08.2014',
    'James Gunn',
    'James Gunn',
    'Kevin Feige ',
    333176600,
    440152029,
    773328629,
    58,
    90,
    195900000,
    '91% (312 reviews)',
    '76 (53 reviews)'
    
);

INSERT INTO 1NF VALUES (
    29,
    'Guardians of the Galaxy',
    '01.08.2014',
    'James Gunn',
    'Nicole Perlman',
    'Kevin Feige ',
    333176600,
    440152029,
    773328629,
    58,
    90,
    195900000,
    '91% (312 reviews)',
    '76 (53 reviews)'
    
);

INSERT INTO 1NF VALUES (
    30,
    'Avengers: Age of Ultron',
    '01.05.2015',
    'Joss Whedon',
    'Joss Whedon',
    'Kevin Feige ',
    459005868,
    946397826,
    1405403694,
    16,
    8,
    365500000,
    '75% (349 reviews)',
    '66 (49 reviews)'
    
);

INSERT INTO 1NF VALUES (
    31,
    'Ant-Man ',
    '17.07.2015',
    'Peyton Reed',
    'Edgar Wright',
    'Kevin Feige ',
    180202163,
    339109802,
    519311965,
    248,
    196,
    109300000,
    '82% (303 reviews)',
    '64 (44 reviews)'
    
);


INSERT INTO 1NF VALUES (
    32,
    'Ant-Man ',
    '17.07.2015',
    'Peyton Reed',
    'Joe Cornish ',
    'Kevin Feige ',
    180202163,
    339109802,
    519311965,
    248,
    196,
    109300000,
    '82% (303 reviews)',
    '64 (44 reviews)'
    
);


INSERT INTO 1NF VALUES (
    33,
    'Ant-Man ',
    '17.07.2015',
    'Peyton Reed',
    'Adam McKay ',
    'Kevin Feige ',
    180202163,
    339109802,
    519311965,
    248,
    196,
    109300000,
    '82% (303 reviews)',
    '64 (44 reviews)'
    
);


INSERT INTO 1NF VALUES (
    34,
    'Ant-Man ',
    '17.07.2015',
    'Peyton Reed',
    'Paul Rudd',
    'Kevin Feige ',
    180202163,
    339109802,
    519311965,
    248,
    196,
    109300000,
    '82% (303 reviews)',
    '64 (44 reviews)'
    
);

INSERT INTO 1NF VALUES (
    35,
    'Captain America: Civil War',
    '06.05.2016',
    'Anthony Russo',
    'Stephen McFeely',
    'Kevin Feige ',
    408084349,
    745220146,
    1153304495,
    27,
    19,
    230000000,
    '91% (389 reviews)',
    '75 (53 reviews)'
    
);


INSERT INTO 1NF VALUES (
    36,
    'Captain America: Civil War',
    '06.05.2016',
    'Joe Russo',
    'Stephen McFeely',
    'Kevin Feige ',
    408084349,
    745220146,
    1153304495,
    27,
    19,
    230000000,
    '91% (389 reviews)',
    '75 (53 reviews)'
    
);

INSERT INTO 1NF VALUES (
    37,
    'Captain America: Civil War',
    '06.05.2016',
    'Anthony Russo',
    'Christopher Markus',
    'Kevin Feige ',
    408084349,
    745220146,
    1153304495,
    27,
    19,
    230000000,
    '91% (389 reviews)',
    '75 (53 reviews)'
    
);

INSERT INTO 1NF VALUES (
    38,
    'Captain America: Civil War',
    '06.05.2016',
    'Joe Russo',
    'Christopher Markus',
    'Kevin Feige ',
    408084349,
    745220146,
    1153304495,
    27,
    19,
    230000000,
    '91% (389 reviews)',
    '75 (53 reviews)'
    
);

INSERT INTO 1NF VALUES (
    39,
    'Doctor Strange',
    '04.11.2016',
    'Scott Derrickson',
    'Jon Spaihts',
    'Kevin Feige ',
    232641920,
    445076475,
    677718395,
    145,
    118,
    165-236600000,
    '89% (345 reviews)',
    '72 (49 reviews)'
    
);


INSERT INTO 1NF VALUES (
    40,
    'Doctor Strange',
    '04.11.2016',
    'Scott Derrickson',
    'C. Robert Cargill',
    'Kevin Feige ',
    232641920,
    445076475,
    677718395,
    145,
    118,
    165-236600000,
    '89% (345 reviews)',
    '72 (49 reviews)'
    
);


INSERT INTO 1NF VALUES (
    41,
    'Doctor Strange',
    '04.11.2016',
    'Scott Derrickson',
    'Scott Derrickson ',
    'Kevin Feige ',
    232641920,
    445076475,
    677718395,
    145,
    118,
    165-236600000,
    '89% (345 reviews)',
    '72 (49 reviews)'
    
);

INSERT INTO 1NF VALUES (
    42,
    'Guardians of the Galaxy Vol. 2',
    '05.05.2017',
    'James Gunn',
    'James Gunn ',
    'Kevin Feige ',
    389813101,
    473942950,
    863756051,
    34,
    66,
    200000000,
    '83% (375 reviews)',
    '67 (48 reviews)'
    
);

INSERT INTO 1NF VALUES (
    43,
    'Spider-Man: Homecoming',
    '07.07.2017',
    'Jon Watts',
    'Jonathan Goldstein  ',
    'Kevin Feige ',
    334201140,
    545965784,
    880166924,
    56,
    58,
    175000000,
    '92% (362 reviews)',
    '73 (51 reviews)'
    
);
INSERT INTO 1NF VALUES (
    44,
    'Spider-Man: Homecoming',
   '07.07.2017',
    'Jon Watts',
    'Jonathan Goldstein  ',
    'Amy Pascal ',
    334201140,
    545965784,
    880166924,
    56,
    58,
    175000000,
    '92% (362 reviews)',
    '73 (51 reviews)'
    
);
INSERT INTO 1NF VALUES (
    45,
    'Spider-Man: Homecoming',
    '07.07.2017',
    'Jon Watts',
    'John Francis Daley ',
    'Kevin Feige ',
    334201140,
    545965784,
    880166924,
    56,
    58,
    175000000,
    '92% (362 reviews)',
    '73 (51 reviews)'
    
);

INSERT INTO 1NF VALUES (
    46,
    'Spider-Man: Homecoming',
    '07.07.2017',
    'Jon Watts',
    'John Francis Daley ',
    'Amy Pascal ',
    334201140,
    545965784,
    880166924,
    56,
    58,
    175000000,
    '92% (362 reviews)',
    '73 (51 reviews)'
    
);


INSERT INTO 1NF VALUES (
    47,
    'Spider-Man: Homecoming',
    '07.07.2017',
    'Jon Watts',
    'Jon Watts ',
    'Kevin Feige ',
    334201140,
    545965784,
    880166924,
    56,
    58,
    175000000,
    '92% (362 reviews)',
    '73 (51 reviews)'
    
);

INSERT INTO 1NF VALUES (
    48,
    'Spider-Man: Homecoming',
    '07.07.2017',
    'Jon Watts',
    'Jon Watts  ',
    'Amy Pascal ',
    334201140,
    545965784,
    880166924,
    56,
    58,
    175000000,
    '92% (362 reviews)',
    '73 (51 reviews)'
    
);

INSERT INTO 1NF VALUES (
    49,
    'Spider-Man: Homecoming',
    '07.07.2017',
    'Jon Watts',
    'Christopher Ford ',
    'Kevin Feige ',
    334201140,
    545965784,
    880166924,
    56,
    58,
    175000000,
    '92% (362 reviews)',
    '73 (51 reviews)'
    
);

INSERT INTO 1NF VALUES (
    50,
    'Spider-Man: Homecoming',
    '07.07.2017',
    'Jon Watts',
    'Christopher Ford  ',
    'Amy Pascal ',
    334201140,
    545965784,
    880166924,
    56,
    58,
    175000000,
    '92% (362 reviews)',
    '73 (51 reviews)'
    
);
INSERT INTO 1NF VALUES (
    51,
    'Spider-Man: Homecoming',
    '07.07.2017',
    'Jon Watts',
    'Chris McKenna',
    'Kevin Feige ',
    334201140,
    545965784,
    880166924,
    56,
    58,
    175000000,
    '92% (362 reviews)',
    '73 (51 reviews)'
    
);

INSERT INTO 1NF VALUES (
    52,
    'Spider-Man: Homecoming',
    '07.07.2017',
    'Jon Watts',
    'Chris McKenna',
    'Amy Pascal ',
    334201140,
    545965784,
    880166924,
    56,
    58,
    175000000,
    '92% (362 reviews)',
    '73 (51 reviews)'
    
);
INSERT INTO 1NF VALUES (
    53,
    'Spider-Man: Homecoming',
    '07.07.2017',
    'Jon Watts',
    'Erik Sommers ',
    'Kevin Feige ',
    334201140,
    545965784,
    880166924,
    56,
    58,
    175000000,
    '92% (362 reviews)',
    '73 (51 reviews)'
    
);

INSERT INTO 1NF VALUES (
    54,
    'Spider-Man: Homecoming',
    '07.07.2017',
    'Jon Watts',
    'Erik Sommers ',
    'Amy Pascal ',
    334201140,
    545965784,
    880166924,
    56,
    58,
    175000000,
    '92% (362 reviews)',
    '73 (51 reviews)'
    
);

INSERT INTO 1NF VALUES (
    55,
    'Thor: Ragnarok',
    '03.11.2017',
    'Taika Waititi',
    'Eric Pearson  ',
    'Kevin Feige',
    315058289,
    538918837,
    853977126,
    70,
    69,
    180000000,
    '92% (383 reviews)',
    '74 (51 reviews)'
    
);
INSERT INTO 1NF VALUES (
    56,
    'Thor: Ragnarok',
    '03.11.2017',
    'Taika Waititi',
    'Craig Kyle',
    'Kevin Feige',
    315058289,
    538918837,
    853977126,
    70,
    69,
    180000000,
    '92% (383 reviews)',
    '74 (51 reviews)'
    
);
INSERT INTO 1NF VALUES (
    57,
    'Thor: Ragnarok',
    '03.11.2017',
    'Taika Waititi',
    'Christopher L. Yost',
    'Kevin Feige',
    315058289,
    538918837,
    853977126,
    70,
    69,
    180000000,
    '92% (383 reviews)',
    '74 (51 reviews)'
    
);
INSERT INTO 1NF VALUES (
    58,
    'Black Panther',
    '16.02.2018',
    'Ryan Coogler',
    'Ryan Coogler',
    'Kevin Feige',
    700059566,
    646853595,
    1346913161,
    3,
    9,
    200-210000000,
    '97% (462 reviews)',
    '88 (55 reviews)'
    
);

INSERT INTO 1NF VALUES (
    59,
    'Black Panther',
    '16.02.2018',
    'Ryan Coogler',
    'Joe Robert Cole',
    'Kevin Feige',
    700059566,
    646853595,
    1346913161,
    3,
    9,
    200-210000000,
    '97% (462 reviews)',
    '88 (55 reviews)'
    
);
INSERT INTO 1NF VALUES (
    60,
    'Avengers: Infinity War',
    '27.04.2018',
    'Anthony Russo',
    'Christopher Markus',
    'Kevin Feige',
    678815482,
    1369544272,
    2048359754,
    4,
    4,
    316-400000000,
    '85% (427 reviews)',
    '68 (53 reviews)'
    
);
INSERT INTO 1NF VALUES (
    61,
    'Avengers: Infinity War',
    '27.04.2018',
    'Joe Russo',
    'Christopher Markus',
    'Kevin Feige',
    678815482,
    1369544272,
    2048359754,
    4,
    4,
    316-400000000,
    '85% (427 reviews)',
    '68 (53 reviews)'
    
);
INSERT INTO 1NF VALUES (
    62,
    'Avengers: Infinity War',
    '27.04.2018',
    'Anthony Russo',
    'Stephen McFeely',
    'Kevin Feige',
    678815482,
    1369544272,
    2048359754,
    4,
    4,
    316-400000000,
    '85% (427 reviews)',
    '68 (53 reviews)'
    
);
INSERT INTO 1NF VALUES (
    63,
    'Avengers: Infinity War',
    '27.04.2018',
    'Joe Russo',
    'Stephen McFeely',
    'Kevin Feige',
    678815482,
    1369544272,
    2048359754,
    4,
    4,
    316-400000000,
    '85% (427 reviews)',
    '68 (53 reviews)'
    
);
INSERT INTO 1NF VALUES (
    64,
    'Ant-Man and the Wasp',
    '06.07.2018',
    'Peyton Reed',
    'Chris McKenna',
    'Kevin Feige',
    216648740,
    406025399,
    622674139,
    170,
    140,
    162000000,
    '88% (383 reviews)',
    '70 (56 reviews)'
    
);
INSERT INTO 1NF VALUES (
    65,
    'Ant-Man and the Wasp',
    '06.07.2018',
    'Peyton Reed',
    'Chris McKenna',
    'Stephen Broussard',
    216648740,
    406025399,
    622674139,
    170,
    140,
    162000000,
    '88% (383 reviews)',
    '70 (56 reviews)'
    
);
INSERT INTO 1NF VALUES (
    66,
    'Ant-Man and the Wasp',
    '06.07.2018',
    'Peyton Reed',
    'Erik Sommers ',
    'Kevin Feige',
    216648740,
    406025399,
    622674139,
    170,
    140,
    162000000,
    '88% (383 reviews)',
    '70 (56 reviews)'
    
);
INSERT INTO 1NF VALUES (
    67,
    'Ant-Man and the Wasp',
    '06.07.2018',
    'Peyton Reed',
    'Erik Sommers ',
    'Stephen Broussard',
    216648740,
    406025399,
    622674139,
    170,
    140,
    162000000,
    '88% (383 reviews)',
    '70 (56 reviews)'
    
);
INSERT INTO 1NF VALUES (
    68,
    'Ant-Man and the Wasp',
    '06.07.2018',
    'Peyton Reed',
    'Paul Rudd ',
    'Kevin Feige',
    216648740,
    406025399,
    622674139,
    170,
    140,
    162000000,
    '88% (383 reviews)',
    '70 (56 reviews)'
    
);
INSERT INTO 1NF VALUES (
    69,
    'Ant-Man and the Wasp',
    '06.07.2018',
    'Peyton Reed',
    'Paul Rudd',
    'Stephen Broussard',
    216648740,
    406025399,
    622674139,
    170,
    140,
    162000000,
    '88% (383 reviews)',
    '70 (56 reviews)'
    
);
INSERT INTO 1NF VALUES (
    70,
    'Ant-Man and the Wasp',
    '06.07.2018',
    'Peyton Reed',
    'Andrew Barrer  ',
    'Kevin Feige',
    216648740,
    406025399,
    622674139,
    170,
    140,
    162000000,
    '88% (383 reviews)',
    '70 (56 reviews)'
    
);
INSERT INTO 1NF VALUES (
    71,
    'Ant-Man and the Wasp',
    '06.07.2018',
    'Peyton Reed',
    'Andrew Barrer ',
    'Stephen Broussard',
    216648740,
    406025399,
    622674139,
    170,
    140,
    162000000,
    '88% (383 reviews)',
    '70 (56 reviews)'
    
);
INSERT INTO 1NF VALUES (
    72,
    'Ant-Man and the Wasp',
    '06.07.2018',
    'Peyton Reed',
    'Gabriel Ferrari',
    'Kevin Feige',
    216648740,
    406025399,
    622674139,
    170,
    140,
    162000000,
    '88% (383 reviews)',
    '70 (56 reviews)'
    
);
INSERT INTO 1NF VALUES (
    73,
    'Ant-Man and the Wasp',
    '06.07.2018',
    'Peyton Reed',
    'Gabriel Ferrari',
    'Stephen Broussard',
    216648740,
    406025399,
    622674139,
    170,
    140,
    162000000,
    '88% (383 reviews)',
    '70 (56 reviews)'
    
);

INSERT INTO 1NF VALUES (
    74,
    'Captain Marvel',
    '08.03.2019',
    'Anna Boden',
    'Anna Boden',
    'Kevin Feige',
    376128109,
    664099896,
    1040228005,
    39,
    39,
    97.8-152000000,
    '78% (448 reviews)',
    '64 (55 reviews)'
    
);
INSERT INTO 1NF VALUES (
    75,
    'Captain Marvel',
    '08.03.2019',
    'Anna Boden',
    'Geneva Robertson-Dworet',
    'Kevin Feige',
    376128109,
    664099896,
    1040228005,
    39,
    39,
    97.8-152000000,
    '78% (448 reviews)',
    '64 (55 reviews)'
    
);
INSERT INTO 1NF VALUES (
    76,
    'Captain Marvel',
    '08.03.2019',
    'Anna Boden',
    'Ryan Fleck',
    'Kevin Feige',
    376128109,
    664099896,
    1040228005,
    39,
    39,
    97.8-152000000,
    '78% (448 reviews)',
    '64 (55 reviews)'
    
);

INSERT INTO 1NF VALUES (
    77,
    'Captain Marvel',
    '08.03.2019',
    'Ryan Fleck',
    'Anna Boden',
    'Kevin Feige',
    376128109,
    664099896,
    1040228005,
    39,
    39,
    97.8-152000000,
    '78% (448 reviews)',
    '64 (55 reviews)'
    
);
INSERT INTO 1NF VALUES (
    78,
    'Captain Marvel',
    '08.03.2019',
    'Ryan Fleck',
    'Geneva Robertson-Dworet',
    'Kevin Feige',
    376128109,
    664099896,
    1040228005,
    39,
    39,
    97.8-152000000,
    '78% (448 reviews)',
    '64 (55 reviews)'
    
);
INSERT INTO 1NF VALUES (
    79,
    'Captain Marvel',
    '08.03.2019',
    'Ryan Fleck',
    'Ryan Fleck',
    'Kevin Feige',
    376128109,
    664099896,
    1040228005,
    39,
    39,
    97.8-152000000,
    '78% (448 reviews)',
    '64 (55 reviews)'
    
);

    


