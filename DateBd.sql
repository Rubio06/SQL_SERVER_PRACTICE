-- QUERYS PRACTICE TAMBO
WITH VentaDiariaPromedio AS (
    SELECT 
        A.IdTienda,
        TdaNombre,
        DATEDIFF(DAY, TdaFechaApertura, GETDATE()) AS DiasApertura,
        DATEPART(DAYOFYEAR, GETDATE()) AS DiasTranscurridos,
        SUM(VentaSinIGV) AS VentaTotal,
        -- Calcular el menor entre los días que la tienda ha estado abierta y los días transcurridos en el año
        CASE 
            WHEN DATEDIFF(DAY, TdaFechaApertura, GETDATE()) < DATEPART(DAYOFYEAR, GETDATE()) 
            THEN DATEDIFF(DAY, TdaFechaApertura, GETDATE()) 
            ELSE DATEPART(DAYOFYEAR, GETDATE()) 
        END AS DiasReferencia
    FROM  
        BDBI_ARU.dbo.Fact_Venta A
    LEFT JOIN 
        BDBI_ARU.dbo.Tienda B ON A.IdTienda = B.IdTienda 
    LEFT JOIN 
        BDBI_ARU.dbo.Producto C ON C.IdProducto = A.IdProducto
    WHERE 
        (TdaClasifOper LIKE 'SSS%' OR TdaClasifOper = 'Nuevas')
        AND DptoProd NOT IN ('GASTOS', 'OFIC.MOLINA', 'BOLSAS', 'OTROS', 'REGALOS', 'TESTERS')
        AND IdModalidad IN (0)
        AND IdTiempo >=  (YEAR(GETDATE()) - 2000) * 10000 + 101
    GROUP BY 
        A.IdTienda,
        TdaNombre,
        TdaFechaApertura
)
SELECT 
    IdTienda,
    TdaNombre,
    DiasReferencia,
    RANK() OVER (ORDER BY VentaTotal / CAST(DiasReferencia AS DECIMAL(10,2)) DESC) AS Ranking
FROM 
    VentaDiariaPromedio
ORDER BY 
    Ranking;


