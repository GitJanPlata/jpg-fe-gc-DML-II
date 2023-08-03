-- 1
SELECT APELLIDOS
FROM empleados;

-- 2
SELECT DISTINCT APELLIDOS
FROM empleados;

-- 3
SELECT *
FROM empleados
WHERE APELLIDOS = 'Smith';

-- 4
SELECT *
FROM empleados
WHERE APELLIDOS = 'Smith' OR APELLIDOS = 'Rogers';

-- 5
SELECT *
FROM empleados
WHERE DEPARTAMENTO = 14;

-- 6
SELECT *
FROM empleados
WHERE DEPARTAMENTO = 37 OR DEPARTAMENTO = 77;

-- 7
SELECT *
FROM empleados
WHERE APELLIDOS LIKE 'P%';

-- 8
SELECT SUM(PRESUPUESTO) AS PresupuestoTotal
FROM departamentos;

-- 9
SELECT d.NOMBRE, COUNT(*) as NumeroDeEmpleados
FROM empleados e
INNER JOIN departamentos d ON e.DEPARTAMENTO = d.CODIGO
GROUP BY d.NOMBRE;

-- 10
SELECT e.*, d.*
FROM empleados e
INNER JOIN departamentos d ON e.DEPARTAMENTO = d.CODIGO;

-- 11
SELECT e.NOMBRE, e.APELLIDOS, d.NOMBRE as NombreDepartamento, d.PRESUPUESTO
FROM empleados e
INNER JOIN departamentos d ON e.DEPARTAMENTO = d.CODIGO;

-- 12
SELECT e.NOMBRE, e.APELLIDOS
FROM empleados e
INNER JOIN departamentos d ON e.DEPARTAMENTO = d.CODIGO
WHERE d.PRESUPUESTO > 60000;

-- 13
SELECT *
FROM departamentos
WHERE PRESUPUESTO > (SELECT AVG(PRESUPUESTO) FROM departamentos);


-- 14
SELECT d.NOMBRE
FROM empleados e
INNER JOIN departamentos d ON e.DEPARTAMENTO = d.CODIGO
GROUP BY d.NOMBRE
HAVING COUNT(e.DNI) > 2;


-- 15
INSERT INTO departamentos (CODIGO, NOMBRE, PRESUPUESTO)
VALUES (11, 'calidad', 40000);

INSERT INTO empleados (DNI, NOMBRE, APELLIDOS, DEPARTAMENTO)
VALUES (892671109, 'Esther', 'Vazquez', 11);

-- 16
UPDATE departamentos
SET PRESUPUESTO = PRESUPUESTO * 0.9;

-- 17
UPDATE empleados
SET DEPARTAMENTO = 14
WHERE DEPARTAMENTO = 77;


-- 18
DELETE FROM empleados
WHERE DEPARTAMENTO = 14;

-- 19
DELETE FROM empleados
WHERE DEPARTAMENTO IN (
    SELECT CODIGO
    FROM departamentos
    WHERE PRESUPUESTO > 60000
);

-- 20
SET SQL_SAFE_UPDATES = 0;
DELETE FROM empleados;
SET SQL_SAFE_UPDATES = 1;


