/* VISTAS EN SQL SERVER VIEW */

USE Instnwnd
SELECT * FROM Categories
use [Instnwnd]

GO
SELECT S.CompanyName,COUNT(P.SupplierID) AS 'TOTAL_PRODUCTS' FROM Products P 
INNER JOIN Suppliers S 
ON P.SupplierID = S.SupplierID 

GROUP BY S.CompanyName

GO
SELECT * FROM Products
SELECT * FROM Suppliers


GO
CREATE VIEW CONSULTA_PRODUCT
AS 
SELECT S.SupplierID, S.CompanyName,COUNT(P.SupplierID) AS 'TOTAL_PRODUCTS' FROM Products P 
INNER JOIN Suppliers S 
ON P.SupplierID = S.SupplierID 
GROUP BY S.SupplierID, S.CompanyName

GO
SELECT * FROM CONSULTA_PRODUCT




/**/
GO
DROP PROC SP_RELACION_TABLA


GO
CREATE PROC SP_RELACION_TABLA
@NameTable VARCHAR(50)
AS 
BEGIN 
	SELECT 
		fk.name AS ForeignKeyName,
		tp.name AS ParentTable,
		cp.name AS ParentColumn,
		tr.name AS ReferencedTable,
		cr.name AS ReferencedColumn
	FROM 
		sys.foreign_keys AS fk
	INNER JOIN 
		sys.foreign_key_columns AS fkc ON fk.object_id = fkc.constraint_object_id
	INNER JOIN 
		sys.tables AS tp ON fkc.parent_object_id = tp.object_id
	INNER JOIN 
		sys.columns AS cp ON fkc.parent_object_id = cp.object_id AND fkc.parent_column_id = cp.column_id
	INNER JOIN 
		sys.tables AS tr ON fkc.referenced_object_id = tr.object_id
	INNER JOIN 
		sys.columns AS cr ON fkc.referenced_object_id = cr.object_id AND fkc.referenced_column_id = cr.column_id
	WHERE 
		tp.name = @NameTable OR tr.name = @NameTable;
END

EXEC SP_RELACION_TABLA 'Products'




