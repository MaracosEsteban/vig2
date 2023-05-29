-- En los dos primeros ejemplos se muestra el proceso deductivo que suelo seguir en clase hasta encontrar la solución de los ejercicios.
-- Conforme aumenta la complejidad de las consultas es difícil escribirlas del tirón, por lo que es preferible
-- ir escribiéndolas poco a poco, ejecutando la sentencia para ver qué resultados arroja. De esta forma partimos
-- de una versión básica y añadimos cláusulas según las necesitemos.

-- EJEMPLO 1: Obtén el nombre de los empleados y el número de reservas que han realizado.

-- En primer lugar tenemos que determinar las tablas donde se encuentran los datos que necesitamos.
-- Por un lado nos piden el nombre de empleados -> tabla empleado
-- Por otro lado nos piden el número de reservas que a hecho cada empleado -> tabla reservas
-- La primera versión de nuestra SELECT incluye las dos tablas en el FROM
SELECT * FROM empleado, reserva;
-- La sentencia anterior obtiene la combinación de todas las filas de empleado con todas las filas de reserva.
-- Para quitar las filas que no nos interesan necesitamos hacer uso de la cláusula WHERE (sintaxis SQL 92)
-- De forma que especificamos que la columna empleado de la tabla reserva debe ser igual que la columna id de la tabla empleado.
SELECT * FROM empleado, reserva WHERE reserva.empleado = empleado.id;
-- Una vez nos hemos quedado con las filas que nos interesan debemos pensar si necesitamos añadir alguna condición más al WHERE.
-- En este caso no es necesario, así que pasamos al siguiente paso: preguntarnos si necesitamos realizar una agrupación.
-- Puesto que necesitamos mostrar el número de reservas que ha realizado cada empleado, habrá que realizar una agrupación
-- por empleado. Una vez tenemos claro que es necesario realizar un GROUP BY hay que elegir la columna. En este caso
-- no sería buena idea agrupar por la columna nombre de la tabla empleado, ya que dos empleados diferentes pueden tener el mismo
-- nombre y en ese caso la agrupación sería incorrecta. Lo mejor en estos casos es agrupar por id del empleado (clave primaria)
-- GROUP BY empleado.id
-- Una vez realizada la agrupación añadiremos las columnas seleccionadas tras la cláusula SELECT para obtener la solución final:

-- Solución 1:
SELECT empleado.nombre, COUNT(*) FROM empleado, reserva
WHERE reserva.empleado = empleado.id
GROUP BY empleado.id;

-- Solución 2:
SELECT e.nombre, COUNT(r.id) AS num_reservas
FROM empleado AS e, reserva AS r
WHERE r.empleado = e.id
GROUP BY e.id;

-- Solución 3 haciendo uso de SQL 99:
SELECT empleado.nombre, COUNT(*) FROM empleado 
INNER JOIN reserva ON reserva.empleado = empleado.id
GROUP BY empleado.id;

-- EJEMPLO 2: Obtén el nombre de cada departamento y su salario medio.
-- Primero decidimos las tablas. Puesto que necesitamos el nombre del departamento, necesitaremos la tabla departamento.
-- Puesto que necesitamos calcular el salario medio, necesitaremos acceder a los salarios de los empleados que se encuentran en la tabla empleado.
-- En una primera versión de la consulta tendremos:
SELECT * FROM departamento, empleado;
-- Para eliminar filas innecesarias añadiremos la condición WHERE
-- Tenemos que igualar la clave ajena y la clave primaria que relacionan las dos tablas.
-- En este caso la columna departamento de la tabla empleado es la clave ajena que referencia a la clave primaria id de la tabla departamento.
SELECT * FROM departamento, empleado
WHERE empleado.departamento = departamento.id;
-- A continuación, nos preguntamos si necesitamos añadir alguna condición al WHERE, y si no es el caso, nos preguntamos si necesitamos añadir
-- una agrupación. En este caso, como se pide el salario medio POR CADA departamento, habrá que hacer una agrupación por departamento.
-- De nuevo, la mejor columna para realizar la agrupación en este caso es el id del departamento.alter
-- Así pues obtenemos la solución final:

-- Solución 1:

SELECT departamento.nombre, AVG(empleado.salario) FROM departamento, empleado
WHERE empleado.departamento = departamento.id
GROUP BY departamento.id;

-- Solución 2 haciendo uso de SQL 99:

SELECT departamento.nombre, AVG(empleado.salario) 
FROM departamento INNER JOIN empleado ON empleado.departamento = departamento.id
GROUP BY departamento.id;

-- EJEMPLO 3: Obtén el nombre de cada empleado y el del departamento donde trabaja.

-- Solución 1 haciendo uso de SQL 92:
SELECT empleado.nombre, departamento.nombre 
FROM empleado, departamento
WHERE empleado.departamento = departamento.id;

-- Solución 2 haciendo uso de SQL 99:
SELECT empleado.nombre, departamento.nombre 
FROM empleado INNER JOIN departamento ON empleado.departamento = departamento.id;

-- EJEMPLO 4: Obtén el número de teléfono de aquellos empleados con el nombre acabado en a y que tengan un despacho asignado

-- Solución 1 haciendo uso de SQL 92:
SELECT empleado.nombre, despacho.telefono FROM empleado, despacho
WHERE empleado.despacho = despacho.codigo AND nombre LIKE '%a';

-- Solución 2 haciendo uso de SQL 99:
SELECT empleado.nombre, despacho.telefono FROM empleado 
INNER JOIN despacho ON empleado.despacho = despacho.codigo
WHERE nombre LIKE '%a';