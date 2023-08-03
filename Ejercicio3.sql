-- 1
SELECT * FROM almacenes;

-- 2
SELECT * FROM cajas
WHERE VALOR > 150;

-- 3
SELECT DISTINCT CONTENIDO FROM cajas;

-- 4
SELECT AVG(VALOR) AS ValorMedio FROM cajas;

-- 5
SELECT ALMACEN, AVG(VALOR) AS ValorMedio
FROM cajas
GROUP BY ALMACEN;

-- 6
SELECT ALMACEN
FROM cajas
GROUP BY ALMACEN
HAVING AVG(VALOR) > 150;

-- 7
SELECT cajas.NUMREFERENCIA, almacenes.LUGAR
FROM cajas
JOIN almacenes ON cajas.ALMACEN = almacenes.CODIGO;

-- 8
SELECT almacenes.LUGAR, COUNT(cajas.NUMREFERENCIA) AS NumeroDeCajas
FROM cajas
JOIN almacenes ON cajas.ALMACEN = almacenes.CODIGO
GROUP BY almacenes.LUGAR;

-- 9
SELECT almacenes.CODIGO
FROM almacenes
WHERE (
  SELECT COUNT(*)
  FROM cajas
  WHERE cajas.ALMACEN = almacenes.CODIGO
) > almacenes.CAPACIDAD;

-- 10
SELECT cajas.NUMREFERENCIA
FROM cajas
JOIN almacenes ON cajas.ALMACEN = almacenes.CODIGO
WHERE almacenes.LUGAR = 'Bilbao';

-- 11
INSERT INTO almacenes (CODIGO, LUGAR, CAPACIDAD)
VALUES (6, 'Barcelona', 3);

-- 12
INSERT INTO cajas (NUMREFERENCIA, CONTENIDO, VALOR, ALMACEN)
VALUES ('H5RT', 'papel', 200, 2);

-- 13
SET SQL_SAFE_UPDATES = 0;
UPDATE cajas 
SET VALOR = VALOR * 0.85;
SET SQL_SAFE_UPDATES = 1;

-- 14 
UPDATE cajas
SET VALOR = VALOR * 0.8
WHERE VALOR > (SELECT AVG(VALOR) FROM cajas);

-- 15
DELETE FROM cajas
WHERE VALOR < 100;

-- 16
DELETE c
FROM cajas c
JOIN (
    SELECT a.CODIGO
    FROM almacenes a
    JOIN (
        SELECT ALMACEN, COUNT(*) as total_cajas 
        FROM cajas 
        GROUP BY ALMACEN
    ) subq 
    ON a.CODIGO = subq.ALMACEN
    WHERE subq.total_cajas > a.CAPACIDAD
) sq 
ON c.ALMACEN = sq.CODIGO;
