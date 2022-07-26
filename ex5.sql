DROP DATABASE IF EXISTS ud15_ex5;
CREATE DATABASE ud15_ex5;
USE ud15_ex5;

#DROP TABLE IF EXISTS RESERVA;
#DROP TABLE IF EXISTS INVISTIGADORES;
#DROP TABLE IF EXISTS EQUIPOS;
#DROP TABLE IF EXISTS FACULTAD;

CREATE TABLE FACULTADES(
	codigo int PRIMARY KEY,
	nombre varchar(100)
);

INSERT INTO FACULTADES VALUES
	(1,'Física'),
    (2,'Matemáticas'),
    (3,'Medicina'),
    (4,'Ingeniería'),
    (5,'Arquitectura'),
    (6,'Bellas Artes'),
    (7,'Psicología'),
    (8,'Robótica'),
    (9,'Química'),
    (10,'Historia');
    
UPDATE FACULTAD SET nombre='Ingeniería Mecánica' WHERE codigo=4;
UPDATE FACULTAD SET nombre='Historia de España' WHERE nombre LIKE 'Historia';
DELETE FROM FACULTAD WHERE nombre LIKE 'Física' OR nombre LIKE 'Química';

CREATE TABLE INVESTIGADORES (
	dni varchar(9) PRIMARY KEY,
	nomApels varchar(255),
	facultad int,
	FOREIGN KEY (facultad) REFERENCES FACULTADES(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO INVESTIGADORES
 VALUES
	('39933791H','Arnau Mas',1),
    ('39943791H','Ionela Vlasdel',1),
    ('39933291H','Oriol Domenech',2),
    ('31933791H','Pau Cahisa',2),
    ('39533791H','Jone Joana',3),
    ('39933797H','Bárbara',3),
    ('39936791H','Ernest Muntané',4),
    ('39433791H','Jordi Ribelles',4),
    ('39933111H','Naiara López',5),
    ('30033791H','Cristhian Requena',5);
    
UPDATE INVISTIGADORES SET nombre='Ingeniería Mecánica' WHERE codigo=4;
UPDATE INVISTIGADORES SET nombre='Historia de España' WHERE nombre LIKE 'Historia';
DELETE FROM INVISTIGADORES WHERE nombre LIKE 'Física' OR nombre LIKE 'Química';

CREATE TABLE EQUIPOS(
	numSerie char(4) PRIMARY KEY,
	nombre varchar(100),
	facultad int,
	FOREIGN KEY (facultad) REFERENCES FACULTADES(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO EQUIPOS VALUES
	('AB01','TEAM1',1),
    ('AB02','TEAM2',1),
    ('AB03','TEAM3',2),
    ('AB04','TEAM4',2),
    ('AB05','TEAM5',3),
    ('AB06','TEAM6',4),
    ('AB07','TEAM7',5),
    ('AB08','TEAM8',6),
    ('AB09','TEAM9',7),
    ('AB10','TEAM10',8);

CREATE TABLE RESERVA(
	dni varchar(9),
	numSerie char(4),
	comienzo datetime,
	fin datetime,
	PRIMARY KEY (dni,numSerie),
	FOREIGN KEY (dni) REFERENCES INVESTIGADORES(dni) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (numSerie) REFERENCES EQUIPOS(numSerie) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO RESERVA VALUES
	('39933791H','AB01','2022-7-25','2022-7-30'),
    ('39943791H','AB02','2022-7-25','2022-7-30'),
    ('39933797H','AB03','2022-7-25','2022-7-30'),
    ('39933791H','AB04','2022-7-25','2022-7-30'),
    ('39936791H','AB05','2022-7-25','2022-7-30'),
    ('39936791H','AB06','2022-7-25','2022-7-30'),
    ('39933797H','AB07','2022-7-25','2022-7-30'),
    ('31933791H','AB08','2022-7-25','2022-7-30'),
    ('39933791H','AB09','2022-7-25','2022-7-30'),
    ('31933791H','AB10','2022-7-25','2022-7-30');
