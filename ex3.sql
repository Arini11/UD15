drop database if exists u15_ex03;
CREATE DATABASE u15_ex03;
use u15_ex03;

CREATE TABLE Proyectos
(
idProyecto char(4) primary key,
Nombre nvarchar(255),
Horas int);

CREATE TABLE Cientificos
(
DNI varchar(8) primary key,
NomApels nvarchar(255)
);

CREATE TABLE Asignado_a
(
Cientifico varchar(8),
Proyecto char(4),
primary key (Cientifico, Proyecto),
constraint FK1 foreign key (Cientifico) references Cientificos (DNI),
constraint FK2 foreign key (Proyecto) references Proyectos (idProyecto)
);

 insert into Proyectos values
 ('PRY', 'Umbrela', 10),
 ('PRY1', 'Umbrela', 20),
 ('PRY2', 'Umbrela', 30),
 ('PRY3', 'Umbrela', 40),
 ('PRY4', 'Umbrela', 45),
 ('PRY5', 'Umbrela', 60),
 ('PRY6', 'Umbrela', 65),
 ('PRY7', 'Umbrela', 80),
 ('PRY8', 'Umbrela', 85),
 ('PRY9', 'Umbrela', 90);
 

 
 insert into Cientificos values
 ('1976023P', 'Carlos Garcia'),
 ('0000000P', 'Sara Rodriguez'),
 ('1100111P', 'Maria Marin'),
 ('2202020P', 'Aitana Anton'),
 ('3993939P', 'Sandra Garcia'),
 ('4040404P', 'Pepe Lopez'),
 ('5050505P', 'Ivan Camorra'),
 ('6060606P', 'Jesus Pujol'),
 ('7070707P', 'Rodolfo Sanchez'),
 ('8080808P', 'Marilo Zamora');
 
insert into Asignado_a values
('1976023P','PRY'),
('0000000P','PRY1'),
('1100111P','PRY2'),
('2202020P','PRY3'),
('3993939P','PRY4'),
('4040404P','PRY5'),
('5050505P','PRY6'),
('6060606P','PRY7'),
('7070707P','PRY8'),
('8080808P','PRY9');

UPDATE Cientificos SET NomApels='Samanta Iglesias' WHERE NomApels='Ivan Camorra';
DELETE FROM Asignado_a WHERE Proyecto='PRY';
 
SELECT*FROM Asignado_a;
