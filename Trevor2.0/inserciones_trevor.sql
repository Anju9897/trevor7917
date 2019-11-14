use trevor;

insert into area (nombre) values ('Admin');
insert into area (nombre) values ('Usuario');

insert into cargo (cargo,descripcion) values ('Administrador_dba','administrador de la base de datos');
insert into cargo (cargo,descripcion) values ('User','un usuario comun');

insert into rol (rol) values ('Admin');
insert into rol (rol) values ('usuario');

set identity_insert menu on; 
insert into menu(idmenu, menu, descripcion, url, idpadre) values(1, 'Vision Agente', 'icon icon-file-text2', '/Principal', null); 
insert into menu(idmenu, menu, descripcion, url, idpadre) values(2, 'Bandeja', 'icon icon-drawer', '/Principal', null); 
insert into menu(idmenu, menu, descripcion, url, idpadre) values(3, 'Notificaciones', 'icon icon-bell', '/Principal', null); 
insert into menu(idmenu, menu, descripcion, url, idpadre) values(4, 'Configuraciones', 'icon icon-wrench', '/Principal', null); 
insert into menu(idmenu, menu, descripcion, url, idpadre) values(5, 'Tickets', 'icon icon-ticket', '/Principal', null); 
insert into menu(idmenu, menu, descripcion, url, idpadre) values(6, 'Acerca de', 'icon icon-question', '/Principal', null); 
insert into menu(idmenu, menu, descripcion, url, idpadre) values(7, 'Salir', 'icon icon-exit', '/Principal', null);

insert into permiso(idmenu, idrol) select idmenu, 1 from menu; 
insert into permiso(idmenu, idrol) select idmenu, 2 from menu where idmenu in (2,3,4,6,7);

-- para administradores
INSERT INTO USUARIO VALUES(
	'k.admin',
	'Klary',
	'Guardado',
	'Klary@usonsonate.edu.sv', 
	'7777-7771', 
	lower(CONVERT(VARCHAR(64),HashBytes('SHA2_256', 'admin'),2)),
	--rol
	1,
	-- cargo
	3,
	-- area
	1
);

-- para usuarios
INSERT INTO USUARIO VALUES(
	'a.user',
	'Anju',
	'Garcia',
	'Anju@usonsonate.edu.sv', 
	'7625-5122', 
	lower(CONVERT(VARCHAR(64),HashBytes('SHA2_256', 'admin'),2)),
	-- rol
	2,
	-- cargo
	4,
	-- area
	2
);

select * from usuario;
select * from menu;

