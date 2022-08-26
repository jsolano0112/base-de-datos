CREATE DATABASE basededatosdos;
GO

USE basededatosdos;
GO

CREATE TABLE asignatura
(idCodigo varchar(4) CONSTRAINT PK_codigo primary key(idCodigo), 
numero varchar(4) UNIQUE,
tipo varchar(100),
curso varchar(100),
duracion varchar(100) NOT NULL,
lib_conf varchar(100),
lim_adm varchar(100),
incompat varchar(10) CONSTRAINT FK_incompat FOREIGN KEY(idCodigo) references asignatura(idCodigo),
equivale varchar(10) CONSTRAINT FK_equivale FOREIGN KEY(idCodigo) references asignatura(idCodigo))
GO

CREATE TABLE creditos
(idCreditos varchar(4) CONSTRAINT PK_idCreditos primary key(idCreditos),
practico bit,
teorico bit,
idCodigo varchar(4),
constraint FK_asignaturaCre FOREIGN KEY(idCodigo) references asignatura(idCodigo));
GO

CREATE TABLE grupos
(idGrupos varchar(4) CONSTRAINT PK_grupos primary key(idGrupos),
practico bit,
teorico bit,
idCodigo varchar(4),
CONSTRAINT FK_asignaturaGru FOREIGN KEY (idCodigo) references asignatura(idCodigo));
GO

CREATE TABLE titulacion
(idTitulacion varchar (4) CONSTRAINT PK_titulacion primary key(idTitulacion),
nombreTitulacion varchar(100) NOT NULL,
idCodigo varchar(4),
CONSTRAINT FK_asignaturaTitu FOREIGN KEY(idCodigo) references asignatura(idCodigo));
GO

CREATE TABLE asignaturaTitulacion 
(idCodigo varchar(4),
idTitulacion varchar(4),
CONSTRAINT PK_asignaturaTitulacion PRIMARY KEY(idCodigo,idTitulacion),
CONSTRAINT FK_asignaturaA FOREIGN KEY (idCodigo) references asignatura(idCodigo),
CONSTRAINT FK_titulacionA FOREIGN KEY (idTitulacion) references titulacion(idTitulacion));
GO

CREATE TABLE profesor
(idProfe varchar(10) CONSTRAINT PK_prof PRIMARY KEY(idProfe),
primerNombre varchar(100) NOT NULL,
despacho varchar(10) UNIQUE);
GO

CREATE TABLE asignaturaProfesor 
(idCodigo varchar(4),
idProfe varchar(10),
CONSTRAINT PK_asignaturaProfesor PRIMARY KEY(idCodigo,idProfe),
CONSTRAINT FK_asignaturaB FOREIGN KEY (idCodigo) references asignatura(idCodigo),
CONSTRAINT FK_profesorB FOREIGN KEY (idProfe) references profesor(idProfe));
GO

CREATE TABLE consultas
(idConsultas varchar(4) CONSTRAINT PK_consultas PRIMARY KEY(idConsultas),
fechaHora date NOT NULL,
idProfe varchar(10),
CONSTRAINT FK_profesorConsulta FOREIGN KEY (idProfe) references profesor(idProfe));
GO

CREATE TABLE area
(idArea varchar(4) CONSTRAINT PK_area PRIMARY KEY(idArea),
nombreArea varchar(30) CONSTRAINT CHK_area CHECK (nombreArea IN ('Ciencias B�sicas','Ingenier�a','Derecho y Ciencias Forenses')),
idProfe varchar(10),
idCodigo varchar(4),
CONSTRAINT FK_profesorArea FOREIGN KEY (idProfe) references profesor(idProfe),
CONSTRAINT FK_asignaturaArea FOREIGN KEY(idCodigo) references asignatura(idCodigo));
GO

CREATE TABLE departamento 
(idDepa varchar(4) CONSTRAINT PK_departamento PRIMARY KEY(idDepa),
nombreDepa varchar(30),
idArea varchar(4),
CONSTRAINT FK_area FOREIGN KEY (idArea) references area(idArea));
GO


