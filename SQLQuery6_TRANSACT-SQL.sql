/*****************TRANSACT SQL***************************/
/*BULK INSERT: PERMITE CARGAR REGISTROS QUE YA EXISTEN EN ARCHIVOS
EXTERNOS*/

create table users(
	NOMBRE VARCHAR(100),
	APELLIDO INT,
)

SELECT * FROM users

GO
BULK INSERT 
users
FROM 'C:\Users\inoc.rubio\Desktop\northwind\archivo_con_bordes.txt'
with(
    FIELDTERMINATOR = 'carácter_delimitador',
    ROWTERMINATOR = 'carácter_final_de_fila',
    FIRSTROW = 2
)

GO
BULK INSERT Personas
FROM 'C:\ruta\del\archivo\datos.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,  -- Empieza desde la segunda fila (para omitir encabezados)
    ERRORFILE = 'C:\ruta\del\archivo\errores.log',
    MAXERRORS = 5,
    TABLOCK
);

SELECT ROW_NUMBER() OVER(ORDER BY UnitPrice) AS NumeroFila,
OrderID,
ProductID,
UnitPrice
FROM [dbo].[Order Details]

/*CONTROL DE FLUJO TRANSACT SQL BLOQUES DE SENTENCIAS*/
CREATE TABLE Prueba(
	campo_one int,
	campo_two int
)


IF EXISTS(SELECT * FROM [dbo].[Order Details] WHERE UnitPrice = 2.00)
	SELECT * FROM [dbo].[Order Details] WHERE UnitPrice = 2.00
ELSE
	SELECT 'NO HAY ARTICULOS' AS RESULTADO


SELECT * FROM sys.objects WHERE name = 'Prueba'

IF OBJECT_ID('Prueba') IS NOT NULL
	DROP TABLE Prueba
ELSE 
	PRINT('LA TABLA NO EXISTE')



SELECT * FROM [dbo].[Order Details]
SELECT * FROM Products

IF EXISTS(SELECT * FROM [dbo].[Order Details] WHERE UnitPrice > 80)
	--DESCUENTO DE 20 SOLES
	SELECT OD.ProductID, P.ProductName, SUM(OD.UnitPrice) AS COSTO_PRODUCTOS, COUNT(OD.ProductID) AS TOTAL_PRODUCTO  
	FROM [dbo].[Order Details] OD 
	INNER JOIN Products P ON OD.ProductID = P.ProductID  
	WHERE OD.UnitPrice > 80
	GROUP BY OD.ProductID, P.ProductName ORDER BY P.ProductName ASC;

	--WHERE P.ProductName = 'Mishi Kobe Niku'
ELSE
	SELECT 'NO HAY DESCUENTO'


SELECT * FROM Region

SELECT * FROM Suppliers


-- UPDATE Suppliers SET Region = @REGION WHERE Region IS NULL
DECLARE @REGION VARCHAR(50)

SET @REGION = 'CAMPO'

IF EXISTS (SELECT * FROM Suppliers WHERE Region IS NULL)
	BEGIN
		UPDATE Suppliers 
		SET Region = @REGION 
		WHERE Region IS NULL
	END
ELSE 
	BEGIN
		UPDATE Suppliers 
		SET Region = NULL 
		WHERE Region = @REGION
	END

SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Suppliers';

GO
CREATE PROCEDURE VerificarStock
    @ProductoID INT,
    @Cantidad INT
AS
BEGIN
    DECLARE @StockDisponible INT;

    -- Supongamos que tenemos una tabla llamada "Inventario"
    SELECT @StockDisponible = Stock FROM Inventario WHERE ProductoID = @ProductoID;

    IF @StockDisponible >= @Cantidad
		BEGIN
			PRINT 'Stock suficiente';
		END
    ELSE
		BEGIN
			PRINT 'Stock insuficiente';
		END
END






SELECT * FROM Products WHERE ProductName = 'Mishi Kobe Niku'

--465.60
SELECT SUM([dbo].[Order Details].UnitPrice) FROM [dbo].[Order Details] INNER JOIN
Products ON [dbo].[Order Details].ProductID = Products.ProductID WHERE Products.ProductName = 'Mishi Kobe Niku'




SELECT 
    OD.ProductID,
	P.ProductName,
	COUNT(OD.ProductID)
FROM 
    [dbo].[Order Details] OD 
INNER JOIN 
    Products P ON OD.ProductID = P.ProductID  
GROUP BY OD.ProductID, P.ProductName


