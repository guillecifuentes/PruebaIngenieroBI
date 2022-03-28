USE [STG_p01]
GO

/****** Object:  Table [dbo].[OperacionesLibranza]    Script Date: 27/03/2022 10:50:30 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stg_OperacionesLibranza](
	[operacion_id] [int] NOT NULL,
	[fecha_operacion] [datetime] NOT NULL,
	[operador_libranza_id] [int] NOT NULL,
	[codigo_operador] [varchar](10) NOT NULL,
	[operador_libranza] [varchar](255) NOT NULL,
	[nombre_corto_operador] [varchar](10) NULL,
	[descripcion_operador] [text] NULL,
	[inactivo_operador] [bit] NOT NULL,
	[afiliado_id] [int] NOT NULL,
	[tipo_documento_afiliado] [varchar](10) NOT NULL,
	[numero_documento_afiliado] [varchar](50) NOT NULL,
	[nombre_afiliado] [varchar](255) NOT NULL,
	[apellido_afiliado] [varchar](255) NOT NULL,
	[email_afiliado] [varchar](255) NOT NULL,
	[movil_afiliado] [varchar](12) NOT NULL,
	[codigo_municipio_afiliado] [varchar](10) NOT NULL,
	[municipio_afiliado] [varchar](255) NOT NULL,
	[codigo_departamento_afiliado] [varchar](10) NOT NULL,
	[departamento_afiliado] [varchar](255) NOT NULL,
	[inactivo_afiliado] [bit] NOT NULL,
	[plazo_solicitud] [int] NOT NULL,
	[monto_solicitud] [bigint] NOT NULL,
	[valor_cuota_solicitud] [int] NOT NULL,
	[estado_solicitud] [int] NOT NULL,
	[estado_operacion] [varchar](11) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