----CAMPOS ADICIONAL POR CADA TABLA
ALTER TABLE asignatura ADD contenido varchar(1000);
GO
ALTER TABLE titulacion ADD fecha date;
GO
ALTER TABLE profesor ADD primerApellido varchar(100) NOT NULL;
GO
ALTER TABLE profesor ADD correo varchar(100) UNIQUE;
GO
ALTER TABLE consultas ADD busqueda varchar(100);
GO
ALTER TABLE area ADD edificio varchar(20);
GO
ALTER TABLE departamento ADD direccion varchar(100) DEFAULT 'Medell�n';
GO

------------------INSERTAR------------------
--ASIGNATURA
INSERT INTO asignatura VALUES
('C623', '1', '', 'Bases de Datos', '6 meses', 'Libreria de Configuracion Ingenieria', 'Adm. de Ingenieria', '', '','');
GO
INSERT INTO asignatura VALUES
('C123', '2', '002', 'Matematicas', '3 semestres', 'Libreria de Configuracion Ingenieria', 'Adm. de Ingenieria', '', '','Enfocada en Calculo Integral');
GO
INSERT INTO asignatura VALUES
('C613', '3', '', 'Dise�o de Sistemas', '1 semestre', 'Libreria de Configuracion Ingenieria', 'Adm. de Ingenieria', '', '','');
GO

--CREDITOS
INSERT INTO creditos VALUES
('0001', '1', '0', 'C623');
GO
INSERT INTO creditos VALUES
('0002', '1', '1', 'C123');
GO
INSERT INTO creditos VALUES
('0003', '0', '1', 'C613');
GO


--GRUPOS
INSERT INTO grupos VALUES
('0001', '1', '0', 'C623');
GO
INSERT INTO grupos VALUES
('0002', '1', '1', 'C613');
GO
INSERT INTO grupos VALUES
('0003', '1', '0', 'C613');
GO


--TITULACION
INSERT INTO titulacion VALUES
('0001', 'Manejo de Base de datos', 'C623', '2022/08/24');
GO
INSERT INTO titulacion VALUES
('0230', 'Conocimiento en Calculo Integral', 'C123', '2022/05/24');
GO
INSERT INTO titulacion VALUES
('0012', 'Conocimiento en Calculo', 'C623', '2022/08/24');
GO

--ASIGNATURATITULACION

--PROFESOR
INSERT INTO profesor VALUES
('1100762342', 'Juan', '3-201', 'Giraldo', 'juan.giraldo@gmail.com');
GO
INSERT INTO profesor VALUES
('1324327342', 'Maria', '3-202', 'Restrepo', 'mrest091@gmail.com');
GO
INSERT INTO profesor VALUES
('3321231321', 'Andres', '1-101', 'Gom�z', 'andres_g@gmail.com');
GO
--ASIGNATURAPROFESOR

--CONSULTAS
INSERT INTO consultas VALUES
('0001', '2022/08/25', '1100762342', 'Julieth');
GO
INSERT INTO consultas VALUES
('0002', '2021/02/12', '1324327342', 'Solano');
GO
INSERT INTO consultas VALUES
('0003', '2022/03/21', '3321231321', 'Luis');
GO
--AREA
INSERT INTO area VALUES
('0001', 'Ingenier�a', '1100762342', 'C623', '3-206');
GO
INSERT INTO area VALUES
('0002', 'Ciencias B�sicas', '1324327342', 'C613', '5-201');
GO
INSERT INTO area VALUES
('0003', 'Ingenier�a', '1100762342', 'C623', '5-201');
GO
--DEPARTAMENTO
INSERT INTO departamento VALUES
('0141', 'Departamento de Robledo', '0001', '');
GO
INSERT INTO departamento VALUES
('0071', 'Departamento de Copacabana', '0002', 'Copacabana');
GO
INSERT INTO departamento VALUES
('0131', 'Departamento de Itagui', '0003', 'Itagui');
GO
------------------ACTUALIZAR------------------
--ASIGNATURA
UPDATE asignatura SET curso = 'ingles' WHERE asignatura.idCodigo='C613';
GO
UPDATE asignatura SET duracion = '2 semestres' WHERE asignatura.idCodigo='C123';
GO
UPDATE asignatura SET equivale = 'C623' WHERE asignatura.idCodigo='C613';
GO

