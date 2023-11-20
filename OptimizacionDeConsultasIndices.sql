--Integracion de optimizacion de consultas atravesz de indices en la tabla gastonew

-- Eliminar clave primaria de la tabla gastonew
alter table gastonew
drop Constraint PK_gastonew


-- Creacion de indices en la tabla gastonew

-- Índice Clustered

CREATE CLUSTERED INDEX IX_ClusteredIndex ON gastonew(idgasto)				-- Crear indice clustered

--drop index IX_ClusteredIndex ON gasto										-- Eliminar indice


CREATE NONCLUSTERED INDEX IX_NonClusteredIndex ON gastonew(periodo)		-- Crear indice Non-Clustered

--drop index IX_NonClusteredIndex ON gasto								-- Eliminar indice

-- Índice Unique

CREATE UNIQUE INDEX IX_UniqueIndex ON gastonew(idgasto)					-- Crear indice Unique

--drop index IX_UniqueIndex ON gasto									-- Eliminar indice


-- Índice con columnas incluidas 
CREATE NONCLUSTERED INDEX IX_IndexColIncluidas ON gastonew(periodo)		-- Crear Índice con columnas incluidas
INCLUDE (fechapago, idtipogasto);										

--drop index IX_IndexColIncluidas ON gasto								-- Eliminar indice

-- Índice Filtrado
CREATE NONCLUSTERED INDEX IX_FilteredIndex ON gastonew(importe)			-- Crear Índice Filtrado
WHERE importe > 50000;													

--drop index IX_FilteredIndex ON gasto									-- Eliminar indice
