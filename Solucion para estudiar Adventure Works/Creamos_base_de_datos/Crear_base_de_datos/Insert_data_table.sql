-- Insertar datos en la tabla no autonumerada. le hemos de indicar la posicion y el nombre

INSERT INTO ComunidadesAutonomas VALUES (6, 'Lérida');

INSERT INTO ComunidadesAutonomas VALUES (6, 'Cataluña');

UPDATE ComunidadesAutonomas  --Este update sirve para modificar una linea erronea.
SET Nombre = 'Canarias'
Where ComunidadId = 5; -- si no se pone el WHERE, modificará todas las lineas de la tabla.

UPDATE ComunidadesAutonomas 
SET Nombre = 'Castilla y León'
Where ComunidadId = 7;

INSERT INTO ComunidadesAutonomas VALUES (10, 'Comunitat Valenciana');


select * from ComunidadesAutonomas;

UPDATE ComunidadesAutonomas 
SET Nombre = 'Cantabria'
Where ComunidadId = 6;
select * from ComunidadesAutonomas;

INSERT INTO ComunidadesAutonomas (ComunidadId, Nombre) VALUES 
(8, 'Castilla-La Mancha'),
(9, 'Cataluña'),
(11, 'Extremadura'),
(12, 'Galicia'),
(13, 'Madrid, Comunidad de'),
(14, 'Murcia, Región de'),
(15, 'Navarra, Comunidad Foral de'),
(16, 'País Vasco'),
(17, 'Rioja, La'),
(18, 'Ceuta'),
(19, 'Melilla');

select * from ComunidadesAutonomas;

-- insertamos en la tabla autonumerada y la autonumerada_pares. solo añadimos el nombre, el id sale solo. 
INSERT INTO Comunidades_autonumeradas_pares VALUES 
('Andalucía'),
('Aragón'),
('Cataluña');

select * from Comunidades_autonumeradas_pares;

INSERT INTO Comunidades_autonumeradas VALUES 
('Andalucía'),
('Aragón'),
('Cataluña');

select * from Comunidades_autonumeradas;

--PARA BORRAR UNA LINEA O UN  BLOQUE DE LINEAS
DELETE FROM Comunidades_autonumeradas
where ComId BETWEEN 5 AND 11;
select * from Comunidades_autonumeradas;

--Importación de datos
--mañana lo vemos
