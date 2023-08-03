
-- 1
SELECT nombre FROM articulos;

-- 2
SELECT nombre, precio FROM articulos;

-- 3
SELECT nombre FROM articulos WHERE precio <=200;

-- 4
SELECT * FROM articulos WHERE precio >= 60 AND precio <= 120;
SELECT * FROM articulos WHERE precio BETWEEN 60 AND 120;

-- 5
SELECT nombre, precio * 186.386 AS precio_pesetas FROM articulos;

-- 6
SELECT AVG(precio) AS precio_medio from articulos;

-- 7
SELECT AVG(precio) AS precio_medio FROM articulos WHERE fabricante = 2;

-- 8
SELECT COUNT(*) AS numero_de_articulos FROM articulos WHERE precio >= 180;

-- 9
SELECT nombre,precio FROM articulos WHERE precio >= 180 
ORDER BY precio DESC, nombre ASC;

-- 10
SELECT articulos.*, fabricantes.* FROM articulos
JOIN fabricantes ON articulos.fabricante = fabricantes.codigo;

-- 11
SELECT articulos.nombre, articulos.precio, fabricantes.nombre FROM articulos
JOIN fabricantes ON articulos.codigo = fabricantes.codigo;

-- 12
SELECT codigo, AVG(precio) AS precio_medio
FROM articulos
GROUP BY codigo;

-- 13
SELECT f.NOMBRE AS 'Nombre fabricante', AVG(a.PRECIO) AS 'Precio medio'
FROM fabricantes f
JOIN articulos a ON f.CODIGO = a.FABRICANTE
GROUP BY f.NOMBRE;

-- 14
SELECT f.NOMBRE, AVG(a.PRECIO) AS 'Precio medio'
FROM fabricantes f
JOIN articulos a ON f.CODIGO = a.FABRICANTE
GROUP BY f.NOMBRE
HAVING AVG(a.PRECIO) >= 150;

-- 15
SELECT NOMBRE, PRECIO 
FROM articulos
ORDER BY PRECIO ASC
LIMIT 1;

-- 16
SELECT f.NOMBRE AS 'Nombre del Fabricante', a.NOMBRE AS 'Nombre del Articulo', a.PRECIO AS 'Precio'
FROM fabricantes f
JOIN articulos a ON f.CODIGO = a.FABRICANTE
WHERE (f.CODIGO, a.PRECIO) IN (
    SELECT FABRICANTE, MAX(PRECIO)
    FROM articulos
    GROUP BY FABRICANTE
);

-- 17
SELECT f.NOMBRE AS 'Nombre del Fabricante', a.NOMBRE AS 'Nombre del Articulo', a.PRECIO AS 'Precio'
FROM fabricantes f
JOIN articulos a ON f.CODIGO = a.FABRICANTE
WHERE (f.CODIGO, a.PRECIO) IN (
    SELECT FABRICANTE, MAX(PRECIO)
    FROM articulos
    GROUP BY FABRICANTE
);
INSERT INTO articulos (CODIGO, NOMBRE, PRECIO, FABRICANTE)
VALUES (11, 'Altavoces', 70, 2);

-- 18
UPDATE articulos
SET NOMBRE = 'Impresora Laser'
WHERE CODIGO = 8;

-- 19
SET SQL_SAFE_UPDATES = 0;
-- Ahora podemos ejecutar el siguiente script para aplicar el descuento.
UPDATE articulos
SET PRECIO = PRECIO * 0.9;
SET SQL_SAFE_UPDATES = 1;

-- 20
UPDATE articulos
SET PRECIO = PRECIO - 10
WHERE PRECIO >= 120;