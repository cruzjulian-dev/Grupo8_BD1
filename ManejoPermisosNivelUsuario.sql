USE base_consorcio;

/*
Creamos usuarios de prubea
*/

CREATE LOGIN UsuarioAdministrador WITH PASSWORD = 'Admin123';
CREATE LOGIN UsuarioComun WITH PASSWORD = 'ContraUsuario';


CREATE USER UsuarioAdministrador FOR LOGIN UsuarioAdministrador;
CREATE USER UsuarioComun FOR LOGIN UsuarioComun;


/*

Creamos dos roles
*/

CREATE ROLE Administradores;
CREATE ROLE Comunes;


/*
Le damos permisos  a los roles
*/

GRANT SELECT TO Administradores;


GRANT CREATE TABLE TO Comunes;
GRANT ALTER ON SCHEMA::dbo TO Comunes;

/*
Le asignamos a cada role los usuarios
*/

ALTER ROLE Administradores ADD MEMBER UsuarioAdministrador;
ALTER ROLE Comunes ADD MEMBER UsuarioComun;


--Pruebas

--NOTA: Es mejor probar en querys diferentes para evitar algun problema

/*
Testeo el funciomiento del rol de administrador
*/

EXECUTE AS USER = 'UsuarioAdministrador';
SELECT * FROM conserje;

/*
Ejemplo de lo que no puede hacer
CREATE TABLE tablaEjemplo1 (ID INT, Nombre VARCHAR(50));
*/

REVERT;


/*
Testeo el funcionamiento del rol de comun
*/
EXECUTE AS USER = 'UsuarioComun';
CREATE TABLE tablaEjemplo (ID INT, Nombre VARCHAR(50));
ALTER TABLE tablaEjemplo ADD Descripcion VARCHAR(100);
/*
Ejemplo de lo que no puede hacer
SELECT * FROM conserje;
*/
