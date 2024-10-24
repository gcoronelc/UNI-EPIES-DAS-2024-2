-- Activar BD

use MarketPERU;
go

-- Paso 1

select 
	pd.IdProveedor, pd.Nombre Producto,
	sum(gd.Cantidad) UnidadesVendidas,
	sum(gd.PrecioVenta*gd.Cantidad) ImporteVentas,
	sum((gd.PrecioVenta-pd.PrecioProveedor)*gd.Cantidad) Ganancia
from GUIA_DETALLE gd
join PRODUCTO pd on gd.IdProducto = pd.IdProducto
group by pd.IdProveedor, pd.Nombre
order by 1, 5 desc;
go

/*
1	JAMONADA LAIVE					300		5625.00		1875.00
2	JAMONADA ESPECIAL OTTO KUNZ		400		10200.00	3400.00
4	JAMONADA DE POLLO SAN FERNANDO	400		6000.00		2000.00
5	DETERGENTE LIMON INVICTO		15000	27000.00	9000.00
6	DETERGENTE LIMON ARIEL 250 GR	7500	22500.00	7500.00
6	DETERGENTE C/BLANQUEADOR ARIEL	7500	22500.00	7500.00
*/
-- Paso 2

with
t1 as (
	select 
		pd.IdProveedor, pd.Nombre Producto,
		sum(gd.Cantidad) UnidadesVendidas,
		sum(gd.PrecioVenta*gd.Cantidad) ImporteVentas,
		sum((gd.PrecioVenta-pd.PrecioProveedor)*gd.Cantidad) Ganancia
	from GUIA_DETALLE gd
	join PRODUCTO pd on gd.IdProducto = pd.IdProducto
	group by pd.IdProveedor, pd.Nombre
)
select 
	IdProveedor, max(Ganancia) MaxGanancia
from t1 
group by IdProveedor;
go

-- Paso 3

with
t1 as (
	select 
		pd.IdProveedor, pd.Nombre Producto,
		sum(gd.Cantidad) UnidadesVendidas,
		sum(gd.PrecioVenta*gd.Cantidad) ImporteVentas,
		sum((gd.PrecioVenta-pd.PrecioProveedor)*gd.Cantidad) Ganancia
	from GUIA_DETALLE gd
	join PRODUCTO pd on gd.IdProducto = pd.IdProducto
	group by pd.IdProveedor, pd.Nombre
),
t2 as (
	select IdProveedor, max(Ganancia) MaxGanancia
	from t1 
	group by IdProveedor
)
select 
	p.Nombre Proveedor, t1.Producto, t1.UnidadesVendidas,
	t1.ImporteVentas, t1.Ganancia
from PROVEEDOR p
join t1 on p.IdProveedor = t1.IdProveedor
join t2 on t1.IdProveedor=t2.IdProveedor and t1.Ganancia=t2.MaxGanancia
order by 1, 2;
go



