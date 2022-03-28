USE [master]
GO
/****** Object:  Database [p01]    Script Date: 7/12/2021 11:30:38 AM ******/
CREATE DATABASE [p01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'p01', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\p01.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'p01_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\p01_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [p01] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [p01].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [p01] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [p01] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [p01] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [p01] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [p01] SET ARITHABORT OFF 
GO
ALTER DATABASE [p01] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [p01] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [p01] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [p01] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [p01] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [p01] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [p01] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [p01] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [p01] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [p01] SET  DISABLE_BROKER 
GO
ALTER DATABASE [p01] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [p01] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [p01] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [p01] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [p01] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [p01] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [p01] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [p01] SET RECOVERY FULL 
GO
ALTER DATABASE [p01] SET  MULTI_USER 
GO
ALTER DATABASE [p01] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [p01] SET DB_CHAINING OFF 
GO
ALTER DATABASE [p01] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [p01] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [p01] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [p01] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'p01', N'ON'
GO
ALTER DATABASE [p01] SET QUERY_STORE = OFF
GO
USE [p01]
GO
/****** Object:  Table [dbo].[Afiliados]    Script Date: 7/12/2021 11:30:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Afiliados](
	[AfiliadoId] [int] IDENTITY(1,1) NOT NULL,
	[TDIId] [int] NOT NULL,
	[NDI] [varchar](50) NOT NULL,
	[Apellidos] [varchar](255) NOT NULL,
	[Nombres] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[Movil] [varchar](12) NOT NULL,
	[MunicipioResidenciaId] [int] NOT NULL,
	[Inactivo] [bit] NOT NULL,
 CONSTRAINT [PK_Afiliados] PRIMARY KEY CLUSTERED 
(
	[AfiliadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 7/12/2021 11:30:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[DepartamentoId] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](10) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Inactivo] [bit] NOT NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[DepartamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipios]    Script Date: 7/12/2021 11:30:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipios](
	[MunicipioId] [int] IDENTITY(1,1) NOT NULL,
	[DepartamentoId] [int] NOT NULL,
	[Codigo] [varchar](10) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Inactivo] [bit] NOT NULL,
 CONSTRAINT [PK_Municipios] PRIMARY KEY CLUSTERED 
(
	[MunicipioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperacionesLibranza]    Script Date: 7/12/2021 11:30:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperacionesLibranza](
	[OperacionId] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[OperadorLibranzaId] [int] NOT NULL,
	[AfiliadoId] [int] NOT NULL,
	[Plazo] [int] NOT NULL,
	[Monto] [bigint] NOT NULL,
	[ValorCuota] [int] NOT NULL,
	[EstadoSolicitud] [int] NOT NULL,
 CONSTRAINT [PK_OperacionesLibranza] PRIMARY KEY CLUSTERED 
(
	[OperacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperadoresLibranza]    Script Date: 7/12/2021 11:30:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperadoresLibranza](
	[OperadorId] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](10) NOT NULL,
	[RazonSocial] [varchar](255) NOT NULL,
	[NombreCorto] [varchar](10) NULL,
	[Descripcion] [text] NULL,
	[Inactivo] [bit] NOT NULL,
 CONSTRAINT [PK_OperadoresLibranza] PRIMARY KEY CLUSTERED 
(
	[OperadorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDIs]    Script Date: 7/12/2021 11:30:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDIs](
	[TDIId] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](10) NOT NULL,
	[Nombre] [varchar](10) NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[Inactivo] [bit] NOT NULL,
 CONSTRAINT [PK_TDIs] PRIMARY KEY CLUSTERED 
(
	[TDIId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Afiliados_DI]    Script Date: 7/12/2021 11:30:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Afiliados_DI] ON [dbo].[Afiliados]
(
	[TDIId] ASC,
	[NDI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Departamentos_Codigo]    Script Date: 7/12/2021 11:30:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Departamentos_Codigo] ON [dbo].[Departamentos]
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Municipios_Nombre]    Script Date: 7/12/2021 11:30:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Municipios_Nombre] ON [dbo].[Municipios]
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Municipios_Codigo]    Script Date: 7/12/2021 11:30:39 AM ******/
CREATE NONCLUSTERED INDEX [UK_Municipios_Codigo] ON [dbo].[Municipios]
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OperadoresLibranza_NombreCorto]    Script Date: 7/12/2021 11:30:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_OperadoresLibranza_NombreCorto] ON [dbo].[OperadoresLibranza]
(
	[NombreCorto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OperadoresLibranza_RazonSocial]    Script Date: 7/12/2021 11:30:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_OperadoresLibranza_RazonSocial] ON [dbo].[OperadoresLibranza]
