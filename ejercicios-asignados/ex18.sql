DROP DATABASE IF EXISTS ex18_asignado_final;
CREATE DATABASE ex18_asignado_final;
USE ex18_asignado_final;

CREATE TABLE Personas(
	codigoPersonal int PRIMARY KEY,
    dni varchar(9),
    nombre varchar(25),
    apellidos varchar(25),
    fijo varchar(25),
    movil varchar(25),
    esTrabajador boolean,
    esCliente boolean
);

CREATE TABLE Inmuebles(
	codigoInmueble int PRIMARY KEY,
    metros varchar(25),
    descripcion varchar(25),
    direccion varchar(25)
);

CREATE TABLE Garajes(
	codigoInmueble int PRIMARY KEY,
    numGaraje varchar(25),
    planta varchar(25),
	CONSTRAINT FK_GarajeInmueble FOREIGN KEY (codigoInmueble) REFERENCES Inmuebles(codigoInmueble) 
);
CREATE TABLE Pisos(
	codigoInmueble int PRIMARY KEY,
    codigoPiso varchar(25),
    codigoGaraje int,
    CONSTRAINT FK_PisoGaraje FOREIGN KEY (codigoGaraje) REFERENCES Garajes(codigoInmueble),
    CONSTRAINT FK_PisoInmueble FOREIGN KEY (codigoInmueble) REFERENCES Inmuebles(codigoInmueble)
);

CREATE TABLE Locales(
	codigoInmueble int PRIMARY KEY,
    uso varchar(25),
    servicio boolean,
	CONSTRAINT FK_LocalInmueble FOREIGN KEY (codigoInmueble) REFERENCES Inmuebles(codigoInmueble)
);

CREATE TABLE Compras(
	codigoCompra int PRIMARY KEY,
    fecha date,
    precio int,
    codigoInmueble int,
	CONSTRAINT FK_CompraInmueble FOREIGN KEY (codigoInmueble) REFERENCES Inmuebles(codigoInmueble)
);

CREATE TABLE Titulares(
    codigoCompra int,
    codigoPersonal int,
    PRIMARY KEY(codigoCompra,codigoPersonal),
    CONSTRAINT FK_TitularCompra FOREIGN KEY (codigoCompra) REFERENCES Compras(codigoCompra),
	CONSTRAINT FK_TitularPersona FOREIGN KEY (codigoPersonal) REFERENCES Personas(codigoPersonal)
);
CREATE TABLE Alquileres(
	codigoAlquiler int,
    codigoInmueble int,
    codigoGestor int,
    codigoArrendatario int,
    PRIMARY KEY(codigoAlquiler,codigoInmueble), #modifico PK para que sea compuesta (un codigo de alquiler puede repetirse en distintos inmuebles)
    CONSTRAINT FK_AlquileresInmueble FOREIGN KEY (codigoInmueble) REFERENCES Inmuebles(codigoInmueble),
    CONSTRAINT FK_AlquileresGestor FOREIGN KEY (codigoGestor) REFERENCES Personas(codigoPersonal),
    CONSTRAINT FK_AlquileresArrendatario FOREIGN KEY (codigoArrendatario) REFERENCES Personas(codigoPersonal)
);

CREATE TABLE Pagos(
    codigoPago int,
    codigoAlquiler int,
    codigoInmueble int,
    mes VARCHAR(15),
    año INT,
    valor double,
    CONSTRAINT FK_PagosInmueble FOREIGN KEY (codigoAlquiler,codigoInmueble) REFERENCES Alquileres(codigoAlquiler,codigoInmueble)
);



INSERT INTO personas VALUES
(1,'4576543F','maria','navarro','93211234','654332211',true,false), #es gestora
(2,'3456754P','marta','periago','76331256','675332211',false,true),
(3,'4567654p','arnau','mas','97723421','655321234',true,true),
(4,'4567543H','juan','marin','95312341','676543456',false,true),
(5,'3454636T','jose','garcia','952341315','65478768',true,false);

INSERT INTO Inmuebles VALUES
(1,'255','Duplex','c/fuensanta 24'),
(2,'25','parking grande','c/fuenlibertina 13'),
(3,'80','local amplio','c/sagrat cor 56'),
(4,'120','piso con garaje','c/reus 133'),
(5,'15','garaje pequeño','c/reus 135'),
(6,'65','loft','c/antonia 32'),
(7,'80','piso con balcon','c/catania 53'),
(8,'120','local soleado','c/asturias 159'),
(9,'250','masia con terreno','c/afores, 25'),
(10,'32','garaje moto cotxe','c/ maladeta 47'),
(11,'150','terreno','c/ comellar del moro SN');

INSERT INTO Garajes VALUES
(2,'9A',2),
(5,'6B',0),
(10,'3B',-3);

INSERT INTO Pisos VALUES
(1,'D23',NULL),
(4,'P12',5),
(6,'L01',null),
(7,'P23',null),
(9,'M02',null);

INSERT INTO locales VALUES
(3,'peluqueria',true),
(8,'comercial',false);

INSERT INTO Compras VALUES 
	(1,'2019-09-18',85000,4),
    (2,'2019-09-18',10000,5), #ESTE GARAJE FUE COMPRADO JUNTO AL (INMUEBLE) PISO NUM 4
    (3,'2021-10-25',20000,3),
    (4,'2022-05-03',15000,2),
    (5,'2022-06-07',300000,1);
    
INSERT INTO Titulares VALUES
	(1,2),
    (2,2),    
    (4,3),
    (3,4),
    (5,4),
    (5,3); #LA MISMA COMPRA PUEDE TENER VARIOS TITULARES

INSERT INTO Alquileres VALUES
	(1,6,1,2),
    (2,9,1,3),
    (3,10,5,4),
    (4,11,5,2),
    (1,7,5,3),
    (2,8,1,4);

INSERT INTO Pagos VALUES
	(1,1,6,'febrero',2010,400),
    (2,2,9,'marzo',2012,350),
    (3,3,10,'octubre',2015,650),
    (4,4,11,'enero',2016,300),
    (5,1,7,'abril',2018,400),
    (6,2,8,'mayo',2022,500);
    
select * from alquileres;
select * from compras;
select * from garajes;
select * from inmuebles;
select * from locales;
select * from pagos;
select * from personas;
select * from pisos;
select * from titulares;
