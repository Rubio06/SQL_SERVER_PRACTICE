select * from Orders;

SELECT GETDATE() AS 'FECHA_ACTUAL'
GO

/*
FUNCION DATEPART(partedefecha, fecha): retorna la parte 
especifica de una fecha, el año, trimestre, dia, hora , etc
*/

DECLARE @CurrentDate DATETIME
SET @CurrentDate = GETDATE()
SELECT DATEPART(MONTH, @CurrentDate) AS 'PARTE_FECHA'
GO

/*
Los valores para "partedefecha" pueden ser: year(año), quarter(cuarto),
month(mes), day(dia), week(semana), hour(hora), minute(minuto), second(segundo) y
millisecond(). ejmplo
*/
--retorna el dia actual
SELECT DATEPART(DAY, GETDATE()) AS 'DIA ACTUAL'
GO

--retorna el dia del año
SELECT DATEPART(DAYOFYEAR, GETDATE()) AS 'DIA DEL AÑO'
GO

--retorna la hora, minuto, segundo actual
SELECT DATEPART(HOUR, GETDATE()) AS 'HORA', DATEPART(MINUTE, GETDATE()) AS 'MINUTO',
DATEPART(SECOND, GETDATE()) AS 'SEGUNDO'
GO

/*
FUNCION DATEADD(partelafecha, numero, fecha): agrega un intervalo a a fecha especificada, es decir, 
retorna una fecha adicionando a la fecha enviada como tercer argumento, el intervalo de tiempo indicado por el parametro, tantas veces como lo indica el segundo 
parametro, los valores paa el primer argumento puede ser: year(año), quarter(cuarto), month(mes),
y millisecond(milisegundo). Ejemplos: 
*/
SELECT DATEADD(DAY, 3, CONVERT(DATE, GETDATE())) AS 'NUEVA FECHA'
GO

SELECT DATEADD(MONTH, 1, CONVERT(DATE, GETDATE())) AS 'NUEVA FECHA'
GO

SELECT DATEADD(YEAR, 1, CONVERT(DATE, GETDATE())) AS 'NUEVA FECHA'
GO

/*
FUNCION DATEIFF(partedelafecha, fecha1, fecha2): calcula el inervalo
de tiempo (segun el primer argumento) entre las 2 fechas. El resultados es un valor
entero que corresponda a fecha2, fecha1. Los valores de "partedelafecha" pueden ser
los mismos que se especificaron anteriormente. Ejemplos:
*/

SELECT DATEDIFF(DAY, GETDATE(), '2024/10/31') AS INTERVALO
GO

SELECT ProductName + ' ' + QuantityPerUnit + CAST(UnitPrice AS VARCHAR(50)) AS 'TEXTO_UNION'  FROM Products

SELECT DISTINCT Region FROM [dbo].[Suppliers]


/*******************ESQUEMAS SCHEMA************************/
/*
ESQUEMAS EN SQL SERVER:
En SQL Server, un esquema es un contenedor que se utiliza para agrupar objetos de base de datos como tablas, 
vistas, procedimientos almacenados, funciones y otros. Los esquemas son útiles para organizar los objetos 
de una base de datos y pueden ayudar a gestionar la seguridad y el acceso a esos objetos.
*/

USE [Instnwnd]

GO
create schema Ventas;

GO
create table Ventas.clientes (
	nombre varchar(40),
	apellido varchar(22)
)

GO
DROP TABLE Ventas.clientes

/**********************FUNCIONES DE AGRUPACIÓN***********************/

/* FUNCIONES DE AGRUPACION: SUM, COUNT, MIN, MAX, AVG, HAVING, GROUP BY */

SELECT MIN(UnitPrice) AS 'Precio minimo', 
MAX(UnitPrice) AS 'Precio maximo' 
FROM [dbo].[Order Details]

SELECT * FROM [dbo].[Order Details]

SELECT COUNT(*) FROM [dbo].[Order Details]

SELECT SUM(UnitPrice) FROM [dbo].[Order Details]

SELECT AVG(UnitPrice) FROM [dbo].[Order Details]

/*Filtra la informacion de acuerdo a una funcion de agrupamiento
que se ocupa*/
SELECT columna1, COUNT(*)
FROM tabla
GROUP BY columna1
HAVING COUNT(*) > 10;  -- Solo incluye grupos con más de 10 filas


CREATE VIEW VENTAS_X_DIA AS
SELECT  DISTINCT P.ProductName, P.ProductID, P.ProductName, COUNT(OD.ProductID) as 'CANT. VENDIDO', SUM(OD.UnitPrice) AS 'VENTAS X DIA'
FROM [dbo].[Order Details] OD
INNER JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.ProductName NOT LIKE 'T%'
GROUP BY P.ProductID, OD.ProductID, P.ProductName
HAVING COUNT(OD.ProductID) > 5
GO

SELECT * FROM VENTAS_X_DIA  ORDER BY ProductID ASC


SELECT * FROM [dbo].[Order Details]
SELECT * FROM Products

SELECT MAX(ProductID) FROM [dbo].[Order Details] 

GROUP BY OrderID
HAVING COUNT(UnitPrice) > 2 


SELECT * FROM [dbo].[Order Details]


/**********************OPERADORES DE COMPRACION***********************/
/*
Igual a (=): Compara si dos valores son iguales.

Ejemplo: WHERE columna1 = 'valor'
Diferente de (<> o !=): Compara si dos valores son diferentes.

Ejemplo: WHERE columna1 <> 'valor' o WHERE columna1 != 'valor'
Mayor que (>): Compara si el valor de la izquierda es mayor que el de la derecha.

Ejemplo: WHERE columna1 > 10
Menor que (<): Compara si el valor de la izquierda es menor que el de la derecha.

Ejemplo: WHERE columna1 < 10
Mayor o igual que (>=): Compara si el valor de la izquierda es mayor o igual al de la derecha.

Ejemplo: WHERE columna1 >= 10
Menor o igual que (<=): Compara si el valor de la izquierda es menor o igual al de la derecha.

Ejemplo: WHERE columna1 <= 10
Entre (BETWEEN ... AND ...): Compara si un valor está dentro de un rango especificado, incluyendo los límites.

Ejemplo: WHERE columna1 BETWEEN 10 AND 20
En (IN): Comprueba si un valor está dentro de un conjunto de valores.

Ejemplo: WHERE columna1 IN (1, 2, 3, 4)
Como (LIKE): Compara un valor con un patrón. Se usa comúnmente para búsquedas de texto.

Ejemplo: WHERE columna1 LIKE 'A%' (busca valores que comienzan con 'A')
Es nulo (IS NULL): Comprueba si un valor es nulo.

Ejemplo: WHERE columna1 IS NULL
No es nulo (IS NOT NULL): Comprueba si un valor no es nulo.

Ejemplo: WHERE columna1 IS NOT NULL
*/











