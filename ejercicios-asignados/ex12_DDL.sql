/*
juan hace los inserts en archivo a parte, finalmente modificamos inserts cn 
autoincrementales y lo añadimos todo en un unico archivo (este) que tambien contiene
los updates, deletes y las modificaciones necesarias en la creacion de tablas
*/

DROP DATABASE IF EXISTS u14_ex12_u12;
CREATE DATABASE u14_ex12_u12;
use u14_ex12_u12;


CREATE TABLE Profesiones(
	idProfesion int auto_increment PRIMARY KEY,
    nombreProfesion varchar(25),
    tipoProfesion varchar(25)
);

CREATE TABLE Empresas(
	cif varchar(9) PRIMARY KEY,
    nombre varchar(100),
    direccion varchar(100),
    telefono varchar(100),
    idInterno varchar(100)
);

CREATE TABLE Proyectos(
	idProyecto int auto_increment PRIMARY KEY,
    fechaPrevista date,
    fechaInicio date,
    fechaFin date,
    idEmpresa varchar(9),
    CONSTRAINT FK_ProyectosEmpresa FOREIGN KEY (idEmpresa) REFERENCES Empresas(cif) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Trabajadores(
	idTrabajador int auto_increment PRIMARY KEY,
    dni varchar(9),
    nombre varchar(25),
    apellidos varchar(25)
);

CREATE TABLE Realiza(
	idTrabajador int,
    idProyecto int,
    idProfesion int,
    horas int,
    PRIMARY KEY(idTrabajador, idProyecto, idProfesion),
    CONSTRAINT FK_RealizaTrabajador FOREIGN KEY (idTrabajador) REFERENCES Trabajadores(idTrabajador) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FK_RealizaProyecto FOREIGN KEY (idProyecto) REFERENCES Proyectos(idProyecto) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FK_RealizaProfesion FOREIGN KEY (idProfesion) REFERENCES Profesiones(idProfesion) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO Profesiones values
	(DEFAULT, 'Analista', 'Finalizador'),
	(DEFAULT, 'Jefe de proyecto', 'Supervisor'),
    (DEFAULT, 'Programador', 'Ejecutor');
    
INSERT INTO Empresas values
	('B-123456F', 'Apple', 'C/Falsa 123', '555-666-898', 'EMP01'),
	('B-541354G', 'Microsoft', 'C/Verdadera 456', '555-565-857', 'EMP02'),
    ('B-842452Y', 'Dell', 'C/Paquita 999', '555-874-212', 'EMP03');
    
INSERT INTO Proyectos values
	(DEFAULT, '2022-11-11', '2022-01-01', '2100-12-31', 'B-123456F'),
	(DEFAULT, '2022-12-12', '2022-02-14', '2100-10-03', 'B-541354G'),
    (DEFAULT, '2023-02-11', '2022-03-21', '2100-11-30', 'B-842452Y');
    
INSERT INTO Trabajadores values
	(DEFAULT, '19540239B', 'Joana', 'Garcia'),
	(DEFAULT, '54651854C', 'Arnau', 'Fernandez'),
    (DEFAULT, '89476541Y', 'Joan', 'Marin');
    
INSERT INTO Realiza values
	(1, 1, 1, 78),
	(2, 2, 2, 80),
    (3, 3, 3, 65);
    
    
SELECT * FROM Empresas;
UPDATE Empresas SET nombre='Apple2' WHERE cif = 'B-123456F';
UPDATE Empresas SET direccion='C/Tarragona 222' WHERE cif = 'B-123456F';
UPDATE Empresas SET telefono='638108313' WHERE cif = 'B-123456F';
DELETE FROM Empresas WHERE cif='B-123456F';

SELECT * FROM Profesiones;
UPDATE Profesiones SET nombreProfesion='Project Manager' WHERE idProfesion=2;

SELECT * FROM Proyectos;
UPDATE Proyectos SET fechaFin='9999-12-31' WHERE idProyecto=1;
UPDATE Proyectos SET fechaFin='9999-12-31' WHERE idEmpresa='B-541354G';

SELECT * FROM Trabajadores;
DELETE FROM Trabajadores ORDER BY apellidos LIMIT 1; #comprobacion de error al tener on delete restrict

SELECT * FROM Realiza;
