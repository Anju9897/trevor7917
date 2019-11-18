
create database trevor;
use trevor;

CREATE TABLE rol(
	[idrol] [int] IDENTITY(1,1) NOT NULL primary key,
	[rol] [varchar](45) NOT NULL,
)
GO

CREATE TABLE usuario(
	[idusuario] [varchar](30) NOT NULL primary key,
	[nombres] [varchar](45) NOT NULL,
	[apellidos] [varchar](45) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[telefono] [varchar](20) NULL DEFAULT (NULL),
	[clave] [varchar](100) NOT NULL,
	[idrol] [int] NOT NULL,
	foreign key (idrol) references rol(idrol) 
)
GO

CREATE TABLE menu(
	[idmenu] [int] IDENTITY(1,1) NOT NULL primary key,
	[menu] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[url] [varchar](300) NULL,
	[idpadre] [int] NULL,
	foreign key (idpadre) references menu(idmenu)
)
go

CREATE TABLE permiso(
	[idpermiso] [int] IDENTITY(1,1) NOT NULL,
	[idmenu] [int] NOT NULL,
	[idrol] [int] NOT NULL,
	foreign key (idmenu) references menu(idmenu) on delete cascade on update cascade,
	foreign key (idrol) references rol(idrol) on delete cascade on update cascade
)
go

create table estado(
	idestado int identity(1,1) not null primary key,
	estado varchar(30) not null
)
go

create table cargo(
	idcargo int identity(1,1) not null primary key,
	descripcion varchar(45) not null,
	cargo varchar(45)
)
go

create table area(
	idarea int not null identity(1,1) primary key,
	nombre varchar(45) not null,
	descripcion varchar(45)
)
go

alter table usuario 
	add 
		idcargo int not null,
		idarea int not null;
	go

alter table usuario
	add
		foreign key (idcargo) references cargo(idcargo) on delete cascade on update cascade,
		foreign key (idarea) references area(idarea) on delete cascade on update cascade;
	go


create table ticket(
	idticket int identity(1,1) not null primary key,
	descripcion varchar(2000) not null,
	u_encargado varchar(30) not null,
	u_reporta varchar(30) not null,
	fecha_emision datetime not null,
	idestado int not null,
	prioridad varchar(20) not null,
	foreign key (u_encargado) references usuario(idusuario) on delete cascade on update cascade,
	foreign key (u_reporta) references usuario(idusuario),
	foreign key (idestado) references estado(idestado)
)
go

create table acciones(
	idaccion int not null identity(1,1) primary key,
	descripcion varchar(50),
	u_encargado varchar(30) not null,
	foreign key (u_encargado) references usuario(idusuario) on delete cascade on update cascade
)
go

create table historialTicket(
	idhistorial int not null identity(1,1) primary key,
	idticket int not null,
	u_reporta varchar(30) not null,
	observaciones varchar(1500),
	fecha_final datetime not null,
	idaccion int not null,
	foreign key (idticket) references ticket(idticket) on delete cascade on update cascade,
	foreign key (u_reporta) references usuario(idusuario),
	foreign key (idaccion) references acciones(idaccion)
)
go



