DROP DATABASE IF EXISTS ex5_asignado_final;
CREATE DATABASE ex5_asignado_final;
USE ex5_asignado_final;

CREATE TABLE TipoPiezas(
    tipo varchar(5) PRIMARY KEY,
    descripcion varchar(100)
);

CREATE TABLE Piezas(
    modelo int,    
    tipo varchar(5),   
    descripcion varchar(100),
    precio double,
    PRIMARY KEY(modelo, tipo),
    CONSTRAINT FK_TipoPiezas FOREIGN KEY (tipo) REFERENCES TipoPiezas(tipo) ON UPDATE CASCADE 
);

CREATE TABLE Almacenes(
	idAlmacen int PRIMARY KEY,
	descripcion varchar(100),
	direccion varchar(100)
);

CREATE TABLE Estanterias(
    idEstanteria varchar(10),
    idAlmacen int,
    PRIMARY KEY(idAlmacen,idEstanteria),
    CONSTRAINT FK_EstanteriasAlmacenes FOREIGN KEY (idAlmacen) REFERENCES Almacenes(idAlmacen) ON UPDATE CASCADE 
);

CREATE TABLE Almacena(
    idAlmacen int, #pk compuesta de estanteria
    idEstanteria varchar(10), #pk compuesta de estanteria
    tipo varchar(5), #pk compuesta de pieza
    modelo int, #pk compuesta de pieza
    cantidad int,
    PRIMARY KEY(idAlmacen,idEstanteria,tipo,modelo),
    CONSTRAINT FK_AlmacenaEstanteria FOREIGN KEY (idAlmacen,idEstanteria) REFERENCES Estanterias(idAlmacen,idEstanteria) ON UPDATE CASCADE,
    CONSTRAINT FK_AlmacenaModelo FOREIGN KEY (modelo,tipo) REFERENCES Piezas(modelo,tipo) ON UPDATE CASCADE 
    );

CREATE TABLE Contiene(
    tipo varchar(5), # pk compuesta de tabla Piezas
    modelo int, # pk compuesta de tabla Piezas
    tipoCompuesto varchar(5),
    modeloCompuesto int,    
    CONSTRAINT FK_ContieneModelo FOREIGN KEY (modelo,tipo) REFERENCES Piezas(modelo,tipo) ON UPDATE CASCADE,    
    CONSTRAINT FK_ContieneModeloCompuesto FOREIGN KEY (modelo,tipo) REFERENCES Piezas(modelo,tipo) 
);

INSERT INTO TipoPiezas VALUES
	('TU', 'Tuerca'),
    ('VA', 'Válvula'),
    ('MU', 'Muelle'),
    ('TA', 'Tapón'),
    ('BI', 'Bisagra');
	
INSERT INTO Piezas VALUES
	(1, 'TU', '1/4 pulgada', 2.99),
    (2, 'TU', '1/2 pulgada', 4.99),
    (1, 'MU', '1/4 pulgada', 2.95),
    (2, 'MU', '1/2 pulgada', 3.95),
    (1, 'BI', 'Negro mate', 5.99);
	
INSERT INTO Almacenes VALUES
	(1, 'Nacional', 'C/ de Suecia, 3, 43120 Poligono Industrial Constantí, Tarragona'),
    (2, 'Comercial', 'C/ de Suecia, 3, 43120 Poligono Industrial Constantí, Tarragona'),
    (3, 'Expediciones', 'C/ de Suecia, 3, 43120 Poligono Industrial Constantí, Tarragona'),
    (4, 'Cliente 39933', 'C/ de Suecia, 3, 43120 Poligono Industrial Constantí, Tarragona'),
    (5, 'Cliente 48922', 'C/ de Suecia, 3, 43120 Poligono Industrial Constantí, Tarragona');
	
INSERT INTO Estanterias VALUES
	('AAA', 1),
    ('BBB', 1),
    ('CCC', 2),
    ('DDD', 2),
    ('EEE', 3);
	
INSERT INTO Almacena VALUES
	(1, 'AAA', 'TU', 1, 30),
    (1, 'AAA', 'TU', 2, 22),
    (2, 'CCC', 'BI', 1, 12),
    (2, 'DDD', 'BI', 1, 23),
    (3, 'EEE', 'BI', 1, 31);
	
INSERT INTO Contiene VALUES
	('BI', 1, 'TU', 1);
	

UPDATE TipoPiezas SET descripcion='Taponazo' WHERE tipo='TA';
UPDATE Almacenes SET DESCRIPCION='MECANICA' WHERE IDALMACEN=3;
UPDATE Almacenes SET idalmacen=6 WHERE idalmacen = 4;
UPDATE Almacenes SET idalmacen=7 WHERE idalmacen = 1;
UPDATE estanterias SET idalmacen=7 WHERE idestanteria like 'AAA';

DELETE FROM TipoPiezas WHERE descripcion='Taponazo';
DELETE FROM Almacena WHERE idAlmacen=1;
DELETE FROM Almacenes WHERE descripcion='Cliente 39933';


REPLACE INTO PIEZAS VALUES
	(1, 'VA', 'compuesta', 1.99);
REPLACE INTO Contiene VALUES
	('VA', 1, 'MU', 1);


SELECT * FROM TIPOPIEZAS;
SELECT * FROM PIEZAS;
SELECT * FROM almacenes;
SELECT * FROM estanterias;
SELECT * FROM almacena;
SELECT * FROM contiene;
