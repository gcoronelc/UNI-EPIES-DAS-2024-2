-- Problema 01

select * from rh..empleado;
go

select 
	d.nombre,
	count(1) cant_empleados,
	sum(e.sueldo) importe,
	sum(e.comision) comision,
	sum(e.sueldo + ISNULL(e.comision,0)) total
from RH..departamento d
join rh..empleado e on d.iddepartamento = e.iddepartamento
group by d.nombre;
go

select 5 + 10;
go

select 5 + null;
go

select ISNULL(null,20);
go


-- Problema 02

select 
	u.ciudad,
	count(1) empleados
from rh..empleado e 
join rh..departamento d on d.iddepartamento = e.iddepartamento
join rh..ubicacion u on u.idubicacion = d.idubicacion
group by u.ciudad;
go



