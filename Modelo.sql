Go
CREATE DATABASE base_consorcio;

go
USE base_consorcio;
go
Create table provincia (
	idprovincia int primary key not null, 
	descripcion varchar(50) not null,
	km2 int not null,
	cantdptos int not null,
	poblacion int not null,
	nomcabe varchar(50) not null
)
go
Create table localidad (
	idprovincia int not null, 
	idlocalidad int not null, 
	descripcion varchar(50) not null,
	Constraint PK_localidad PRIMARY KEY (idprovincia, idlocalidad),
	Constraint FK_localidad_pcia FOREIGN KEY (idprovincia)  REFERENCES provincia(idprovincia)						 					     					     					     				     					     
)

go

Create table zona (
	idzona int identity primary key not null, 
	descripcion varchar(50) not null
)

go

Create table conserje (
	idconserje int identity primary key not null, 
	apeynom varchar(50) not null,
	tel varchar(20) not null,
	fechnac datetime not null,
	estciv varchar(1)  NULL default ('S')
	CONSTRAINT CK_estadocivil CHECK (estciv IN ('S', 'C','D','O'))
)

go

Create table administrador	(
	idadmin int identity primary key not null, 
	apeynom varchar(50) not null,
	viveahi varchar(1)  NULL default ('N') 
	CONSTRAINT CK_habitante_viveahi CHECK (viveahi IN ('S', 'N')),
	tel varchar(20) not null,
	sexo varchar(1)  NOT NULL 
	CONSTRAINT CK_sexo CHECK (sexo IN ('F', 'M')),
    fechnac datetime not null
)

go

Create table tipogasto	(
	idtipogasto int primary key not null, 
	descripcion varchar(50) not null
)

go

Create table consorcio	(
	idprovincia int not null,
    idlocalidad int not null,
    idconsorcio int not null, 
	nombre varchar(50) not null,
	direccion varchar(250) not null,					     
	idzona int not null,	
	idconserje int not null,	
	idadmin int not null,	
	Constraint PK_consorcio PRIMARY KEY (idprovincia, idlocalidad,idconsorcio),
	Constraint FK_consorcio_pcia FOREIGN KEY (idprovincia,idlocalidad)  REFERENCES localidad(idprovincia,idlocalidad),
	Constraint FK_consorcio_zona FOREIGN KEY (idzona)  REFERENCES zona(idzona),						 					     					     					     				     					     
	Constraint FK_consorcio_conserje FOREIGN KEY (idconserje)  REFERENCES conserje(idconserje),
	Constraint FK_consorcio_admin FOREIGN KEY (idadmin)  REFERENCES administrador(idadmin)						 					     					     					     				     					     						 						 						 					     					     					     				     					     						 
)

go

Create table gasto (
	idgasto int identity not null,
	idprovincia int not null,
    idlocalidad int not null,
    idconsorcio int not null, 
	periodo int not null,
	fechapago datetime not null,					     
	idtipogasto int not null,
	importe decimal (8,2) not null,	
	Constraint PK_gasto PRIMARY KEY (idgasto),
	Constraint FK_gasto_consorcio FOREIGN KEY (idprovincia,idlocalidad,idconsorcio)  REFERENCES consorcio(idprovincia,idlocalidad,idconsorcio),
	Constraint FK_gasto_tipo FOREIGN KEY (idtipogasto)  REFERENCES tipogasto(idtipogasto)					     					     						 					     					     
)

go

Create table gastonew (
	idgasto int identity not null,
	idprovincia int not null,
    idlocalidad int not null,
    idconsorcio int not null, 
	periodo int not null,
	fechapago datetime not null,					     
	idtipogasto int not null,
	importe decimal (8,2) not null,	
	Constraint PK_gastonew PRIMARY KEY (idgasto),
	Constraint FK_gastonew_consorcio FOREIGN KEY (idprovincia,idlocalidad,idconsorcio)  REFERENCES consorcio(idprovincia,idlocalidad,idconsorcio),
	Constraint FK_gastonew_tipo FOREIGN KEY (idtipogasto)  REFERENCES tipogasto(idtipogasto)					     					     						 					     					     
)
go