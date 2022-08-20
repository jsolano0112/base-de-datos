CREATE DATABASE basededatosdos
go

USE basededatosdos;
go

CREATE TABLE asignatura
(idCodigo varchar(4) CONSTRAINT PK_codigo primary key(idCodigo), 
numero varchar (4) UNIQUE,
tipo varchar(100),
curso varchar(100),
duracion varchar(100) NOT NULL,
lib_conf varchar(100),
lim_adm varchar(100),
contenido varchar(1000),
incompat varchar(10),
equivale varchar(10))
go

CREATE TABLE creditos
(idCreditos varchar(4) CONSTRAINT PK_idCreditos primary key(idCreditos),
practico bit,
teorico bit,---definir si uno solo
idCodigo varchar(4),
constraint FK_asignaturaCre FOREIGN KEY(idCodigo) references asignatura(idCodigo));
go

CREATE TABLE grupos
(idGrupos varchar(4) CONSTRAINT PK_grupos primary key(idGrupos),
practico bit,
teorico bit,
idCodigo varchar(4),
CONSTRAINT FK_asignaturaGru FOREIGN KEY (idCodigo) references asignatura(idCodigo));
go

CREATE TABLE titulacion
(nombreTitulacion varchar(30) CONSTRAINT PK_titulacion primary key(nombreTitulacion),
fecha date,
idCodigo varchar(4),
CONSTRAINT FK_asignaturaTitu FOREIGN KEY(idCodigo) references asignatura(idCodigo));
go

CREATE TABLE asignaturaTitulacion 
(idCodigo varchar(4),
nombreTitulacion varchar(30),
CONSTRAINT PK_asignaturaTitulacion PRIMARY KEY(idCodigo,nombreTitulacion),
CONSTRAINT FK_asignaturaA FOREIGN KEY (idCodigo) references asignatura(idCodigo),
CONSTRAINT FK_titulacionA FOREIGN KEY (nombreTitulacion) references titulacion(nombreTitulacion));
go

CREATE TABLE profesor
(idProfe varchar(10) CONSTRAINT PK_prof PRIMARY KEY(idProfe),
nombre varchar(100) NOT NULL,
apellido varchar(100) NOT NULL,
despacho varchar(10) UNIQUE,
correo varchar(70) NOT NULL UNIQUE);
go

CREATE TABLE asignaturaProfesor 
(idCodigo varchar(4),
idProfe varchar(10),
CONSTRAINT PK_asignaturaProfesor PRIMARY KEY(idCodigo,idProfe),
CONSTRAINT FK_asignaturaB FOREIGN KEY (idCodigo) references asignatura(idCodigo),
CONSTRAINT FK_profesorB FOREIGN KEY (idProfe) references profesor(idProfe));
go

CREATE TABLE consultas
(idConsultas varchar(100) CONSTRAINT PK_consultas PRIMARY KEY(idConsultas),
fechaHora date NOT NULL,
idProfe varchar(10),
CONSTRAINT FK_profesorB FOREIGN KEY (idProfe) references profesor(idProfe));
go

CREATE TABLE area
(nombreArea varchar(30) CONSTRAINT PK_area PRIMARY KEY(nombreArea),
idProfe varchar(10),
idCodigo varchar(4),
CONSTRAINT FK_profesorB FOREIGN KEY (idProfe) references profesor(idProfe),
CONSTRAINT FK_asignaturaB FOREIGN KEY(idCodigo) references asignatura(idCodigo));
go

CREATE TABLE departamento 
(nombreDepa varchar(10) CONSTRAINT PK_departamento PRIMARY KEY(nombreDepa),
nombreArea varchar(30),
CONSTRAINT FK_area FOREIGN KEY (nombreArea) references area(nombreArea);
go


----INSERTAR

----ACTUALIZAR


