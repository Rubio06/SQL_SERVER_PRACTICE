/*TRAE DATOS SOBRE LA TABLA*/
SELECT * FROM sys.tables;
GO

/*CAMBIANDO NOMBRE DE LA TABLA*/
EXEC sp_rename 'Categorie', 'Categories'
GO

/*ME TRAE LOS 10 PRIMEROS REGISTROS DE UNA BASE DE DATOS*/
SELECT TOP(10)* FROM Categories
SELECT TOP 50 PERCENT * FROM Categories


ALTER TABLE Categories ADD CatePrueba VARCHAR(50)
GO

ALTER TABLE Categories DROP COLUMN CatePrueba
GO
INSERT INTO Categories (CategoryName, Description, Picture) SELECT CategoryName, Description, Picture FROM Categories



