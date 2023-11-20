-- 1° se verifica el modo de recuperacion de la base de datos
use base_consorcio

-- Verificar el modo de backup de la base de datos

SELECT name, recovery_model_desc
FROM sys.databases
WHERE name = 'base_consorcio';


-- 2° cambiamar el modo de recuperacion

USE master; -- Asegúrarse de estar en el contexto de la base de datos master
ALTER DATABASE base_consorcio -- Base de datos a la que se hará el backup
SET RECOVERY FULL; -- Modo de recuperacion

-- Posibles modos de backup: "SIMPLE", "BULK_LOGGED", "FULL"


-- 3 Realizacion del backup de la base de datos

BACKUP DATABASE base_consorcio
TO DISK = 'C:\backup\consorcioBackup.bak' --Ruta para guardar el archivo de Backup.bak'
WITH FORMAT, INIT;


-- Para Realizar la prueba

-- Se ingresaron 10 registros

select * from gasto;

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (1,5,GETDATE(),4,2100);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (2,3,GETDATE(),1,76312);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (3,8,GETDATE(),3,1000);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (4,4,GETDATE(),3,20431);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (5,11,GETDATE(),5,20128);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (6,10,GETDATE(),4,500);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (7,6,GETDATE(),1,47180);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (8,9,GETDATE(),2,2510);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (9,1,GETDATE(),5,20150);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (10,2,GETDATE(),3,33123);


-- 4 Realizacion del backup del log de la base de datos completa

BACKUP LOG base_consorcio
TO DISK = 'C:\backup\LogBackup.trn' --Ruta para el archivo LogBackup.trn
WITH FORMAT, INIT;


-- Se ingreasan 10 registros mas

select * from gasto

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (15,1,GETDATE(),1,12700);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (11,1,GETDATE(),1,5100);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (12,11,GETDATE(),3,3200);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (13,7,GETDATE(),2,72000);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (14,10,GETDATE(),5,5100);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (16,7,GETDATE(),4,2200);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (18,9,GETDATE(),3,13100);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (19,4,GETDATE(),2,57000);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (20,11,GETDATE(),5,2100);

insert into gasto (idconsorcio,periodo,fechapago,idtipogasto,importe) values (21,2,GETDATE(),1,100);


--5 Realizacion del backup del log en una ubicacion diferente

BACKUP LOG base_consorcio
TO DISK = 'C:\backup\logs\LogBackup2.trn'
WITH FORMAT, INIT;

--6 Restauracion del backup de la base de datos

use master

-- Para restaurar una base de datos desde un archivo de respaldo

RESTORE DATABASE base_consorcio
FROM DISK = 'C:\backup\consorcioBackup.bak'
WITH REPLACE, NORECOVERY;

-- Restaurar un archivo de registro de transacciones

RESTORE LOG base_consorcio
FROM DISK = 'C:\backup\LogBackup.trn'
WITH RECOVERY; --Indica que la base de datos se dejará en un estado de recuperación completa  y permitirá que la base de datos esté disponible para su uso normal. 

-- Segundo log

RESTORE LOG base_consorcio
FROM DISK = 'C:\backup\logs\LogBackup2.trn'
WITH RECOVERY; 

select * from gasto