(
	[RazonSocial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_OperadoresLibranza_Codigo]    Script Date: 7/12/2021 11:30:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_OperadoresLibranza_Codigo] ON [dbo].[OperadoresLibranza]
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TDIs_Nombre]    Script Date: 7/12/2021 11:30:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_TDIs_Nombre] ON [dbo].[TDIs]
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_TDIs_Codigo]    Script Date: 7/12/2021 11:30:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_TDIs_Codigo] ON [dbo].[TDIs]
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Afiliados] ADD  CONSTRAINT [DF_Afiliados_Inactivo]  DEFAULT ((0)) FOR [Inactivo]
GO
ALTER TABLE [dbo].[Municipios] ADD  CONSTRAINT [DF_Municipios_Inactivo]  DEFAULT ((0)) FOR [Inactivo]
GO
ALTER TABLE [dbo].[OperacionesLibranza] ADD  CONSTRAINT [DF_OperacionesLibranza_Fecha]  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[OperacionesLibranza] ADD  CONSTRAINT [DF_OperacionesLibranza_EstadoSolicitud]  DEFAULT ((0)) FOR [EstadoSolicitud]
GO
ALTER TABLE [dbo].[OperadoresLibranza] ADD  CONSTRAINT [DF_OperadoresLibranza_Inactivo]  DEFAULT ((0)) FOR [Inactivo]
GO
ALTER TABLE [dbo].[TDIs] ADD  CONSTRAINT [DF_TDIs_Inactivo]  DEFAULT ((0)) FOR [Inactivo]
GO
ALTER TABLE [dbo].[Afiliados]  WITH CHECK ADD  CONSTRAINT [FK_Afiliados_Municipios] FOREIGN KEY([MunicipioResidenciaId])
REFERENCES [dbo].[Municipios] ([MunicipioId])
GO
ALTER TABLE [dbo].[Afiliados] CHECK CONSTRAINT [FK_Afiliados_Municipios]
GO
ALTER TABLE [dbo].[Afiliados]  WITH CHECK ADD  CONSTRAINT [FK_Afiliados_TDIs] FOREIGN KEY([TDIId])
REFERENCES [dbo].[TDIs] ([TDIId])
GO
ALTER TABLE [dbo].[Afiliados] CHECK CONSTRAINT [FK_Afiliados_TDIs]
GO
ALTER TABLE [dbo].[Municipios]  WITH CHECK ADD  CONSTRAINT [FK_Municipios_Departamentos] FOREIGN KEY([DepartamentoId])
REFERENCES [dbo].[Departamentos] ([DepartamentoId])
GO
ALTER TABLE [dbo].[Municipios] CHECK CONSTRAINT [FK_Municipios_Departamentos]
GO
ALTER TABLE [dbo].[OperacionesLibranza]  WITH CHECK ADD  CONSTRAINT [FK_OperacionesLibranza_Afiliados] FOREIGN KEY([AfiliadoId])
REFERENCES [dbo].[Afiliados] ([AfiliadoId])
GO
ALTER TABLE [dbo].[OperacionesLibranza] CHECK CONSTRAINT [FK_OperacionesLibranza_Afiliados]
GO
ALTER TABLE [dbo].[OperacionesLibranza]  WITH CHECK ADD  CONSTRAINT [FK_OperacionesLibranza_OperadoresLibranza] FOREIGN KEY([OperadorLibranzaId])
REFERENCES [dbo].[OperadoresLibranza] ([OperadorId])
GO
ALTER TABLE [dbo].[OperacionesLibranza] CHECK CONSTRAINT [FK_OperacionesLibranza_OperadoresLibranza]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id del Afiliado, autonumérico' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Afiliados', @level2type=N'COLUMN',@level2name=N'AfiliadoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id del Tipo de Documento de Identidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Afiliados', @level2type=N'COLUMN',@level2name=N'TDIId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de Documento de Identidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Afiliados', @level2type=N'COLUMN',@level2name=N'NDI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Apellidos del Afiliado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Afiliados', @level2type=N'COLUMN',@level2name=N'Apellidos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombres del Afiliado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Afiliados', @level2type=N'COLUMN',@level2name=N'Nombres'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'e-mail del Afiliado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Afiliados', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de teléfono móvil del Afiliado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Afiliados', @level2type=N'COLUMN',@level2name=N'Movil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id del municipio de residencia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Afiliados', @level2type=N'COLUMN',@level2name=N'MunicipioResidenciaId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el afiliado se encuentra activo o inactivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Afiliados', @level2type=N'COLUMN',@level2name=N'Inactivo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Afiliados de la Pagaduría' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Afiliados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del Departamento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Departamentos', @level2type=N'COLUMN',@level2name=N'Codigo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del Departamento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Departamentos', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el Departamento se encuentra activo o inactivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Departamentos', @level2type=N'COLUMN',@level2name=N'Inactivo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Departamentos del sistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Departamentos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id del Municipio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Municipios', @level2type=N'COLUMN',@level2name=N'MunicipioId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id del Departamento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Municipios', @level2type=N'COLUMN',@level2name=N'DepartamentoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del Municipio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Municipios', @level2type=N'COLUMN',@level2name=N'Codigo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del Municipio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Municipios', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el municipio se encuentra activo o inactivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Municipios', @level2type=N'COLUMN',@level2name=N'Inactivo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Municipios del sistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Municipios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id de la Operación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperacionesLibranza', @level2type=N'COLUMN',@level2name=N'OperacionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de la Operación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperacionesLibranza', @level2type=N'COLUMN',@level2name=N'Fecha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id del Operador de Libranza' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperacionesLibranza', @level2type=N'COLUMN',@level2name=N'OperadorLibranzaId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id del Afiliado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperacionesLibranza', @level2type=N'COLUMN',@level2name=N'AfiliadoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Plazo de la solicitud de crédito' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperacionesLibranza', @level2type=N'COLUMN',@level2name=N'Plazo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Monto solicitidado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperacionesLibranza', @level2type=N'COLUMN',@level2name=N'Monto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor de la Cuota' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperacionesLibranza', @level2type=N'COLUMN',@level2name=N'ValorCuota'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado de la operación: 0-Solicitada, 1-Aprobada, 2-Rechazada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperacionesLibranza', @level2type=N'COLUMN',@level2name=N'EstadoSolicitud'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Operaciones de Libranza' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperacionesLibranza'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id del Operador, autonuméerico' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperadoresLibranza', @level2type=N'COLUMN',@level2name=N'OperadorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del Operador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperadoresLibranza', @level2type=N'COLUMN',@level2name=N'Codigo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Razón Social del Operador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperadoresLibranza', @level2type=N'COLUMN',@level2name=N'RazonSocial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre Corto del Operador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperadoresLibranza', @level2type=N'COLUMN',@level2name=N'NombreCorto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del Operador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperadoresLibranza', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el Operador esta activo o inactivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperadoresLibranza', @level2type=N'COLUMN',@level2name=N'Inactivo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla de Operadores de Libranza' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperadoresLibranza'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id del Tipo de Documento de IDentidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TDIs', @level2type=N'COLUMN',@level2name=N'TDIId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del Tipo de Documento de Identidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TDIs', @level2type=N'COLUMN',@level2name=N'Codigo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del Documento de Identidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TDIs', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del Documento de Identidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TDIs', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el TDI está activo o inactivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TDIs', @level2type=N'COLUMN',@level2name=N'Inactivo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipos de Documentos de Identidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TDIs'
GO
USE [master]
GO
ALTER DATABASE [p01] SET  READ_WRITE 
GO
