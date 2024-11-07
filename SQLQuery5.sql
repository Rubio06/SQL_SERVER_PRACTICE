/****************** SUB CONSULTAS EN SQL SERVER *******************/
/*Las subconsultas (también conocidas como consultas anidadas) son consultas 
SQL que se colocan dentro de otra consulta para ayudar a realizar operaciones 
complejas o recuperar datos de forma condicional. Son particularmente útiles para dividir 
consultas en partes más pequeñas y manejables, permitiendo calcular o filtrar datos dentro de otra consulta.
*/

USE [Instnwnd]


SELECT SUM(UnitPrice) FROM Products

SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice > (SELECT SUM(UnitPrice)/100  FROM Products)

SELECT P.ProductName
FROM Products P
WHERE P.ProductID IN (SELECT P.ProductID FROM Products P WHERE P.ProductName NOT IN ('Chai', 'Chang'));


SELECT ProductName, AVG(UnitPrice) AS salario_promedio
FROM (SELECT ProductName, UnitPrice FROM Products) AS dept_salarios
GROUP BY ProductName;


SELECT P1.ProductName, P1.UnitPrice
FROM Products P1
WHERE P1.UnitPrice > (SELECT AVG(P2.UnitPrice) FROM Products P2 WHERE P2.ProductID = P1.ProductID);

/*CASE */
GO
SELECT P.ProductID, P.ProductName, P.UnitPrice, 
CASE
	WHEN P.UnitPrice >= 101.00 THEN 'CON DESCUENTO'
	WHEN P.UnitPrice <= 100.00 THEN 'SIN DESCUENTO'
	ELSE 'PRODUCTO NORMAL'
END 
AS Producto 
FROM Products P


GO
SELECT ShipName, ShipRegion FROM Orders
ORDER BY (
	CASE
		WHEN ShipRegion IS NULL then ShipCity
		ELSE ShipCity
	END
)


