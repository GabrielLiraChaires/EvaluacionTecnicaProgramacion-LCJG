CREATE DATABASE InventarioGrupoCastores
GO
USE InventarioGrupoCastores
GO

--Para el manejo de roles del sistema.
CREATE TABLE Roles(
	id INT PRIMARY KEY NOT NULL IDENTITY(1,1), 
	descripcion VARCHAR(60) NOT NULL UNIQUE
)
CREATE TABLE Usuarios(
	idUsuario INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(100),
	correo VARCHAR(50),
	contrasena VARCHAR(25),
	fkIdRol INT,
	estatus VARCHAR(8) CHECK (estatus IN ('Activo','Inactivo')),
	CONSTRAINT fkIdRol FOREIGN KEY (fkIdRol) REFERENCES Roles(id),
)

--Para el manejo de inventarios.
CREATE TABLE Productos(
	id INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(100) NOT NULL,
	descripcion VARCHAR(200) NOT NULL,
	cantidad INT NOT NULL DEFAULT 0,
	estatus VARCHAR(8) CHECK (estatus IN ('Activo','Inactivo')),
	fechaRegistro DATETIME NOT NULL DEFAULT GETDATE()
)
CREATE TABLE Movimientos(
	idMovimiento INT PRIMARY KEY IDENTITY(1,1),
	fkIdProducto INT NOT NULL, 
	tipoMovimiento VARCHAR(9) CHECK (tipoMovimiento IN ('Entrada','Salida')) NOT NULL,
	cantidad INT NOT NULL,
	fkIdUsuario INT NOT NULL,
	fechaMovimiento DATETIME NOT NULL DEFAULT GETDATE(),
	CONSTRAINT fkIdUsuario_Usuarios FOREIGN KEY (fkIdUsuario) REFERENCES Usuarios(idUsuario),
	CONSTRAINT fkIdProducto_Productos FOREIGN KEY (fkIdProducto) REFERENCES Productos(id)
)