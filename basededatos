CREATE DATABASE basededatosdos
go

USE basededatosdos;
go

CREATE TABLE asignatura
(idCodigo varchar(4) CONSTRAINT PK_codigo primary key(codigo), 
numero varchar (4),
tipo varchar(100),
curso varchar(100),
duracion varchar(100),
lib_conf varchar(100),
lim_adm varchar(100),
CONSTRAINT FK_incompat FOREIGN KEY idCodigo references asignatura(idCodigo),
CONSTRAINT FK_equivale FOREIGN KEY idCodigo references asignatura(idCodigo));
go

CREATE TABLE creditos
(idCreditos varchar(4) CONSTRAINT PK_idCreditos primary key(idCreditos),
practico bit,
teorico bit,---definir si uno solo
idCodigo varchar(4),
CONSTRAINT FK_idCodigo FOREIGN KEY idCodigo references asignatura(idCodigo));
go

CREATE TABLE grupos
(idGrupos varchar(4) CONSTRAINT PK_grupos primary key(idGrupos),
practico bit,
teorico bit,
idCodigo varchar(4),
CONSTRAINT FK_idCodigo FOREIGN KEY idCodigo references asignatura(idCodigo));
go

CREATE TABLE titulacion
(idTitulacion varchar(4) CONSTRAINT PK_titulacion(idTitulacion),
nombre varchar(100),
CONSTRAINT FK_idCodigo FOREIGN KEY idCodigo references asignatura(idCodigo));
go

CREATE TABLE asignaturaTitulacion 
(idCodigo varchar(4),
idTitulacion varchar(4),
CONSTRAINT PK_asignaturaTitulacion PRIMARY KEY(idCodigo,idTitulacion),
CONSTRAINT FK_asignaturaA FOREIGN KEY idCodigo references asignatura(idCodigo),
CONSTRAINT FK_titulacionA FOREIGN KEY idTitulacion references titulacion(idTitulacion));
go

CREATE TABLE profesor
(idProfesor varchar(30) CONSTRAINT PK_prof(idProfesor),
nombre varchar(100),
despacho varchar(10));
go

CREATE TABLE asignaturaProfesor 
(idCodigo varchar(4),
idProfesor varchar(30),
CONSTRAINT PK_asignaturaProfesor PRIMARY KEY(idCodigo,idProfesor),
CONSTRAINT FK_asignaturaB FOREIGN KEY idCodigo references asignatura(idCodigo),
CONSTRAINT FK_profesorB FOREIGN KEY idProfesor references profesor(idProfesor));
go

CREATE TABLE consultas
(idConsultas varchar(100),
fechaHora date,
idProfesor varchar(30),
CONSTRAINT FK_profesorB FOREIGN KEY idProfesor references profesor(idProfesor));
go

CREATE TABLE area
(idArea varchar(10) CONSTRAINT PK_area PRIMARY KEY(idArea),
nombre varchar(30),
CONSTRAINT FK_profesorB FOREIGN KEY idProfesor references profesor(idProfesor)
CONSTRAINT FK_asignaturaB FOREIGN KEY idCodigo references asignatura(idCodigo));
go

CREATE TABLE departamento 
(idDepartamento varchar(10) CONSTRAINT PK_departamento PRIMARY KEY(idDepartamento),
nombre varchar(30),
idArea varchar(10),
CONSTRAINT FK_area FOREIGN KEY idArea references area(idArea);
