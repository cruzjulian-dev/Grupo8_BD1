-- =============================================
-- Author:		<Peloso Nicolas>
-- Description:	<Agrega un nuevo registro de consorcio en la BD>
-- =============================================

USE base_consorcio
GO

CREATE PROCEDURE agregarConsorcio
@Provincia INT,
@Localidad INT,
@Consorcio INT, 
@Nombre VARCHAR(50),
@Direccion VARCHAR(255),
@Zona INT,
@Conserje INT,
@Admin INT

      AS
BEGIN
		INSERT INTO consorcio(idprovincia,idlocalidad,idconsorcio,nombre,direccion, idzona,idconserje,idadmin) 
			VALUES (@Provincia,@Localidad,@Consorcio,@Nombre,@Direccion, @Zona, @Conserje, @Admin)
					
END  

--DROP PROCEDURE agregarConsorcio
--Para probar
/*EXECUTE agregarConsorcio @Provincia=5, @Localidad=6, @Consorcio= 50, @Nombre='Nicolás', @Direccion='General Viamonte 1658', @Zona=3,@Conserje='2',@Admin=1
SELECT * FROM consorcio WHERE idConsorcio=50 */

-----------------------------------------------------------------------------------------------------------

-- =============================================
-- Author:		<Peloso Nicolas>
-- Description:	<Modifica un registro existente de consorcio en la BD>
-- =============================================

USE base_consorcio
GO

CREATE PROCEDURE modificarConsorcio
@Provincia INT,
@Localidad INT,
@Consorcio INT, 
@Nombre VARCHAR(50),
@Direccion VARCHAR(255),
@Zona INT,
@Conserje INT,
@Admin INT

      AS
BEGIN

	IF @Consorcio IS NOT NULL
		UPDATE consorcio SET idprovincia= @Provincia, idlocalidad= @Localidad,nombre= @Nombre,direccion= @Direccion,idzona= @Zona, 
		idconserje= @Conserje,idadmin= @Admin
		WHERE idconsorcio= @Consorcio
END

--DROP PROCEDURE modificarConsorcio
--Para probar
/*EXECUTE modificarConsorcio @Provincia=6, @Localidad=5, @Consorcio= 50, @Nombre='Anibal', @Direccion='Juan Jose Castelli 1217', @Zona=4, @Conserje='1', @Admin=2
SELECT * FROM consorcio WHERE idConsorcio=50 
DELETE FROM consorcio WHERE idconsorcio=50*/

---------------------------------------------------------------------------------------------

-- =============================================
-- Author:		<Peloso Nicolas>
-- Description:	<Elimina un registro de consorcio en la BD>
-- =============================================

USE base_consorcio
GO

CREATE PROCEDURE eliminarConsorcio
@Consorcio INT

AS
BEGIN

	DELETE FROM consorcio WHERE idconsorcio=@Consorcio
END

--DROP PROCEDURE eliminarConsorcio
--Para probar
/*EXECUTE eliminarConsorcio @Consorcio=50
SELECT * FROM consorcio WHERE idconsorcio=50 */