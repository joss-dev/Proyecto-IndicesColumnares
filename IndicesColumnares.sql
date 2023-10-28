--crea un indice agrupado
--CREATE NONCLUSTERED COLUMNSTORE INDEX NombreDelIndice
--ON NombreDeLaTabla;

CREATE CLUSTERED COLUMNSTORE INDEX PK_gastonew ON GASTONEW
WITH (DROP_EXISTING = ON);

--índice no agrupado
--CREATE NONCLUSTERED COLUMNSTORE INDEX NombreDelIndice
--ON NombreDeLaTabla (nombreColumna);


EXECUTE sp_helpindex 'gastonew'


SELECT *
FROM gastonew
WHERE importe = 517.76

DBCC FREEPROCCACHE WITH NO_INFOMSGS

SELECT *
FROM gasto
WHERE importe = 517.76

SELECT idconsorcio AS AliasColumna
FROM consorcio
ORDER BY AliasColumna ASC;
