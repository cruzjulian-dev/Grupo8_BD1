-- =============================================
-- Author:		<Cruz Julian>
-- Description:	<Agrega un nuevo Administrador a la BD>
-- =============================================

USE base_consorcio
GO

CREATE PROCEDURE InsertarAdministrador
(
    @apeynom varchar(50),
    @viveahi varchar(1),
    @tel varchar(20),
    @sexo varchar(1),
    @fechnac datetime
)
AS
BEGIN
    INSERT INTO administrador (apeynom, viveahi, tel, sexo, fechnac)
    VALUES (@apeynom, @viveahi, @tel, @sexo, @fechnac);
END


-----------------------------------------------------------------------------------------------------------

-- =============================================
-- Author:		<Cruz Julian>
-- Description:	<Modifica un Administrador existente en la BD>
-- =============================================

USE base_consorcio
GO

CREATE PROCEDURE ModificarAdministrador
(
    @idadmin int,
    @apeynom varchar(50),
    @viveahi varchar(1),
    @tel varchar(20),
    @sexo varchar(1),
    @fechnac datetime
)
AS
BEGIN
    UPDATE administrador
    SET apeynom = @apeynom,
        viveahi = @viveahi,
        tel = @tel,
        sexo = @sexo,
        fechnac = @fechnac
    WHERE idadmin = @idadmin;
END


---------------------------------------------------------------------------------------------

-- =============================================
-- Author:		<Cruz Julian>
-- Description:	<Elimina un Administrador de la BD>
-- =============================================

USE base_consorcio
GO

CREATE PROCEDURE BorrarAdministrador
(
    @idadmin int
)
AS
BEGIN
    DELETE FROM administrador
    WHERE idadmin = @idadmin;
END


---------------------------------------------------------------------------------------------------

-- Lote de Pruebas --

-- Vaciar la tabla Administrador:
DELETE FROM administrador;

-- Insertar datos utilizando el procedimiento almacenado correspondiente:
EXEC InsertarAdministrador 'Julian Cruz', 'S', '3795024422', 'M', '17-02-1997';

-- Modificar datos de un administrador utilizando el procedimiento almacenado correspondiente:
EXEC ModificarAdministrador 1, 'Julian Luis Cruz', 'N', '112443434', 'M', '17-02-1997';

-- Eliminacion de datos de un administrador utilizando el procedimiento almacenado correspondiente:
EXEC BorrarAdministrador 1;