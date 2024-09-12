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


WITH
T1 AS (
	select 
		u.ciudad,
		count(1) empleados
	from rh..empleado e 
	join rh..departamento d on d.iddepartamento = e.iddepartamento
	join rh..ubicacion u on u.idubicacion = d.idubicacion
	group by u.ciudad
),
T2 AS (SELECT SUM(empleados) empl_totales FROM T1)
SELECT 
	t1.ciudad, t1.empleados,
	cast(t1.empleados * 100.0 / T2.empl_totales as decimal(10,2)) porcentaje
FROM T1 cross join T2;
go

-- Problema 3 --
WITH
T1 as (
	select 
		c.NomCurso, 
		COUNT (1) aulas,
		sum(Vacantes + Matriculados ) vacantes_programadas,
		sum (Matriculados) matriculados
	from EduTec..CursoProgramado cp
	join EduTec..Curso c on cp.IdCurso=c.IdCurso
	where cp.IdCiclo = '2024-01'
	group by c.NomCurso
)
select 
	NomCurso,aulas,vacantes_programadas,matriculados,
    CAST(matriculados*100.0/vacantes_programadas as numeric(10,2)) porcentaje 
from T1 
go

select *
from EduTec..CursoProgramado 
go


-- PROBLEMA 4

select 
	CONCAT(p.ApeProfesor,', ', p.NomProfesor) nombreprofesor,
	COUNT(1) AULAS,
	sum(t.Horas) horas,
	sum(t.PagoHora*t.Horas) Importe
from EduTec..CursoProgramado cp
join EduTec..Curso c on c.IdCurso = cp.IdCurso
join EduTec..Tarifa t on t.IdTarifa=c.IdTarifa
join EduTec..Profesor p on p.IdProfesor=cp.IdProfesor
where CP.IdCiclo='2024-01'
GROUP BY CONCAT(p.ApeProfesor,', ', p.NomProfesor)
go

select *
from EduTec..Tarifa
go



-- PROBLEMA 6

WITH 
T1 AS (
	SELECT 
		O.ShipCountry PAIS,
		COUNT(DISTINCT O.OrderID) CANT_PEDIDOS,
		SUM(OD.Quantity) CANT_PRODUCTOS,
		SUM(OD.UnitPrice*OD.Quantity) IMPORTE
	FROM Northwind..Orders O
	JOIN Northwind..[Order Details] OD ON O.OrderID = OD.OrderID
	GROUP BY O.ShipCountry
),
T2 AS (SELECT SUM(IMPORTE) TOTAL FROM T1)
SELECT 
	T1.PAIS, T1.CANT_PEDIDOS, T1.CANT_PRODUCTOS,
	T1.IMPORTE, T1.IMPORTE * 100.0 / T2.TOTAL PORCENTAJE
FROM T1 CROSS JOIN T2
GO

SELECT COUNT(1) FROM Northwind..Orders
GO


SELECT COUNT(1) FROM Northwind..[Order Details]
GO


-- EJERCICIO ADICIONAL
-- --------------------
-- Base de Datos: Northwind
-- Ventas del año 1997
/*

PAIS       Enero      Febrero .... Diciembre Total
-------------------------------------------------
Argentina  50,000.00  


-------------------------------------------------
*/

SELECT * FROM Northwind..Orders
GO

WITH 
T1 AS (
	SELECT 
		O.ShipCountry PAIS,
		MONTH(O.OrderDate) MES,
		SUM(OD.UnitPrice*OD.Quantity) IMPORTE
	FROM Northwind..Orders O
	JOIN Northwind..[Order Details] OD ON O.OrderID = OD.OrderID
	WHERE YEAR(O.OrderDate) = 1997
	GROUP BY O.ShipCountry, MONTH(O.OrderDate)
)
SELECT 
	PAIS, 
	SUM(IIF(MES=1,IMPORTE,0.0)) ENERO,
	SUM(IIF(MES=2,IMPORTE,0.0)) FEBRERO,
	SUM(IIF(MES=3,IMPORTE,0.0)) MARZO,
	SUM(IIF(MES=4,IMPORTE,0.0)) ABRIL,
	SUM(IIF(MES=5,IMPORTE,0.0)) MAYO,
	SUM(IIF(MES=6,IMPORTE,0.0)) JUNIO,
	SUM(IIF(MES=7,IMPORTE,0.0)) JULIO,
	SUM(IIF(MES=8,IMPORTE,0.0)) AGOSTO,
	SUM(IIF(MES=9,IMPORTE,0.0)) SETIEMBRE,
	SUM(IIF(MES=10,IMPORTE,0.0)) OCTUBRE,
	SUM(IIF(MES=11,IMPORTE,0.0)) NOVIEMBRE,
	SUM(IIF(MES=12,IMPORTE,0.0)) DICIEMBRE,
	SUM(IMPORTE) TOTAL
FROM T1
GROUP BY PAIS
ORDER BY 1
GO




















