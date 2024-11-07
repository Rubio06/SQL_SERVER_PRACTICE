

USE Instnwnd
SELECT * FROM Categories
use [Instnwnd]

GO
SELECT S.CompanyName,COUNT(P.SupplierID) AS 'TOTAL_PRODUCTS' FROM Products P 
INNER JOIN Suppliers S 
ON P.SupplierID = S.SupplierID 
WHERE S.CompanyName = 'Exotic Liquids'
GROUP BY S.CompanyName

GO
SELECT * FROM Products
SELECT * FROM Suppliers


/*VIEW: Las vistas en SQL Server son consultas almacenadas que permiten 
acceder a datos específicos de una o varias tablas como si fueran una sola tabla virtual. 
Aunque no contienen datos propios, las vistas presentan una estructura simplificada o personalizada 
de los datos de base y se actualizan automáticamente al consultar las tablas subyacentes.*/
GO
CREATE VIEW CONSULTA_PRODUCT
AS 
SELECT S.SupplierID, S.CompanyName,COUNT(P.SupplierID) AS 'TOTAL_PRODUCTS' FROM Products P 
INNER JOIN Suppliers S 
ON P.SupplierID = S.SupplierID 
GROUP BY S.SupplierID, S.CompanyName

GO
SELECT * FROM CONSULTA_PRODUCT




/*PROCEDIMIENTO ALMACENADO*/

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


/*CLAUSULA DISTINC*/

SELECT DISTINCT * FROM Products


USE Instnwnd

/*CLUSTERED: En SQL Server, los índices clustered son una estructura de almacenamiento especial 
que organiza físicamente los datos de una tabla en el disco en función del orden de uno o más campos 
especificados. Solo puede existir un índice clustered por tabla, 
ya que este índice define la organización física de los datos en esa tabla*/

-- code_primary identity(1,1) primary key CLUSTERED
GO
CREATE CLUSTERED INDEX IXD_Territories
ON [dbo].[Territories]([TerritoryDescription]);

SELECT * FROM Territories

/*Non-Clustered: No afecta la organización física; utiliza una estructura separada que 
contiene las claves de índice y apuntadores a las filas de datos,
el nom-clustering se ejecuta en filtros para buscar 
*/

GO
CREATE NONCLUSTERED INDEX NIXD_Territories
ON [dbo].[Territories]([TerritoryID])

EXEC sp_helpindex 'Territories'

/*DISTINCT: Para mostrar datos no repetidos de un campo*/

SELECT * FROM [dbo].[Suppliers]
SELECT * FROM Products

SELECT DISTINCT Region FROM [dbo].[Suppliers]

/*CAST: CONVIERTE UN TIPO DE DATO A OTRO*/
SELECT ProductName + ' - ' + QuantityPerUnit + ' - ' + 
CAST(GETDATE() as VARCHAR(50)) AS "DATA_STOCK" FROM Products




SELECT * FROM Products
