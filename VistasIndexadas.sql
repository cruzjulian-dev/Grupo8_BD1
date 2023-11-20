USE base_consorcio

-------------------------------------
-- CREAR VISTA INDEXADA ConsorcioDetalles_view
-------------------------------------
CREATE VIEW ConsorcioDetalles_view AS
(
	SELECT 
		AdministradorApeyNom = ADM.apeynom, 
		ConsorcioNombre		 = CON.nombre,
		Periodo				 = G.periodo,
		FechaPago			 = G.fechapago
	FROM  [dbo].[consorcio] CON
	INNER JOIN [dbo].[administrador] ADM
		ON CON.idadmin = ADM.idadmin
	INNER JOIN [dbo].[gasto] G
		ON CON.idconsorcio = G.idconsorcio
	INNER JOIN [dbo].[tipogasto] TG
		ON G.idtipogasto = TG.idtipogasto
)
GO
-------------------------------------
-- Ver los datos en la view
-------------------------------------
SELECT * FROM [dbo].[ConsorcioDetalles_view]


-------------------------------------
-- MODIFICAR VISTA INDEXADA ConsorcioDetalles_view
-------------------------------------
ALTER VIEW [dbo].[ConsorcioDetalles_view] 
WITH SCHEMABINDING
AS
(

	SELECT 
		IdGasto			= g.idgasto,
		Administrador	= adm.apeynom, 
	    ConsorcioNombre = c.nombre,
		Periodo			= g.periodo,
		fechapago		= g.fechapago,
		TipoGasto	    = tg.descripcion
	FROM [dbo].[gasto] g 
	INNER JOIN [dbo].[tipogasto] tg
		ON g.idtipogasto = tg.idtipogasto
	INNER JOIN  [dbo].[consorcio] c
		ON g.idconsorcio = c.idconsorcio
		AND g.idprovincia = c.idprovincia
		AND g.idlocalidad = c.idlocalidad
	INNER JOIN [dbo].[administrador] adm
		ON c.idadmin = adm.idadmin
)
GO

SELECT * FROM [dbo].[ConsorcioDetalles_view]

--Probar con permisos de usuarios

--Usuario administrador
--Ejecutar solo para la creacion a nivel de servidor.
USE master;
CREATE LOGIN UserAdmin WITH PASSWORD = 'admin';
--Usuario de Solo Lectura
CREATE LOGIN NormalUser WITH PASSWORD = 'user123';

-- Se asigna el permiso de Admin para UserAdmin
USE [base_consorcio];
CREATE USER UserAdmin FOR LOGIN UserAdmin;
ALTER ROLE db_owner ADD MEMBER UserAdmin

-- Con la palabra 'GRANT' asignamos el permiso SELECT sobre la view [conserje_view]
CREATE USER NormalUser FOR LOGIN NormalUser;
GRANT SELECT ON [dbo].[conserje_view] TO NormalUser;

--Consulta SELECT con el usuario administrador
EXECUTE AS LOGIN = 'UserAdmin'
SELECT * FROM [dbo].[conserje_view]
REVERT --REVERT en SQL Server se utiliza para volver al contexto original

--Consulta SELECT con el usuario observador
EXECUTE AS LOGIN = 'NormalUser'
SELECT * FROM [dbo].[conserje_view]
REVERT

--Al intentar realizar un UPDATE con el 'UsuarioObservador' es rechazado.
USE [base_consorcio];
EXECUTE AS LOGIN = 'NormalUser';
UPDATE [dbo].[conserje_view]
   SET [estciv] = 'C'
 WHERE apeynom LIKE 'ESPINOZA JULIO'
GO
SELECT * FROM [dbo].[conserje_view] 
REVERT;