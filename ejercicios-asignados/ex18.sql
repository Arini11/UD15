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
    precio double,
    codigoInmueble int,
	CONSTRAINT FK_CompraInmueble FOREIGN KEY (codigoInmueble) REFERENCES Inmuebles(codigoInmueble)
);
CREATE TABLE Titulares(
	id int PRIMARY KEY,
    codigoCompra int,
    codigoPersonal int,
    CONSTRAINT FK_TitularCompra FOREIGN KEY (codigoCompra) REFERENCES Compras(codigoCompra),
	CONSTRAINT FK_TitularPersona FOREIGN KEY (codigoPersonal) REFERENCES Personas(codigoPersonal)
);
CREATE TABLE Alquileres(
	codigoAlquiler int PRIMARY KEY,
    codigoInmueble int,
    codigoGestor int,
    codigoArrendatario int,
    CONSTRAINT FK_AlquileresInmueble FOREIGN KEY (codigoInmueble) REFERENCES Inmuebles(codigoInmueble),
    CONSTRAINT FK_AlquileresGestor FOREIGN KEY (codigoGestor) REFERENCES Personas(codigoPersonal),
    CONSTRAINT FK_AlquileresArrendatario FOREIGN KEY (codigoArrendatario) REFERENCES Personas(codigoPersonal)
);

CREATE TABLE Pagos(
    codigoPago int,
    codigoAlquiler int,
    mes date,
    año date,
    valor double,
    CONSTRAINT FK_PagosInmueble FOREIGN KEY (codigoAlquiler) REFERENCES Alquileres(codigoAlquiler)
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
(5,'15','garaje pequeño','c/reus 135');

INSERT INTO Garajes VALUES
(2,'9A',2),
(5,'6B',0);

INSERT INTO Pisos VALUES
(1,'D23',NULL),
(4,'P12',5);

INSERT INTO locales VALUES
(3,'peluqueria',true);

#faltan compras, alquileres, titulares y pagos
