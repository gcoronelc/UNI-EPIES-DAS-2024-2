
-- Activar la Base de Datos

use MarketPERU;
go


-- Caso 1

select 
	p.IdProducto, p.Nombre,
	sum(d.CantidadSolicitada) CantidadSolicitada,
	sum(d.CantidadRecibida) CantidadRecibida,
	cast( sum(d.CantidadRecibida)*100.0/sum(d.CantidadSolicitada) 
	      as numeric(10,2)) PorcCumplimiento
from ORDEN_DETALLE d
join PRODUCTO p on d.IdProducto = p.IdProducto
group by p.IdProducto, p.Nombre
order by 1,2;
go

-- Caso 2

with
t1 as (
	select 
		p.IdProducto, p.Nombre,
		sum(d.CantidadSolicitada) CantidadSolicitada,
		sum(d.CantidadRecibida) CantidadRecibida
	from ORDEN_DETALLE d
	join PRODUCTO p on d.IdProducto = p.IdProducto
	group by p.IdProducto, p.Nombre
)
select 
	IdProducto, Nombre,
	CantidadSolicitada, CantidadRecibida,
	cast(CantidadRecibida * 100.0 / CantidadSolicitada 
	     as numeric(10,2)) PorcCumplimiento
from t1
order by 1,2;
go




