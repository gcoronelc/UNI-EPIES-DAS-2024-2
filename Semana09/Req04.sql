-- Activar la Base de Datos

use MarketPERU;
go

-- Paso 1

select 
	pv.Nombre, 
	sum(d.CantidadRecibida) Cantidad,
	sum(d.CantidadRecibida * d.PrecioCompra) Importe
from ORDEN_DETALLE d
join PRODUCTO p on d.IdProducto = p.IdProducto
join PROVEEDOR pv on p.IdProveedor = pv.IdProveedor
group by pv.Nombre
go

-- Paso 2

with
t1 as (
	select 
		pv.Nombre, 
		sum(d.CantidadRecibida) Cantidad,
		sum(d.CantidadRecibida * d.PrecioCompra) Importe
	from ORDEN_DETALLE d
	join PRODUCTO p on d.IdProducto = p.IdProducto
	join PROVEEDOR pv on p.IdProveedor = pv.IdProveedor
	group by pv.Nombre
)
select sum(Importe) total from t1;
go


-- Paso 3

with
t1 as (
	select 
		pv.Nombre, 
		sum(d.CantidadRecibida) Cantidad,
		sum(d.CantidadRecibida * d.PrecioCompra) Importe
	from ORDEN_DETALLE d
	join PRODUCTO p on d.IdProducto = p.IdProducto
	join PROVEEDOR pv on p.IdProveedor = pv.IdProveedor
	group by pv.Nombre
),
t2 as (
	select sum(Importe) total from t1
)
select 
	t1.Nombre, t1.Cantidad, t1.Importe,
	t1.Importe*100.0/t2.total Porcentaje
from t1 cross join t2
order by 1
go


