﻿USE [master]
GO
/****** Object:  Database [WEB_BANBANH_N10]    Script Date: 06/19/2020 7:07:44 PM ******/
CREATE DATABASE [WEB_BANBANH_N10]
GO
USE [WEB_BANBANH_N10]
GO
ALTER DATABASE [WEB_BANBANH_N10] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WEB_BANBANH_N10].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WEB_BANBANH_N10] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET ARITHABORT OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET RECOVERY FULL 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET  MULTI_USER 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WEB_BANBANH_N10] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WEB_BANBANH_N10] SET QUERY_STORE = OFF
GO
USE [WEB_BANBANH_N10]
GO
/****** Object:  Table [dbo].[BANH]    Script Date: 06/19/2020 7:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANH](
	[MABANH] [int] IDENTITY(1,1) NOT NULL,
	[TENBANH] [nvarchar](255) NULL,
	[LOAIBANH] [nvarchar](255) NULL,
	[MOTA] [nvarchar](255) NULL,
	[SOLUONG] [int] NULL,
	[PATHHINHANH] [nvarchar](255) NULL,
	[GIA] [float] NULL,
	[GIAMGIA] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MABANH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETHOADON]    Script Date: 06/19/2019 7:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETHOADON](
	[SOLUONG] [int] NULL,
	[MABANH] [int] NOT NULL,
	[MAHD] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MABANH] ASC,
	[MAHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 4/30/2019 7:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[MAHD] [int] IDENTITY(1,1) NOT NULL,
	[DIACHI] [nvarchar](255) NULL,
	[THANHTOAN] [int] NULL,
	[NGAYLAPHD] [datetime] NULL,
	[MAKH] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MAHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 4/30/2019 7:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[MAKH] [int] IDENTITY(1,1) NOT NULL,
	[HO] [nvarchar](255) NULL,
	[TEN] [nvarchar](255) NULL,
	[USERNAME] [nvarchar](255) NOT NULL,
	[HASHEDPASSWORD] [varchar](255) NULL,
	[PASSWORDSALT] [varchar](255) NULL,
	[LOAITK] [BIT] NULL,
	[DIACHI] [nvarchar](255) NULL,
	[EMAIL] [varchar](255) NULL,
	[NGAYSINH] [datetime] NULL,
	[CMND] [varchar](255) NULL,
	[SODT] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BANH] ON 
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (1, N'cupcake1', 50, 0, N'img/cake_dataimg/cupcake1.jpg', N'Cupcake Alaska', N'Bánh Cupcake', 21)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (2, N'cupcake2', 50, 0, N'img/cake_dataimg/cupcake2.jpg', N'CONFETTI CUPCAKES', N'Bánh Cupcake', 41)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (3, N'cupcake3', 50, 0, N'img/cake_dataimg/cupcake3.jpg', N'WHITE CHOCOLATE RASPBERRY MUFFINS', N'Bánh Cupcake', 14)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (4, N'cupcake4', 50, 0, N'img/cake_dataimg/cupcake4.jpg', N'FRENCH TOAST MUFFINS', N'Bánh Cupcake', 24)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (5, N'cupcake5', 50, 0, N'img/cake_dataimg/cupcake5.jpg', N'COKE FLOAT CUPCAKES', N'Bánh Cupcake', 11)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (6, N'Pudding 1', 45, 0, N'img/cake_dataimg/pudding1.jpg', N'Pudding Coklat ', N'Bánh Pudding', 22)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (7, N'Pudding 2', 45, 0, N'img/cake_dataimg/pudding2.jpg', N'Vanilla Pudding ', N'Bánh Pudding', 25)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (8, N'Pudding 3', 45, 0, N'img/cake_dataimg/pudding3.jpg', N'japanese custard pudding ', N'Bánh Pudding', 15)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (9, N'Pudding 4', 45, 0, N'img/cake_dataimg/pudding4.jpg', N'chocolate-chia-pudding', N'Bánh Pudding', 2)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (10, N'Bánh Kem 1', 60, 0, N'img/cake_dataimg/banhkem1.jpg', N'Bánh Kem 1', N'Bánh Kem', 32)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (11, N'Bánh Kem 2', 62, 0, N'img/cake_dataimg/banhkem2.jpg', N'Bánh Kem 2', N'Bánh Kem', 13)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (12, N'Bánh Kem 3', 62, 0, N'img/cake_dataimg/banhkem3.jpg', N'Bánh Kem 3', N'Bánh Kem', 3)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (13, N'Bánh Kem 4', 62, 0, N'img/cake_dataimg/banhkem4.jpg', N'Bánh Kem 4', N'Bánh Kem', 9)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (14, N'Bánh Kem 5', 62, 0, N'img/cake_dataimg/banhkem5.jpg', N'Bánh Kem 5', N'Bánh Kem', 12)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (15, N'Bánh Bông Lan 1', 35, 0, N'img/cake_dataimg/bonglan1.jpg', N'Tiramisu M1', N'Bánh Bông Lan', 7)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (16, N'Bánh Bông Lan 2', 35, 0, N'img/cake_dataimg/bonglan2.jpg', N'ANNA TRÀ XANH', N'Bánh Bông Lan', 18)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (17, N'Bánh Bông Lan 3', 35, 0, N'img/cake_dataimg/bonglan3.jpg', N'ANNA MAGARET', N'Bánh Bông Lan', 14)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (18, N'Bánh Bông Lan 4', 35, 0, N'img/cake_dataimg/bonglan4.jpg', N'Bông Lan TRÀ XANH', N'Bánh Bông Lan', 24)
GO
INSERT [dbo].[BANH] ([MABANH], [MOTA], [GIA], [GIAMGIA], [PATHHINHANH], [TENBANH], [LOAIBANH], [SOLUONG]) VALUES (19, N'Bánh Bông Lan 5', 35, 0, N'img/cake_dataimg/bonglan5.jpg', N'Bông Lan Bap Cuon', N'Bánh Bông Lan', 0)
GO
SET IDENTITY_INSERT [dbo].[BANH] OFF
GO
ALTER TABLE [dbo].[CHITIETHOADON]  WITH CHECK ADD  CONSTRAINT [CHITIETHOADON_MABANH] FOREIGN KEY([MABANH])
REFERENCES [dbo].[BANH] ([MABANH])
GO
ALTER TABLE [dbo].[CHITIETHOADON] CHECK CONSTRAINT [CHITIETHOADON_MABANH]
GO
ALTER TABLE [dbo].[CHITIETHOADON]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETHOADON_MAHD] FOREIGN KEY([MAHD])
REFERENCES [dbo].[HOADON] ([MAHD])
GO
ALTER TABLE [dbo].[CHITIETHOADON] CHECK CONSTRAINT [FK_CHITIETHOADON_MAHD]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_DONHANG_MAKH] FOREIGN KEY([MAKH])
REFERENCES [dbo].[TAIKHOAN] ([MAKH])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_DONHANG_MAKH]
GO
USE [master]
GO
ALTER DATABASE [WEB_NHOM10_BANBANH] SET  READ_WRITE 
GO
