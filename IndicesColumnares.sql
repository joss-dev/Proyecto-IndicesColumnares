--En este scrip se presenta el uso de ..

go
--Utilizamos la base de datos proporcionada por la asignatura 
USE base_consorcio;

go

--Es importante mencionar que solo puede haber un índice agrupado por cada tabla, porque las filas de datos solo pueden estar almacenadas de una forma.
--Cuando se establece una restricción de clave primaria (PRIMARY KEY) en una tabla, se crea automáticamente un índice agrupado (clustered) si no se especifica uno.
--Entonces para nuestra investigación se utilizara un índice no agrupado
--crea un indice agrupado
--CREATE NONCLUSTERED COLUMNSTORE INDEX NombreDelIndice
--ON NombreDeLaTabla;

go
--El siguiente comando crea un indice no agrupado en la tabla gastonew, en las columnas especificadas
--CREATE NONCLUSTERED COLUMNSTORE INDEX NombreDelIndice
--ON NombreDeLaTabla (nombreColumna1, nombreColumna2,.....);
CREATE NONCLUSTERED COLUMNSTORE INDEX Indice_NoAgrupado
ON gastonew (idgasto, idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe);

--CONSULTAS SOBRE LAS TABLAS GASTO Y GASTONEW PARA HACER UN ANALISIS DEL RENDIMIENTO

--Las siguientes consultas sobre la tabla gasto y gastonew: 
--Selecciona la fecha de pago y la suma total de los importes para cada fecha única.
--Agrupa los resultados por fecha de pago.
--Ordena los resultados por fecha de pago.
go
SELECT fechapago, SUM(importe) as TotalVentas
FROM gasto
GROUP BY fechapago
ORDER BY fechapago;


SELECT fechapago, SUM(importe) as TotalVentas
FROM gastonew
GROUP BY fechapago
ORDER BY fechapago;


--Esta consulta suma los gastos (importe) de cada tipo de gasto (idtipogasto) en el período 3 (periodo = 3) de la tabla gasto. Cada tipo de gasto tendrá una suma total.
SELECT idtipogasto, SUM(importe) as TotalGastos
FROM gasto
WHERE periodo = 3
GROUP BY idtipogasto;

SELECT idtipogasto, SUM(importe) as TotalGastos
FROM gastonew
WHERE periodo = 3
GROUP BY idtipogasto;
