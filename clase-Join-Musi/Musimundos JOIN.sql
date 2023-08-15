/*
Consultas
SELECT, GROUP BY y JOIN

*/

#Listar las canciones cuya duración sea mayor a 2 minutos.
SELECT * FROM canciones WHERE milisegundos > 120000;

#Listar las canciones cuyo nombre comience con una vocal. 
SELECT nombre FROM canciones WHERE nombre LIKE "a%" or nombre LIKE "e%" or nombre LIKE "i%" or nombre LIKE"o%" or nombre LIKE "u%";

#Listar las canciones ordenadas por compositor en forma descendente.  


SELECT compositor FROM canciones order by compositor desc;
#Luego, por nombre en forma ascendente. Incluir únicamente aquellas canciones que tengan compositor.
SELECT nombre, compositor FROM canciones where compositor != "" order by nombre;

#Canciones
#Listar la cantidad de canciones de cada compositor. 
select compositor, COUNT(compositor) AS cantidad from canciones group by compositor; 
#Modificar la consulta para incluir únicamente los compositores que tengan más de 10 canciones. 
select compositor, COUNT(compositor) AS cantidad from canciones  group by compositor having  cantidad > 10; 

#5. Facturas
#Listar el total facturado agrupado por ciudad.
SELECT ciudad_de_facturacion, SUM(total) FROM facturas group by ciudad_de_facturacion;

#Modificar el listado del punto (a) mostrando únicamente las ciudades de Canadá.
SELECT ciudad_de_facturacion, SUM(total) FROM facturas where pais_de_facturacion like "Canadá" group by ciudad_de_facturacion;

#Modificar el listado del punto (a) mostrando únicamente las ciudades con una facturación mayor a 38.
SELECT ciudad_de_facturacion, SUM(total) as total FROM facturas group by ciudad_de_facturacion having total > 38;

#Modificar el listado del punto (a) agrupando la facturación por país, y luego por ciudad.
SELECT pais_de_facturacion, SUM(total) FROM facturas group by pais_de_facturacion;

#Canciones / Géneros
#Listar la duración mínima, máxima y promedio de las canciones.
SELECT MIN(milisegundos) as duracionMinima , max(milisegundos) as durMaxi, AVG(milisegundos) as promedio FROM canciones;

#Modificar el punto (a) mostrando la información agrupada por género.
select g.nombre, MIN(milisegundos) as duracionMinima , max(milisegundos) as durMaxi, ROUND(AVG(milisegundos), 2) as promedio from canciones 
join generos as g ON id_genero = g.id 
group by g.id ;








