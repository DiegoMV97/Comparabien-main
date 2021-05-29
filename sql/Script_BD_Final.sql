USE [concentracion]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 29 May. 2021 13:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[DepartamentoID] [int] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[DepartamentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntidadFinanciera]    Script Date: 29 May. 2021 13:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntidadFinanciera](
	[EntidadFinancieraID] [int] NOT NULL,
	[RazonSocial] [varchar](200) NULL,
	[NombreComercial] [varchar](200) NULL,
	[PathImagen] [varchar](200) NULL,
	[TipoInstitucionID] [int] NULL,
	[DepartamentoID] [int] NULL,
	[TipoDocumentoID] [smallint] NULL,
	[NumeroDocumento] [varchar](20) NULL,
	[Direccion] [varchar](200) NULL,
	[Telefono] [varchar](20) NULL,
	[Correo] [varchar](100) NULL,
	[PaginaWeb] [varchar](100) NULL,
	[UsuarioRegistro] [varchar](100) NULL,
	[FechaRegistro] [datetime] NULL,
	[UsuarioModifica] [varchar](100) NULL,
	[FechaModificacion] [datetime] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_EntidadFinanciera] PRIMARY KEY CLUSTERED 
(
	[EntidadFinancieraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductoFinanciero]    Script Date: 29 May. 2021 13:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoFinanciero](
	[ProductoFinancieroID] [int] NOT NULL,
	[TipoProductoID] [int] NULL,
	[EntidadFinancieraID] [int] NULL,
	[Nombre] [varchar](100) NULL,
	[Descripcion] [varchar](200) NULL,
	[PorcentajeTea] [decimal](10, 2) NULL,
	[PorcentajeComision] [decimal](10, 2) NULL,
	[PorcentajeSeguro] [decimal](10, 2) NULL,
	[Observacion] [varchar](500) NULL,
	[PlazoMinimoMes] [smallint] NULL,
	[PlazoMaximoMes] [smallint] NULL,
	[PlazoMinimoDia] [smallint] NULL,
	[PlazoMaximoDia] [smallint] NULL,
	[TieneFondoSeguro] [bit] NULL,
	[UsuarioRegistro] [varchar](100) NULL,
	[FechaRegistro] [datetime] NULL,
	[UsuarioModifica] [varchar](100) NULL,
	[FechaModificacion] [datetime] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_ProductoFinanciero] PRIMARY KEY CLUSTERED 
