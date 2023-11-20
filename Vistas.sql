
USE [base_consorcio];

-------------------------------------
-- CREAR VIEW conserje_view
-------------------------------------
CREATE VIEW conserje_view AS
(
	SELECT 
		apeynom, 
		tel,
		fechnac
	FROM  [dbo].[conserje]
)
GO
-------------------------------------
-- Ver los datos en la view
-------------------------------------
SELECT * FROM conserje_view


-------------------------------------
-- MODIFICAR VIEW conserje_view
-------------------------------------
ALTER VIEW [dbo].[conserje_view] AS
(
	SELECT 
		apeynom, 
		tel,
		fechnac,
		estciv --ESTE ES EL NUEVO CAMPO
	FROM  [dbo].[conserje]
)
GO
------------------------------------
-- Ver los cambios en la view
------------------------------------
SELECT * FROM conserje_view


-------------------------------------
-- ELIMINAR VIEW conserje_view
-------------------------------------
IF OBJECT_ID('[dbo].[conserje_view]', 'V') IS NOT NULL
DROP VIEW [dbo].[conserje_view]


-------------------------------------
-- ELIMINAR VIEW conserje_view
-------------------------------------
DROP VIEW IF EXISTS [dbo].[conserje_view]


-------------------------------------
-- ACTUALIZAR VIEW conserje_view
-------------------------------------
UPDATE [dbo].[conserje]
SET
	  apeynom = 'Camilo Sexto de Guadalajara'
WHERE idconserje = 1

------------------------------------
-- Ver los cambios en la view
------------------------------------
SELECT * FROM conserje_view