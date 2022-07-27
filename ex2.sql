DROP DATABASE IF EXISTS u15_ex2;
CREATE DATABASE IF NOT EXISTS u15_ex2;
use u15_ex2;

CREATE TABLE IF NOT EXISTS Piezas(
	codigo int PRIMARY KEY,
	nombre varchar(100)
);

INSERT INTO piezas VALUES
	(22,'palanca'),
	(23,'punta'),
	(24,'hoja metalica'),
    (25,'cola'),
    (26,'rueda'),
    (27,'mango'),
    (28,'solapa'),
    (29,'taza'),
    (30,'tuerca'),
    (31,'goma redonda');
    
REPLACE INTO piezas VALUES
	(28,'placa base');

CREATE TABLE IF NOT EXISTS Proveedores(
	id char(4) PRIMARY KEY,
	nombre varchar(100)
);

INSERT INTO proveedores VALUES
	('a1','mangos mil sa'),
	('b1','puntadas asociados'),
	('a2','bafalluy tornillos'),
    ('a3','menganito SA'),
    ('a4','hmnos lopez'),
    ('b2','vidal asociados'),
    ('b3','american spirit'),
    ('b4','bezoya'),
    ('b5','home and decor'),
    ('a5','viuda menganito SA');

CREATE TABLE IF NOT EXISTS Suministra(
	cod_pieza int,
	idProveedor char(4),
	precio int,
	PRIMARY KEY(cod_pieza,idProveedor),
	FOREIGN KEY(cod_pieza) REFERENCES Piezas(codigo) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(idProveedor) REFERENCES Proveedores(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO suministra VALUES
	(23,'a3',2),
	(30,'a2',29),
	(28,'b3',3),
    (22,'a3',43),
    (27,'a4',1),
    (25,'b2',7),
    (29,'b3',21),
    (31,'b4',21),
    (24,'b5',6),
    (26,'a5',5);
    
UPDATE PROVEEDORES SET nombre='puntas asociados' WHERE id like 'b1';
UPDATE PROVEEDORES SET id='b18' WHERE nombre like 'puntas asociados'; #se ha de desactivar safe update mode para poder modificar PK
UPDATE PROVEEDORES SET id='a5b' WHERE nombre like 'viuda menganito SA';

UPDATE suministra SET idProveedor='b18' WHERE cod_pieza = 23;

DELETE FROM piezas WHERE codigo = 29;

SELECT * FROM SUMINISTRA;
SELECT * FROM PIEZAS;
SELECT * FROM PROVEEDORES;
