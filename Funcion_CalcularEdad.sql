-- =============================================
-- Author:		<Peloso Nicolas>
-- =============================================
USE base_consorcio
GO

/*Devuelve la edad del admin*/
CREATE FUNCTION calcularEdad(@ID INT)
RETURNS VARCHAR(200)
AS
BEGIN
	DECLARE @Edad VARCHAR(200)

	SELECT @Edad= DATEDIFF(YEAR,fechnac, GETDATE())
		FROM administrador
	WHERE idadmin= @ID
	RETURN @Edad
END;

--DROP FUNCTION calcularEdad

/*
Para probar

SELECT *, dbo.calcularEdad(idadmin) AS Edad FROM administrador;
*/

