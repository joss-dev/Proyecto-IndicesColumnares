--Integracion de optimizacion de consultas atravesz de indices en la tabla gastonew

-- Eliminar clave primaria de la tabla gastonew
alter table gastonew
drop Constraint PK_gastonew


-- Creacion de indices en la tabla gastonew

-- �ndice Clustered

CREATE CLUSTERED INDEX IX_ClusteredIndex ON gastonew(idgasto)				-- Crear indice clustered

--drop index IX_ClusteredIndex ON gasto										-- Eliminar indice


CREATE NONCLUSTERED INDEX IX_NonClusteredIndex ON gastonew(periodo)		-- Crear indice Non-Clustered

--drop index IX_NonClusteredIndex ON gasto								-- Eliminar indice

-- �ndice Unique

CREATE UNIQUE INDEX IX_UniqueIndex ON gastonew(idgasto)					-- Crear indice Unique

--drop index IX_UniqueIndex ON gasto									-- Eliminar indice


-- �ndice con columnas incluidas 
CREATE NONCLUSTERED INDEX IX_IndexColIncluidas ON gastonew(periodo)		-- Crear �ndice con columnas incluidas
INCLUDE (fechapago, idtipogasto);										

--drop index IX_IndexColIncluidas ON gasto								-- Eliminar indice

-- �ndice Filtrado
CREATE NONCLUSTERED INDEX IX_FilteredIndex ON gastonew(importe)			-- Crear �ndice Filtrado
WHERE importe > 50000;													

--drop index IX_FilteredIndex ON gasto									-- Eliminar indice
