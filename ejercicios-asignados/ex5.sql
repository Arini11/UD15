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