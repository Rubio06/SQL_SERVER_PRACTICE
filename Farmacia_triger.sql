delete from Products
select * from Products

alter table Products add status nvarchar(50)
 
go
update products set status = 'Activo' where CodeProduct = 5

drop table Lg_Historial
go

CREATE TABLE Lg_Historial(
	CodeHistorial int primary key identity(1, 1),
	ProductID nvarchar(50),
	Product nvarchar(50),
	CurrentDate datetime,
	Administrator varchar(50),
	Descriptions nvarchar(50) 
) 

drop trigger TR_PRODUCTS_INSERT

-- TRIGER PARA INSERCION
go
CREATE TRIGGER TR_PRODUCTS_INSERT
ON Products
FOR INSERT 
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Lg_Historial(ProductID, Product, currentDate, administrator, descriptions) 
	SELECT CONCAT('P', RIGHT('0000' + CAST(CodeProduct AS NVARCHAR), 4)), Product, getdate(), SUSER_SNAME(), 'OPERACION DE INSERTAR' 
	FROM INSERTED 
END

-- DELETE TRIGER
go
CREATE TRIGGER TR_PRODUCTS_DELETE
ON Products
AFTER DELETE 
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Lg_Historial(ProductID, Product, currentDate, administrator, descriptions) 
    SELECT CONCAT('P', RIGHT('0000' + CAST(CodeProduct AS NVARCHAR), 4)), Product, GETDATE(), SUSER_SNAME(), 'OPERACION DE ELIMINACION' 
    FROM deleted;
END;

drop trigger TR_PRODUCTS_DELETE


DBCC CHECKIDENT ('Lg_Historial', RESEED, 0)
select * from Lg_Historial
select * from Products


DROP TABLE Products
CREATE TABLE Products (
    CodeProduct INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    ProductID AS ('P' + RIGHT('0000' + CONVERT(VARCHAR, CodeProduct), 4)) PERSISTED,
    Product VARCHAR(50),
    ActivePrinciple VARCHAR(50),
    CodeCategory1 INT, 
    CodeLaboratory1 INT,
    Description VARCHAR(100),
    Quantity INT,
    PackagePrice DECIMAL(10, 2),
    UnitPrice DECIMAL(10, 2),
	EntryDate datetime
    CONSTRAINT PK_CATEGORY1 FOREIGN KEY (CodeCategory1) REFERENCES Category(CodeCategory) on delete cascade,
    CONSTRAINT PK_LABORATORY1 FOREIGN KEY (CodeLaboratory1) REFERENCES Laboratory(CodeLaboratory) on delete cascade
);

select * from Products