---SALES 
GO
CREATE PROC SP_SALES 
AS 
DECLARE @CurrentDate DATETIME;
DECLARE @StartDate DATETIME;
DECLARE @EndDate DATETIME;

SET @CurrentDate = GETDATE();

SET @StartDate = DATEADD(MONTH, DATEDIFF(MONTH, 0, @CurrentDate) - 1, 0);

SET @EndDate = DATEADD(MILLISECOND, -3, cast(EOMONTH(@CurrentDate) as datetime) + 1);

BEGIN 
    DELETE FROM [dbo].[ventas] WHERE SALESDATE BETWEEN @StartDate AND @EndDate;

    INSERT INTO [dbo].[ventas]
           ([StoreNo]
           ,[ReceiptId]
           ,[SalesDate]
           ,[SubTotal]
           ,[PayTotal]
           ,[DiscPercentCabecera]
           ,[DiscTotal]
           ,[DiscTotalWTax]
           ,[SKU]
           ,[Qty]
           ,[RetailPrice]
           ,[OriginalPriceLine]
           ,[ExtRetailPrice]
           ,[ExtCost]
           ,[AvgCost]
           ,[TaxAmount]
           ,[DiscAmount]
           ,[Package]
           ,[LineDescription]
           ,[OriginalPriceWTax]
           ,[RetailPriceWTax]
           ,[ExtRetailPriceWTax]
           ,[DiscAmountWTax]
           ,[PriceLevelId]
           ,[NonInventory]
           ,[PromoId])

    SELECT R.[StoreNo]
          ,R.[ReceiptId]
          ,R.[SalesDate]
          ,[SubTotal]
          ,[PayTotal]
          ,R.DiscPercent AS DiscPercentCabecera 
          ,[DiscTotal]
          ,[DiscTotalWTax]
          ,[SKU]
          ,[Qty]
          ,[RetailPrice]
          ,RL.OriginalPrice AS OriginalPriceLine
          ,[ExtRetailPrice]
          ,[ExtCost]
          ,[AvgCost]
          ,[TaxAmount]
          ,[DiscAmount]
          ,[Package]
          ,[LineDescription]
          ,[OriginalPriceWTax]
          ,[RetailPriceWTax]
          ,[ExtRetailPriceWTax]
          ,[DiscAmountWTax]
          ,[PriceLevelId]
          ,[NonInventory]
          ,[PromoId]
    FROM [10.180.11.118].RETAILDATA.DBO.VIEWRECEIPT R
    INNER JOIN [10.180.11.118].RETAILDATA.DBO.RECEIPT_LINE RL 
        ON R.STORENO = RL.STORENO 
        AND R.RECEIPTID = RL.RECEIPTID
    WHERE R.SALESDATE BETWEEN @StartDate AND @EndDate
        AND RL.SALESDATE BETWEEN @StartDate AND @EndDate
        AND R.STATUSCODE = 'A' 
        AND R.SALESCODE IN ('R', 'S')
END;


-- PRODUCTS
CREATE PROC SP_PRODUCTS
AS
BEGIN
--TRUNCATE TABLE  [dbo].[Promocion]
--GO

INSERT INTO [Tambo2022].[dbo].[Promocion]
SELECT
	  p.[PromoId]
      ,p.[PromoName]
      ,p.[ReasonCode]
      ,p.[StartDate]
      ,p.[EndDate]
      ,p.[GetPercentOff]
      ,p.[GetMoneyOff]
      ,p.[Qty1]
      ,p.[PromotionalCode]
      ,p.[CreationDate]
      ,p.[ChangeDate]
      ,p.[CreatedBy]
from [10.180.11.118].retaildata.dbo.PROMO p
left join Promocion pro on pro.PromoId = p.promoid
where --promoid not in (select distinct PromoId from Promocion)
pro.PromoId is null


 

  --TRUNCATE TABLE  [dbo].[Promocion_detalle]
  --GO

INSERT INTO [Tambo2022].[dbo].[Promocion_detalle]
SELECT
	  pitem.[PromoId]
	  ,pitem.[SKU]
      ,pitem.[Deleted]
      ,pitem.[Price]
      ,pitem.[GroupNo]
      ,pitem.[GroupQty]
from [10.180.11.118].retaildata.dbo.PROMO_ITEMS pitem
left join [Tambo2022].[dbo].[Promocion_detalle] pd on pitem.promoid = pd.PromoId and pitem.sku=pd.SKU
where pd.PromoId is null
--where promoid not in (select distinct PromoId from Promocion_detalle)



--TRUNCATE TABLE Proveedor
--GO

INSERT INTO [Tambo2022].[dbo].Proveedor
SELECT v.[VendorCode]
      ,v.[VendorName]
      ,v.[Info2]
      ,v.[Info1]
      ,v.[Deleted]
  FROM [10.180.11.118].retaildata.dbo.[VENDOR] v
  left join Proveedor pro on pro.VendorCode = v.vendorcode
where --vendorcode not in (select distinct vendorcode from [Tambo2022].[dbo].Proveedor )
	pro.VendorCode is null


TRUNCATE TABLE Productos

 insert into Tambo2022.dbo.Productos 
select fv.StyleCode,	SKU,	fv.StyleName,	fv.Desc1,	StatusCode,	fv.BrandCode,	fv.Desc3,	CaseQty,	PackQty,	Height,	Weight,	fv.DeptCode,	DeptName,	
fv.ClassCode,	ClassName,	fv.SubClassCode,	SubClassName, PU5.UDF5Description as Familia, PU3.UDF3Description as Marca
from  [10.180.11.118].retaildata.dbo.filter_view fv 
inner join  [10.180.11.118].retaildata.dbo.style_detail_view sdv on fv.stylecode = sdv.stylecode
LEFT JOIN  [10.180.11.118].retaildata.dbo.PRODUCT_UDF3 PU3 on PU3.udf3 = sdv.udf3
LEFT JOIN  [10.180.11.118].retaildata.dbo.PRODUCT_UDF5 PU5 on PU5.udf5 = sdv.udf5

END