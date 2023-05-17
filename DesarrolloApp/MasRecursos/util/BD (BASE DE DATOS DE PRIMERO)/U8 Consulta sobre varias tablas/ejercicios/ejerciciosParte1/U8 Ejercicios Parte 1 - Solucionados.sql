-- 1.	Realiza el producto cartesiano entre la tabla municipio y provincia.
SELECT * FROM municipio, provincia;
-- 2.	Añade a la sentencia del ejercicio anterior la condición WHERE necesaria para que sólo se muestren las filas con los municipios y sus provincias correspondientes. 
SELECT * FROM municipio, provincia WHERE municipio.provincia = provincia.codigo;
-- 3.	Modifica la sentencia anterior para obtener únicamente el nombre del municipio y el de la provincia a la que pertenece.
SELECT municipio.nombre AS municipio, provincia.nombre AS provincia
FROM municipio, provincia
WHERE municipio.provincia = provincia.codigo;
-- 4.	Modifica la sentencia anterior para obtener únicamente las filas de aquellos municipios que empiezan por B.
SELECT municipio.nombre AS municipio, provincia.nombre AS provincia
FROM municipio, provincia
WHERE municipio.provincia = provincia.codigo AND municipio.nombre LIKE 'B%';
-- 5.	Realiza el producto cartesiano entre la tabla cliente y municipio.
SELECT * FROM cliente, municipio;
-- 6.	Añade a la sentencia del ejercicio anterior la condición WHERE necesaria para que sólo se muestren las filas con los clientes y el municipio al que pertenecen.
SELECT * FROM cliente, municipio
WHERE cliente.municipio = municipio.codigo;
-- 7.	Modifica la sentencia anterior para obtener el número de clientes de cada municipio.
SELECT municipio.nombre, COUNT(*) FROM cliente, municipio
WHERE cliente.municipio = municipio.codigo
GROUP BY municipio.nombre;
-- 8.	Escribe una sentencia que muestre el código de ticket, la fecha y el nombre del cliente. Utiliza la sintaxis SQL 92 y SQL 99.
SELECT t.codigo, t.fecha, c.nombre FROM ticket t, cliente c
WHERE t.cliente = c.codigo;
SELECT t.codigo, t.fecha, c.nombre 
FROM ticket t JOIN cliente c ON t.cliente = c.codigo;
-- 9.	Escribe una sentencia que muestre el código de ticket, el número de línea, la descripción del artículo y la cantidad de unidades vendidas en dicha línea para todas las líneas del ticket con código 7. Utiliza la sintaxis SQL 92 y SQL 99.
SELECT lt.ticket, lt.nlinea, a.descripcion, lt.cant FROM linea_ticket lt, articulo a
WHERE lt.articulo = a.codigo AND lt.ticket = 7;
SELECT lt.ticket, lt.nlinea, a.descripcion, lt.cant
FROM linea_ticket lt JOIN articulo a ON lt.articulo = a.codigo
WHERE lt.ticket = 7;
-- 10.	Escribe una sentencia que muestre el código y fecha de cada ticket junto al nombre del cliente y el nombre del vendedor. Utiliza la sintaxis SQL 92 y SQL 99.
SELECT t.codigo, t.fecha, c.nombre AS cliente, v.nombre AS vendedor FROM ticket t, cliente c, vendedor v
WHERE t.cliente = c.codigo AND t.vendedor = v.codigo;
SELECT t.codigo, t.fecha, c.nombre AS cliente, v.nombre AS vendedor
FROM ticket t JOIN cliente c ON t.cliente = c.codigo
			  JOIN vendedor v ON t.vendedor = v.codigo;
-- 11.	Escribe una sentencia que muestre el código y nombre de cada vendedor junto al número total de tickets en los que aparece. Utiliza la sintaxis SQL 92 y SQL 99.
SELECT v.codigo, v.nombre, COUNT(*) AS num_tickets  FROM vendedor v, ticket t
WHERE t.vendedor = v.codigo
GROUP BY v.codigo;
-- 12.	Escribe una sentencia que muestre el código y fecha de cada ticket, junto al nombre y dirección completa (calle, código postal, municipio y provincia) del cliente.
SELECT t.codigo, t.fecha, c.nombre, c.direccion, c.cp, m.nombre AS municipio, p.nombre AS provincia
FROM ticket t, cliente c, municipio m, provincia p
WHERE t.cliente = c.codigo AND c.municipio = m.codigo AND m.provincia = p.codigo;