--CREDITOS
UPDATE creditos SET idCodigo = 'C123' WHERE creditos.idCreditos = '0001';
GO
UPDATE creditos SET teorico = '1' WHERE creditos.idCreditos = '0003';
GO
UPDATE creditos SET idCodigo = 'C123' WHERE creditos.idCreditos = '0002';
GO

--GRUPOS
UPDATE grupos SET idCodigo = 'C123' WHERE grupos.idGrupos = '0001';
GO
UPDATE grupos SET teorico = '1' WHERE grupos.idGrupos = '0001';
GO
UPDATE grupos SET practico = '0' WHERE grupos.idGrupos = '0003';
GO


--TITULACION
UPDATE titulacion SET idCodigo = 'C623' WHERE titulacion.idTitulacion = '0012';
GO
UPDATE titulacion SET nombreTitulacion = 'Manejo de Excel Avanzado' WHERE titulacion.idTitulacion = '0012';
GO
UPDATE titulacion SET fecha = '2021/3/12' WHERE titulacion.idTitulacion = '0001';
GO

---------------------------------------------------

--CONSULTAS IN BETWEEN Y LIKE--

SELECT idCodigo, numero, curso FROM asignatura WHERE idCodigo LIKE 'C6%';
GO
SELECT idCreditos, practico, teorico, idCodigo FROM creditos WHERE practico IN(1);
GO
SELECT idGrupos, practico, teorico, idCodigo FROM grupos WHERE idCodigo LIKE 'C6%' AND teorico IN(1);
GO
SELECT idTitulacion, nombreTitulacion, idCodigo FROM titulacion WHERE nombreTitulacion LIKE '%Excel%';
GO
SELECT * FROM asignaturaTitulacion;
GO
SELECT idProfe, primerNombre, primerApellido FROM profesor WHERE primerApellido LIKE 'G%';
GO
SELECT * FROM asignaturaProfesor;
GO
SELECT idConsultas, fechaHora, idProfe FROM consultas WHERE fechaHora BETWEEN '2022-01-1' AND '2022-12-31'; 
GO
SELECT idArea, nombreArea, idProfe, idCodigo FROM area WHERE nombreArea IN('Ingenier?a');
GO
SELECT idDepa, nombreDepa, idArea, direccion FROM departamento WHERE idArea BETWEEN 0001 AND 0003 AND direccion IN('Copacabana');
GO

----------------------------------------------

--INNER JOIN OUTER JOIN--

SELECT asignatura.idCodigo, asignatura.curso, area.nombreArea
FROM asignatura 
INNER JOIN area ON asignatura.idCodigo = area.idCodigo
GO

SELECT asignatura.idCodigo, asignatura.curso, area.nombreArea
FROM asignatura
FULL OUTER JOIN area ON asignatura.idCodigo = area.idCodigo
GO

----------------------------------------------

--OPERADORES LOGICOS Y ORDER BY

SELECT idProfe, primerNombre, primerApellido
FROM profesor
WHERE primerNombre NOT LIKE 'Andres'
ORDER BY primerApellido DESC
GO

SELECT idTitulacion, nombreTitulacion
FROM titulacion
WHERE idTitulacion >= 0001 AND idTitulacion <= 0012
ORDER BY nombreTitulacion DESC
GO

----------------------------------------------

------------------ELIMINAR--------------------

DROP TABLE asignatura;
GO
DROP TABLE creditos;
GO
DROP TABLE grupos;
GO
DROP TABLE titulacion;
GO
DROP TABLE asignaturaTitulacion;
GO
DROP TABLE profesor;
GO
DROP TABLE asignaturaProfesor;
GO
DROP TABLE consultas;
GO
DROP TABLE area;
GO
DROP TABLE departamento;
GO

----------------------------------------------
