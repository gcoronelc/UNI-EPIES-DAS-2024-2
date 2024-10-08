
-- Activar la Base de Datos

use MarketPERU;
go


-- Paso 1

select 
	p.IdProveedor, P.Nombre,
	count(d.IdGuia) CantidadVentas,
	sum(d.Cantidad) UnidadesVendidas,
	sum(d.Cantidad*d.PrecioVenta) Importe
from GUIA_DETALLE d
join PRODUCTO p on d.IdProducto = p.IdProducto
group by P.IdProveedor, P.Nombre
order by 1,2;
go

-- Paso 2

with
t1 as (
	select 
		p.IdProveedor, P.Nombre,
		count(d.IdGuia) CantidadVentas,
		sum(d.Cantidad) UnidadesVendidas,
		sum(d.Cantidad*d.PrecioVenta) Importe
	from GUIA_DETALLE d
	join PRODUCTO p on d.IdProducto = p.IdProducto
	group by P.IdProveedor, P.Nombre
)
select IdProveedor, max(UnidadesVendidas) MaxUnidadesVendidas
from t1
group by IdProveedor;
go


-- Paso 3
with
t1 as (
	select 
		p.IdProveedor, P.Nombre,
		count(d.IdGuia) CantidadVentas,
		sum(d.Cantidad) UnidadesVendidas,
		sum(d.Cantidad*d.PrecioVenta) Importe
	from GUIA_DETALLE d
	join PRODUCTO p on d.IdProducto = p.IdProducto
	group by P.IdProveedor, P.Nombre
),
t2 as (
	select IdProveedor, max(UnidadesVendidas) MaxUnidadesVendidas
	from t1
	group by IdProveedor
)
select 
	p.Nombre NombreProveedor, t1.Nombre NombreProducto,
	t1.CantidadVentas, t1.UnidadesVendidas, t1.Importe
from t1 join t2
on t1.IdProveedor = t2.IdProveedor and t1.UnidadesVendidas = t2.MaxUnidadesVendidas
join PROVEEDOR p on t1.IdProveedor = p.IdProveedor
order by 1, 2;
go








