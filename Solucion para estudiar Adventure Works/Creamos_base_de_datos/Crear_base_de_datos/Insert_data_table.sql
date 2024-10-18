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

select * from ComunidadesAutonomas; --esto permite que al ejecutarlo junto al Insert into veamos al momento el resultado en la parte inferior. 

--para sustituir un dato ya insertado en una de las filas 

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

INSERT INTO Comunidades_autonumeradas_pares VALUES 
('Andalucía'),
('Aragón'),
('Cataluña'),
('Balears, Illes'),
('Canarias'),
('Cantabria'),
('Castilla León'),
('Castilla-La Mancha'),
('Cataluña'),
('Extremadura'),
('Galicia'),
('Madrid, Comunidad de'),
('Murcia, Región de'),
('Navarra, Comunidad Foral de'),
('País Vasco'),
('Rioja, La'),
('Ceuta'),
('Melilla');

select * from Comunidades_autonumeradas_pares;

--PARA BORRAR UNA LINEA O UN  BLOQUE DE LINEAS
DELETE FROM Comunidades_autonumeradas
where ComId BETWEEN 5 AND 11;
select * from Comunidades_autonumeradas;

--Importación de datos

-- Pulsamos botón derecho encima del nombre de la base de datos. En el menú pulsamos la opción TASKS. Se abrirá un auxiliar WIZARD
--Seleccionamos el tipo de archivo donde tenemos los datos. en el campus el profe subió un fichero excel con los datos y dos ficheros planos (CSV) por si no teníamos excel. 
--Siguiendo el auxiliar de importación WIZARD, una vez seleccionado el tipo de fichero, seleccionamos el fichero en si. podremos visualizar el contenido del mismo
-- a través de la barra lateral.
-- Seleccionamos el destino. Comprobamos que está en la base de datos correcto.
-- se pueden meter los datos en una table que tengamos creada y vacía o bien crear la tabla desde el propio WIZARD. Con la opción mapping permite ajustar los parametros de la tabla. 
