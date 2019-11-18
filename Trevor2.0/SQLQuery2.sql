use trevor;

alter table ticket
alter column fecha_emision Date null;
go

select t.asunto,t.descripcion,t.fecha_emision,e.estado from ticket t inner join estado e on (t.idestado = e.idestado);