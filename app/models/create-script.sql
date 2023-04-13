-- ##################
-- Door: Thijs van Waaij
-- ##################
-- - Step 1; Create a new Database
DROP DATABASE IF EXISTS `be-p4-opdr-1`;

CREATE DATABASE IF NOT EXISTS `be-p4-opdr-1`;

-- * Use Database for inserting;
USE `be-p4-opdr-1`;

-- - Step 2: create new table typevoertuig.
DROP TABLE IF EXISTS typevoertuig;

CREATE TABLE IF NOT EXISTS typevoertuig (
    id                  TINYINT UNSIGNED    NOT NULL AUTO_INCREMENT,
    typevoertuig        VARCHAR(100)        NOT NULL,
    rijbewijscategorie  VARCHAR(3)          NOT NULL,

    CONSTRAINT          PK_typevoertuig_Id  PRIMARY KEY CLUSTERED(id)
) ENGINE=InnoDB;

-- - Step 3: Fill table Typevoertuig with data
INSERT INTO typevoertuig (
    typevoertuig,
    rijbewijscategorie
)
VALUES 
("Personenauto", "B" ),
("Vrachtwagen" , "C" ),
("Bus"         , "D" ),
("Bromfiets"   , "AM");

-- - Step 4: Create new table voertuig

DROP TABLE IF EXISTS voertuig;

CREATE TABLE IF NOT EXISTS voertuig (
    id              TINYINT UNSIGNED    NOT NULL    AUTO_INCREMENT,
    kenteken        VARCHAR(8)          NOT NULL,
    type            VARCHAR(50)         NOT NULL,
    bouwjaar        DATE                NOT NULL,
    brandstof       VARCHAR(15)         NOT NULL,
    typevoertuigID  TINYINT UNSIGNED    NOT NULL,
    CONSTRAINT      PK_voertuig_Id      PRIMARY KEY CLUSTERED(id),
    CONSTRAINT      FK_typevoertuigID   FOREIGN KEY (typevoertuigID) REFERENCES typevoertuig (id)
) ENGINE=InnoDB;

-- - Step 5 Insert data into table voertuig

-- Id(PK)	Kenteken	Type	Bouwjaar	Brandstof	TypeVoertuigId (FK)
INSERT INTO voertuig (
kenteken,
type,
bouwjaar,
brandstof,
typevoertuigID
) 
VALUES
("AU-67-IO",  "Golf",           "2017-06-12",     "Diesel",     1),
("TR-24-OP",  "DAF",            "2019-05-23",     "Diesel",     2),
("TH-78-KL",  "Mercedes",       "2023-01-01",     "Benzine",    1),
("90-KL-TR",  "Fiat 500",       "2021-09-12",     "Benzine",    1),
("34-TK-LP",  "Scania",         "2015-03-13",     "Diesel",     2),
("YY-OP-78",  "BMW M5",         "2022-05-13",     "Diesel",     1),
("UU-HH-JK",  "M.A.N",          "2017-12-03",     "Diesel",     2),
("ST-FZ-28",  "Citroën",        "2018-01-20",     "Elektrisch", 1),
("123-FR-T",  "Piaggio ZIP",	"2021-02-01",     "Benzine",    4),
("DRS-52-P",  "Vespa",          "2022-03-21",     "Benzine",    4),
("STP-12-U",  "Kymco",          "2022-07-02",     "Benzine",    4),
("45-SD-23",  "Renault",        "2023-01-01",     "Diesel",     3);

-- - Step 6 Create table instructeurs

DROP TABLE IF EXISTS instructeurs;

CREATE TABLE IF NOT EXISTS instructeurs (
    id              TINYINT UNSIGNED    NOT NULL    AUTO_INCREMENT,
    voornaam        VARCHAR(50)         NOT NULL,
    tussenvoegsel   VARCHAR(10)         NULL,
    achternaam      VARCHAR(50)         NOT NULL,
    telefoon        CHAR(12)            NOT NULL,
    datumInDienst   DATE                NOT NULL,
    aantalSterren   TINYINT UNSIGNED    NULL,
    CONSTRAINT PK_instructeursID PRIMARY KEY CLUSTERED(id)
) ENGINE=InnoDB;

-- - Step 7 Insert data into instructeurs

INSERT INTO instructeurs (
    voornaam,
    tussenvoegsel,
    achternaam,
    telefoon,
    datumInDienst,
    aantalSterren
) VALUES
("Li",        null,    "Zhan",      "06-28493827", "2015-04-17", 3),
("Leroy",     null,    "Boerhaven", "06-39398734", "2018-06-25", 1),
("Yoeri",     "Van",   "Veen",      "06-24383291", "2010-05-12", 3),
("Bert",      "Van",   "Sali",      "06-48293823", "2023-01-10", 4),
("Mohammed",  "El",    "Yassidi",   "06-34291234", "2010-06-14", 5);

-- - Step 8 Create linking table voertuig-instructeur
DROP TABLE IF EXISTS voertuiginstructeur;

CREATE TABLE IF NOT EXISTS voertuiginstructeur (
    id              TINYINT UNSIGNED            NOT NULL    AUTO_INCREMENT,
    voertuigID      TINYINT UNSIGNED            NOT NULL,
    instructeurID   TINYINT UNSIGNED            NOT NULL,
    datumToekenning DATE                        NOT NULL,
    CONSTRAINT      PK_voertuiginstructeurID    PRIMARY KEY CLUSTERED(id),
    CONSTRAINT      FK_voertuigID    FOREIGN KEY (voertuigID)    REFERENCES voertuig    (id),
    CONSTRAINT      FK_instructeurID FOREIGN KEY (instructeurID) REFERENCES instructeurs(id)
) ENGINE=InnoDB;

-- - Step 9 Insert into voertuig-instructeur

INSERT INTO voertuiginstructeur (voertuigID, instructeurID, datumToekenning) 
VALUES
(1,     5,  "2017-06-18"),
(3,     1,  "2021-09-26"),
(9,     1,  "2021-09-27"),
(3,     4,  "2022-08-01"),
(5,     1,  "2019-08-30"),
(10,    5,  "2020-02-02");
