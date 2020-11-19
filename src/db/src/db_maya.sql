CREATE DATABASE CalendarioMaya;
USE CalendarioMaya;

CREATE TABLE Categoria (
	idCategoria INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,

	CONSTRAINT PK_CODIGO_CATEGORIA PRIMARY KEY(idCategoria)
);

CREATE TABLE HechoHistorico (
	idHechoHistorico INT NOT NULL AUTO_INCREMENT,
	fechaInicio DATE NOT NULL,
	fechaFinal DATE NOT NULL,
	titulo VARCHAR(150),
    descripcion VARCHAR(5000),

	CONSTRAINT PK_CODIGO_TEMA PRIMARY KEY(idHechoHistorico)
);

CREATE TABLE Rol (
	idRol INT NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    
    CONSTRAINT PK_ID_ROL PRIMARY KEY(idRol)
);

CREATE TABLE Usuario (
	username VARCHAR(40) NOT NULL,
	password VARCHAR (100) NOT NULL,
	email VARCHAR (100) NOT NULL,
	nombre VARCHAR (50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	nacimiento DATE,
	telefono VARCHAR(15),
	rol INT NOT NULL,

	CONSTRAINT PK_USUARIO PRIMARY KEY(username),
	CONSTRAINT FK_ROL_ROLES FOREIGN KEY(rol) REFERENCES Rol(idRol)
); 

CREATE TABLE Edicion (
	idEdicion INT NOT NULL AUTO_INCREMENT,
	username VARCHAR (35) NOT NULL,
	idHechoHistorico INT NOT NULL,
	fecha DATE NOT NULL,
    creacion BOOLEAN NOT NULL,

	CONSTRAINT PK_ID_REGISTRO PRIMARY KEY(idEdicion),
	CONSTRAINT FK_ID_TEMA FOREIGN KEY(idHechoHistorico) REFERENCES HechoHistorico(idHechoHistorico),
	CONSTRAINT FK_ID_USER_R FOREIGN KEY(username) REFERENCES Usuario(username)
);

CREATE TABLE Nahual (
	idNahual INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR (35) NOT NULL,
	fechaInicio DATE NOT NULL,
	significado VARCHAR(25),
    descripcion VARCHAR(5000),

	CONSTRAINT PK_ID_R1 PRIMARY KEY(idNahual)
);

CREATE TABLE Rueda1 (
	idRueda INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR (35) NOT NULL,
	nahual INT NOT NULL,
	fecha DATE NOT NULL,
    descripcion VARCHAR(5000),
	CONSTRAINT PK_ID_R1 PRIMARY KEY(idRueda)
);
CREATE TABLE Rueda2 (
	idRueda INT NOT NULL AUTO_INCREMENT,
	nahual INT NOT NULL,
	fecha DATE NOT NULL,
    descripcion VARCHAR(5000),
	CONSTRAINT PK_ID_R2 PRIMARY KEY(idRueda),
    CONSTRAINT FK_Id_Nagual FOREIGN KEY(nahual) REFERENCES Nahual(idNahual)
);
CREATE TABLE Rueda3 (
	idRueda INT NOT NULL AUTO_INCREMENT,
	nahual INT NOT NULL,
	fecha DATE NOT NULL,
    descripcion VARCHAR(5000),
	CONSTRAINT PK_ID_R3 PRIMARY KEY(idRueda)
);

CREATE TABLE RuedaCalendarica (
	idRuedaCalendarica INT NOT NULL AUTO_INCREMENT,
	idRueda1 INT NOT NULL,
	idRueda2 INT NOT NULL,
	idRueda3 INT NOT NULL,
    descripcion VARCHAR(5000),
	CONSTRAINT PK_ID_RUEDA_CALENDARICA PRIMARY KEY(idRuedaCalendarica),
    CONSTRAINT FK_R1 FOREIGN KEY(idRueda1) REFERENCES Rueda1(idRueda),
    CONSTRAINT FK_R2 FOREIGN KEY(idRueda2) REFERENCES Rueda2(idRueda),
    CONSTRAINT FK_R3 FOREIGN KEY(idRueda3) REFERENCES Rueda3(idRueda)
);

CREATE TABLE DiaCholqij (
	dia INT NOT NULL,
	idNahual INT NOT NULL,
	CONSTRAINT PK_ID_RUEDA_CALENDARICA PRIMARY KEY(dia),
    CONSTRAINT FK_IdNagual FOREIGN KEY(idNahual) REFERENCES Nahual(idNahual)
);

CREATE TABLE Categorizar (
	idHechoHistorico INT NOT NULL,
	idCategoria INT NOT NULL,
    
    CONSTRAINT FK_IDCATEGORIA_CATEGORIZAR_CATEGORIA FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria),
    CONSTRAINT FK_IDHECHO_CATEGORIZAR_HECHOHISTORICO FOREIGN KEY(idHechoHistorico) REFERENCES HechoHistorico(idHechoHistorico)
);

CREATE TABLE Cargador (
	nombre VARCHAR(10) NOT NULL PRIMARY KEY,
    descripcion VARCHAR(45) NOT NULL,
    fechaInicio DATE NOT NULL
);

CREATE TABLE Winal (
	numero INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL,
    descripcion VARCHAR(45) NOT NULL,
    dias INT,
    nombreCargador VARCHAR(10),
    
    CONSTRAINT FK_NOMBRECARGADOR_WINAL_CARGADOR FOREIGN KEY(nombreCargador) REFERENCES Cargador(nombre)
);