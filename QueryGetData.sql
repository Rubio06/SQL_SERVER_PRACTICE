-- Declarar las variables
DECLARE @FechaActual DATETIME;
DECLARE @FechaInicio DATETIME;
DECLARE @FechaFin DATETIME;

-- Asignar la fecha y hora actual a @FechaActual
SET @FechaActual = '2024-01-01';

-- Calcular el primer día del mes actual
SET @FechaInicio = cast(DATEFROMPARTS(YEAR(@FechaActual), MONTH(@FechaActual), 1) as datetime);

-- Calcular el último día del mes actual
SET @FechaFin = DATEADD(MILLISECOND, -3, cast(EOMONTH(@FechaActual) as datetime) + 1);

-- Mostrar los resultados
SELECT 
    @FechaActual AS FechaActual,
    @FechaInicio AS FechaInicio,
    @FechaFin AS FechaFin;




-- Declarar las variables de fecha
DECLARE @CurrentDate DATETIME;
DECLARE @StartDate DATETIME;
DECLARE @EndDate DATETIME;

-- Asignar la fecha actual
SET @CurrentDate = GETDATE();

-- Calcular el primer día del mes anterior
SET @StartDate = DATEADD(MONTH, DATEDIFF(MONTH, 0, @CurrentDate) - 1, 0);

-- Calcular el último día del mes anterior
SET @EndDate = DATEADD(MILLISECOND, -3, cast(EOMONTH(@CurrentDate) as datetime) + 1);

-- Mostrar las fechas calculadas
SELECT 
    @CurrentDate AS FechaActual,
    @StartDate AS FechaInicio,
    @EndDate AS FechaFin;