(
	[ProductoFinancieroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleProductoFinanciero]    Script Date: 29 May. 2021 13:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleProductoFinanciero](
	[DetalleProductoFinancieroID] [int] NOT NULL,
	[ProductoFinancieroID] [int] NULL,
	[TipoMonedaID] [int] NULL,
	[IngresoPermitido] [int] NULL,
	[MontoMinimoPrestamo] [decimal](10, 2) NULL,
	[MontoMaximoPrestamo] [decimal](10, 2) NULL,
	[MontoMinimoDeposito] [decimal](10, 2) NULL,
	[MontoMaximoDeposito] [decimal](10, 2) NULL,
 CONSTRAINT [PK_DetalleProductoFinanciero] PRIMARY KEY CLUSTERED 
(
	[DetalleProductoFinancieroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parametro]    Script Date: 29 May. 2021 13:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parametro](
	[ParametroID] [int] NOT NULL,
	[CodigoPadre] [varchar](10) NULL,
	[CodigoHijo] [varchar](10) NULL,
	[Valor1] [varchar](100) NULL,
	[Valor2] [varchar](100) NULL,
	[Descripcion] [varchar](200) NULL,
	[Orden] [int] NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Parametro] PRIMARY KEY CLUSTERED 
(
	[ParametroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_consulta_entidad_producto]    Script Date: 29 May. 2021 13:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [dbo].[vw_consulta_entidad_producto] (ProductoFinancieroId, TipoProductoId, TipoInstitucionId,
    Producto, PathImagen, MonedaId, Moneda, PorcentajeTea, ConsultaEntidadProductoId, MontoMinimoDeposito,
    MontoMaximoDeposito, MontoMinimoPrestamo, MontoMaximoPrestamo, IngresoPermitido, PorcentajeComision,
    PorcentajeSeguro, PlazoMinimoDia, PlazoMaximoDia, PlazoMinimoMes, PlazoMaximoMes, Nombre, Descripcion,
    Observacion, DepartamentoId, Ubicacion)
 AS SELECT pf.ProductoFinancieroID,
       pf.TipoProductoID,
       ef.TipoInstitucionID,
       ef.NombreComercial                AS producto,
       ef.PathImagen,
       pa.ParametroID                    AS id_moneda,
       pa.Valor2                         AS moneda,
       pf.PorcentajeTea,
       dpf.DetalleProductoFinancieroID AS id_consulta_entidad_producto,
       dpf.MontoMinimoDeposito,
       dpf.MontoMaximoDeposito,
       dpf.MontoMinimoPrestamo,
       dpf.MontoMaximoPrestamo,
       dpf.IngresoPermitido,
       pf.PorcentajeComision,
       pf.PorcentajeSeguro,
       pf.PlazoMinimoDia,
       pf.PlazoMaximoDia,
       pf.PlazoMinimoMes,
       pf.PlazoMaximoMes,
       pf.nombre,
       pf.descripcion,
       pf.observacion,
       de.DepartamentoID,
       de.nombre                          AS ubicacion
FROM ProductoFinanciero pf
         JOIN EntidadFinanciera ef ON ef.EntidadFinancieraID = pf.EntidadFinancieraID
         JOIN DetalleProductoFinanciero dpf ON dpf.ProductoFinancieroID = pf.ProductoFinancieroID
         JOIN Parametro pa ON pa.ParametroID = dpf.TipoMonedaID
         JOIN Departamento de ON de.DepartamentoID = ef.DepartamentoID;

GO
/****** Object:  View [dbo].[vw_consulta_movimiento]    Script Date: 29 May. 2021 13:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vw_consulta_movimiento](ProductoFinancieroId, Nombre, FechaRegistro, EntidadFinancieraId, NombreComercial, PorcentajeTea,
    Moneda, DetalleId, MontoMaximoDeposito, MontoMaximoPestamo, PlazoMaximoMes, Activo) as
	SELECT pf.ProductoFinancieroID,
       pf.Nombre,
       pf.FechaRegistro,
       ef.EntidadFinancieraID,
       ef.NombreComercial,
       pf.PorcentajeTea,
       p.Valor2                          AS moneda,
       dpf.DetalleProductoFinancieroID AS id_detalle,
       dpf.MontoMaximoDeposito,
       dpf.MontoMaximoPrestamo,
       pf.PlazoMaximoMes,
       pf.activo
FROM ProductoFinanciero pf
         JOIN EntidadFinanciera ef ON ef.EntidadFinancieraID = pf.EntidadFinancieraID
         JOIN DetalleProductoFinanciero dpf ON dpf.ProductoFinancieroID = pf.ProductoFinancieroID
         JOIN Parametro p ON p.ParametroID = dpf.TipoMonedaID;
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 29 May. 2021 13:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opcion]    Script Date: 29 May. 2021 13:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opcion](
	[OpcionID] [int] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Descripcion] [varchar](200) NULL,
	[PathUrl] [varchar](200) NULL,
	[Icono] [varchar](100) NULL,
	[Estado] [bit] NULL,
	[Orden] [smallint] NULL,
 CONSTRAINT [PK_Opcion] PRIMARY KEY CLUSTERED 
(
	[OpcionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prospecto]    Script Date: 29 May. 2021 13:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prospecto](
	[ProspectoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](200) NULL,
	[Apellidos] [varchar](200) NULL,
	[TipoDocumentoID] [int] NULL,
	[NumeroDocumento] [varchar](20) NULL,
	[Email] [varchar](200) NULL,
	[NumeroCelular] [varchar](20) NULL,
	[DepartamentoID] [smallint] NULL,
	[FechaRegistro] [datetime] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Prospecto] PRIMARY KEY CLUSTERED 
(
	[ProspectoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET DATEFORMAT YMD
GO
INSERT [dbo].[Departamento] ([DepartamentoID], [Nombre], [Estado]) VALUES (1, N'Lima', 1)
GO
INSERT [dbo].[Departamento] ([DepartamentoID], [Nombre], [Estado]) VALUES (2, N'Amazonas', 1)
GO
INSERT [dbo].[Departamento] ([DepartamentoID], [Nombre], [Estado]) VALUES (3, N'Arequipa', 1)
GO
INSERT [dbo].[Departamento] ([DepartamentoID], [Nombre], [Estado]) VALUES (4, N'Apurimac', 1)
GO
INSERT [dbo].[Departamento] ([DepartamentoID], [Nombre], [Estado]) VALUES (5, N'Ayacucho', 1)
GO
INSERT [dbo].[Departamento] ([DepartamentoID], [Nombre], [Estado]) VALUES (6, N'Cajamarca', 1)
GO
INSERT [dbo].[Departamento] ([DepartamentoID], [Nombre], [Estado]) VALUES (7, N'Cusco', 1)
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (1, 1, 5, NULL, NULL, NULL, CAST(1500.00 AS Decimal(10, 2)), CAST(4580.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (2, 1, 6, NULL, NULL, NULL, CAST(1400.00 AS Decimal(10, 2)), CAST(4200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (3, 1, 6, NULL, NULL, NULL, CAST(1100.00 AS Decimal(10, 2)), CAST(4500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (4, 2, 6, 4000, CAST(1000.00 AS Decimal(10, 2)), CAST(99001.00 AS Decimal(10, 2)), NULL, NULL)
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (5, 2, 5, 4000, CAST(1000.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), NULL, NULL)
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (6, 3, 6, NULL, NULL, NULL, CAST(1000.00 AS Decimal(10, 2)), CAST(79000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (7, 3, 5, NULL, NULL, NULL, CAST(1000.00 AS Decimal(10, 2)), CAST(80000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (8, 4, 5, 500, CAST(1000.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)), NULL, NULL)
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (9, 4, 6, 500, CAST(1000.00 AS Decimal(10, 2)), CAST(12000.00 AS Decimal(10, 2)), NULL, NULL)
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (10, 5, 5, 500, CAST(1000.00 AS Decimal(10, 2)), CAST(52000.00 AS Decimal(10, 2)), NULL, NULL)
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (11, 5, 6, 500, CAST(1000.00 AS Decimal(10, 2)), CAST(46000.00 AS Decimal(10, 2)), NULL, NULL)
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (12, 6, 5, NULL, NULL, NULL, CAST(1000.00 AS Decimal(10, 2)), CAST(69000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (13, 6, 6, NULL, NULL, NULL, CAST(1000.00 AS Decimal(10, 2)), CAST(69000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (14, 8, 6, NULL, NULL, NULL, CAST(1000.00 AS Decimal(10, 2)), CAST(39000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (15, 8, 5, NULL, NULL, NULL, CAST(1000.00 AS Decimal(10, 2)), CAST(49000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (16, 9, 5, NULL, NULL, NULL, CAST(1000.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (17, 9, 6, NULL, NULL, NULL, CAST(1000.00 AS Decimal(10, 2)), CAST(19000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (18, 10, 5, 500, CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), NULL, NULL)
GO
INSERT [dbo].[DetalleProductoFinanciero] ([DetalleProductoFinancieroID], [ProductoFinancieroID], [TipoMonedaID], [IngresoPermitido], [MontoMinimoPrestamo], [MontoMaximoPrestamo], [MontoMinimoDeposito], [MontoMaximoDeposito]) VALUES (19, 10, 6, 1000, CAST(1000.00 AS Decimal(10, 2)), CAST(48000.00 AS Decimal(10, 2)), NULL, NULL)
GO
INSERT [dbo].[EntidadFinanciera] ([EntidadFinancieraID], [RazonSocial], [NombreComercial], [PathImagen], [TipoInstitucionID], [DepartamentoID], [TipoDocumentoID], [NumeroDocumento], [Direccion], [Telefono], [Correo], [PaginaWeb], [UsuarioRegistro], [FechaRegistro], [UsuarioModifica], [FechaModificacion], [Activo]) VALUES (1, N'BBVA CONTINENTAL', N'BBVA Continental', N'https://enviotodo.pe/wp-content/uploads/2020/01/logobbva.png', 8, 2, 3, N'000292992', N'Av. Mandamiento - 903 ', N'03939393', N'bbva@gmail.com', NULL, N'Farmacias Peruanas', NULL, N'Farmacias Peruanas', NULL, 1)
GO
INSERT [dbo].[EntidadFinanciera] ([EntidadFinancieraID], [RazonSocial], [NombreComercial], [PathImagen], [TipoInstitucionID], [DepartamentoID], [TipoDocumentoID], [NumeroDocumento], [Direccion], [Telefono], [Correo], [PaginaWeb], [UsuarioRegistro], [FechaRegistro], [UsuarioModifica], [FechaModificacion], [Activo]) VALUES (2, N'SCOTIABANK', N'Scotiabank', N'https://style.shockvisual.net/wp-content/uploads/2019/05/logo-scotiabank.png', 8, 1, 3, N'39999393933', N'Av. Plaza CC - San Isidro', N'92929202', N'scotiabank@gmail.com', NULL, N'Farmacias Peruanas', NULL, N'Farmacias Peruanas', NULL, 1)
GO
INSERT [dbo].[EntidadFinanciera] ([EntidadFinancieraID], [RazonSocial], [NombreComercial], [PathImagen], [TipoInstitucionID], [DepartamentoID], [TipoDocumentoID], [NumeroDocumento], [Direccion], [Telefono], [Correo], [PaginaWeb], [UsuarioRegistro], [FechaRegistro], [UsuarioModifica], [FechaModificacion], [Activo]) VALUES (3, N'INTERBANK', N'Interbank', N'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQaIaVxDUfkWpVFOrqFJQhUMXMwVd7AnX4BJg&usqp=CAU', 8, 3, 3, N'93930303', N'Av. Saenz Peña 90 - Malaga', N'393930302', N'interbank@interbank.pe', NULL, N'Farmacias Peruanas', NULL, N'Farmacias Peruanas', NULL, 1)
GO
INSERT [dbo].[EntidadFinanciera] ([EntidadFinancieraID], [RazonSocial], [NombreComercial], [PathImagen], [TipoInstitucionID], [DepartamentoID], [TipoDocumentoID], [NumeroDocumento], [Direccion], [Telefono], [Correo], [PaginaWeb], [UsuarioRegistro], [FechaRegistro], [UsuarioModifica], [FechaModificacion], [Activo]) VALUES (4, N'BCP', N'Banco Credito Peru', N'https://logovtor.com/wp-content/uploads/2020/03/banco-de-credito-del-peru-bcp-logo-vector.png', 8, 1, 3, N'121312322', N'Av. Saenz Peña #428', N'2323390', N'bancocreditoperu@bcp.com.pe', NULL, N'Farmacias Peruanas', NULL, N'Farmacias Peruanas', NULL, 1)
GO
INSERT [dbo].[EntidadFinanciera] ([EntidadFinancieraID], [RazonSocial], [NombreComercial], [PathImagen], [TipoInstitucionID], [DepartamentoID], [TipoDocumentoID], [NumeroDocumento], [Direccion], [Telefono], [Correo], [PaginaWeb], [UsuarioRegistro], [FechaRegistro], [UsuarioModifica], [FechaModificacion], [Activo]) VALUES (5, N'MI BANCO ', N'Mi Banco', N'https://www.mibanco.com.pe/repositorioaps/data/1/1/1/zon/zona-logo/images/logo.png', 8, 3, 3, N'393939302', N'AV. Puente Nuevo # 940 - Bellavista', N'22828289', N'mibanco@outlook.pe', NULL, N'Farmacias Peruanas', NULL, N'Farmacias Peruanas', NULL, 1)
GO
INSERT [dbo].[EntidadFinanciera] ([EntidadFinancieraID], [RazonSocial], [NombreComercial], [PathImagen], [TipoInstitucionID], [DepartamentoID], [TipoDocumentoID], [NumeroDocumento], [Direccion], [Telefono], [Correo], [PaginaWeb], [UsuarioRegistro], [FechaRegistro], [UsuarioModifica], [FechaModificacion], [Activo]) VALUES (6, N'CAJA SULLANA', N'Sullana', N'https://seeklogo.com/images/C/caja-sullana-logo-B67137F998-seeklogo.com.png', 9, 1, 3, N'233030303', N'Av. Nicolas Pierola #890 - Lince', N'7373738', N'cajasullana@hotmail.com', NULL, N'Farmacias Peruanas', NULL, N'Farmacias Peruanas', NULL, 1)
GO
INSERT [dbo].[EntidadFinanciera] ([EntidadFinancieraID], [RazonSocial], [NombreComercial], [PathImagen], [TipoInstitucionID], [DepartamentoID], [TipoDocumentoID], [NumeroDocumento], [Direccion], [Telefono], [Correo], [PaginaWeb], [UsuarioRegistro], [FechaRegistro], [UsuarioModifica], [FechaModificacion], [Activo]) VALUES (7, N'CAJA DEL SANTA', N'Caja Del Santa', N'https://sevend.pe/images/clientes/caja%20del%20santa.png', 9, 2, 3, N'484849302', N'Av. Mesa Redonda 890', N'2311111', N'cajasanta@gmail.com', NULL, N'Farmacias Peruanas', NULL, N'Farmacias Peruanas', NULL, 1)
GO
INSERT [dbo].[Opcion] ([OpcionID], [Nombre], [Descripcion], [PathUrl], [Icono], [Estado], [Orden]) VALUES (1, N'Deposito Plazo', N'Deposito de dinero', N'/deposito-plazo/result', N'fas fa-money-bill', 1, 2)
GO
INSERT [dbo].[Opcion] ([OpcionID], [Nombre], [Descripcion], [PathUrl], [Icono], [Estado], [Orden]) VALUES (2, N'Prestamos Personales', N'Prestamo de dinero', N'/prestamo/result', N'fas fa-hand-holding-usd', 1, 1)
GO
INSERT [dbo].[Parametro] ([ParametroID], [CodigoPadre], [CodigoHijo], [Valor1], [Valor2], [Descripcion], [Orden], [Estado]) VALUES (1, N'DOC', NULL, N'Tipo Documento', NULL, N'Tipo de Documento', NULL, 1)
GO
INSERT [dbo].[Parametro] ([ParametroID], [CodigoPadre], [CodigoHijo], [Valor1], [Valor2], [Descripcion], [Orden], [Estado]) VALUES (2, NULL, N'DOC', NULL, N'DNI', N'Documento Nacional Identidad', 1, 1)
GO
INSERT [dbo].[Parametro] ([ParametroID], [CodigoPadre], [CodigoHijo], [Valor1], [Valor2], [Descripcion], [Orden], [Estado]) VALUES (3, NULL, N'DOC', NULL, N'RUC', N'Registro Unico Contribuyente', 2, 1)
GO
INSERT [dbo].[Parametro] ([ParametroID], [CodigoPadre], [CodigoHijo], [Valor1], [Valor2], [Descripcion], [Orden], [Estado]) VALUES (4, N'MON', NULL, N'Tipo Moneda', NULL, N'Tipo de Moneda', NULL, 1)
GO
INSERT [dbo].[Parametro] ([ParametroID], [CodigoPadre], [CodigoHijo], [Valor1], [Valor2], [Descripcion], [Orden], [Estado]) VALUES (5, NULL, N'MON', NULL, N'SOLES', N'Soles Peruanos', 1, 1)
GO
INSERT [dbo].[Parametro] ([ParametroID], [CodigoPadre], [CodigoHijo], [Valor1], [Valor2], [Descripcion], [Orden], [Estado]) VALUES (6, NULL, N'MON', NULL, N'DOLARES', N'Dolares Americanos', 2, 1)
GO
INSERT [dbo].[Parametro] ([ParametroID], [CodigoPadre], [CodigoHijo], [Valor1], [Valor2], [Descripcion], [Orden], [Estado]) VALUES (7, N'INS', NULL, N'Tipo Institucion', NULL, N'Tipo Institucion', NULL, 1)
GO
INSERT [dbo].[Parametro] ([ParametroID], [CodigoPadre], [CodigoHijo], [Valor1], [Valor2], [Descripcion], [Orden], [Estado]) VALUES (8, NULL, N'INS', NULL, N'BANCO', N'Banco - ASBANC', 1, 1)
GO
INSERT [dbo].[Parametro] ([ParametroID], [CodigoPadre], [CodigoHijo], [Valor1], [Valor2], [Descripcion], [Orden], [Estado]) VALUES (9, NULL, N'INS', NULL, N'CAJA', N'Caja', 2, 1)
GO
INSERT [dbo].[Parametro] ([ParametroID], [CodigoPadre], [CodigoHijo], [Valor1], [Valor2], [Descripcion], [Orden], [Estado]) VALUES (10, NULL, N'INS', NULL, N'COOPERATIVA', N'Cooperativa', 3, 1)
GO
INSERT [dbo].[Parametro] ([ParametroID], [CodigoPadre], [CodigoHijo], [Valor1], [Valor2], [Descripcion], [Orden], [Estado]) VALUES (11, NULL, N'INS', NULL, N'OTRO', N'Otro', 4, 1)
GO
INSERT [dbo].[Parametro] ([ParametroID], [CodigoPadre], [CodigoHijo], [Valor1], [Valor2], [Descripcion], [Orden], [Estado]) VALUES (12, N'TD', NULL, N'Tipo Producto', NULL, N'Tipo de Producto Financiero', NULL, 1)
GO
INSERT [dbo].[Parametro] ([ParametroID], [CodigoPadre], [CodigoHijo], [Valor1], [Valor2], [Descripcion], [Orden], [Estado]) VALUES (13, NULL, N'TD', NULL, N'PRESTAMO PERSONAL', N'Prestamo Personal', 1, 1)
GO
INSERT [dbo].[Parametro] ([ParametroID], [CodigoPadre], [CodigoHijo], [Valor1], [Valor2], [Descripcion], [Orden], [Estado]) VALUES (14, NULL, N'TD', NULL, N'DEPOSITO', N'Deposito a Plazo', 2, 1)
GO
INSERT [dbo].[ProductoFinanciero] ([ProductoFinancieroID], [TipoProductoID], [EntidadFinancieraID], [Nombre], [Descripcion], [PorcentajeTea], [PorcentajeComision], [PorcentajeSeguro], [Observacion], [PlazoMinimoMes], [PlazoMaximoMes], [PlazoMinimoDia], [PlazoMaximoDia], [TieneFondoSeguro], [UsuarioRegistro], [FechaRegistro], [UsuarioModifica], [FechaModificacion], [Activo]) VALUES (1, 14, 1, N'Deposito BBVA Continental', N'Deposito BBVA Continental Free', CAST(0.19 AS Decimal(10, 2)), CAST(0.23 AS Decimal(10, 2)), CAST(0.19 AS Decimal(10, 2)), N'Deposito BBVA Continental con multiples beneficios', NULL, NULL, 60, 1800, NULL, N'Farmacias Peruanas', NULL, N'Farmacias Peruanas', NULL, 1)
GO
INSERT [dbo].[ProductoFinanciero] ([ProductoFinancieroID], [TipoProductoID], [EntidadFinancieraID], [Nombre], [Descripcion], [PorcentajeTea], [PorcentajeComision], [PorcentajeSeguro], [Observacion], [PlazoMinimoMes], [PlazoMaximoMes], [PlazoMinimoDia], [PlazoMaximoDia], [TieneFondoSeguro], [UsuarioRegistro], [FechaRegistro], [UsuarioModifica], [FechaModificacion], [Activo]) VALUES (2, 13, 1, N'Prestamo BBVA Continental', N'Prestamo BBVA Continental Online ', CAST(0.19 AS Decimal(10, 2)), CAST(0.19 AS Decimal(10, 2)), CAST(1.09 AS Decimal(10, 2)), N'Prestamo BBVA Continental con beneficios', 3, 60, NULL, NULL, NULL, N'Farmacias Peruanas', NULL, N'Farmacias Peruanas', NULL, 1)
GO
INSERT [dbo].[ProductoFinanciero] ([ProductoFinancieroID], [TipoProductoID], [EntidadFinancieraID], [Nombre], [Descripcion], [PorcentajeTea], [PorcentajeComision], [PorcentajeSeguro], [Observacion], [PlazoMinimoMes], [PlazoMaximoMes], [PlazoMinimoDia], [PlazoMaximoDia], [TieneFondoSeguro], [UsuarioRegistro], [FechaRegistro], [UsuarioModifica], [FechaModificacion], [Activo]) VALUES (3, 14, 2, N'Deposito Scotiabank', N'Deposito Scotiabank Free', CAST(1.20 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(0.82 AS Decimal(10, 2)), N'Deposito Scotiabank con beneficios', NULL, NULL, 30, 1600, NULL, N'Farmacias Peruanas', NULL, N'Farmacias Peruanas', NULL, 1)
GO
INSERT [dbo].[ProductoFinanciero] ([ProductoFinancieroID], [TipoProductoID], [EntidadFinancieraID], [Nombre], [Descripcion], [PorcentajeTea], [PorcentajeComision], [PorcentajeSeguro], [Observacion], [PlazoMinimoMes], [PlazoMaximoMes], [PlazoMinimoDia], [PlazoMaximoDia], [TieneFondoSeguro], [UsuarioRegistro], [FechaRegistro], [UsuarioModifica], [FechaModificacion], [Activo]) VALUES (4, 13, 2, N'Prestamo Scotiabank', N'Prestamo Scotiabank Online', CAST(1.20 AS Decimal(10, 2)), CAST(1.45 AS Decimal(10, 2)), CAST(1.33 AS Decimal(10, 2)), N'Prestamo Scotiabank Online - Cero Mantenimiento', 6, 49, NULL, NULL, NULL, N'Farmacias Peruanas', NULL, N'Farmacias Peruanas', NULL, 1)
GO
INSERT [dbo].[ProductoFinanciero] ([ProductoFinancieroID], [TipoProductoID], [EntidadFinancieraID], [Nombre], [Descripcion], [PorcentajeTea], [PorcentajeComision], [PorcentajeSeguro], [Observacion], [PlazoMinimoMes], [PlazoMaximoMes], [PlazoMinimoDia], [PlazoMaximoDia], [TieneFondoSeguro], [UsuarioRegistro], [FechaRegistro], [UsuarioModifica], [FechaModificacion], [Activo]) VALUES (5, 13, 3, N'Prestamo Interbank ', N'Prestamo Interbank Online', CAST(0.20 AS Decimal(10, 2)), CAST(0.01 AS Decimal(10, 2)), CAST(0.02 AS Decimal(10, 2)), N'Prestamo Interbank con beneficios clubsueldo', 3, 39, NULL, NULL, NULL, N'Farmacias Peruanas', NULL, N'Farmacias Peruanas', NULL, 1)
GO
INSERT [dbo].[ProductoFinanciero] ([ProductoFinancieroID], [TipoProductoID], [EntidadFinancieraID], [Nombre], [Descripcion], [PorcentajeTea], [PorcentajeComision], [PorcentajeSeguro], [Observacion], [PlazoMinimoMes], [PlazoMaximoMes], [PlazoMinimoDia], [PlazoMaximoDia], [TieneFondoSeguro], [UsuarioRegistro], [FechaRegistro], [UsuarioModifica], [FechaModificacion], [Activo]) VALUES (6, 14, 3, N'Deposito Interbank', N'Deposito Interbank Free', CAST(1.29 AS Decimal(10, 2)), CAST(1.02 AS Decimal(10, 2)), CAST(0.23 AS Decimal(10, 2)), N'Deposito Interbank con beneficios', NULL, NULL, 30, 1300, NULL, N'Farmacias Peruanas', NULL, N'Farmacias Peruanas', NULL, 1)
GO
INSERT [dbo].[ProductoFinanciero] ([ProductoFinancieroID], [TipoProductoID], [EntidadFinancieraID], [Nombre], [Descripcion], [PorcentajeTea], [PorcentajeComision], [PorcentajeSeguro], [Observacion], [PlazoMinimoMes], [PlazoMaximoMes], [PlazoMinimoDia], [PlazoMaximoDia], [TieneFondoSeguro], [UsuarioRegistro], [FechaRegistro], [UsuarioModifica], [FechaModificacion], [Activo]) VALUES (7, 13, 4, N'Prestamo BCP', N'Prestamo Trabajadores BCP ', CAST(0.90 AS Decimal(10, 2)), CAST(0.45 AS Decimal(10, 2)), CAST(0.19 AS Decimal(10, 2)), N'Prestamo Trabajadpres BCP  - ClubSueldo', 3, 60, NULL, NULL, NULL, N'Farmacias Peruanas', NULL, N'Farmacias Peruanas', NULL, 1)
GO
INSERT [dbo].[ProductoFinanciero] ([ProductoFinancieroID], [TipoProductoID], [EntidadFinancieraID], [Nombre], [Descripcion], [PorcentajeTea], [PorcentajeComision], [PorcentajeSeguro], [Observacion], [PlazoMinimoMes], [PlazoMaximoMes], [PlazoMinimoDia], [PlazoMaximoDia], [TieneFondoSeguro], [UsuarioRegistro], [FechaRegistro], [UsuarioModifica], [FechaModificacion], [Activo]) VALUES (8, 14, 4, N'Deposito BCP', N'Deposito BCP', CAST(0.13 AS Decimal(10, 2)), CAST(0.34 AS Decimal(10, 2)), CAST(0.32 AS Decimal(10, 2)), N'Deposito BCP', NULL, NULL, 30, 900, NULL, N'Farmacias Peruanas', NULL, N'Farmacias Peruanas', NULL, 1)
GO
INSERT [dbo].[ProductoFinanciero] ([ProductoFinancieroID], [TipoProductoID], [EntidadFinancieraID], [Nombre], [Descripcion], [PorcentajeTea], [PorcentajeComision], [PorcentajeSeguro], [Observacion], [PlazoMinimoMes], [PlazoMaximoMes], [PlazoMinimoDia], [PlazoMaximoDia], [TieneFondoSeguro], [UsuarioRegistro], [FechaRegistro], [UsuarioModifica], [FechaModificacion], [Activo]) VALUES (9, 14, 6, N'Depostio mi banco', N'Deposito club beneficiarios', CAST(0.20 AS Decimal(10, 2)), CAST(0.19 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), N'Deposito exclusivo para club Mi Banco', NULL, NULL, 30, 410, NULL, N'Farmacias Peruanas', NULL, N'Farmacias Peruanas', NULL, 1)
GO
INSERT [dbo].[ProductoFinanciero] ([ProductoFinancieroID], [TipoProductoID], [EntidadFinancieraID], [Nombre], [Descripcion], [PorcentajeTea], [PorcentajeComision], [PorcentajeSeguro], [Observacion], [PlazoMinimoMes], [PlazoMaximoMes], [PlazoMinimoDia], [PlazoMaximoDia], [TieneFondoSeguro], [UsuarioRegistro], [FechaRegistro], [UsuarioModifica], [FechaModificacion], [Activo]) VALUES (10, 13, 6, N'Prestamo Mi Banco', N'Prestamo Mi Banco Online', CAST(0.12 AS Decimal(10, 2)), CAST(0.13 AS Decimal(10, 2)), CAST(0.43 AS Decimal(10, 2)), N'Prestamo Mi Banco con beneficios ', 3, 50, NULL, NULL, NULL, N'Farmacias Peruanas', NULL, N'Farmacias Peruanas', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Prospecto] ON 
GO
INSERT [dbo].[Prospecto] ([Nombres], [Apellidos], [TipoDocumentoID], [NumeroDocumento], [Email], [NumeroCelular], [DepartamentoID], [FechaRegistro], [Activo]) VALUES (N'Diego', N'Mendoza', 1, N'76739277', N'diego.mendoza@materiagris.pe', N'987654321', 1, CAST(N'2021-05-29T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Prospecto] ([Nombres], [Apellidos], [TipoDocumentoID], [NumeroDocumento], [Email], [NumeroCelular], [DepartamentoID], [FechaRegistro], [Activo]) VALUES (N'Diego', N'Villarreyes', 2, N'98765432111', N'diego.mendoza@test.com', N'987654321', 3, CAST(N'2021-05-29T00:00:00.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Prospecto] OFF
GO
ALTER TABLE [dbo].[DetalleProductoFinanciero]  WITH CHECK ADD  CONSTRAINT [FK_DetalleProductoFinanciero_ProductoFinanciero] FOREIGN KEY([ProductoFinancieroID])
REFERENCES [dbo].[ProductoFinanciero] ([ProductoFinancieroID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetalleProductoFinanciero] CHECK CONSTRAINT [FK_DetalleProductoFinanciero_ProductoFinanciero]
GO
ALTER TABLE [dbo].[EntidadFinanciera]  WITH CHECK ADD  CONSTRAINT [FK_EntidadFinanciera_Departamento] FOREIGN KEY([DepartamentoID])
REFERENCES [dbo].[Departamento] ([DepartamentoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EntidadFinanciera] CHECK CONSTRAINT [FK_EntidadFinanciera_Departamento]
GO
ALTER TABLE [dbo].[ProductoFinanciero]  WITH CHECK ADD  CONSTRAINT [FK_ProductoFinanciero_EntidadFinanciera] FOREIGN KEY([EntidadFinancieraID])
REFERENCES [dbo].[EntidadFinanciera] ([EntidadFinancieraID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductoFinanciero] CHECK CONSTRAINT [FK_ProductoFinanciero_EntidadFinanciera]
GO
