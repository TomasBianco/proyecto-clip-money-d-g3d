USE [master]
GO
/****** Object:  Database [clip]    Script Date: 10/20/2020 10:34:11 PM ******/
CREATE DATABASE [clip]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'clip', FILENAME = N'C:\SQL2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\clip.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'clip_log', FILENAME = N'C:\SQL2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\clip_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [clip] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [clip].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [clip] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [clip] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [clip] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [clip] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [clip] SET ARITHABORT OFF 
GO
ALTER DATABASE [clip] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [clip] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [clip] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [clip] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [clip] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [clip] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [clip] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [clip] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [clip] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [clip] SET  DISABLE_BROKER 
GO
ALTER DATABASE [clip] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [clip] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [clip] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [clip] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [clip] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [clip] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [clip] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [clip] SET RECOVERY FULL 
GO
ALTER DATABASE [clip] SET  MULTI_USER 
GO
ALTER DATABASE [clip] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [clip] SET DB_CHAINING OFF 
GO
ALTER DATABASE [clip] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [clip] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [clip] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'clip', N'ON'
GO
ALTER DATABASE [clip] SET QUERY_STORE = OFF
GO
USE [clip]
GO
/****** Object:  Table [dbo].[Billetera_Cripto]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billetera_Cripto](
	[idWallet] [nchar](10) NOT NULL,
	[idCliente] [nchar](10) NULL,
	[nroCuenta] [nchar](10) NULL,
	[saldo] [nchar](10) NULL,
 CONSTRAINT [PK_Billetera_Cripto] PRIMARY KEY CLUSTERED 
(
	[idWallet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [nchar](10) NOT NULL,
	[nombre] [nchar](10) NULL,
	[apellido] [nchar](10) NULL,
	[estado] [nchar](10) NULL,
	[idDireccion] [nchar](10) NULL,
	[cvu] [nchar](10) NULL,
	[nroTelefono] [nchar](10) NULL,
	[nroDNI] [nchar](10) NULL,
	[frontalDNI] [image] NULL,
	[traseraDNI] [image] NULL,
	[email] [nchar](10) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criptomoneda]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criptomoneda](
	[idCriptomoneda] [nchar](10) NOT NULL,
	[nombre] [nchar](10) NULL,
	[valor] [nchar](10) NULL,
	[descripcion] [nchar](10) NULL,
 CONSTRAINT [PK_Criptomoneda] PRIMARY KEY CLUSTERED 
(
	[idCriptomoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[idCuenta] [nchar](10) NOT NULL,
	[idEntidadBancaria] [nchar](10) NULL,
	[idCliente] [nchar](10) NULL,
	[idTipoMoneda] [nchar](10) NULL,
	[cvu] [nchar](10) NULL,
	[fechaAlta] [date] NULL,
	[estado] [nchar](10) NULL,
	[saldo] [nchar](10) NULL,
	[topeDescubierto] [int] NULL,
 CONSTRAINT [PK_Cuenta] PRIMARY KEY CLUSTERED 
(
	[idCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[idDetalleFactura] [nchar](10) NOT NULL,
	[idFactura] [nchar](10) NULL,
	[idServicio] [nchar](10) NULL,
	[subTotal] [nchar](10) NULL,
 CONSTRAINT [PK_DetalleFactura] PRIMARY KEY CLUSTERED 
(
	[idDetalleFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[idDireccion] [nchar](10) NOT NULL,
	[calle] [nchar](10) NULL,
	[numero] [nchar](10) NULL,
	[idLocalidad] [nchar](10) NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[idDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entidad_Bancaria]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entidad_Bancaria](
	[idEntidadBancaria] [nchar](10) NOT NULL,
	[nombre] [nchar](10) NULL,
	[idDireccion] [nchar](10) NULL,
	[razonSocial] [nchar](10) NULL,
 CONSTRAINT [PK_Entidad_Bancaria] PRIMARY KEY CLUSTERED 
(
	[idEntidadBancaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[idFactura] [nchar](10) NOT NULL,
	[fechaElaboracion] [date] NULL,
	[total] [nchar](10) NULL,
	[estado] [nchar](10) NULL,
	[fechaVencimiento] [nchar](10) NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inversion]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inversion](
	[idInversion] [nchar](10) NOT NULL,
	[idCuenta] [nchar](10) NULL,
	[idTipoInversion] [nchar](10) NULL,
	[fechaInicio] [date] NULL,
	[cantidadDias] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Inversion] PRIMARY KEY CLUSTERED 
(
	[idInversion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidad](
	[idLocalidad] [nchar](10) NOT NULL,
	[nombre] [nchar](10) NULL,
	[idProvincia] [nchar](10) NULL,
	[codigoPostal] [nchar](10) NULL,
 CONSTRAINT [PK_Localidad] PRIMARY KEY CLUSTERED 
(
	[idLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operacion]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operacion](
	[idOperacion] [nchar](10) NOT NULL,
	[idTipoOperacion] [nchar](10) NULL,
	[idCuenta] [nchar](10) NULL,
	[nroOperacion] [nchar](10) NULL,
	[estado] [nchar](10) NULL,
	[fechaOperacion] [date] NULL,
	[horaOperacion] [nchar](10) NULL,
	[monto] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Operacion] PRIMARY KEY CLUSTERED 
(
	[idOperacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operacion_Cripto]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operacion_Cripto](
	[idOperacion_Cripto] [nchar](10) NOT NULL,
	[idTipo_Operacion_Cripto] [nchar](10) NULL,
	[idWallet] [nchar](10) NULL,
	[estado] [nchar](10) NULL,
	[fechaOperacion] [nchar](10) NULL,
	[monto] [numeric](18, 2) NULL,
	[nroOperacion] [nchar](10) NULL,
 CONSTRAINT [PK_Operacion_Cripto] PRIMARY KEY CLUSTERED 
(
	[idOperacion_Cripto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[idPago] [nchar](10) NOT NULL,
	[idCuenta] [nchar](10) NULL,
	[idFactura] [nchar](10) NULL,
	[fecha] [nchar](10) NULL,
	[total] [nchar](10) NULL,
	[cantCuotas] [int] NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[idProvincia] [nchar](10) NOT NULL,
	[nombre] [nchar](10) NULL,
	[descripcion] [nchar](10) NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[idProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[idServicio] [nchar](10) NOT NULL,
	[idTipoServicio] [nchar](10) NULL,
	[nombre] [nchar](10) NULL,
	[descripcion] [nchar](10) NULL,
	[estado] [nchar](10) NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[idServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Inversion]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Inversion](
	[idTipoInversion] [nchar](10) NOT NULL,
	[nombre] [nchar](10) NULL,
	[descripcion] [nchar](10) NULL,
	[tasa] [nchar](10) NULL,
 CONSTRAINT [PK_Tipo_Inversion] PRIMARY KEY CLUSTERED 
(
	[idTipoInversion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Moneda]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Moneda](
	[idTipoMoneda] [nchar](10) NOT NULL,
	[nombre] [nchar](10) NULL,
	[descripcion] [nchar](10) NULL,
	[valor] [nchar](10) NULL,
 CONSTRAINT [PK_Tipo_Moneda] PRIMARY KEY CLUSTERED 
(
	[idTipoMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Operacion]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Operacion](
	[idTipoOperacion] [nchar](10) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nchar](10) NULL,
	[tasa] [int] NULL,
 CONSTRAINT [PK_Tipo_Operacion] PRIMARY KEY CLUSTERED 
(
	[idTipoOperacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Operacion_Cripto]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Operacion_Cripto](
	[idTipo_Operacion_Cripto] [nchar](10) NOT NULL,
	[nombre] [nchar](10) NULL,
	[descripcion] [nchar](10) NULL,
	[comision] [nchar](10) NULL,
 CONSTRAINT [PK_Tipo_Operacion_Cripto] PRIMARY KEY CLUSTERED 
(
	[idTipo_Operacion_Cripto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Servicio]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Servicio](
	[idTipoServicio] [nchar](10) NOT NULL,
	[nombre] [nchar](10) NULL,
	[descripcion] [nchar](10) NULL,
 CONSTRAINT [PK_Tipo_Servicio] PRIMARY KEY CLUSTERED 
(
	[idTipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transferencia]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transferencia](
	[idTransferencia] [nchar](10) NOT NULL,
	[idCuentaOrigen] [nchar](10) NULL,
	[idCuentaDestino] [nchar](10) NULL,
	[monto] [numeric](18, 0) NULL,
	[fechaOperacion] [date] NULL,
	[horaOperacion] [date] NULL,
	[motivo] [nchar](10) NULL,
 CONSTRAINT [PK_Transferencia] PRIMARY KEY CLUSTERED 
(
	[idTransferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transferencia_Cripto]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transferencia_Cripto](
	[idTransferencia_Cripto] [nchar](10) NOT NULL,
	[idWalletOrigen] [nchar](10) NULL,
	[idWalletDestino] [nchar](10) NULL,
	[fechaOperacion] [nchar](10) NULL,
	[horaOperacion] [nchar](10) NULL,
	[monto] [nchar](10) NULL,
 CONSTRAINT [PK_Transferencia_Cripto] PRIMARY KEY CLUSTERED 
(
	[idTransferencia_Cripto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/20/2020 10:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [nchar](10) NOT NULL,
	[idCliente] [nchar](10) NULL,
	[nombreUsuario] [nchar](10) NULL,
	[password] [nchar](10) NULL,
	[fechaAlta] [nchar](10) NULL,
	[estado] [nchar](10) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Billetera_Cripto]  WITH CHECK ADD  CONSTRAINT [FK_Billetera_Cripto_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Billetera_Cripto] CHECK CONSTRAINT [FK_Billetera_Cripto_Cliente]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Direccion] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Direccion] ([idDireccion])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Direccion]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_Cliente] FOREIGN KEY([idCuenta])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_Cliente]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_Entidad_Bancaria] FOREIGN KEY([idCuenta])
REFERENCES [dbo].[Entidad_Bancaria] ([idEntidadBancaria])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_Entidad_Bancaria]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_Tipo_Moneda] FOREIGN KEY([idCuenta])
REFERENCES [dbo].[Tipo_Moneda] ([idTipoMoneda])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_Tipo_Moneda]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Factura] FOREIGN KEY([idDetalleFactura])
REFERENCES [dbo].[Factura] ([idFactura])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Factura]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Servicio] FOREIGN KEY([idServicio])
REFERENCES [dbo].[Servicio] ([idServicio])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Servicio]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Localidad] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Localidad] ([idLocalidad])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Localidad]
GO
ALTER TABLE [dbo].[Entidad_Bancaria]  WITH CHECK ADD  CONSTRAINT [FK_Entidad_Bancaria_Direccion] FOREIGN KEY([idEntidadBancaria])
REFERENCES [dbo].[Direccion] ([idDireccion])
GO
ALTER TABLE [dbo].[Entidad_Bancaria] CHECK CONSTRAINT [FK_Entidad_Bancaria_Direccion]
GO
ALTER TABLE [dbo].[Inversion]  WITH CHECK ADD  CONSTRAINT [FK_Inversion_Cuenta] FOREIGN KEY([idCuenta])
REFERENCES [dbo].[Cuenta] ([idCuenta])
GO
ALTER TABLE [dbo].[Inversion] CHECK CONSTRAINT [FK_Inversion_Cuenta]
GO
ALTER TABLE [dbo].[Inversion]  WITH CHECK ADD  CONSTRAINT [FK_Inversion_Tipo_Inversion] FOREIGN KEY([idInversion])
REFERENCES [dbo].[Tipo_Inversion] ([idTipoInversion])
GO
ALTER TABLE [dbo].[Inversion] CHECK CONSTRAINT [FK_Inversion_Tipo_Inversion]
GO
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD  CONSTRAINT [FK_Localidad_Estado] FOREIGN KEY([idLocalidad])
REFERENCES [dbo].[Provincia] ([idProvincia])
GO
ALTER TABLE [dbo].[Localidad] CHECK CONSTRAINT [FK_Localidad_Estado]
GO
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD  CONSTRAINT [FK_Operacion_Cuenta] FOREIGN KEY([idOperacion])
REFERENCES [dbo].[Cuenta] ([idCuenta])
GO
ALTER TABLE [dbo].[Operacion] CHECK CONSTRAINT [FK_Operacion_Cuenta]
GO
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD  CONSTRAINT [FK_Operacion_Tipo_Operacion] FOREIGN KEY([idOperacion])
REFERENCES [dbo].[Tipo_Operacion] ([idTipoOperacion])
GO
ALTER TABLE [dbo].[Operacion] CHECK CONSTRAINT [FK_Operacion_Tipo_Operacion]
GO
ALTER TABLE [dbo].[Operacion_Cripto]  WITH CHECK ADD  CONSTRAINT [FK_Operacion_Cripto_Billetera_Cripto] FOREIGN KEY([idWallet])
REFERENCES [dbo].[Billetera_Cripto] ([idWallet])
GO
ALTER TABLE [dbo].[Operacion_Cripto] CHECK CONSTRAINT [FK_Operacion_Cripto_Billetera_Cripto]
GO
ALTER TABLE [dbo].[Operacion_Cripto]  WITH CHECK ADD  CONSTRAINT [FK_Operacion_Cripto_Tipo_Operacion_Cripto] FOREIGN KEY([idTipo_Operacion_Cripto])
REFERENCES [dbo].[Tipo_Operacion_Cripto] ([idTipo_Operacion_Cripto])
GO
ALTER TABLE [dbo].[Operacion_Cripto] CHECK CONSTRAINT [FK_Operacion_Cripto_Tipo_Operacion_Cripto]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Cuenta] FOREIGN KEY([idPago])
REFERENCES [dbo].[Cuenta] ([idCuenta])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Cuenta]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Factura] FOREIGN KEY([idFactura])
REFERENCES [dbo].[Factura] ([idFactura])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Factura]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_Servicio_Tipo_Servicio] FOREIGN KEY([idServicio])
REFERENCES [dbo].[Tipo_Servicio] ([idTipoServicio])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_Servicio_Tipo_Servicio]
GO
ALTER TABLE [dbo].[Transferencia]  WITH CHECK ADD  CONSTRAINT [FK_Transferencia_CuentaDestino] FOREIGN KEY([idCuentaDestino])
REFERENCES [dbo].[Cuenta] ([idCuenta])
GO
ALTER TABLE [dbo].[Transferencia] CHECK CONSTRAINT [FK_Transferencia_CuentaDestino]
GO
ALTER TABLE [dbo].[Transferencia]  WITH CHECK ADD  CONSTRAINT [FK_Transferencia_CuentaOrigen] FOREIGN KEY([idCuentaOrigen])
REFERENCES [dbo].[Cuenta] ([idCuenta])
GO
ALTER TABLE [dbo].[Transferencia] CHECK CONSTRAINT [FK_Transferencia_CuentaOrigen]
GO
ALTER TABLE [dbo].[Transferencia_Cripto]  WITH CHECK ADD  CONSTRAINT [FK_Transferencia_Cripto_Billetera_Destino] FOREIGN KEY([idWalletDestino])
REFERENCES [dbo].[Billetera_Cripto] ([idWallet])
GO
ALTER TABLE [dbo].[Transferencia_Cripto] CHECK CONSTRAINT [FK_Transferencia_Cripto_Billetera_Destino]
GO
ALTER TABLE [dbo].[Transferencia_Cripto]  WITH CHECK ADD  CONSTRAINT [FK_Transferencia_Cripto_Billetera_Origen] FOREIGN KEY([idWalletOrigen])
REFERENCES [dbo].[Billetera_Cripto] ([idWallet])
GO
ALTER TABLE [dbo].[Transferencia_Cripto] CHECK CONSTRAINT [FK_Transferencia_Cripto_Billetera_Origen]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Cliente] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Cliente]
GO
USE [master]
GO
ALTER DATABASE [clip] SET  READ_WRITE 
GO
