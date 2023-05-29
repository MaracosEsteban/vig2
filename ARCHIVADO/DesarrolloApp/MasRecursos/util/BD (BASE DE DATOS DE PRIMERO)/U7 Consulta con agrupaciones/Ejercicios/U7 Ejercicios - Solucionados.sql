 -- 1.	Mostrar el precio más alto y bajo de todos los artículos.
SELECT MIN(precio), MAX(precio) FROM articulo;
-- 2.	Mostrar el precio medio de aquellos artículos cuyo stock es inferior a las 25 unidades.
SELECT AVG(precio) FROM articulo WHERE stock < 25;
-- 3.	Escribir una sentencia que obtenga el stock más alto de aquellos artículos cuyo precio es inferior a 1.5 euros.
SELECT MAX(stock) FROM articulo WHERE precio < 1.5;
-- 4.	Obtener el número de artículos almacenados en la base de datos.
SELECT COUNT(*) AS num_articulos FROM articulo;
-- 5.	Mostrar el precio medio de los artículos.
SELECT AVG(precio) AS precio_medio FROM articulo;
-- 6.	Mostrar la cantidad de municipios de cada provincia.
SELECT provincia, COUNT(*) AS num_municipios FROM municipio GROUP BY provincia;
-- 7.	Mostrar el último código de municipio de cada provincia.
SELECT provincia, MAX(codigo) FROM municipio GROUP BY provincia;
-- 8.	Obtener la cantidad de tickets que hay por cada tipo de IVA.
SELECT iva, COUNT(*) FROM ticket GROUP BY iva;
-- 9.	Obtener la media de descuentos aplicados a cada cliente.
SELECT cliente, AVG(dto) FROM ticket WHERE cliente IS NOT NULL GROUP BY cliente;
-- 10.	Obtén el código de aquellos clientes cuyo descuento medio aplicado en sus tickets es superior al 4%. Considera solo los tickets cuyo código es superior a 25.
SELECT cliente, AVG(dto) FROM ticket WHERE codigo > 25 GROUP BY cliente HAVING AVG(dto) > 4;
-- 11.	Obtén los tickets del año 2019.
SELECT * FROM ticket WHERE fecha >= '2019/01/01' AND fecha <= '2019/12/3';
-- 12.	Obtén el código de los clientes con más de 2 tickets.
SELECT cliente FROM ticket WHERE cliente IS NOT NULL GROUP BY cliente HAVING COUNT(*) > 2;
-- 13.	Obtén los tickets con código menor que 20.
SELECT * FROM ticket WHERE codigo < 20;
-- 14.	Obtén el id de aquellos clientes que tienen algún ticket con IVA del 21%.
SELECT DISTINCT cliente FROM ticket WHERE iva = 21 AND cliente IS NOT NULL;
-- 15.	Por cada artículo, obtén el descuento máximo aplicado en los tickets donde aparece. Considérense sólo los artículos cuyo código comienza por 'SEG'.
SELECT articulo, MAX(dto) FROM linea_ticket GROUP BY articulo HAVING articulo LIKE 'SEG%';
-- 16.	Obtén la cantidad media de artículos vendidos en los tickets con más de 2 líneas.
SELECT ticket, AVG(cant) AS cantidad_media FROM linea_ticket GROUP BY ticket HAVING COUNT(*) > 2;
-- 17.	Obtener la nota más baja y más alta en la asignatura con código 13.
SELECT MIN(nota), MAX(nota) FROM matricula WHERE asignatura = 13;
-- 18.	Calcular la nota media de cada asignatura.
SELECT asignatura, AVG(nota) FROM matricula GROUP BY asignatura;
-- 19.	Obtén el mayor código de asignatura correspondiente al 1º curso.
SELECT MAX(codigo) AS mayor_codigo FROM asignatura WHERE curso = 1;
-- 20.	Obtén el año medio de incorporación de todos los profesores excepto los que comenzaron en 2013.
SELECT AVG(anyoi) FROM profesor WHERE anyoi != 2013;
-- 21.	Obtén la cantidad de alumnos matriculados en la asignatura con código 3.
SELECT COUNT(*) AS num_alumnos FROM matricula GROUP BY asignatura HAVING asignatura = 3;
SELECT COUNT(*) AS num_alumnos FROM matricula WHERE asignatura = 3 GROUP BY asignatura;
-- 22.	Obtén la cantidad de profesores que se incorporaron en el año 2014.
SELECT COUNT(*) AS num_profesores FROM profesor WHERE anyoi = 2014;
-- 23.	Obtén la cantidad de notas diferentes obtenidas por los alumnos de la asignatura con código 1.
SELECT COUNT(DISTINCT nota) AS notas_diferentes FROM matricula WHERE asignatura = 1;
-- 24.	Obtén el DNI de cada alumno y la nota que ha obtenido en la asignatura con código 1
SELECT alumno, nota FROM matricula WHERE asignatura = 1;
-- 25.  Obtén la cantidad de alumnos matriculados por asignatura.
SELECT asignatura, COUNT(*) AS num_alumnos FROM matricula GROUP BY asignatura;
-- 26.	Muestra la nota más alta de cada asignatura.
SELECT asignatura, MAX(nota) AS nota_maxima FROM matricula GROUP BY asignatura;
-- 27.	Obtener la nota media de aquellas asignaturas que tengan matriculados más de 10 alumnos.
SELECT asignatura, AVG(nota) FROM matricula GROUP BY asignatura HAVING COUNT(*) > 10;
-- 28.	Contabiliza cuántos usuarios han dado cada una de las diferentes valoraciones de una cita (mal, regular, bien, muy bien). Ordena los resultados de forma que la valoración menos repetida se muestre primero. 
SELECT valoracion, COUNT(*) AS num_valoraciones FROM encuesta GROUP BY valoracion ORDER BY num_valoraciones ASC;
-- 29.	Muestra aquellos nombres de usuario que han dado “Me gusta” a más de 2 personas.
SELECT nom_usuario_1 FROM gusta GROUP BY nom_usuario_1 HAVING COUNT(*) > 2;
-- 30.	Muestra el número de usuarios que practican al menos una afición todas las semanas.
SELECT COUNT(DISTINCT nom_usuario) FROM practica WHERE frecuencia = "todas las semanas";
-- 31.  Muestra el número de mujeres que hay de cada religión.
SELECT religion, COUNT(*) AS num_mujeres FROM perfil WHERE sexo = 'F' GROUP BY religion;
-- 32.	Obtén el número de personas que tienen trabajo.
SELECT COUNT(trabajo) FROM perfil;
-- 33.	Obtén el nombre de aquellos trabajos con más de un trabajador.
SELECT trabajo, COUNT(*) AS num_trabajadores FROM perfil WHERE trabajo IS NOT NULL GROUP BY trabajo HAVING num_trabajadores > 1;