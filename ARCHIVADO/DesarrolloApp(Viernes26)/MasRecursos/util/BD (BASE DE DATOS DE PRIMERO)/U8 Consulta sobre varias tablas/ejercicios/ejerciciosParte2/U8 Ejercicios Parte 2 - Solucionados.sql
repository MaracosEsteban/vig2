-- 13.	Mostrar el código de ticket, fecha y nombre del cliente sin que se pierda ningún ticket, aunque su cliente sea NULL.
SELECT ticket.codigo, ticket.fecha, cliente.nombre FROM ticket LEFT JOIN cliente ON ticket.cliente = cliente.codigo;
-- 14.	Mostrar el nombre y dirección de los clientes junto con el nombre de su municipio sin perder aquellos municipios que no tienen clientes.
SELECT cliente.nombre, cliente.direccion, municipio.nombre FROM cliente RIGHT JOIN municipio ON cliente.municipio = municipio.codigo;
-- 15.	Escribe una consulta que devuelva el código de ticket, número de línea, código y descripción del artículo para todas las líneas del ticket 108, aunque la línea no tenga artículo asociado.
SELECT lt.ticket, lt.nlinea, lt.articulo, a.descripcion
FROM linea_ticket lt 
LEFT JOIN articulo a ON lt.articulo = a.codigo
WHERE lt.ticket = 108;
-- 16.	Si has resuelto la sentencia anterior con RIGHT JOIN, resuélvela con LEFT JOIN. Si la has resuelto con LEFT JOIN, resuélvela con RIGHT JOIN.
SELECT lt.ticket, lt.nlinea, lt.articulo, a.descripcion
FROM articulo a
RIGHT JOIN linea_ticket lt ON lt.articulo = a.codigo
WHERE lt.ticket = 108;
-- 17.	Mostrar el nombre de cada municipio y el número de clientes residiendo en cada uno de ellos. Los municipios que no tienen ningún cliente no aparecerán.
SELECT m.nombre, COUNT(*)
FROM cliente AS c
INNER JOIN municipio AS m ON c.municipio = m.codigo
GROUP BY m.nombre;
-- 18.	Mostrar el nombre de cada municipio y el número de clientes residiendo en cada uno de ellos. Los municipios que no tienen ningún cliente también aparecerán.
SELECT m.nombre, COUNT(c.codigo)
FROM cliente AS c
RIGHT JOIN municipio AS m ON c.municipio = m.codigo
GROUP BY m.nombre;
-- 19.	Escribe una consulta que devuelva el código y fecha de cada ticket junto al nombre del vendedor que realizó la venta y el nombre del cliente destinatario del ticket. No se debe perder ningún ticket aunque no tenga código de vendedor o código de cliente.
SELECT t.codigo, t.fecha, v.nombre, c.nombre
FROM ticket t
LEFT JOIN cliente c ON t.cliente = c.codigo
LEFT JOIN vendedor v ON t.vendedor = v.codigo;
-- 20. Obtén el nombre de los clientes y el número de tickets en los que aparecen. También se mostrarán los clientes que no aparecen en ningún ticket.
SELECT cliente.nombre, COUNT(ticket.codigo) AS num_tickets
FROM ticket RIGHT JOIN cliente ON ticket.cliente = cliente.codigo
GROUP BY cliente.codigo;
-- 21.	Escribe una sentencia que muestre el código y nombre de cada vendedor y el total de sus ventas (suma del importe total de todos sus tickets ignorando posibles descuentos e impuestos).
SELECT v.codigo, v.nombre, SUM(lt.cant * lt.precio) AS total_ventas
FROM linea_ticket lt 
INNER JOIN ticket t ON t.codigo = lt.ticket
INNER JOIN vendedor v ON v.codigo = t.vendedor
GROUP BY v.codigo;
-- 22.	Escribe una sentencia que muestre el nombre de la provincia y la cantidad total de artículos vendidos a clientes que residen en dicha provincia.
SELECT pr.codigo, pr.nombre, sum( l.cant ) AS cantidad_articulos
FROM provincia pr
INNER JOIN municipio m ON m.provincia = pr.codigo
INNER JOIN cliente c ON c.municipio = m.codigo
INNER JOIN ticket t ON t.cliente = c.codigo
INNER JOIN linea_ticket l ON l.ticket = t.codigo
GROUP BY pr.codigo; 
-- 23.	Escribe una consulta que muestre el código y nombre de aquellos clientes de la provincia de Castellón (con código de provincia ‘CA’) que en total han gastado más de 100 euros (ignora descuentos e impuestos).
SELECT c.codigo, c.nombre
FROM cliente c 
INNER JOIN ticket t ON t.cliente = c.codigo
INNER JOIN linea_ticket l ON l.ticket = t.codigo
INNER JOIN municipio m ON m.codigo = c.municipio
WHERE m.provincia = 'CA'
GROUP BY c.codigo
HAVING SUM(l.cant * l.precio) > 100.00 ; 
-- 24.	Escribe una consulta que obtenga el nombre de cada vendedor y el de su jefe.
SELECT v.nombre AS vendedor, j.nombre AS jefe 
FROM vendedor v 
INNER JOIN vendedor j ON v.jefe = j.codigo;
-- 25.	Obtén el nombre de cada asignatura, así como el curso, edificio y aula donde se imparte.
SELECT a.nombre, a.curso, i.edificioaula, i.claseaula
FROM asignatura a INNER JOIN imparte i ON a.codigo = i.asignatura;
-- 26.	Obtén el nombre completo de cada profesor junto con el nombre y curso de cada una de las asignaturas asignatura que imparte.
SELECT p.nombre, p.apellido1, p.apellido2, a.nombre, a.curso
FROM profesor p 
INNER JOIN ensenya e ON p.dni = e.profesor
INNER JOIN asignatura a ON e.asignatura = a.codigo
GROUP BY p.dni, a.codigo;
-- 27.	Obtén el nombre y apellidos de los alumnos nacidos en 1999 junto con el nombre de cada una de las asignaturas que cursa y la nota obtenida.
SELECT al.nombre, al.apellido1, al.apellido2, a.nombre, m.nota
FROM alumno al 
INNER JOIN matricula m ON m.alumno = al.dni
INNER JOIN asignatura a ON a.codigo = m.asignatura
WHERE fechnac >= '1999-01-01' AND fechnac <= '1999-12-31';
-- 28.	Obtén el nombre de los profesores y el número de alumnos que tienen.
SELECT p.nombre, COUNT(*) AS num_alumnos
FROM profesor p 
INNER JOIN ensenya e ON e.profesor = p.dni
INNER JOIN matricula m ON e.asignatura = m.asignatura
GROUP BY p.dni;
-- 29.	Para cada asignatura, obtén el nombre, el curso y la nota media obtenida por los alumnos que la cursan.
SELECT a.nombre, a.curso, AVG(m.nota) AS media
FROM asignatura a
INNER JOIN matricula m ON m.asignatura = a.codigo
GROUP BY a.codigo;
-- 30.	Obtén el nombre completo de cada alumno y la cantidad de asignaturas en que está matriculado cada uno de ellos siempre y cuando esté matriculado en menos de 5 asignaturas.
SELECT a.nombre, a.apellido1, a.apellido2, COUNT(asignatura)
FROM alumno a
INNER JOIN matricula m ON m.alumno = a.dni
GROUP BY a.dni
HAVING COUNT(asignatura) < 5;