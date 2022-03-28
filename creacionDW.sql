create table dim_geografia(
	geografia_key int primary key identity(1,1) NOT NULL,
	codigo_municipio [varchar](5) NOT NULL,
	nombre_municipio [varchar](50) NOT NULL,
	codigo_departamento [varchar](2) NOT NULL,
	nombre_departamento [varchar](50) NOT NULL,
	latitud [varchar](25) NULL,
	longitud [nvarchar](25) NOT NULL,
	inactivo bit NOT NULL,
	fecha_evento_registro [datetime] NOT NULL
)

create table dim_afiliado(
	afiliado_key int primary key identity(1,1) NOT NULL,
	tipo_documento [varchar](10) NOT NULL,
	numero_documento [varchar](50) NOT NULL,
	apellidos_afiliado [varchar](255) NOT NULL,
	nombres_afiliado [varchar](255) NOT NULL,
	email_afiliado [varchar](255) NOT NULL,
	movil_afiliado [varchar](12) NOT NULL,
	geografia_key int NOT NULL,
	inactivo bit NOT NULL,
	fecha_evento_registro [datetime] NOT NULL
)

ALTER TABLE [dbo].[dim_afiliado]  WITH CHECK ADD  CONSTRAINT [FK_DimAfiliado_DimGeografia] FOREIGN KEY([geografia_key])
REFERENCES [dbo].[dim_geografia] ([geografia_key])
GO

ALTER TABLE [dbo].[dim_afiliado] CHECK CONSTRAINT [FK_DimAfiliado_DimGeografia]
GO

create table dim_operador(
	operador_key int primary key identity(1,1) NOT NULL,
	codigo_operador [varchar](10) NOT NULL,
	nombre_operador [varchar](255) NOT NULL,
	nombre_corto_operador [varchar](10) NOT NULL,
	descripcion_operador varchar(500) NOT NULL,
	inactivo bit NOT NULL,
	fecha_evento_registro [datetime] NOT NULL
)

create table dim_tiempo(
	tiempo_key [int] PRIMARY KEY NOT NULL,
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
	fecha_evento_registro [datetime] NOT NULL
)
create table dim_estado_solicitud(
	estado_solicitud_key [int] PRIMARY KEY NOT NULL,
	descripcion_estado_solicitud_id [varchar](20) NULL,
	fecha_evento_registro [datetime] NOT NULL	
)

create table fact_operaciones_libranza(
	operaciones_libranza_key [int] IDENTITY(1,1) NOT NULL,
	tiempo_key [int] NOT NULL,
	operador_key [int] NOT NULL,
	afiliado_key [int] NOT NULL,
	estado_solicitud_key [int] NOT NULL,
	plazo_credito int NOT NULL,
	monto_solicitud bigint NOT NULL,
	valor_cuota int NOT NULL,
	fecha_solicitud datetime NOT NULL,
	fecha_evento_registro [datetime] NOT NULL
)
ALTER TABLE [dbo].[fact_operaciones_libranza]  WITH CHECK ADD  CONSTRAINT [FK_FactOperaciones_DimTiempo] FOREIGN KEY([tiempo_key])
REFERENCES [dbo].[dim_tiempo] ([tiempo_key])
GO

ALTER TABLE [dbo].[fact_operaciones_libranza] CHECK CONSTRAINT [FK_FactOperaciones_DimTiempo]
GO

ALTER TABLE [dbo].[fact_operaciones_libranza]  WITH CHECK ADD  CONSTRAINT [FK_FactOperaciones_DimOperador] FOREIGN KEY([operador_key])
REFERENCES [dbo].[dim_operador] ([operador_key])
GO

ALTER TABLE [dbo].[fact_operaciones_libranza] CHECK CONSTRAINT [FK_FactOperaciones_DimOperador]
GO

ALTER TABLE [dbo].[fact_operaciones_libranza]  WITH CHECK ADD  CONSTRAINT [FK_FactOperaciones_DimAfiliado] FOREIGN KEY([afiliado_key])
REFERENCES [dbo].[dim_afiliado] ([afiliado_key])
GO

ALTER TABLE [dbo].[fact_operaciones_libranza] CHECK CONSTRAINT [FK_FactOperaciones_DimAfiliado]
GO