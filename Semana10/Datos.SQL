-- Tabla: ROL


SET IDENTITY_INSERT dbo.Rol ON;  
GO  

insert into rol(idrol,nombre) values(1,'Sistemas');
insert into rol(idrol,nombre) values(2,'Administrador');
insert into rol(idrol,nombre) values(3,'Bibliotecario');
go

SET IDENTITY_INSERT dbo.Rol OFF;  
GO

select * from rol;
go


-- Tabla: EMPLEADO

SET IDENTITY_INSERT dbo.EMPLEADO ON;  
GO  

INSERT INTO EMPLEADO(IDEMPLEADO,APELLIDOS,NOMBRES,DNI,CORREO)
VALUES(1,'AGUIRRE ALVARADO','LUIS GUILLERMO','43568723','laguirre@gmail.com');
go

INSERT INTO EMPLEADO(IDEMPLEADO,APELLIDOS,NOMBRES,DNI,CORREO)
VALUES(2,'ALAYO OLIVO','BRAYAN BAGNER','09345678','balayo@gmail.com');
go

INSERT INTO EMPLEADO(IDEMPLEADO,APELLIDOS,NOMBRES,DNI,CORREO)
VALUES(3,'CHIROQUE SANDOVAL','VALERIA ANABEL','12436789','vchiroque@gmail.com');
go
 

INSERT INTO EMPLEADO(IDEMPLEADO,APELLIDOS,NOMBRES,DNI,CORREO)
VALUES(4,'ESPIRITU SILVESTRE','ALICIA DIRCEJA DE FATIMA','76892345','aespiritu@gmail.com');
go
 
INSERT INTO EMPLEADO(IDEMPLEADO,APELLIDOS,NOMBRES,DNI,CORREO)
VALUES(5,'MORALES PALACIOS','FRANCKLIN WILLIAMS','21763409','fmorales@gmail.com');
go

SET IDENTITY_INSERT dbo.EMPLEADO OFF;  
GO  

SELECT * FROM EMPLEADO;
GO


-- Tabla: USUARIO


INSERT INTO USUARIO(IDEMPLEADO,IDROL,USUARIO,CLAVE,ACTIVO) VALUES(1,2,'LAGUIRRE','SECRETO',0);
INSERT INTO USUARIO(IDEMPLEADO,IDROL,USUARIO,CLAVE,ACTIVO) VALUES(2,2,'BALAYO','GUARANA',1);
INSERT INTO USUARIO(IDEMPLEADO,IDROL,USUARIO,CLAVE,ACTIVO) VALUES(3,3,'VCHIROQUE','CHIFLE',1);
INSERT INTO USUARIO(IDEMPLEADO,IDROL,USUARIO,CLAVE,ACTIVO) VALUES(4,3,'AESPIRITU','ALICIA',1);
INSERT INTO USUARIO(IDEMPLEADO,IDROL,USUARIO,CLAVE,ACTIVO) VALUES(5,3,'FMORALES','FLECHA',1);
GO


SELECT * FROM USUARIO;
GO


-- Tabla ESTADO

select * from dbo.estado;
go

insert into estado values
(1,'Prestado'),
(2,'Devoluci�n normal'),
(3,'Devoluci�n con multa');

select * from dbo.estado;
go


-- Tabla ESTUDIANTE

insert into dbo.estudiante(codigo,apellido,nombre) values
('20072170D','AGUIRRE ALVARADO','LUIS GUILLERMO'),
('20222188K','ALAYO OLIVO','BRAYAN BAGNER'),
('20220093B','ARIAS FLORES','JOSE ANTONIO'),
('20220624H','AYARQUISPE MAMANI','JOSE'),
('20220521D','BENITO CUYA','LEIDY VANESSA');

select * from dbo.estudiante;
go



INSERT INTO dbo.TEMA (NOMBRE) 
VALUES 
('Ficci�n'),
('No Ficci�n'),
('Ciencia');


INSERT INTO dbo.AUTOR (NOMBRE, APELLIDO) 
VALUES 
('Gabriel', 'Garc�a M�rquez'),
('Isabel', 'Allende'),
('J.K.', 'Rowling');



INSERT INTO dbo.LIBRO (TITULO, IDTEMA, IDAUTOR) 
VALUES 
('Cien a�os de soledad', 1, 1),
('La casa de los esp�ritus', 1, 2),
('Harry Potter y la piedra filosofal', 1, 3);



INSERT INTO dbo.EJEMPLAR (CODIGO, EDICION, EDITORIAL, ANIO, IDLIBRO) 
VALUES 
('EJ001', 1, 'Editorial XYZ', 2000, 1),
('EJ002', 1, 'Editorial ABC', 2005, 2),
('EJ003', 1, 'Editorial DEF', 2010, 3);




