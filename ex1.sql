DROP DATABASE IF EXISTS u15_ex01;
CREATE DATABASE u15_ex01;
use u15_ex01;

CREATE TABLE Despachos
(
idNumero int primary key auto_increment,
Capacidad int
);

CREATE TABLE Directores
(
idDNI varchar (8),
NomApels varchar (255),
idDNIJefe varchar (8),
idDespacho int auto_increment,
primary key (idDNI, idDNIJefe, idDespacho),
constraint FK1 foreign key (idDespacho) references Despachos (idNumero),
constraint FK2 foreign key (idDNIJefe) references Directores (idDNI) on update cascade
);

INSERT INTO Despachos values
(default, 60),
(default, 40),
(default, 20),
(default, 23),
(default, 56),
(default, 80),
(default, 46),
(default, 88),
(default, 10),
(default, 33);

INSERT INTO Directores values
('1234587P', 'Jaime', '1234587P', 1 ),
('1543566I', 'Paco', '1234587P', 2 ),
('6667588G', 'Joan', '1234587P', 3 ),
('9744580L', 'Clara', '1234587P', 4 ),
('8327593S', 'Pepito', '1234587P', 5 ),
('5539579C', 'Mario', '1234587P', 6 ),
('0019263D', 'Sara', '1234587P', 7 ),
('9877765O', 'Marta', '1234587P', 8 ),
('0101013T', 'Ruben', '1234587P', 9 ),
('3322445A', 'Oscar', '1234587P', 10 );

SELECT * FROM Directores;
UPDATE Directores SET NomApels='Eufasio' WHERE NomApels='Pepito';
DELETE FROM Directores WHERE idDNI='6667588G';
