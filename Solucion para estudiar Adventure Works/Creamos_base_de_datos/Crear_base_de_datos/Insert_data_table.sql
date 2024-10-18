-- Insertar datos en la tabla no autonumerada. le hemos de indicar la posicion y el nombre

INSERT INTO ComunidadesAutonomas VALUES (6, 'L�rida');

INSERT INTO ComunidadesAutonomas VALUES (6, 'Catalu�a');

UPDATE ComunidadesAutonomas  --Este update sirve para modificar una linea erronea.
SET Nombre = 'Canarias'
Where ComunidadId = 5; -- si no se pone el WHERE, modificar� todas las lineas de la tabla.

UPDATE ComunidadesAutonomas 
SET Nombre = 'Castilla y Le�n'
Where ComunidadId = 7;

INSERT INTO ComunidadesAutonomas VALUES (10, 'Comunitat Valenciana');


select * from ComunidadesAutonomas;

UPDATE ComunidadesAutonomas 
SET Nombre = 'Cantabria'
Where ComunidadId = 6;
select * from ComunidadesAutonomas;

INSERT INTO ComunidadesAutonomas (ComunidadId, Nombre) VALUES 
(8, 'Castilla-La Mancha'),
(9, 'Catalu�a'),
(11, 'Extremadura'),
(12, 'Galicia'),
(13, 'Madrid, Comunidad de'),
(14, 'Murcia, Regi�n de'),
(15, 'Navarra, Comunidad Foral de'),
(16, 'Pa�s Vasco'),
(17, 'Rioja, La'),
(18, 'Ceuta'),
(19, 'Melilla');

select * from ComunidadesAutonomas;

-- insertamos en la tabla autonumerada y la autonumerada_pares. solo a�adimos el nombre, el id sale solo. 
INSERT INTO Comunidades_autonumeradas_pares VALUES 
('Andaluc�a'),
('Arag�n'),
('Catalu�a');

select * from Comunidades_autonumeradas_pares;

INSERT INTO Comunidades_autonumeradas VALUES 
('Andaluc�a'),
('Arag�n'),
('Catalu�a');

select * from Comunidades_autonumeradas;

--PARA BORRAR UNA LINEA O UN  BLOQUE DE LINEAS
DELETE FROM Comunidades_autonumeradas
where ComId BETWEEN 5 AND 11;
select * from Comunidades_autonumeradas;

--Importaci�n de datos
--ma�ana lo vemos
