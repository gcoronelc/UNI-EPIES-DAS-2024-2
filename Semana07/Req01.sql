
use MarketPERU;
go

-- Varificamos que el precio de venta no varia
select distinct IdProducto, PrecioVenta
from GUIA_DETALLE
order by 1;
go


-- Pero hay que tener en cuenta que el precio 
-- de un producto varia en el tiempo
select 
	g.IdLocal, p.Nombre, 
	sum(d.Cantidad) Cantidad,
	cast(avg(d.PrecioVenta) as numeric(10,2)) Precio_Promedio,
	sum(d.Cantidad*d.PrecioVenta) Total
from GUIA_DETALLE d
join GUIA g on d.IdGuia = g.IdGuia
join PRODUCTO p on d.IdProducto = p.IdProducto
group by g.IdLocal, p.Nombre
order by 1, 2;
go





