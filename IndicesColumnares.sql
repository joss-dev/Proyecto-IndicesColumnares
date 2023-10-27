-- Variables para controlar el bucle de inserci�nnn
DECLARE @RowCount INT = 0;
DECLARE @TotalRows INT = 900000; -- N�mero total de registros a insertar

-- Habilitar IDENTITY_INSERT si es necesario
-- SET IDENTITY_INSERT GASTO ON;

-- Inicio del bucle de inserci�n
WHILE @RowCount < @TotalRows
BEGIN
    -- Generar datos aleatorios
    DECLARE @idprovincia INT;
    DECLARE @idlocalidad INT;
    DECLARE @idconsorcio INT;
    
    -- valores aleatorios para idprovincia, idlocalidad e idconsorcio de la tabla "consorcio"
    SELECT TOP 1 @idprovincia = idprovincia, @idlocalidad = idlocalidad, @idconsorcio = idconsorcio
    FROM consorcio
    ORDER BY NEWID();							--genera valores entre 1 y 24
    
								-- aleatorio entre 1 y 9
    DECLARE @periodo INT = FLOOR(RAND() * 9) + 1;; 
								-- Fecha en los �ltimos 365 d�as
    DECLARE @fechapago DATETIME = DATEADD(DAY, -CAST((RAND() * 365) AS INT), GETDATE()); 
								--genera valores entre 1 y 5
    DECLARE @idtipogasto INT = FLOOR(RAND() * 5) + 1;
								--genera valores entre 1 y 10
    
								-- Importe aleatorio
    DECLARE @importe DECIMAL(8, 2) = CAST(RAND() * 1000 AS DECIMAL(8, 2)); 

    -- Insertar el registro aleatorio en la tabla GASTO
    INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio,periodo, fechapago, idtipogasto, importe)
    VALUES (@idprovincia, @idlocalidad,@idconsorcio ,@periodo, @fechapago, @idtipogasto, @importe);

    -- Incrementar el contador
    SET @RowCount = @RowCount + 1;
END


--crea un indice agrupado
--CREATE NONCLUSTERED COLUMNSTORE INDEX NombreDelIndice
--ON NombreDeLaTabla;

CREATE COLUMNSTORE INDEX i_fechapago ON GASTONEW (fechapago);


--�ndice no agrupado
--CREATE NONCLUSTERED COLUMNSTORE INDEX NombreDelIndice
--ON NombreDeLaTabla;


SELECT *
FROM gastonew
WHERE fechapago = '2017-04-05 00:00:00.000' AND importe = 1980.69


SELECT *
FROM gasto
WHERE fechapago = '2017-04-05 00:00:00.000' AND importe = 1980.69

SELECT idconsorcio AS AliasColumna
FROM consorcio
ORDER BY AliasColumna ASC;
