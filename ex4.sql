DROP DATABASE IF EXISTS ud15_ex4;
CREATE DATABASE ud15_ex4;
USE ud15_ex4;

#DROP TABLE IF EXISTS MAQUINAS_REGISTRADORAS;
#DROP TABLE IF EXISTS PRODUCTOS;
#DROP TABLE IF EXISTS CAJEROS;
#DROP TABLE IF EXISTS VENTA;

CREATE TABLE PRODUCTOS(
	codigo int PRIMARY KEY,
	nom varchar(100),
	precio int
);

INSERT INTO PRODUCTOS VALUES
	(1,'Manzana',1.99),
    (2,'Huevo',1.99),
    (3,'Naranja',1.99),
    (4,'Pan',1.99),
    (5,'Espinacas',1.99),
    (6,'Jamón',1.99),
    (7,'Queso',1.99),
    (8,'Leche',1.99),
    (9,'Cebolla',1.99),
    (10,'Aceitunas',1.99);

CREATE TABLE CAJEROS(
	codigo int PRIMARY KEY,
	nomApels varchar(255)
);

INSERT INTO CAJEROS VALUES
	(1,'Ermendessa'),
    (2,'Griselda'),
    (3,'Gentil'),
    (4,'Rodrigo'),
    (5,'Jimena'),
    (6,'Juan'),
    (7,'Luís'),
    (8,'Teresina'),
    (9,'Maria Cinta'),
    (10,'Román Javier');

CREATE TABLE MAQUINAS_REGISTRADORAS(
	codigo int PRIMARY KEY,
	piso int
);

INSERT INTO MAQUINAS_REGISTRADORAS VALUES
	(1,1),
    (2,1),
    (3,1),
    (4,1),
    (5,1),
    (6,2),
    (7,2),
    (8,2),
    (9,2),
    (10,2);

CREATE TABLE VENTA(
	cajero int,
	maquina int,
	producto int,
	PRIMARY KEY (cajero,maquina,producto),
	FOREIGN KEY (cajero) REFERENCES CAJEROS(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (maquina) REFERENCES MAQUINAS_REGISTRADORAS(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (producto) REFERENCES PRODUCTOS(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO VENTA VALUES
	(1,1,4),
    (2,2,5),
    (3,3,1),
    (4,4,3),
    (5,5,8),
    (6,6,6),
    (7,7,8),
    (8,8,9),
    (9,9,10),
    (10,10,2);
