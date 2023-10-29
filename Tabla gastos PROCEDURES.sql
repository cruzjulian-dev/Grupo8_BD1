---Utilicé el modelos de datos y el lote de datos que estan en el aula por eso los ejemplos tienen esos datos
---Select * from gasto;

----Procedimiento insertar registro de la tabla gastos
CREATE PROCEDURE InsertarGasto(
    @idprovincia INT,
    @idlocalidad INT,
    @idconsorcio INT,
    @periodo INT,
    @fechapago DATETIME,
    @idtipogasto INT,
    @importe DECIMAL(8, 2)
)
AS
BEGIN
    INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (@idprovincia, @idlocalidad, @idconsorcio, @periodo, @fechapago, @idtipogasto, @importe);
END;
----FIN INSERTARGASTOS

----Procedimiento modificar registro de la tabla gastos
CREATE PROCEDURE ModificarGasto
(
    @idgasto INT,
    @idprovincia INT,
    @idlocalidad INT,
    @idconsorcio INT,
    @periodo INT,
    @fechapago DATETIME,
    @idtipogasto INT,
    @importe DECIMAL(8, 2)
)
AS
BEGIN
    UPDATE gasto
    SET
        idprovincia = @idprovincia,
        idlocalidad = @idlocalidad,
        idconsorcio = @idconsorcio,
        periodo = @periodo,
        fechapago = @fechapago,
        idtipogasto = @idtipogasto,
        importe = @importe
    WHERE idgasto = @idgasto;
END;

----FIN MODIFICARGASTOS


----Procedimiento borrar registro de la tabla gastos
CREATE PROCEDURE BorrarGasto
(
    @idgasto INT
)
AS
BEGIN
    DELETE FROM gasto
    WHERE idgasto = @idgasto;
END;

----FIN BORRARGASTOS


-- Inserción de datos en la tabla gasto utilizando sentencias INSERT
INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
VALUES
    (24, 17, 6, 8, convert(datetime,'20231029'), 4, 100.50),
    (24, 17, 6, 3, convert(datetime,'20231030'), 4, 150.75),
    (24, 17, 6, 4, convert(datetime,'20231101'), 5, 75.25);
---FIN de la insercion de datos utilizando sentencias INSERT	


-- Invocación de procedimientos almacenados para insertar datos
EXEC InsertarGasto 24, 17, 6, 8, '20231102', 4, 80.00;
EXEC InsertarGasto 24, 17, 6, 3, '20231103', 5, 60.25;

---FIN de la invocación de procedimientos almacenados para insertar datos

---Actualización de un registro utilizando el procedimiento almacenado
EXEC ModificarGasto @idgasto = 1, @idprovincia = 24, @idlocalidad = 17, @idconsorcio = 6, @periodo = 8, @fechapago = '20240115', @idtipogasto = 4, @importe = 120.00;

---FIN de la invocación de procedimientos almacenados para actualización de un registro

---Eliminación de un registro utilizando el procedimiento almacenado
EXEC BorrarGasto @idgasto = 2;

---FIN de la invocación de procedimientos almacenados para la eliminación de un registro
