
/*
	CREATE TABLE [dbo].[dim_tiempo](
	[tiempo_key] [int] NOT NULL,
	[anio] [int] NOT NULL,
	[mes] [varchar](20) NOT NULL,
	[numero_mes] [int] NOT NULL,
	[dia] [int] NOT NULL,
	[numero_dia_semana] [int] NULL,
	[dia_semana] [varchar](10) NULL,
	[es_festivo] [bit] NULL,
	[numero_semana] [int] NULL,
	[fecha] [date] NULL,
	[semestre] [varchar](10) NULL,
	[trimestre] [varchar](10) NULL,
	[periodo] [varchar](10) NULL,
	[fecha_evento_registro] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tiempo_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

*/
CREATE PROCEDURE CargarDatos_DW_DIM_TIEMPO(
	@fecha_ini date = '2018-01-01'
	, @fecha_fin date = '2022-12-31'
)
AS
Begin
	SET LANGUAGE Spanish
	declare @fechas_tabla table (
		fecha date
	)

	declare @dias_diferencia int = DATEDIFF(DAY, @fecha_ini, @fecha_fin)	-- Obtener los dias de diferencia
	declare @index int = 0
	declare @fecha_aux date

	-- select @fecha_ini, @fecha_fin, @dias_diferencia
	WHILE @index <= @dias_diferencia BEGIN

		set @fecha_aux = DATEADD(DAY, @index, @fecha_ini)
		insert into @fechas_tabla (fecha)
		values ( @fecha_aux )

		SET @index = @index + 1 
	END 

	-- Truncar la tabla antes de insertar datos
	--TRUNCATE TABLE [dbo].[dim_tiempo];

	INSERT INTO [dbo].[dim_tiempo] ( [tiempo_key], fecha, anio, mes, numero_mes, dia,numero_dia_semana,dia_semana,numero_semana,semestre, trimestre, periodo,fecha_evento_registro )
	SELECT 
		CAST( DATEPART( yyyy, fecha  ) AS VARCHAR ) 
			+  Right('0' + Cast(  DATEPART( mm, fecha) As varchar(5)), 2)
			+  Right('0' + Cast(  DATEPART( dd, fecha) As varchar(5)), 2) AS 'ID_FECHA'
		, fecha 
		, DATEPART( yyyy, fecha  ) as 'anio'
		, Right('0' + Cast(  DATENAME(month, fecha) As varchar(5)), 2) AS 'MES'
		, Right('0' + Cast(  DATEPART( mm, fecha) As varchar(5)), 2) AS 'NUMERO_MES'
		, Right('0' + Cast(  DATEPART( dd, fecha) As varchar(5)), 2) AS 'DIA'
		, DATEPART( dw, fecha  ) as 'dia_number'
		, CASE 
			WHEN ( DATEPART( dw, fecha  ) = 1 ) THEN 
				'Lunes'
			WHEN ( DATEPART( dw, fecha  ) = 2 ) THEN 
				'Martes'
			WHEN ( DATEPART( dw, fecha  ) = 3 ) THEN 
				'Miércoles'
			WHEN ( DATEPART( dw, fecha  ) = 4 ) THEN 
				'Jueves'
			WHEN ( DATEPART( dw, fecha  ) = 5 ) THEN 
				'Viernes'
			WHEN ( DATEPART( dw, fecha  ) = 6 ) THEN 
				'Sábado'
			WHEN ( DATEPART( dw, fecha  ) = 7 ) THEN 
				'Domingo'
			END as 'dia_semana_desc'
		
		,DATEPART(wk , fecha) AS 'NUMERO_SEMANA'
		,case when (Cast(  DATEPART( mm, fecha) As int))<7 then 'PRIMERO' else 'SEGUNDO' end AS 'SEMESTRE'
		, case when (Right('0' + Cast(  DATEPART( Qq, fecha) As varchar(5)), 2))=1 then 'Primero'
			when (Right('0' + Cast(  DATEPART( Qq, fecha) As varchar(5)), 2))=2 then 'Segundo'
			when (Right('0' + Cast(  DATEPART( Qq, fecha) As varchar(5)), 2))=3 then 'Tercero'
			when (Right('0' + Cast(  DATEPART( Qq, fecha) As varchar(5)), 2))=4 then 'Cuarto' end
			AS 'TRIMESTRE'
		, CAST( DATEPART( yyyy, fecha  ) AS VARCHAR ) 
			+ '-' +  Right('0' + Cast(  DATEPART( mm, fecha) As varchar(5)), 2) AS 'PERIODO'
		,getdate() AS 'fecha_evento_registro'
		
		
		
	FROM @fechas_tabla


END -- Cerrar procedimiento

/*
EXEC CargarDatos_DW_DIM_TIEMPO 

EXEC CargarDatos_DW_DIM_TIEMPO 
	@fecha_ini = '2018-01-01'
	, @fecha_fin = '2022-12-31'
*/








