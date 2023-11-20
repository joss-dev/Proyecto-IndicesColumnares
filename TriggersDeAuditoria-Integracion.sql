--En este script realizamos la creacion de una tabla llamada auditoria en donde se van monitorear y registrar
--operaciones que afecten al contenido de la tabla conserje, proporcionando as� un
--registro de actividad y posibilitando la detecci�n de acciones no autorizadas o
--inesperadas
--y la creacion de los triggers correspondientes a la tabla conserje, en sus 3 casos, insert, delete, update

USE [base_consorcio]

--La tabla en cuesti�n sirve para dos prop�sitos principales: proporcionar una vista r�pida de los datos alterados en las tablas que activaron el disparador (como el nombre de la tabla, los valores modificados, la columna afectada, etc.) y almacenar informaci�n importante relacionada con la acci�n realizada, como el usuario que realiz� la acci�n, el tipo de acci�n realizada y la fecha y hora en que ocurri�.
CREATE TABLE auditoria (
    id_auditoria int identity primary key,
    tabla_afectada varchar(100),  
	columna_afectada varchar(100), 
    accion varchar(10),           
    fecha_hora datetime,          
    usuario varchar(50),        
    valor_anterior varchar(max),  
    valor_actual varchar(max),     
);

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Trigger para INSERT en la tabla conserje
CREATE TRIGGER dbo.trconserjeInsert
   ON  dbo.conserje
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.auditoria(tabla_afectada, columna_afectada, valor_Anterior, valor_actual, usuario, fecha_hora, accion)
	SELECT 'dbo.conserje','idconserje', NULL, inserted.idconserje, SYSTEM_USER, CURRENT_TIMESTAMP, 'Insert' FROM inserted;

	INSERT INTO dbo.auditoria(tabla_afectada, columna_afectada, valor_Anterior, valor_actual, usuario, fecha_hora, accion)
	SELECT 'dbo.conserje','apeynom', NULL, inserted.apeynom, SYSTEM_USER, CURRENT_TIMESTAMP, 'Insert' FROM inserted;

	INSERT INTO dbo.auditoria(tabla_afectada, columna_afectada, valor_Anterior, valor_actual, usuario, fecha_hora, accion)
	SELECT 'dbo.conserje','tel', NULL, inserted.tel, SYSTEM_USER, CURRENT_TIMESTAMP, 'Insert' FROM inserted;

	INSERT INTO dbo.auditoria(tabla_afectada, columna_afectada, valor_Anterior, valor_actual, usuario, fecha_hora, accion)
	SELECT 'dbo.conserje','fechnac', NULL, inserted.fechnac, SYSTEM_USER, CURRENT_TIMESTAMP, 'Insert' FROM inserted;

	INSERT INTO dbo.auditoria(tabla_afectada, columna_afectada, valor_Anterior, valor_actual, usuario, fecha_hora, accion)
	SELECT 'dbo.conserje','estciv', NULL, inserted.estciv, SYSTEM_USER, CURRENT_TIMESTAMP, 'Insert' FROM inserted;
END
GO

-- Trigger para DELETE en la tabla conserje
CREATE TRIGGER dbo.trconserjeDelete
   ON  dbo.conserje
   AFTER DELETE
AS 
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.auditoria(tabla_afectada, columna_afectada, valor_Anterior, valor_actual, usuario, fecha_hora, accion)
    SELECT 'dbo.conserje','idconserje', deleted.idconserje, NULL, SYSTEM_USER, CURRENT_TIMESTAMP, 'Delete' FROM deleted;

    INSERT INTO dbo.auditoria(tabla_afectada, columna_afectada, valor_Anterior, valor_actual, usuario, fecha_hora, accion)
    SELECT 'dbo.conserje','apeynom', deleted.apeynom, NULL, SYSTEM_USER, CURRENT_TIMESTAMP, 'Delete' FROM deleted;

    INSERT INTO dbo.auditoria(tabla_afectada, columna_afectada, valor_Anterior, valor_actual, usuario, fecha_hora, accion)
    SELECT 'dbo.conserje','tel', deleted.tel, NULL, SYSTEM_USER, CURRENT_TIMESTAMP, 'Delete' FROM deleted;

    INSERT INTO dbo.auditoria(tabla_afectada, columna_afectada, valor_Anterior, valor_actual, usuario, fecha_hora, accion)
    SELECT 'dbo.conserje','fechnac', deleted.fechnac, NULL, SYSTEM_USER, CURRENT_TIMESTAMP, 'Delete' FROM deleted;

    INSERT INTO dbo.auditoria(tabla_afectada, columna_afectada, valor_Anterior, valor_actual, usuario, fecha_hora, accion)
    SELECT 'dbo.conserje','estciv', deleted.estciv, NULL, SYSTEM_USER, CURRENT_TIMESTAMP, 'Delete' FROM deleted;
END
GO


-- Trigger para UPDATE en la tabla conserje
CREATE TRIGGER dbo.trconserjeUpdate
   ON  dbo.conserje
   AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF UPDATE(idconserje)
    BEGIN
    INSERT INTO dbo.auditoria(tabla_afectada, columna_afectada, valor_Anterior, valor_actual, usuario, fecha_hora, accion)
    SELECT 'dbo.conserje','idconserje', deleted.idconserje, inserted.idconserje, SYSTEM_USER, CURRENT_TIMESTAMP, 'Update' FROM deleted INNER JOIN inserted ON deleted.idconserje = inserted.idconserje;
    END;

    IF UPDATE(apeynom)
    BEGIN
    INSERT INTO dbo.auditoria(tabla_afectada, columna_afectada, valor_Anterior, valor_actual, usuario, fecha_hora, accion)
    SELECT 'dbo.conserje','apeynom', deleted.apeynom, inserted.apeynom, SYSTEM_USER, CURRENT_TIMESTAMP, 'Update' FROM deleted INNER JOIN inserted ON deleted.idconserje = inserted.idconserje;
    END;

    IF UPDATE(tel)
    BEGIN
    INSERT INTO dbo.auditoria(tabla_afectada, columna_afectada, valor_Anterior, valor_actual, usuario, fecha_hora, accion)
    SELECT 'dbo.conserje','tel', deleted.tel, inserted.tel, SYSTEM_USER, CURRENT_TIMESTAMP, 'Update' FROM deleted INNER JOIN inserted ON deleted.idconserje = inserted.idconserje;
    END;

    IF UPDATE(fechnac)
    BEGIN
    INSERT INTO dbo.auditoria(tabla_afectada, columna_afectada, valor_Anterior, valor_actual, usuario, fecha_hora, accion)
    SELECT 'dbo.conserje','fechnac', deleted.fechnac, inserted.fechnac, SYSTEM_USER, CURRENT_TIMESTAMP, 'Update' FROM deleted INNER JOIN inserted ON deleted.idconserje = inserted.idconserje;
    END;

    IF UPDATE(estciv)
    BEGIN
    INSERT INTO dbo.auditoria(tabla_afectada, columna_afectada, valor_Anterior, valor_actual, usuario, fecha_hora, accion)
    SELECT 'dbo.conserje','estciv', deleted.estciv, inserted.estciv, SYSTEM_USER, CURRENT_TIMESTAMP, 'Update' FROM deleted INNER JOIN inserted ON deleted.idconserje = inserted.idconserje;
    END;
	
END
GO
