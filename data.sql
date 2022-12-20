USE [WebBanHang]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_diagramobjects]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	


GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[MaNV] [nchar](5) NULL,
	[CMND] [char](9) NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [bit] NULL,
	[DiaChi] [nvarchar](256) NULL,
	[Avatar] [text] NULL,
	[RoleID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBL] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [nchar](5) NULL,
	[MaKH] [nvarchar](128) NULL,
	[NoiDung] [ntext] NULL,
	[NgayDang] [datetime] NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](128) NULL,
	[DaTraLoi] [char](1) NULL,
	[Parent] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDH] [nchar](5) NOT NULL,
	[MaSP] [nchar](5) NOT NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHangKH]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHangKH](
	[MaDH] [nchar](5) NOT NULL,
	[MaKH] [nvarchar](128) NULL,
	[PhiVanChuyen] [decimal](18, 0) NULL,
	[PTGiaoDich] [nvarchar](200) NULL,
	[NgayDatMua] [datetime] NULL,
	[TinhTrangDH] [int] NULL,
	[Tongtien] [float] NULL,
	[Ghichu] [text] NULL,
	[Diachi] [nvarchar](100) NULL,
	[Dienthoai] [nchar](15) NULL,
	[MaAdmin] [nvarchar](128) NULL,
	[thanhToanOnline] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaoDien]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoDien](
	[Id] [int] NOT NULL,
	[ThuocTinh] [nvarchar](128) NOT NULL,
	[GiaTri] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangSanXuat]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangSanXuat](
	[HangSX] [nchar](5) NOT NULL,
	[TenHang] [nvarchar](50) NULL,
	[TruSoChinh] [nvarchar](200) NULL,
	[QuocGia] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[HangSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhoSP]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoSP](
	[IDKho] [nchar](5) NOT NULL,
	[MaSP] [nchar](5) NULL,
	[SL] [int] NULL,
	[DateImport] [datetime] NULL,
	[DateExport] [datetime] NULL,
	[TenSP] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[MaKM] [nchar](5) NOT NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[NoiDung] [ntext] NULL,
	[TenCT] [nvarchar](128) NOT NULL,
	[AnhCT] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Link]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Link](
	[id] [int] NOT NULL,
	[Url] [text] NULL,
	[Image] [text] NULL,
	[Text] [nvarchar](128) NOT NULL,
	[Group] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [nchar](5) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nchar](5) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SDT_NCC] [nchar](11) NULL,
	[Email] [nvarchar](50) NULL,
	[Website] [text] NULL,
	[Net_user] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nchar](5) NOT NULL,
	[TenSP] [nvarchar](250) NULL,
	[LoaiSP] [nchar](5) NOT NULL,
	[SoLuotXemSP] [int] NULL,
	[HangSX] [nchar](5) NOT NULL,
	[XuatXu] [nvarchar](50) NULL,
	[GiaGoc] [decimal](18, 0) NULL,
	[GiaTien] [decimal](18, 0) NULL,
	[MoTa] [ntext] NULL,
	[AnhDaiDien] [ntext] NULL,
	[AnhNen] [ntext] NULL,
	[AnhKhac] [ntext] NULL,
	[SoLuong] [int] NULL,
	[isnew] [bit] NULL,
	[ishot] [bit] NULL,
	[MaNCC] [nchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sanphamcanmua]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sanphamcanmua](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [nchar](5) NOT NULL,
	[Soluong] [int] NULL,
	[Ngayketthuc] [datetime] NULL,
	[Ngaydang] [datetime] NULL,
	[Mota] [ntext] NULL,
	[SanPham_Id] [nchar](5) NOT NULL,
	[NhaCungCap_Id] [nchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SanPham_Id] ASC,
	[NhaCungCap_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPhamKhuyenMai]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPhamKhuyenMai](
	[MaKM] [nchar](5) NOT NULL,
	[MaSP] [nchar](5) NOT NULL,
	[MoTa] [ntext] NULL,
	[GiamGia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKM] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongSoKyThuat]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongSoKyThuat](
	[MaSP] [nchar](5) NOT NULL,
	[ThuocTinh] [nvarchar](50) NOT NULL,
	[GiaTri] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[ThuocTinh] ASC,
	[GiaTri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TongSPKho]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TongSPKho](
	[IDKho] [nchar](5) NOT NULL,
	[IDSP] [nchar](5) NOT NULL,
	[SL] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDKho] ASC,
	[IDSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trackingaction]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trackingaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NULL,
	[MaSP] [nchar](5) NULL,
	[Controller] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[Ngaythuchien] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'a00f8232-0674-4ac3-8a6b-89bd5ce471da', N'Bị khóa')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'37877e60-4cd3-4eb3-8a94-a5d881a81446', N'Khách hàng')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'8d050225-c36f-4790-bd7b-28bb044d90b1', N'Nhân viên')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'ec481379-dfae-4d9e-93d8-dce55add3258', N'Nhân Viên Đơn Hàng')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'dc481379-dfae-4d9e-93d8-dce55add3258', N'Quản trị viên')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'16e8cda8-9a74-49cd-9eb5-57467e941024', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'26f85d42-9ef0-4b75-b960-2bc58b5be278', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3f680d24-c3a0-470d-b334-38b0dd93be9f', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'63d125c7-616d-4ebf-bb9a-21f9301f3c1d', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6bfbe085-cd95-4b2e-94bd-3c17ca1b0be1', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7ff0c209-f22e-472b-b74f-d6ec0f086487', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'98c9bfd9-6edb-42d8-80dc-63512116438c', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b8a4eb01-77d5-41ee-8073-ed823fe26918', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ee905bef-72ce-4590-93f9-f1a6eebc8819', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f0bce217-bc51-409d-b7ca-c8292af1e5f5', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f9bd102b-b18a-4b65-98b9-f333f7cd7ab9', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0e7c252b-2dcb-4c17-9826-ca775fae7786', N'8d050225-c36f-4790-bd7b-28bb044d90b1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2a643d50-2adb-4e84-a0b3-d5b47b016305', N'8d050225-c36f-4790-bd7b-28bb044d90b1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'33b376ed-9d53-42e4-82dd-f22ce7432883', N'8d050225-c36f-4790-bd7b-28bb044d90b1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'49d6a193-658a-460e-9d15-152b12a58edf', N'8d050225-c36f-4790-bd7b-28bb044d90b1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'655dd096-f156-4a9b-83f5-810f35060598', N'8d050225-c36f-4790-bd7b-28bb044d90b1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'75878ac4-ab67-4d8e-b4dc-dcf736b4cec6', N'a00f8232-0674-4ac3-8a6b-89bd5ce471da')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7ad84669-4ef6-466a-885c-b09797d3d6b4', N'a00f8232-0674-4ac3-8a6b-89bd5ce471da')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd3a9c7f9-92e0-4b43-8b07-e1fde0f1c4be', N'a00f8232-0674-4ac3-8a6b-89bd5ce471da')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e857c0c1-4a3e-4393-994d-d0aa77f7e9ad', N'a00f8232-0674-4ac3-8a6b-89bd5ce471da')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'865a9ddc-ff8b-426d-9e30-8b8ab69e72e4', N'dc481379-dfae-4d9e-93d8-dce55add3258')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8c43382d-faf3-45e8-954e-ca9589173033', N'dc481379-dfae-4d9e-93d8-dce55add3258')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'acd6cdda-f84a-40ca-b5e0-502af24cfe44', N'dc481379-dfae-4d9e-93d8-dce55add3258')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1e614b27-a91b-4390-b3b8-653128b5ca34', N'ec481379-dfae-4d9e-93d8-dce55add3258')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8727a1be-83c5-4bae-be6a-368f26b8a5e5', N'ec481379-dfae-4d9e-93d8-dce55add3258')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f6cba742-450b-492d-b492-128d5c77aa81', N'ec481379-dfae-4d9e-93d8-dce55add3258')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'0e7c252b-2dcb-4c17-9826-ca775fae7786', N'testnv@gmail.com', 0, N'AEjNNd9W4FfGgTVIp3aQzIzJoror0wR8bFC7mLLZg6wb1DVf2YkpQw8UyjK6tvkbXg==', N'ac6597a2-8491-45ed-b7cb-9c6a56cb9bee', N'0964681638', 0, 0, NULL, 0, 0, N'testnv', NULL, NULL, N'test nhaan vien', NULL, NULL, N'Đại học công  nghiệp Hà Nội', N'noavatar.jpg', N'8d050225-c36f-4790-bd7b-28bb044d90b1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'16e8cda8-9a74-49cd-9eb5-57467e941024', N'tranvien@haui.com', 0, N'AEtqNcUWaaFhv6AcfXlleTLzy9qRv8UyGQnU5T0fEKCPhi/MVvTXfnJHvTrC+qfCAQ==', N'2f60e4d9-ff80-49a8-9718-963eab97aaed', N'01674646597', 0, 0, NULL, 0, 300, N'customer', NULL, NULL, N'Trần Văn Viên', NULL, NULL, N'Trường đại học công nghiệp Hà Nội', N'noavatar.jpg', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'1e614b27-a91b-4390-b3b8-653128b5ca34', N'hiepn475911gmail.com', 0, N'AKebY8oo6SY0PxrKirlQqrnUBvMIhHWOj/6rS3nGe2PjHNSvKW3/U8TxJ57PGJLIdw==', N'a90ab87e-29ad-4333-8114-161aaf055c43', N'0964681635', 0, 0, NULL, 0, 0, N'nhanviendhhiepns', NULL, NULL, N'Trần Văn Viên', NULL, NULL, N'Đại học công  nghiệp Hà Nội', N'noavatar.jpg', N'ec481379-dfae-4d9e-93d8-dce55add3258')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'26f85d42-9ef0-4b75-b960-2bc58b5be278', N'haiphuong33344351997@gmail.com', 1, N'AHcFWhYFiurDUaVkHsE3eEExwaIo0SYnW/RnSL9L6QuWhhnw2xE8TgHUbAcpHvlqqA==', N'b0f32305-c06c-45b3-b0cb-8be25e66cf18', N'0964681635', 0, 0, NULL, 0, 200, N'testkhachhang', NULL, NULL, N'Trần Văn Viên', NULL, NULL, N'Đại học công  nghiệp Hà Nội', N'noavatar.jpg', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'2a643d50-2adb-4e84-a0b3-d5b47b016305', N'haha@gmail.com', 0, N'AMXiYBWyTnahRec7zqBa3UmxcWtdReZHkGXWhu106Z7VyJAZ90RrxPFtXmsoIrZq9A==', N'03765d3f-f2e7-455e-9356-003e4bc11271', N'0964688263', 0, 0, NULL, 0, 0, N'hahahihi', NULL, NULL, N'nguyen thị ha ha hihi', NULL, NULL, N'Đại học công  nghiệp Hà Nội', N'noavatar.jpg', N'8d050225-c36f-4790-bd7b-28bb044d90b1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'33b376ed-9d53-42e4-82dd-f22ce7432883', N'nhanviensanpham@gmail.com', 0, N'AMomqQT+otSYcGQujW6H4MJOpA0p8cCIx5YOFt5+MHsR39iv6OSI1DCNTBflO+h/Jg==', N'843ecdd8-9560-43f0-a97f-63a566c9bf50', N'0985625348', 0, 0, NULL, 0, 0, N'nhanviensanpham', NULL, NULL, N'Nguyễn Văn Hiếu', NULL, NULL, N'Nguyễn Văn Trỗi, Hà đông, Hà Nội', N'33b376ed-9d53-42e4-82dd-f22ce7432883.jpg', N'8d050225-c36f-4790-bd7b-28bb044d90b1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'3f680d24-c3a0-470d-b334-38b0dd93be9f', N'tranviensb@gmail.com', 0, N'ACzGi6z81TjNtTTJIW2xUmqWoiAVgkCNDFEm34QNUYI1mO1syfG/+cFFJJmuWmSb0w==', N'58715ac7-c553-45a0-a273-8ff596d67bdb', N'01674646597', 0, 0, NULL, 0, 200, N'VienTran', NULL, NULL, N'Trần Văn Viên', NULL, NULL, N'Đại học công nghiệp Hà Nội', N'noavatar.jpg', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'49d6a193-658a-460e-9d15-152b12a58edf', N'hiepn47510@gmail.com', 0, N'ADYtwoxUGjiTrehrGbGC8JfokGHQ0AJs8jmRNtRqf89RXqOm/dyPTcWSs/Xt3Hx9SA==', N'786dbc73-9a19-4b37-86e1-23e1acd0334b', N'0964681635', 0, 0, NULL, 0, 0, N'nhanvienhiepns', NULL, NULL, N'Trần Văn Viên', NULL, NULL, N'Đại học công  nghiệp Hà Nội', N'noavatar.jpg', N'8d050225-c36f-4790-bd7b-28bb044d90b1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'63d125c7-616d-4ebf-bb9a-21f9301f3c1d', N'tranviensp@haui.com', 0, N'APxt34Nm0qlUAUAYV8rRIrsGp3p8R1ft/bRwzLp7s8dqOfU31PggDbCDFbxWC6uFKA==', N'34144e8c-4036-4f5f-9c73-b3739f17cd83', N'01674646597', 0, 0, NULL, 0, 0, N'vientransb', NULL, NULL, N'Trần Văn Viên', NULL, NULL, N'Trường đại học công nghiệp Hà Nội', N'noavatar.jpg', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'655dd096-f156-4a9b-83f5-810f35060598', N'kkk@gmail.com', 0, N'AOE4KVv2egXDBjSjSC+yLL2Uja02zlG2zYbndOcoSPhHRD9ibvpdvOEbCKr/1/alkA==', N'f66420e1-ba1f-4cf3-88bc-635859c10c4a', N'0964688263', 0, 0, NULL, 0, 0, N'kkkkkkk', NULL, NULL, N'hiephelo', NULL, NULL, N'nghe an12', N'noavatar.jpg', N'8d050225-c36f-4790-bd7b-28bb044d90b1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'6bfbe085-cd95-4b2e-94bd-3c17ca1b0be1', N'haiphuong3519971@gmail.com', 0, N'AK9cdTZ42FNmNzJi5qn+07mnv75i8SCug2JNulQyzUOoG1AKBM9VpkruNBy+WdUngA==', N'6b21192e-156b-4f40-b3b9-cb68069fd0e4', N'0987223743', 0, 0, NULL, 0, 0, N'eeeeeee', NULL, NULL, N'eeeee', NULL, NULL, N'Đại học công  nghiệp Hà Nội', N'noavatar.jpg', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'75878ac4-ab67-4d8e-b4dc-dcf736b4cec6', N'nguyensyhiepboss1@gmail.com', 0, N'ADBHRrXlMH1KCQUvgKeEWXX1zhRNPyzzmJwEorS0cmw/0t+3rvymxpECaEe0D/azEg==', N'70b17d87-9d37-4612-af4b-6fe86837eb90', N'0987223743', 0, 0, NULL, 0, 0, N'abcddd', NULL, NULL, N'ccccccc', NULL, NULL, N'Đại học công  nghiệp Hà Nội', N'noavatar.jpg', N'a00f8232-0674-4ac3-8a6b-89bd5ce471da')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'7ad84669-4ef6-466a-885c-b09797d3d6b4', N'abc@gmail.com', 0, N'ALnyAoG79fsS3RtL251GKpESWARkTFyu0FIR02XB5Gm/O5Jys6JwBuBVVT+XM4/TTA==', N'2594f2cd-1e62-45a0-890b-8a7f5e94debf', N'0964622245', 0, 0, NULL, 0, 0, N'hahahaha', NULL, NULL, N'hiephelo', NULL, NULL, N'Đại học công  nghiệp Hà Nội', N'noavatar.jpg', N'a00f8232-0674-4ac3-8a6b-89bd5ce471da')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'7ff0c209-f22e-472b-b74f-d6ec0f086487', N'khachhangtest@gmail.com', 0, N'AOSMsQ1Q6ubVGyk+v1130wUrph5BqXoudMmXNC4Pon42iNBvih8rT54LaOYjQRJXOg==', N'e617978c-87ba-4b69-9db6-ac535b4999e0', N'0965692258', 0, 0, NULL, 0, 300, N'khachhangtest', NULL, NULL, N'khachang', NULL, NULL, N'hà nội', N'noavatar.jpg', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'865a9ddc-ff8b-426d-9e30-8b8ab69e72e4', N'hiepn47591@gmail.com', 0, N'ABqYpASG40NPMRzFm7Aij++aWFnCJ9+AbzlQLb6yOVWck9c/pZdN1tVoj3hgkQFAKw==', N'b33cfacb-a425-425a-990b-01261f426e26', N'0964681635', 0, 0, NULL, 0, 1000, N'administrator', NULL, NULL, N'Trần Văn Viên', NULL, NULL, N'Đại học công  nghiệp Hà Nội', N'865a9ddc-ff8b-426d-9e30-8b8ab69e72e4.jpg', N'dc481379-dfae-4d9e-93d8-dce55add3258')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'8727a1be-83c5-4bae-be6a-368f26b8a5e5', N'hiepn475900@gmail.com', 0, N'AHQ/VOFLiHZEvzeHEBNz2fj1s3AmYaoTc+RaNsvBLtxjg8uV0sja3jrB73dfYC7rRA==', N'778d5b14-2214-4511-bdac-e2c729301ff9', N'0964681635', 0, 0, NULL, 0, 0, N'okok', NULL, NULL, N'GiDdy HiỆp', NULL, NULL, N'Đại học công  nghiệp Hà Nội', N'noavatar.jpg', N'ec481379-dfae-4d9e-93d8-dce55add3258')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'8c43382d-faf3-45e8-954e-ca9589173033', N'nmmm@gmail.com', 0, N'AAmm0tHy7sD1uOZvoHgYBWcVeOE7RrF4sneSVenUOUT8aG1XWFdETkAm4YwnFmU8xA==', N'08bdb92f-0e6e-4a55-a393-6860b45b85c9', N'0987223743', 0, 0, NULL, 0, 0, N'dddddddeee', NULL, NULL, N'nguyenhiep', NULL, NULL, N'Đại học công  nghiệp Hà Nội', N'noavatar.jpg', N'dc481379-dfae-4d9e-93d8-dce55add3258')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'98c9bfd9-6edb-42d8-80dc-63512116438c', N'hiepn4759111@gmail.com', 0, N'ABY41h+10awIjXGW9h+Q4PjLwXkPcfFlybAHrYrE5f0ND3pqtgdT2NeH1eyiSXsIFQ==', N'fc99a36f-5a81-4438-b177-e77a0d691bbb', N'0964681635', 0, 0, NULL, 0, 300, N'khachhanghiepns', NULL, NULL, N'Trần Văn Viên', NULL, NULL, N'Đại học công  nghiệp Hà Nội', N'noavatar.jpg', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'acd6cdda-f84a-40ca-b5e0-502af24cfe44', N'kknn@gmail.com', 0, N'ACBs2Y7woeggS1Ks9PyWXIfoQmfkxvdMlXxahZVPG69M6rAVYDyAw+Ku6qU6ShVvMQ==', N'37cdb9b7-bd0a-4e4f-b438-58ee310c4472', N'0964681635', 0, 0, NULL, 0, 0, N'ahsdas', NULL, NULL, N'sấdsa', NULL, NULL, N'Ha Noi', N'noavatar.jpg', N'dc481379-dfae-4d9e-93d8-dce55add3258')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'b8a4eb01-77d5-41ee-8073-ed823fe26918', N'haiphuong3519eee97@gmail.com', 1, N'AKt5zhEvgUJzKnvFSbramkrrMGik+wFbXhaAANrEoFO5gbuxoMYA3pysbJdmmellKw==', N'c7c964b4-510c-4d80-a5ab-3ba7774d3523', N'0964681635', 0, 0, NULL, 0, 0, N'testtest', NULL, NULL, N'testtest', NULL, NULL, N'Đại học công  nghiệp Hà Nội', N'noavatar.jpg', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'd3a9c7f9-92e0-4b43-8b07-e1fde0f1c4be', N'thuhuyenptth7898@gmail.com', 1, N'AG/RQbXgEmC6lVrNK+vpm/Bw8gi+g+nnrHyT+BzyuByY4qqyHujLkuZv8eSU7JKK3Q==', N'be9caf98-e688-4285-898f-48690fb3baea', N'0964681635', 0, 0, NULL, 0, 0, N'nbbnbnbnbn', NULL, NULL, N'GiDdy HiỆp', NULL, NULL, N'Đại học công  nghiệp Hà Nội', N'noavatar.jpg', N'a00f8232-0674-4ac3-8a6b-89bd5ce471da')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'e857c0c1-4a3e-4393-994d-d0aa77f7e9ad', N'bbb@gmail.com', 0, N'AAkedZzju+JKQAJwPmtlITPsYYmVBDhgumqv7NsBrjiNj4GbV1MQHLuAKcuELkExNw==', N'f113cb4c-ff72-417e-9c18-03b13fc46ba8', N'0964681635', 0, 0, NULL, 0, 0, N'bbbbb', NULL, NULL, N'bbbbbbbbb', NULL, NULL, N'Đại học công  nghiệp Hà Nội', N'noavatar.jpg', N'a00f8232-0674-4ac3-8a6b-89bd5ce471da')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'ee905bef-72ce-4590-93f9-f1a6eebc8819', N'hhhhh@gmail.com', 0, N'ABa2sdp7T4GSZvEsgluKNMiVK+MVLDQGeOkdf8BqMLaJejMOkMeSUh+R9nlLbR2wjQ==', N'e284b8bc-074f-4126-bcd0-082a615632f7', N'0964681635', 0, 0, NULL, 0, 0, N'ahahahahahaah', NULL, NULL, N'ddddddwewe', NULL, NULL, N'Đại học công  nghiệp Hà Nội', N'noavatar.jpg', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'f0bce217-bc51-409d-b7ca-c8292af1e5f5', N'nguyensyhiepboeeeess@gmail.com', 0, N'ADgYlgtFgxrKuLDN5VSzfiIQbD4RKatpuxzzwcaz4pyPOnMLpRktTl/vRE1XoEqkuw==', N'af3a4ea2-779f-4b3f-8cc4-5937332854e0', N'0964681638', 0, 0, NULL, 0, 500, N'thuhuyenptit', NULL, NULL, N'Phan Thị Thu Huyền', NULL, NULL, N'Hà đông, Hà nội', N'f0bce217-bc51-409d-b7ca-c8292af1e5f5.jpg', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'f6cba742-450b-492d-b492-128d5c77aa81', N'nhanviendonhang@gmail.com', 0, N'AArxndflwEliS4g62CI8jSEPc4Dw6mpsTGLWCiWi8rPNzFXyW/Kd4lFmqS2F4bMZRQ==', N'211eed5c-b178-4c9a-a4e9-b69a0fa6ec69', N'0964159358', 0, 0, NULL, 0, 0, N'nhanviendonhang', NULL, NULL, N'Phan Thị Thu Huyền', NULL, NULL, N'265 Cầu giấy, Hà Nội', N'f6cba742-450b-492d-b492-128d5c77aa81.jpg', N'ec481379-dfae-4d9e-93d8-dce55add3258')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MaNV], [CMND], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Avatar], [RoleID]) VALUES (N'f9bd102b-b18a-4b65-98b9-f333f7cd7ab9', N'haiphuong351997@gmail.com', 0, N'ACXZhyY/RzgvSESZqnt/D59rmIfUGwDSC0dH4RSUFr0BvT38aH96u91g1tNb5YFzpg==', N'5d0e8517-6d56-46ae-b8e5-818515f6c7de', N'0964681635', 0, 0, NULL, 0, 0, N'khachhanghiepnstest', NULL, NULL, N'nguyen sy hiep1', NULL, NULL, N'Đại học công  nghiệp Hà Nội', N'noavatar.jpg', N'37877e60-4cd3-4eb3-8a94-a5d881a81446')
GO
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [ThanhTien]) VALUES (N'13508', N'32665', 1, CAST(26300000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [ThanhTien]) VALUES (N'13508', N'70707', 1, CAST(25200000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [ThanhTien]) VALUES (N'21824', N'75462', 1, CAST(21990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [ThanhTien]) VALUES (N'23036', N'10476', 1, CAST(5750000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [ThanhTien]) VALUES (N'23036', N'16406', 1, CAST(6990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [ThanhTien]) VALUES (N'38162', N'75462', 1, CAST(21990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [ThanhTien]) VALUES (N'80504', N'13840', 4, CAST(19764000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [ThanhTien]) VALUES (N'80504', N'16406', 2, CAST(13980000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [ThanhTien]) VALUES (N'84732', N'13840', 1, CAST(4941000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [ThanhTien]) VALUES (N'85448', N'04053', 2, CAST(9980000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [ThanhTien]) VALUES (N'85448', N'16406', 1, CAST(6990000 AS Decimal(18, 0)))
GO
INSERT [dbo].[DonHangKH] ([MaDH], [MaKH], [PhiVanChuyen], [PTGiaoDich], [NgayDatMua], [TinhTrangDH], [Tongtien], [Ghichu], [Diachi], [Dienthoai], [MaAdmin], [thanhToanOnline]) VALUES (N'13508', N'16e8cda8-9a74-49cd-9eb5-57467e941024', CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-05-13T00:56:07.343' AS DateTime), 2, 51500000, NULL, N'Trường đại học công nghiệp Hà Nội', N'01674646597    ', N'0', NULL)
INSERT [dbo].[DonHangKH] ([MaDH], [MaKH], [PhiVanChuyen], [PTGiaoDich], [NgayDatMua], [TinhTrangDH], [Tongtien], [Ghichu], [Diachi], [Dienthoai], [MaAdmin], [thanhToanOnline]) VALUES (N'21824', NULL, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-05-10T20:31:54.167' AS DateTime), 3, 21990000, NULL, N'Nam Thịnh, Tiền Hải, Thái Bình', N'01374646597    ', N'1', NULL)
INSERT [dbo].[DonHangKH] ([MaDH], [MaKH], [PhiVanChuyen], [PTGiaoDich], [NgayDatMua], [TinhTrangDH], [Tongtien], [Ghichu], [Diachi], [Dienthoai], [MaAdmin], [thanhToanOnline]) VALUES (N'23036', N'16e8cda8-9a74-49cd-9eb5-57467e941024', CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-05-13T00:57:10.360' AS DateTime), 3, 12740000, NULL, N'Trường đại học công nghiệp Hà Nội', N'01674646597    ', N'1', NULL)
INSERT [dbo].[DonHangKH] ([MaDH], [MaKH], [PhiVanChuyen], [PTGiaoDich], [NgayDatMua], [TinhTrangDH], [Tongtien], [Ghichu], [Diachi], [Dienthoai], [MaAdmin], [thanhToanOnline]) VALUES (N'38162', NULL, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-05-10T01:55:57.837' AS DateTime), 3, 21990000, NULL, N'Nam Thịnh, Tiền Hải, Thái Bình', N'01374646597    ', N'0', NULL)
INSERT [dbo].[DonHangKH] ([MaDH], [MaKH], [PhiVanChuyen], [PTGiaoDich], [NgayDatMua], [TinhTrangDH], [Tongtien], [Ghichu], [Diachi], [Dienthoai], [MaAdmin], [thanhToanOnline]) VALUES (N'68458', NULL, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-05-11T00:48:11.223' AS DateTime), 4, 0, NULL, N'Nam Thịnh, Tiền Hải, Thái Bình', N'01374646597    ', N'1', NULL)
INSERT [dbo].[DonHangKH] ([MaDH], [MaKH], [PhiVanChuyen], [PTGiaoDich], [NgayDatMua], [TinhTrangDH], [Tongtien], [Ghichu], [Diachi], [Dienthoai], [MaAdmin], [thanhToanOnline]) VALUES (N'80504', NULL, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-05-11T01:17:16.493' AS DateTime), 3, 33744000, NULL, N'Nam Thịnh, Tiền Hải, Thái Bình', N'01374646597    ', N'1', NULL)
INSERT [dbo].[DonHangKH] ([MaDH], [MaKH], [PhiVanChuyen], [PTGiaoDich], [NgayDatMua], [TinhTrangDH], [Tongtien], [Ghichu], [Diachi], [Dienthoai], [MaAdmin], [thanhToanOnline]) VALUES (N'84732', NULL, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-05-11T00:51:05.670' AS DateTime), 3, 4941000, NULL, N'Nam Thịnh, Tiền Hải, Thái Bình', N'01374646597    ', N'1', NULL)
INSERT [dbo].[DonHangKH] ([MaDH], [MaKH], [PhiVanChuyen], [PTGiaoDich], [NgayDatMua], [TinhTrangDH], [Tongtien], [Ghichu], [Diachi], [Dienthoai], [MaAdmin], [thanhToanOnline]) VALUES (N'85448', N'16e8cda8-9a74-49cd-9eb5-57467e941024', CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-05-13T00:53:53.053' AS DateTime), 1, 16970000, NULL, N'Trường đại học công nghiệp Hà Nội', N'01674646597    ', N'1', NULL)
GO
INSERT [dbo].[GiaoDien] ([Id], [ThuocTinh], [GiaTri]) VALUES (1, N'Logo', N'logo.svg')
INSERT [dbo].[GiaoDien] ([Id], [ThuocTinh], [GiaTri]) VALUES (2, N'WebsiteName', N'Website thương mại điện tử ')
INSERT [dbo].[GiaoDien] ([Id], [ThuocTinh], [GiaTri]) VALUES (3, N'FooterText', NULL)
INSERT [dbo].[GiaoDien] ([Id], [ThuocTinh], [GiaTri]) VALUES (4, N'Facebook', N'https://www.facebook.com/hjep.nguyen.792')
INSERT [dbo].[GiaoDien] ([Id], [ThuocTinh], [GiaTri]) VALUES (5, N'Pinterest', N'https://www.facebook.com/hjep.nguyen.792')
INSERT [dbo].[GiaoDien] ([Id], [ThuocTinh], [GiaTri]) VALUES (6, N'Twitter', N'https://www.facebook.com/hjep.nguyen.792')
GO
INSERT [dbo].[HangSanXuat] ([HangSX], [TenHang], [TruSoChinh], [QuocGia]) VALUES (N'03500', N'HP', N'Palo Alto, California, Hoa Kỳ', N'Hoa Kỳ')
INSERT [dbo].[HangSanXuat] ([HangSX], [TenHang], [TruSoChinh], [QuocGia]) VALUES (N'11112', N'Dell', N'Round Rock, Texas, Hoa Kỳ', N'Hoa Kỳ')
INSERT [dbo].[HangSanXuat] ([HangSX], [TenHang], [TruSoChinh], [QuocGia]) VALUES (N'22232', N'Nokia', N'Espoo, Phần Lan', N'Phần Lan')
INSERT [dbo].[HangSanXuat] ([HangSX], [TenHang], [TruSoChinh], [QuocGia]) VALUES (N'27844', N'Vivo', N'Đông Hoản, Trung Quốc', N'Trung Quốc')
INSERT [dbo].[HangSanXuat] ([HangSX], [TenHang], [TruSoChinh], [QuocGia]) VALUES (N'42742', N'Bphone', N'Dương Đình Nghệ, Yên Hòa, Cầu Giấy, Hà Nội', N'Việt Nam')
INSERT [dbo].[HangSanXuat] ([HangSX], [TenHang], [TruSoChinh], [QuocGia]) VALUES (N'62575', N'OPPO', N'Đông Hoản, Trung Quốc', N'Trung Quốc')
INSERT [dbo].[HangSanXuat] ([HangSX], [TenHang], [TruSoChinh], [QuocGia]) VALUES (N'72443', N'SamSung', N'Samsung Tower & Samsung Town, Seocho-gu, Seoul, Hàn Quốc', N'Hàn Quốc')
INSERT [dbo].[HangSanXuat] ([HangSX], [TenHang], [TruSoChinh], [QuocGia]) VALUES (N'76615', N'Vsmart', N'Khu Công nghiệp Công nghệ cao 1, Khu Công nghệ cao Hòa Lạc, Xã Hạ Bằng, Huyện Thạch Thất, Hà Nội', N'Việt Nam')
INSERT [dbo].[HangSanXuat] ([HangSX], [TenHang], [TruSoChinh], [QuocGia]) VALUES (N'80642', N'Huawei', N'Thâm Quyến, Trung Quốc', N'Trung Quốc')
INSERT [dbo].[HangSanXuat] ([HangSX], [TenHang], [TruSoChinh], [QuocGia]) VALUES (N'84680', N'Apple', N'Cupertino, California, Hoa Kỳ', N'Hoa Kỳ')
INSERT [dbo].[HangSanXuat] ([HangSX], [TenHang], [TruSoChinh], [QuocGia]) VALUES (N'88281', N'Xiaomi', N'Hải Điến, Bắc Kinh, Trung Quốc', N'Trung Quốc')
GO
INSERT [dbo].[KhoSP] ([IDKho], [MaSP], [SL], [DateImport], [DateExport], [TenSP]) VALUES (N'17275', N'70707', 23, CAST(N'2021-05-11T23:49:55.960' AS DateTime), CAST(N'2021-05-11T23:49:55.960' AS DateTime), N'Samsung Galaxy S21 Plus 256GB 5G - Chính hãng')
INSERT [dbo].[KhoSP] ([IDKho], [MaSP], [SL], [DateImport], [DateExport], [TenSP]) VALUES (N'24156', N'20152', 25, CAST(N'2021-05-12T00:36:55.290' AS DateTime), CAST(N'2021-05-12T00:36:55.290' AS DateTime), N'Vivo Y12s 2021 3GB/32GB - Chính hãng')
INSERT [dbo].[KhoSP] ([IDKho], [MaSP], [SL], [DateImport], [DateExport], [TenSP]) VALUES (N'25854', N'75462', 41, CAST(N'2021-05-10T21:30:02.270' AS DateTime), CAST(N'2021-05-10T21:30:02.270' AS DateTime), N'iPhone 11 - 128GB - Chính hãng VN/A')
INSERT [dbo].[KhoSP] ([IDKho], [MaSP], [SL], [DateImport], [DateExport], [TenSP]) VALUES (N'27576', N'16406', 25, CAST(N'2021-05-11T01:14:17.567' AS DateTime), CAST(N'2021-05-11T01:14:17.567' AS DateTime), N'Xiaomi Redmi Note 10 Pro 6GB/128GB - Chính hãng')
INSERT [dbo].[KhoSP] ([IDKho], [MaSP], [SL], [DateImport], [DateExport], [TenSP]) VALUES (N'32738', N'10476', 17, CAST(N'2021-05-12T00:36:48.647' AS DateTime), CAST(N'2021-05-12T00:36:48.647' AS DateTime), N'Vivo V20 SE - Chính hãng')
INSERT [dbo].[KhoSP] ([IDKho], [MaSP], [SL], [DateImport], [DateExport], [TenSP]) VALUES (N'40504', N'83681', 11, CAST(N'2021-05-12T00:36:42.517' AS DateTime), CAST(N'2021-05-12T00:36:42.517' AS DateTime), N'Vivo S1 Pro - 8GB/128GB - Chính hãng')
INSERT [dbo].[KhoSP] ([IDKho], [MaSP], [SL], [DateImport], [DateExport], [TenSP]) VALUES (N'42630', N'28525', 12, CAST(N'2021-05-11T23:50:38.873' AS DateTime), CAST(N'2021-05-11T23:50:38.873' AS DateTime), N'Samsung Galaxy S21 Ultra 256GB 5G - Chính hãng')
INSERT [dbo].[KhoSP] ([IDKho], [MaSP], [SL], [DateImport], [DateExport], [TenSP]) VALUES (N'48824', N'21134', 16, CAST(N'2021-05-11T23:50:12.573' AS DateTime), CAST(N'2021-05-11T23:50:12.573' AS DateTime), N'Samsung Galaxy S21 Plus 128GB 5G - Chính hãng')
INSERT [dbo].[KhoSP] ([IDKho], [MaSP], [SL], [DateImport], [DateExport], [TenSP]) VALUES (N'55050', N'75462', 45, CAST(N'2021-05-10T20:19:56.530' AS DateTime), CAST(N'2021-05-10T20:19:56.530' AS DateTime), N'iPhone 11 - 128GB - Chính hãng VN/A')
INSERT [dbo].[KhoSP] ([IDKho], [MaSP], [SL], [DateImport], [DateExport], [TenSP]) VALUES (N'63745', N'13840', 31, CAST(N'2021-05-10T21:29:33.390' AS DateTime), CAST(N'2021-05-10T21:29:33.390' AS DateTime), N'Xiaomi Redmi Note 10 6GB/128GB - Chính hãng')
INSERT [dbo].[KhoSP] ([IDKho], [MaSP], [SL], [DateImport], [DateExport], [TenSP]) VALUES (N'67356', N'32665', 21, CAST(N'2021-05-11T23:51:02.300' AS DateTime), CAST(N'2021-05-11T23:51:02.300' AS DateTime), N'Samsung Galaxy S21 Ultra 128GB 5G - Chính hãng')
INSERT [dbo].[KhoSP] ([IDKho], [MaSP], [SL], [DateImport], [DateExport], [TenSP]) VALUES (N'77565', N'62855', 29, CAST(N'2021-05-12T00:37:10.063' AS DateTime), CAST(N'2021-05-12T00:37:10.063' AS DateTime), N'Vivo V20 - 8GB/128GB - Chính hãng')
INSERT [dbo].[KhoSP] ([IDKho], [MaSP], [SL], [DateImport], [DateExport], [TenSP]) VALUES (N'78162', N'13840', 30, CAST(N'2021-05-10T21:18:09.100' AS DateTime), CAST(N'2021-05-10T21:18:09.100' AS DateTime), N'Xiaomi Redmi Note 10 6GB/128GB - Chính hãng')
INSERT [dbo].[KhoSP] ([IDKho], [MaSP], [SL], [DateImport], [DateExport], [TenSP]) VALUES (N'80176', N'26674', 32, CAST(N'2021-05-11T23:51:12.560' AS DateTime), CAST(N'2021-05-11T23:51:12.560' AS DateTime), N'Oppo A93 - 8GB/128GB - Chính hãng')
INSERT [dbo].[KhoSP] ([IDKho], [MaSP], [SL], [DateImport], [DateExport], [TenSP]) VALUES (N'86188', N'38131', 25, CAST(N'2021-05-11T23:51:37.887' AS DateTime), CAST(N'2021-05-11T23:51:37.887' AS DateTime), N'Oppo Find X2 - Chính hãng')
GO
INSERT [dbo].[KhuyenMai] ([MaKM], [NgayBatDau], [NgayKetThuc], [NoiDung], [TenCT], [AnhCT]) VALUES (N'60750', CAST(N'2020-01-21' AS Date), CAST(N'2020-03-15' AS Date), N'<p>Khuyến m&atilde;i đầu năm. mua c&agrave;ng nhiều lợi &iacute;ch c&agrave;ng tăng</p>
', N'Khuyến mãi đầu năm', N'607501.jpg')
INSERT [dbo].[KhuyenMai] ([MaKM], [NgayBatDau], [NgayKetThuc], [NoiDung], [TenCT], [AnhCT]) VALUES (N'76337', CAST(N'2021-01-01' AS Date), CAST(N'2021-02-15' AS Date), N'<p>Giảm gi&aacute; tất cả c&aacute;c mặt h&agrave;ng.</p>
', N'Khuyến mãi cuối năm', N'763371.jpg')
GO
INSERT [dbo].[Link] ([id], [Url], [Image], [Text], [Group]) VALUES (1, N'http://localhost:11878/SanPham?id=DT001', N'1.jpg', N'Lumia 830 Cover', N'SlideShow')
GO
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'64844', N'Điện thoại')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'NOTTT', N'Điện tử')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'55341', N'Đồng hồ')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'05341', N'Laptop - Máy tính')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'22832', N'Máy tính')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT_NCC], [Email], [Website], [Net_user]) VALUES (N'35313', N'VNPT', N'Số 9 Ngõ 18 Vũ Thanh, Chợ Dừa, Hoàn Kiếm, Hà Nội', N'0964681635 ', N'vnpt@gmail.com', N'https://vnpt.com.vn', N'administrator')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT_NCC], [Email], [Website], [Net_user]) VALUES (N'81113', N'Viettel Telecom', N'Đội 10, Thông Ngọc Trục, Xã Đại Mỗ, Huyện Từ Liêm, Đại Mễ, Hà Nội', N'0964681636 ', N'vettel@gmail.com', N'https://vietteltelecom.vn', N'administrator')
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [LoaiSP], [SoLuotXemSP], [HangSX], [XuatXu], [GiaGoc], [GiaTien], [MoTa], [AnhDaiDien], [AnhNen], [AnhKhac], [SoLuong], [isnew], [ishot], [MaNCC]) VALUES (N'04053', N'Điện thoại di động Nokia 5.4 - Chính hãng', N'64844', NULL, N'22232', N'Trung Quốc', CAST(4990000 AS Decimal(18, 0)), CAST(4990000 AS Decimal(18, 0)), N'<h2>Mua Nokia 5.4 gi&aacute; rẻ ch&iacute;nh h&atilde;ng tại Tiến Dũng Mobile</h2>

<p>Nokia chắc chắn l&agrave; một thương hiệu điện thoại đ&atilde; kh&ocirc;ng c&ograve;n qu&aacute; xa lạ đối với ch&uacute;ng ta, v&agrave; mới đ&acirc;y h&atilde;ng đ&atilde; vừa cho ra mắt mẫu điện thoại mới với c&aacute;i t&ecirc;n Nokia 5.4, hứa hẹn sẽ l&agrave;m người d&ugrave;ng h&agrave;i l&ograve;ng bởi những thứ m&agrave; m&aacute;y đem lại.</p>

<h3>Thiết kế hiện đại, thời thượng</h3>

<p>Được ra mắt trong nửa cuối năm 2020, đầu năm 2021 thế n&ecirc;n tất nhi&ecirc;n Nokia 5.4 sẽ mang đầy đủ những đường n&eacute;t thiết kế thời thượng của những chiếc smartphone hiện đại. M&aacute;y được trang bị một m&agrave;n h&igrave;nh tr&agrave;n viền dạng đục lỗ với k&iacute;ch thước lớn l&ecirc;n tới 6.39 inch, tỉ lệ m&agrave;n h&igrave;nh đạt chuẩn 19.5:9, diện t&iacute;ch m&agrave;n h&igrave;nh chiếm tới 81.9% mặt trước, gi&uacute;p người d&ugrave;ng c&oacute; được một kh&ocirc;ng gian trải nghiệm rộng r&atilde;i, hiển thị được nhiều th&ocirc;ng tin nhất c&oacute; thể nhưng vẫn nằm gọn trong l&ograve;ng b&agrave;n tay của người d&ugrave;ng. Độ ph&acirc;n giải của m&agrave;n h&igrave;nh tuy chỉ dừng lại ở mức HD+, thế nhưng do được t&iacute;ch hợp tấm nền IPS LCD, vậy n&ecirc;n chất lượng hiển thị của m&aacute;y vẫn sẽ đảm bảo được độ sắc n&eacute;t, c&ugrave;ng g&oacute;c nh&igrave;n si&ecirc;u rộng. Với Nokia 5.4, người d&ugrave;ng vẫn c&oacute; thể thoải m&aacute;i thực hiện được c&aacute;c thao t&aacute;c cơ bản h&agrave;ng ng&agrave;y như lướt web, đoc b&aacute;o hay xem m&agrave; kh&ocirc;ng hề gặp một ch&uacute;t trở ngại hoặc kh&oacute; chịu n&agrave;o.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/13/ddd.jpg" /></p>

<p>&nbsp;</p>

<p>Nokia 5.4 c&oacute; lớp vỏ b&ecirc;n ngo&agrave;i được ho&agrave;n thiện từ nhựa giả k&iacute;nh v&ocirc; c&ugrave;ng bắt mắt v&agrave; sang trọng, đặc biệt phần mặt lưng của m&aacute;y c&ograve;n được Nokia thiết kế theo kiểu v&aacute;t cong 3D mềm mại về 2 cạnh b&ecirc;n, mang lại một cảm gi&aacute;c cấm nắm cực k&igrave; thoải m&aacute;i. Nokia 5.4 c&oacute; tất cả 2 phi&ecirc;n bản m&agrave;u sắc cho người d&ugrave;ng lựa chọn bao gồm m&agrave;u Xanh Polar Night v&agrave; Dusk T&iacute;m.</p>

<h3>Khả năng nhiếp ảnh tốt với bộ 4 camera</h3>

<p>Hệ thống camera của Nokia 5.4 cũng l&agrave; một ưu điểm kh&ocirc;ng thể kh&ocirc;ng nhắc tới. Tuy chỉ l&agrave; một mẫu điện thoại nằm ở ph&acirc;n kh&uacute;c gi&aacute; rẻ tầm trung, thế nhưng m&aacute;y cũng được trang bị một hệ thống camera sau với 4 cảm biến cực xịn bao gồm camera ch&iacute;nh 48MP, camera g&oacute;c si&ecirc;u rộng 5MP, v&agrave; camera macro c&ugrave;ng tele c&oacute; c&ugrave;ng độ ph&acirc;n giải 2MP. Camera sau của m&aacute;y cũng hỗ trợ lấy n&eacute;t tự động Auto Focus, HDR, chụp to&agrave;n cảnh, quay video 4K@30fps v&agrave; Full HD@30fps.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/13/bbb.jpg" /></p>

<p>Trong khi đ&oacute;, camera selfie ph&iacute;a trước sẽ c&oacute; độ ph&acirc;n giải l&agrave; 16MP, khẩu độ f/2.0, hỗ trợ quay video ở mức Ful HD 30 khung h&igrave;nh/gi&acirc;y. Với camera selfie n&agrave;y, Nokia 5.4 hứa hẹn sẽ mang tới cho người d&ugrave;ng những bức ảnh &ldquo;tự sướng&rdquo; sắc n&eacute;t c&ugrave;ng chất lượng tốt nhất.</p>

<h2>Hiệu năng mượt m&agrave; với vi xử l&yacute; Snapdragon 662</h2>

<p>Được Nokia ưu &aacute;i trang bị cho bộ vi xử l&yacute; &ldquo;quốc d&acirc;n&rdquo; ở ph&acirc;n kh&uacute;c gi&aacute; rẻ l&agrave; Snapdragon 662 8 nh&acirc;n, với tốc độ xung nhịp tối đa đạt 2.0GHz, được sản xuất tr&ecirc;n tiến tr&igrave;nh 11nm hiện đại, t&iacute;ch hợp bộ GPU xử l&yacute; đồ họa Adreno 610, Nokia 5.4 chắc chắn sẽ mang lại cho người d&ugrave;ng khả năng xử l&yacute; ổn định v&agrave; mượt m&agrave; nhất. Với Snapdragon 662, chắc chắn những t&aacute;c vụ cơ bản h&agrave;ng ng&agrave;y sẽ kh&ocirc;ng thể l&agrave;m kh&oacute; được bộ vi xử l&yacute; n&agrave;y, c&ograve;n việc giải tr&iacute; với những tựa game online phổ biến hiện nay như Li&ecirc;n Minh Tốc Chiến, PUBG Mobile hay Call of Duty Mobile, con chip n&agrave;y cũng c&oacute; thể ho&agrave;n to&agrave;n xử l&yacute; được tốt.</p>

<p>&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/13/aaa.jpg" /></p>

<p>Đi c&ugrave;ng với vi xử l&yacute; Snapdragon 662 l&agrave; bộ nhớ RAM 4GB gi&uacute;p cho người d&ugrave;ng c&oacute; thể thoải m&aacute;i sử dụng đa nhiệm c&aacute;c ứng dụng m&agrave; kh&ocirc;ng lo gặp phải t&igrave;nh trạng bị tr&agrave;n RAM như nhiều mẫu m&aacute;y gi&aacute; rẻ kh&aacute;c chỉ c&oacute; 2GB hoặc 3GB RAM. Bộ nhớ trong của m&aacute;y cũng l&agrave; một điểm cộng khi c&oacute; dung lượng l&ecirc;n tới 128GB cho người d&ugrave;ng c&oacute; thể thoải m&aacute;i lưu trữ dữ liệu, kh&ocirc;ng phải bận t&acirc;m tới việc hết kh&ocirc;ng gian lưu trữ.</p>

<h3>Dung lượng pin lớn 4000mAh</h3>

<p><a name="_heading=h.gjdgxs"></a>Cung cấp năng lượng cho Nokia 5.4 vẫn l&agrave; một vi&ecirc;n pin dung lượng kh&aacute; khủng ở thời điểm hiện tại &ndash; 4.000mAh, đặc biệt l&agrave; khi đi c&ugrave;ng với con chip Snapdragon 662 11nm tiết kiệm điện, m&aacute;y sẽ cho ph&eacute;p người d&ugrave;ng c&oacute; thể thoải m&aacute;i sử dụng trong cả 1 ng&agrave;y d&agrave;i, thậm ch&iacute; l&ecirc;n tới tận 2 ng&agrave;y mới cần phải sạc lại. Nokia 5.4 cũng được trang bị cổng sạc chuẩn USB Type-C, hiện đang được trang bị tr&ecirc;n hầu hết c&aacute;c mẫu điện thoại hiện nay.</p>

<p><a name="_heading=h.ijajcqs268vj"></a></p>

<p>Đến ngay với&nbsp;<a href="https://hoanghamobile.com/">https://tiendungmobile.xyz/</a>&nbsp;để mua điện thoại Nokia 5.4 gi&aacute; tốt nhất thị trường. Chiếc smartphone n&agrave;y chắc chắn sẽ kh&ocirc;ng l&agrave;m bạn thất vọng. Tham khảo th&ecirc;m c&aacute;c sản phẩm kh&aacute;c của Nokia tại đường link&nbsp;<a href="https://hoanghamobile.com/dien-thoai-di-dong/nokia%20">https://tiendungmobile.com/</a>&nbsp;Nội dung chi tiếtNội dung chi tiết</p>
', N'040531.jpg', N'040532.jpg', N'040533.jpg', NULL, 1, 1, N'81113')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [LoaiSP], [SoLuotXemSP], [HangSX], [XuatXu], [GiaGoc], [GiaTien], [MoTa], [AnhDaiDien], [AnhNen], [AnhKhac], [SoLuong], [isnew], [ishot], [MaNCC]) VALUES (N'10476', N'Vivo V20 SE - Chính hãng', N'64844', NULL, N'27844', N'Trung Quốc', CAST(5750000 AS Decimal(18, 0)), CAST(5750000 AS Decimal(18, 0)), N'<p>Mua điện thoại di động Vivo V20 SE gi&aacute; rẻ ch&iacute;nh h&atilde;ng tại Tiến Dũng</p>

<p>Vivo l&agrave; thương hiệu sản xuất v&agrave; cung cấp c&aacute;c mẫu điện thoại th&ocirc;ng minh đến từ Trung Quốc. Tại thị trường Việt Nam, Vivo phải cạnh tranh với rất nhiều đối thủ lớn trong ph&acirc;n kh&uacute;c gi&aacute; tầm trung. Mặc d&ugrave; vậy, c&ocirc;ng ty vẫn khẳng định t&ecirc;n tuổi bởi chất lượng sản phẩm vượt trội v&agrave; thiết kế kh&aacute;c biệt. Cuối năm 2020, Vivo ch&iacute;nh thức giới thiệu đến người d&ugrave;ng Việt Nam chiếc điện thoại Vivo V20 SE. Đ&acirc;y l&agrave; chiếc smartphone với nhiều ưu điểm hấp dẫn m&agrave; bạn kh&ocirc;ng thể bỏ lỡ trong tầm gi&aacute; n&agrave;y.&nbsp;</p>

<p><img src="https://lh5.googleusercontent.com/jVBHYg_HOeRNq66tkmXyIYH3IfzXnQSlGYlO1GBZ3tO0obe_pCEKZjCV7442Whcw9nvu2byD5qkn2VGZYyrzOH309-cTgmxeVEeiBTkD8gNC3wNw1S_Bxtzf1C0sNiGH9VauYaw" style="height:351px; width:624px" /></p>

<p>Thiết kế hiện đại, bắt mắt với m&agrave;n h&igrave;nh lớn&nbsp;</p>

<p>Cũng như những chiếc smartphone kh&aacute;c nh&agrave; Vivo, chiếc Vivo V20 SE sở hữu ng&ocirc;n ngữ thiết kế hiện đại v&agrave; c&aacute;c chi tiết được ho&agrave;n thiện rất tốt. Phần khung viền bằng nhựa trọng lượng chỉ khoảng 171g n&ecirc;n cầm rất thoải m&aacute;i v&agrave; đầm tay. Mặt lưng của m&aacute;y được bo cong một c&aacute;ch tinh tế v&agrave; m&agrave;u sắc c&oacute; thể thay đổi t&ugrave;y theo &aacute;nh s&aacute;ng v&agrave; g&oacute;c nh&igrave;n. G&oacute;c tr&ecirc;n b&ecirc;n tr&aacute;i l&agrave; m&ocirc;-đun camera h&igrave;nh chữ nhật kh&aacute; nhỏ gọn. Ngoại h&igrave;nh b&ecirc;n ngo&agrave;i của Vivo V20 SE ch&iacute;nh h&atilde;ng được đ&aacute;nh gi&aacute; l&agrave; nổi bật khi đặt b&ecirc;n cạnh những chiếc smartphone kh&aacute;c.&nbsp;</p>

<p><img src="https://lh6.googleusercontent.com/Kqjna-YcLnkY_u8tM81VBNJ8QAkd_rFDM93IhSPwlc9S9SJfVsSJ2L8hDnTcu41U-HuTZacNr7ja7Dh3TGvfs7IwNfEE47ldSbhldHFk13k-OObFUguNwzg5_AEqvAcv6KpsE_0" style="height:361px; width:624px" /></p>

<p>Mặt trước của chiếc Vivo V20 SE ch&iacute;nh h&atilde;ng l&agrave; m&agrave;n h&igrave;nh AMOLED 6.44 inch với độ ph&acirc;n giải Full HD+ (1080 x 2400 Pixels). Nh&agrave; sản xuất lựa chọn kiểu m&agrave;n h&igrave;nh giọt nước phổ biến tr&ecirc;n c&aacute;c smartphone hiện nay. C&aacute;c viền m&agrave;n h&igrave;nh đ&atilde; được tinh giản c&ugrave;ng tỷ lệ 20:9 đem lại trải nghiệm kh&ocirc;ng gian tối đa cho người d&ugrave;ng. M&agrave;n h&igrave;nh của Vivo V20 SE hiển thị m&agrave;u sắc kh&aacute; ch&acirc;n thực v&agrave; bắt mắt, r&otilde; r&agrave;ng ngay cả khi sử dụng ngo&agrave;i trời.&nbsp;</p>

<p>Cụm 3 camera chụp h&igrave;nh ấn tượng</p>

<p>B&ecirc;n cạnh thiết kế nổi bật, hiệu năng chụp ảnh cũng l&agrave; một điểm s&aacute;ng tr&ecirc;n chiếc Vivo V20 SE ch&iacute;nh h&atilde;ng. Như đ&atilde; đề cập ở tr&ecirc;n, mặt sau của điện thoại l&agrave; m&ocirc;-đun camera h&igrave;nh chữ nhật chứa 3 cảm biến. Bao gồm camera g&oacute;c rộng 48 MP, khẩu độ f/1.8, hỗ trợ lấy n&eacute;t theo pha PDAF. Ngo&agrave;i ra c&ograve;n c&oacute; camera g&oacute;c si&ecirc;u rộng độ ph&acirc;n giải 8 MP, khẩu độ f/2.2 v&agrave; camera đo chiều s&acirc;u hỗ trợ x&oacute;a ph&ocirc;ng 2 MP, khẩu độ f/2.4. Với hệ thống camera n&agrave;y, Vivo V20 SE ch&iacute;nh h&atilde;ng c&oacute; thể đem lại những bức ảnh &ldquo;chất như nước cất&rdquo; v&agrave; nghệ thuật kh&ocirc;ng thua k&eacute;m g&igrave; c&aacute;c smartphone cao cấp.&nbsp;</p>

<p><img src="https://lh3.googleusercontent.com/xlOYMlfJUAO8aZPGugIUMr-y1Uoe0XeX-ja8K5JBcBimPaPQiF2dtEhLuSWDOYG1X1t9GoYWyxGtLVBbTTKzS9gPYHtfs_Chyb8dL2vRziER2G3yyECRgAXTxhXVcpRt7s1P4_I" style="height:415px; width:624px" /></p>

<p>Những bức ảnh chụp từ chiếc Vivo V20 SE được đ&aacute;nh gi&aacute; bắt chi tiết kh&aacute; tốt trong điều kiện thiếu s&aacute;ng. C&aacute;c h&igrave;nh ảnh chụp đ&ecirc;m c&oacute; thể hơi s&aacute;ng hơn so với b&igrave;nh thường. Đối với ảnh ch&acirc;n dung, m&aacute;y x&oacute;a ph&ocirc;ng ph&iacute;a sau kh&aacute; ổn. Ngo&agrave;i ra, camera selfie 32MP ở mặt trước cho m&agrave;u ảnh kh&aacute; nịnh mắt v&agrave; chi tiết ảnh tốt. Bạn cũng c&oacute; thể sử dụng hệ thống camera tr&ecirc;n Vivo V20 SE để ghi lại những đoạn video lưu giữ khoảnh khắc.&nbsp;&nbsp;</p>

<p>Hiệu năng ổn định với chip Snapdragon 665</p>

<p><img src="https://lh3.googleusercontent.com/xbRxfwWcP1iLVHK32Qu_Wt-EZkwSHVHv27WYt0B0Nm29tCTjDzjVHMsgjIRQ3A1EZHy0apLZomPxNx6DdEMnmmlfbs64efjfhB1KfSJjXb3aBDQjSVjKu-x9gOdNvIOPJftF0vc" style="height:351px; width:624px" /></p>

<p>Chiếc Vivo V20 SE ch&iacute;nh h&atilde;ng được nh&agrave; sản xuất trang bị con chip Snapdragon 665. Trong đ&oacute; bao gồm 4 nh&acirc;n tốc độ 2.0 GHz &amp; 4 nh&acirc;n tốc độ 1.8 GHz v&agrave; đồ họa Adreno 610. Với con chip n&agrave;y, điện thoại c&oacute; thể đ&aacute;p ứng c&aacute;c t&aacute;c vụ h&agrave;ng ng&agrave;y như lướt web, đọc v&agrave; nhắn tin, xem c&aacute;c trang mua sắm,&hellip; Với t&aacute;c vụ chơi game, tốc độ khung h&igrave;nh 60 FPS c&oacute; thể hiện thị c&aacute;c chi tiết nh&acirc;n vật v&agrave; hiệu ứng của m&aacute;y rất mượt m&agrave;. Vivo V20 SE ch&iacute;nh h&atilde;ng đi k&egrave;m với RAM 8GB v&agrave; bộ nhớ trong 128 GB. M&aacute;y sở hữu vi&ecirc;n pin 4100mAh v&agrave; sạc nhanh c&ocirc;ng suất 33W. Bạn ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m Vivo V20 SE sẽ đ&aacute;p ứng nhu cầu sử dụng li&ecirc;n tục trong ng&agrave;y d&agrave;i m&agrave; kh&ocirc;ng bị gi&aacute;n đoạn.&nbsp;</p>

<p>Sản phẩm đang được b&aacute;n tr&ecirc;n hệ thống của Ho&agrave;ng H&agrave; Mobile với mức gi&aacute; ưu đ&atilde;i v&agrave; chế độ bảo h&agrave;nh ch&iacute;nh h&atilde;ng 12 th&aacute;ng. Tham khảo th&ecirc;m th&ocirc;ng tin sản phẩm tại link: https://hoanghamobile.com/dien-thoai-di-dong/vivo-v20-se-chinh-hang</p>
', N'104761.jpg', N'104762.jpg', N'104763.jpg', 16, 1, 1, N'35313')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [LoaiSP], [SoLuotXemSP], [HangSX], [XuatXu], [GiaGoc], [GiaTien], [MoTa], [AnhDaiDien], [AnhNen], [AnhKhac], [SoLuong], [isnew], [ishot], [MaNCC]) VALUES (N'13840', N'Xiaomi Redmi Note 10 6GB/128GB - Chính hãng', N'64844', NULL, N'88281', N'Trung Quốc', CAST(5490000 AS Decimal(18, 0)), CAST(4941000 AS Decimal(18, 0)), N'<h1>Mua Xiaomi Redmi Note 10 6GB/128GB ch&iacute;nh h&atilde;ng, gi&aacute; tốt tại Tiến Dũng</h1>

<p>Xiaomi đ&atilde; ch&iacute;nh thức tr&igrave;nh l&agrave;ng bộ đ&ocirc;i Redmi Note 10 Series trong sự kiện ng&agrave;y 16 th&aacute;ng 3 tại Việt Nam. Redmi Note 10 phi&ecirc;n bản 6GB/128GB được Xiaomi ưu &aacute;i đặt t&ecirc;n l&agrave; Nh&agrave; Th&aacute;m Hiểm AMOLED. Chiếc smartphone n&agrave;y được n&acirc;ng cấp với tấm nền AMOLED v&agrave; vi xử l&yacute; Snapdragon 678 cực mới.&nbsp;</p>

<h2>Thiết kế nguy&ecirc;n khối sang trọng, m&agrave;n h&igrave;nh AMOLED 6.43 inch</h2>

<p>Redmi Note 10 sở hữu thiết kế kim loại nguy&ecirc;n khối sang trọng, tinh tế. Mặt lưng được bo cong 3D, hai đầu phẳng, c&aacute;c cạnh thon gọn mang đến vẻ đẹp tao nh&atilde;. Phối m&agrave;u tự nhi&ecirc;n nhưng vẫn rất bỏng bẩy, bắt mắt. Với trọng lượng dưới 180g, điện thoại tr&ocirc;ng khả mỏng v&agrave; dễ cầm nắm.</p>

<p><img src="https://lh3.googleusercontent.com/fb6M7bGDebpJsC15BC3pY1pRF-vH9PNBhHrX_EUITwvFzbnTn6m8Tq_qqUW6KdJFRjcrwfUOtolBPAR_fU5AI1WSbNpEJSfoc7KnAs5gIcb4pIUHiS6gPMshjkueXEpavI36HYw" style="height:323px; width:646px" /></p>

<p>Để mang đến trải nghiệm tốt nhất cho người d&ugrave;ng, Xiaomi đ&atilde; trang bị cho Redmi Note 10 tấm nền AMOLED DotDisplay v&agrave; k&iacute;nh cường lực Corning Gorilla 3. Nhờ đ&oacute; độ bền cho sản phẩm cũng tăng l&ecirc;n đ&aacute;ng kể. M&agrave;n h&igrave;nh c&oacute; k&iacute;ch thước 6.43 inch, độ s&aacute;ng 100 nits v&agrave; hỗ trợ 100% dải m&agrave;u DCI-P3 gi&uacute;p mang đến những h&igrave;nh ảnh sắc n&eacute;t. Ngo&agrave;i ra, thiết bị n&agrave;y c&ograve;n c&oacute; cảm biến &aacute;nh s&aacute;ng 360 độ, cảm biến v&acirc;n tay ở ph&iacute;m kh&oacute;a cạnh b&ecirc;n c&ugrave;ng khả năng chống thấm IP53.</p>

<h2>Bộ bốn camera AI ấn tượng, camera ch&iacute;nh 48MP</h2>

<p>Redmi Note 10 được trang bị tới bốn camera AI gi&uacute;p người d&ugrave;ng kh&aacute;m ph&aacute; v&agrave; bắt trọn mọi khoảnh khắc trong cuộc sống một c&aacute;ch chi tiết nhất. D&ugrave; l&agrave; chụp cận cảnh hay chụp khung cảnh rộng lớn như n&uacute;i rừng h&ugrave;ng vĩ, biển cả xa x&ocirc;i đều c&oacute; thể thực hiện dễ d&agrave;ng.&nbsp;</p>

<p><img src="https://lh3.googleusercontent.com/btMKsnAqKoSAQDEzSzLVIE870jPcILLMIu12gt2dOenDfI22rMz3oFhvDzI8CXUPwFxbcvDQ1BY7o5-IOQAFQezY-MvqZBZxGo72E65EXJJ_javrUWnjZjEuqqJjFvWkUgGkL8Y" style="height:338px; width:645px" /></p>

<p>Camera ch&iacute;nh 48MP gi&uacute;p mang đến những bức ảnh họa tiết đầy đủ, quay video time-lapse chuy&ecirc;n nghiệp. Camera g&oacute;c si&ecirc;u rộng 8MP hỗ trợ chụp ảnh nh&oacute;m, ảnh tập thể đẹp. B&ecirc;n cạnh đ&oacute;, camera macro 2MP kết hợp c&ugrave;ng cảm biến độ s&acirc;u cho ph&eacute;p chụp cận cảnh, chụp ch&acirc;n dung bắt mắt. Ph&iacute;a trước l&agrave; camera selfie lấy n&eacute;t tốt, tạo ra những bức ảnh ấn tượng.</p>

<p>Chế độ chụp ảnh đ&ecirc;m d&ugrave;ng c&aacute;c thuật to&aacute;n n&acirc;ng cao để cho ra những bức ảnh r&otilde; n&eacute;t kể cả trong điều kiện &aacute;nh s&aacute;ng yếu. Người d&ugrave;ng c&ograve;n c&oacute; thể tạo ra những video chuyển động nhanh hấp dẫn. Ngo&agrave;i ra, c&aacute;c chế độ chụp ch&acirc;n dung, tự động lấy n&eacute;t bằng laser dựa tr&ecirc;n AI, hộ trợ quay video 4K, quay slo-mo v&agrave; zoom quang 5x cũng rất đ&aacute;ng để trải nghiệm</p>

<h2>Chip Snapdragon 678 mang đến hiệu suất vượt trội</h2>

<p>Redmi Note 10 được trang bị chip Qualcomm Snapdragon 678 với hiệu suất đ&aacute;ng tin cậy, tốc độ xử l&yacute; linh hoạt. B&ecirc;n trong con chip l&agrave; 8 l&otilde;i bao gồm 4 l&otilde;i Cortex-A76 v&agrave; 4 l&otilde;i Cortex-A55 với xung nhịp l&ecirc;n đến 2,2 GHz, sản xuất tr&ecirc;n tiến tr&igrave;nh 11nm. C&oacute; thể coi đ&acirc;y l&agrave; ng&ocirc;i sao mới của ph&acirc;n kh&uacute;c vi xử l&yacute; tầm trung.&nbsp;</p>

<p><img src="https://lh5.googleusercontent.com/34os6IH521SHkjGx8VejOzV5vRClvTTsat3EarO3qMZ_clDnoYnjeErKoBQHqjmY2QrtPN7KoTvZvulgbKfYBYuUwpaKBW1mjElSCR9mPpzbIsI-cMMd568KFNs9xP3R4cxCncc" style="height:323px; width:646px" /></p>

<p>Xiaomi đ&atilde; tăng cường cả CPU v&agrave; GPU cho sản phẩm của m&igrave;nh nhằm cải thiện khả năng chụp ảnh, chơi game, streaming... Với UFS 2.2, tốc độ ghi tuần tự c&oacute; thể tăng l&ecirc;n đếb 100%. RAM 6GB v&agrave; bộ nhớ trong 128GB cũng đ&aacute;p ứng tốt nhu cầu lưu trữ th&ocirc;ng tin, video, h&igrave;nh ảnh, c&agrave;i đặt ứng dụng...</p>

<h2>Pin 5000 mAh, loa k&eacute;p sống động</h2>

<p>Dung lượng pin cao l&ecirc;n tới 5000 mAh đ&aacute;p ứng thời gian sử dụng đến hơn 2 ng&agrave;y. Đặc biệt, Xiaomi đ&atilde; trang bị sạc nhanh 33W cho sản phẩm n&agrave;y. Nhờ đ&oacute;, chỉ với 25 ph&uacute;t l&agrave; đ&atilde; c&oacute; thể sạc đầy 50% pin.&nbsp;</p>

<p><img src="https://lh5.googleusercontent.com/CV2-4_WhMhc7qBDN7M-aU2JG5Hwf8Djg9i4pCQh-hjQG1yaXGEKQGFxa2P2kMNozqSYpkni4keJm04zXOONCoTMOEILI8otCU-NlTrZhFUWLS5zMEZHk7qG3DRoUVlZygoA3sHk" style="height:323px; width:646px" /></p>

<p>Loa k&eacute;p si&ecirc;u tuyến t&iacute;nh kết hợp với dải &acirc;m thanh cao v&agrave; rộng hơn mang đến cho bạn trải nghiệm &acirc;m thanh sống động nhất. C&ocirc;ng cụ tuyến t&iacute;nh c&ograve;n gi&uacute;p biến đổi c&aacute;c &acirc;m thanh, chuyển động kh&aacute;c nhau tạo hiệu ứng rung ch&iacute;nh x&aacute;c khiến bạn đắm ch&igrave;m v&agrave;o c&aacute;c bộ phim hay v&agrave; c&aacute;c tr&ograve; chơi hot.&nbsp;</p>

<p>Xiaomi Redmi Note 10 c&oacute; ba phi&ecirc;n bản m&agrave;u sắc bao gồm X&aacute;m Kho&aacute;ng Thạch, Trắng Sỏi Đ&aacute;, Xanh Ngọc B&iacute;ch. Nếu muốn mua sản phẩm ch&iacute;nh h&atilde;ng gi&aacute; tốt th&igrave; h&atilde;y đến ngay Tiến Dũng.&nbsp;</p>
', N'138401.jpg', N'138402.jpg', N'138403.jpg', 26, 1, 1, N'35313')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [LoaiSP], [SoLuotXemSP], [HangSX], [XuatXu], [GiaGoc], [GiaTien], [MoTa], [AnhDaiDien], [AnhNen], [AnhKhac], [SoLuong], [isnew], [ishot], [MaNCC]) VALUES (N'16406', N'Xiaomi Redmi Note 10 Pro 6GB/128GB - Chính hãng', N'64844', NULL, N'88281', N'Trung Quốc', CAST(6990000 AS Decimal(18, 0)), CAST(6990000 AS Decimal(18, 0)), N'<h2>Mua Xiaomi Redmi Note 10 Pro 6GB/128GB ch&iacute;nh h&atilde;ng DGW gi&aacute; tốt nhất tại Tiến Dũng</h2>

<p>Thương hiệu Xiaomi của Trung Quốc từ trước đến nay vốn nổi tiếng l&agrave; h&atilde;ng điện thoại c&oacute; cấu h&igrave;nh khủng nhưng gi&aacute; th&agrave;nh lại rất b&igrave;nh d&acirc;n n&ecirc;n được nhiều người ưa chuộng. Trong số đ&oacute;, sản phẩm Redmi Note 10 Pro 6GB/128GB vừa ra mắt thị trường mới đ&acirc;y tự tin c&oacute; thể&nbsp;đ&aacute;p ứng ho&agrave;n hảo đủ mọi y&ecirc;u cầu về hiệu năng, lại c&oacute; mức gi&aacute; v&ocirc; c&ugrave;ng &ldquo;hợp t&uacute;i tiền&rdquo; m&agrave; tất cả MiFan kh&ocirc;ng n&ecirc;n bỏ lỡ.</p>

<h3>Thiết kế hiện đại, m&agrave;u sắc bắt mắt</h3>

<p>Sản phẩm Redmi Note 10 Pro được gia c&ocirc;ng từ khung kim loại nguy&ecirc;n khối, c&oacute; độ mỏng khoảng 8,1mm v&agrave; nặng 193g n&ecirc;n khi cầm nắm tr&ecirc;n tay kh&aacute; chắc chắn lại vẫn to&aacute;t l&ecirc;n sự sang trọng, thanh lịch.</p>

<p>M&agrave;n h&igrave;nh c&oacute; k&iacute;ch thước cực lớn, l&ecirc;n tới&nbsp;6.67 inch, kết hợp c&ugrave;ng&nbsp;camera selfie đục lỗ đặt ch&iacute;nh giữa v&agrave;&nbsp;mặt k&iacute;nh cong 3D gi&uacute;p cảm gi&aacute;c độ hiển thị tr&agrave;n viền lớn hơn cực đ&atilde; mắt.</p>

<p>C&ocirc;ng nghệ trang bị tr&ecirc;n m&agrave;n h&igrave;nh của Redmi Note 10 Pro l&agrave; tấm nền&nbsp;AMOLED c&oacute;&nbsp;độ ph&acirc;n giải Full HD+ (1080 x 2400 Pixels),&nbsp;hỗ trợ tần số qu&eacute;t 120Hz c&ugrave;ng tốc độ phản hồi cảm ứng 240Hz đem lại độ hiển thị sắc n&eacute;t, sống động.</p>

<p><img src="https://lh5.googleusercontent.com/oZyVed1-rKjfXbnMvifpSTG7Us81Ivd7G5XhF57kbFlEptNup-MJ3JWf_Y_itf_aIYgfGoNoH-ma38z69lI90U2_lh18-nWv7qH4NL5XD9bJVwgYKZz1cNk6UQrxM8PBfLgN_Ws" style="height:624px; width:624px" /></p>

<p>&nbsp;</p>

<p>Phần k&iacute;nh được l&agrave;m từ chất liệu k&iacute;nh cường lực Corning Gorilla Glass 5 gi&uacute;p chống trầy xước, hạn chế tối đa va đập cho người d&ugrave;ng trong qu&aacute; tr&igrave;nh sử dụng.&nbsp;Ngo&agrave;i ra, phần cạnh viền của chiếc Redmi Note 10 c&ograve;n l&agrave; cảm biến v&acirc;n tay si&ecirc;u nhạy, chỉ cần chạm nhẹ 1 lần l&agrave; c&oacute; thể mở kho&aacute; ngay lập tức.&nbsp;</p>

<p>Hiện đối với d&ograve;ng Redmi Note 10 Pro, h&atilde;ng Xiaomi cho ra mắt tổng cộng 3 phi&ecirc;n bản m&agrave;u m&aacute;y kh&aacute;c nhau để kh&aacute;ch h&agrave;ng chọn lựa gồm: &nbsp;X&aacute;m m&atilde; n&atilde;o (Onyx Gray), Xanh băng (Glacier Blue) v&agrave; Đồng Gradient (Gradient Bronze).</p>

<h3>Bộ tứ camera ho&agrave;n hảo trong mọi bối cảnh</h3>

<p>Điểm nổi bật nhất của sản phẩm Redmi Note 10 Pro ch&iacute;nh l&agrave; phần camera.&nbsp; Lần n&agrave;y, Xiaomi đ&atilde; tập trung trang bị cụm 4 camera xịn x&ograve; nhất cho sản phẩm mới của m&igrave;nh. Bao gồm: Camera ch&iacute;nh sử dụng cảm biến Samsung ISOCELL HM2 108MP c&oacute; khả năng pixel binning gộp 9 pixel th&agrave;nh 1, tạo ra c&aacute;c bức ảnh 12MP r&otilde; n&eacute;t hơn; 1 camera si&ecirc;u rộng 8MP; 1 camera tele-macro 5MP c&ugrave;ng 1 cảm biến độ s&acirc;u 2MP. C&ograve;n ở ph&iacute;a mặt trước, Redmi Note Pro 10 cũng sở hữu camera selffie 16MP, c&oacute; hỗ trợ l&agrave;m đẹp.</p>

<p><img src="https://lh4.googleusercontent.com/uQsC2_reNgp_f1DOxl45OoJwhqPsnoG7GHw0CpXf8yEh2wzJmgR6DYpNru8z56mMmw9I0MaHAZQ1DyCQfYXXB8bM6icomgMPI0u4sDgKVtHfnOTjA7ZDrtXYgAAy28-zG1CRd_0" style="height:312px; width:624px" /></p>

<p>&nbsp;</p>

<p>C&oacute; thể n&oacute;i, bộ tứ ho&agrave;n hảo n&agrave;y sẽ phối hợp với nhau v&ocirc; c&ugrave;ng ăn &yacute; gi&uacute;p người d&ugrave;ng thoải m&aacute;i t&aacute;c nghiệp trong trong mọi bối cảnh m&agrave; vẫn y&ecirc;n t&acirc;m cho ra những bức h&igrave;nh đẹp.&nbsp;</p>

<p>Th&ecirc;m một điểm cộng m&agrave; d&ograve;ng Redmi Note 10 Pro sở hữu ch&iacute;nh l&agrave; chế độ chụp ảnh v&agrave;o ban đ&ecirc;m. Ngay cả khi bạn đang ở trong điều kiện thiếu s&aacute;n. đừng lo v&igrave; chiếc smartphone n&agrave;y vẫn sẽ l&agrave;m tốt nhiệm vụ của m&igrave;nh, cho ra m&agrave;u ảnh c&oacute; &aacute;nh s&aacute;ng vừa đủ chứ kh&ocirc;ng hề tối om đ&acirc;u nh&eacute;.</p>

<h3>Hiệu năng mạnh mẽ, chơi game mượt m&agrave;</h3>

<p>Redmi Note 10 Pro sử dụng chip Snapdragon 732G 8 nh&acirc;n của Qualcom đem lại hiệu năng khủng v&agrave; khả năng xử l&yacute; tuyệt vời, mượt m&agrave; cho m&aacute;y. Với chipset n&agrave;y, c&aacute;c game thủ ho&agrave;n to&agrave;n c&oacute; thể thoải m&aacute;u chơi những tựa game online đ&ograve;i hỏi chất lượng cao c&ugrave;ng đồ họa sắc n&eacute;t như Li&ecirc;n Qu&acirc;n hay PUBG Mobile tr&ecirc;n ch&iacute;nh chiếc điện thoại th&acirc;n y&ecirc;u.</p>

<p>Với chiếc điện thoại th&ocirc;ng ming Redmi Note 10 Pro phi&ecirc;n bản 6GB RAM cũng sẽ gi&uacute;p người d&ugrave;ng đa nhiệm mượt m&agrave; m&agrave; kh&ocirc;ng lo giật lag.</p>

<p>Pin tr&acirc;u, hỗ trợ sạc nhanh thần tốc&nbsp;</p>

<p>Đối với thiết bị n&agrave;y, Xiaomi trang bị cho n&oacute; vi&ecirc;n pin Li-on với dung lượng 5020 mAh, gi&uacute;p bạn thoải m&aacute;i sử dụng để giải tr&iacute; hay l&agrave;m việc suốt nhiều giờ li&ecirc;n tiếp với năng suất cao. Ngay cả khi chơi game cũng kh&ocirc;ng ti&ecirc;u hao đ&aacute;ng kể thời lượng pin của m&aacute;y.</p>

<p><img src="https://lh3.googleusercontent.com/cv1eAHcjRD2Ot6nJDxIIWZbHfoxctT_MDNZoAvgoIs8YgoHg8glEyfSpXk0miwgRUYo7Vp-l8eSAAzKg-za9BZSGoJRdrP16LrXZQoZbwIuHcvrTuE7MmDS2dEom_YXypR3EYio" style="height:355px; width:533px" /></p>

<p>Điểm nổi bật hơn cả ch&iacute;nh l&agrave; m&aacute;y c&oacute; chế độ sạc nhanh v&agrave; cung cấp sẵn củ sạc si&ecirc;u tốc 33W trong hộp phụ kiện đi k&egrave;m. Bởi vậy, với chiếc Redmi Note 10 Pro, việc hết pin c&oacute; lẽ kh&ocirc;ng c&ograve;n l&agrave; nỗi lo &acirc;u của ch&uacute;ng ta mỗi khi đi ra ngo&agrave;i nữa.</p>

<p>N&oacute;i t&oacute;m lại, với tất cả những ưu điểm v&agrave; t&iacute;nh năng vượ trội như vậy lại sở hữu mức gi&aacute; cựchấp dẫn tại Ho&agrave;ng H&agrave; Mobile th&igrave; Xiaomi Redmi Note 10 Pro ch&iacute;nh l&agrave; gợi &yacute; thực sự đ&aacute;ng mua hiện nay.</p>
', N'164061.jpg', N'164062.jpg', N'164063.jpg', 22, 1, 1, N'81113')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [LoaiSP], [SoLuotXemSP], [HangSX], [XuatXu], [GiaGoc], [GiaTien], [MoTa], [AnhDaiDien], [AnhNen], [AnhKhac], [SoLuong], [isnew], [ishot], [MaNCC]) VALUES (N'20152', N'Vivo Y12s 2021 3GB/32GB - Chính hãng', N'64844', NULL, N'27844', N'Trung Quốc', CAST(3290000 AS Decimal(18, 0)), CAST(3290000 AS Decimal(18, 0)), N'<h1>Mua điện thoại Vivo Y12s 2021 ch&iacute;nh h&atilde;ng, gi&aacute; tốt tại Tiến Dũng</h1>

<p>Vivo Y12s l&agrave; chiếc smartphone c&oacute; thiết kế bắt mắt, cấu h&igrave;nh đ&aacute;p ứng tốt nhu cầu sử dụng cơ bản. Sản phẩm n&agrave;y hứa hẹn sẽ mang tới trải nghiệm th&uacute; vị cho người d&ugrave;ng.</p>

<h3>Thiết kế m&agrave;n h&igrave;nh giọt nước, k&iacute;ch thước 6.51 inch</h3>

<p>Vivo Y12s sở hữu thiết kế mặt lưng bắt mắt với hiệu ứng chuyển m&agrave;u gradient hiện đại. C&oacute; hai m&agrave;u xanh &aacute;nh băng v&agrave; đen huyền b&iacute; cho bạn chọn lựa. C&aacute;c g&oacute;c m&aacute;y đều được bo tr&ograve;n nhẹ nh&agrave;ng gi&uacute;p thoải m&aacute;i cầm tr&ecirc;n tay. Tr&ecirc;n th&acirc;n m&aacute;y c&ograve;n c&oacute; cảm biến v&acirc;n tay t&iacute;ch hợp với n&uacute;t nguồn cho ph&eacute;p mở kh&oacute;a nhanh ch&oacute;ng.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/04/08/111.jpg" style="height:312.903px; width:556.272px" /></p>

<p>M&agrave;n h&igrave;nh giọt nước tr&agrave;n viền kết hợp c&ugrave;ng mặt k&iacute;nh cong 2.5D sẽ mang đến trải nghiệm tuyệt vời khi chơi game, xem phim... Tấm nền IPS LCD, độ ph&acirc;n giải HD+ v&agrave; k&iacute;ch thước 6.51 inch cũng gi&uacute;p bạn trải nghiệm h&igrave;nh ảnh g&oacute;c rộng sống động hơn.</p>

<p>Vivo Y12s c&ograve;n c&oacute; khả năng t&aacute;i tạo m&agrave;u sống động v&agrave; cho ph&eacute;p sử dụng m&aacute;y trong mọi điều kiện &aacute;nh s&aacute;ng. Đặc biệt, bạn cũng kh&ocirc;ng phải lo mỏi mắt khi xem điện thoại trong thời gian d&agrave;i bởi đ&atilde; c&oacute; t&iacute;nh năng lọc &aacute;nh s&aacute;ng xanh.</p>

<h3>Camera AI th&ocirc;ng minh, hỗ trợ selfie g&oacute;c rộng</h3>

<p>Vivo Y12s được trang bị camera k&eacute;p với camera ch&iacute;nh độ ph&acirc;n giải 12MP khẩu độ f/2.2 v&agrave; camera phụ độ ph&acirc;n giải 2MP khẩu độ f/2.4. Bộ đ&ocirc;i camera n&agrave;y c&oacute; thuật to&aacute;n x&oacute;a ph&ocirc;ng mới nhất gi&uacute;p l&agrave;m mở hậu cảnh một c&aacute;ch tinh tế. Nhờ đ&oacute;, bạn sẽ sở hữu những bức ảnh ch&acirc;n dung chuy&ecirc;n nghiệp, c&oacute; chiều s&acirc;u hơn. B&ecirc;n cạnh đ&oacute;, m&aacute;y c&ograve;n c&oacute; c&aacute;c t&iacute;nh năng như l&agrave;m đẹp, x&oacute;a ph&ocirc;ng, lấy n&eacute;t tự động... Đặc biệt, nếu th&iacute;ch bạn c&oacute; thể quay video chất lượng 1080p @ 30 fps.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/04/08/222.jpg" style="height:378.788px; width:569.748px" /></p>

<p>Ph&iacute;a trước l&agrave; camera selfie 8MP khẩu độ f/1.8. Camera n&agrave;y mang đến chất lượng ảnh sắc n&eacute;t, tự động lấy n&eacute;t v&agrave; hộ trợ l&agrave;m đẹp bằng AI Beautify. B&ecirc;n cạnh đ&oacute;, bạn c&oacute; thể chụp ảnh g&oacute;c rộng v&agrave; quay video 1080p tương tự như camera sau. H&atilde;y thoải sức s&aacute;ng tạo v&agrave; lưu giữ những h&igrave;nh ảnh &yacute; nghĩa. Đặc biệt, Vivo Y12s c&ograve;n c&oacute; c&ocirc;ng nghệ nhận diện khu&ocirc;n mặt th&ocirc;ng minh để mở kh&oacute;a nhanh ch&oacute;ng.</p>

<h3>Hiệu năng ổn định, xứng đ&aacute;ng với mức gi&aacute;</h3>

<p>Vivo Y12s được trang bị chip tầm trung MediaTek Helio P35 8 nh&acirc;n mang đến khả năng xử l&yacute; t&aacute;c vụ mượt m&agrave;. M&aacute;y c&ograve;n c&oacute; RAM 3GB, bộ nhớ trong 32GB cho ph&eacute;p giải tr&iacute; thoải m&aacute;i với nhiều ứng dụng kh&aacute;c nhau, chơi game kh&ocirc;ng lo bị giật. Thiết bị n&agrave;y hỗ trợ tới 3 khe cắm thẻ nhớ gi&uacute;p mở rộng bộ nhớ l&ecirc;n đến 256GB. Nhờ đ&oacute;, bạn c&oacute; thể dễ d&agrave;ng lưu trữ h&igrave;nh ảnh, video, b&agrave;i h&aacute;t m&agrave; kh&ocirc;ng lo đầy dung lượng.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/04/08/333.jpg" style="height:337.312px; width:599.667px" /></p>

<p>&nbsp;</p>

<p>Vivo Y12s chạy tr&ecirc;n hệ điều h&agrave;nh Android 10 ti&ecirc;n tiến của Google. Đi k&egrave;m với đ&oacute; l&agrave; c&ocirc;ng nghệ Multi-Turbo 3.0 với khả năng tối ưu h&oacute;a t&agrave;i nguy&ecirc;n hệ thống, giảm giật lag khi chơi game. Đặc biệt, m&aacute;y c&ograve;n c&oacute; chế độ Ultra-Game Mode, Rung 4D 2.0 gi&uacute;p ngăn cửa số bật l&ecirc;n, chặn th&ocirc;ng b&aacute;o, cuộc gọi cho ph&eacute;p bạn ch&igrave;m đắm ho&agrave;n to&agrave;n v&agrave;o những tr&ograve; chơi th&uacute; vị.</p>

<h3>Dung lượng pin khủng 5000 mAh</h3>

<p>Vivo đ&atilde; trang bị cho Y12s vi&ecirc;n pin chuẩn Li-Po với dung lượng l&ecirc;n tới 5000 mAh. Ch&iacute;nh v&igrave; vậy, bạn c&oacute; thể thoải m&aacute;i sử dụng đến tận 2 ng&agrave;y m&agrave; kh&ocirc;ng lo hết pin. Đặc biệt, c&ocirc;ng nghệ tiết kiệm năng lượng th&ocirc;ng minh tr&ecirc;n chiếc điện thoại n&agrave;y c&ograve;n cho ph&eacute;p bạn xem phim HD trong 16,3 giờ v&agrave; chơi game trong 8,9 giờ li&ecirc;n tục.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/04/08/444.png" style="height:308.912px; width:598.667px" /></p>

<p>Từ thiết kế cho đến cấu h&igrave;nh v&agrave; dung lượng pin, Vivo Y12s đều được đ&aacute;nh gi&aacute; l&agrave; ổn trong ph&acirc;n kh&uacute;c điện thoại tầm trung. Nếu bạn muốn sở hữu sản phẩm ch&iacute;nh h&atilde;ng, gi&aacute; tốt th&igrave; h&atilde;y đến ngay Ho&agrave;ng H&agrave; Mobile.</p>
', N'201521.jpg', N'201522.jpg', N'201523.jpg', 25, 1, 1, N'35313')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [LoaiSP], [SoLuotXemSP], [HangSX], [XuatXu], [GiaGoc], [GiaTien], [MoTa], [AnhDaiDien], [AnhNen], [AnhKhac], [SoLuong], [isnew], [ishot], [MaNCC]) VALUES (N'21134', N'Samsung Galaxy S21 Plus 128GB 5G - Chính hãng', N'64844', NULL, N'72443', N'Trung Quốc', CAST(25990000 AS Decimal(18, 0)), CAST(25990000 AS Decimal(18, 0)), N'<h2>Mua Galaxy S21+ ch&iacute;nh h&atilde;ng gi&aacute; tốt tại Tiến Dũng</h2>

<p>&nbsp;</p>

<p>Mở đầu cuộc chơi flagship năm 2021, Samsung đ&atilde; giới thiệu chiếc Galaxy S21+ b&ecirc;n cạnh Galaxy S21 v&agrave; S21 Ultra. Đ&acirc;y l&agrave; một trong những chiếc m&aacute;y cao cấp nhất của Samsung hiện tại với đầu tư xứng đ&aacute;ng về cả phần cứng lẫn phần mềm.</p>

<h3>Kết nối 5G ho&agrave;n to&agrave;n mới</h3>

<p>&nbsp;</p>

<p>Năm 2021, Samsung đ&atilde; đem đến Việt Nam những chiếc điện thoại Galaxy S đầu ti&ecirc;n hỗ trợ 5G. Galaxy S21+ sử dụng hai chuẩn 5G được triển khai tại Việt Nam l&agrave; sub-6 v&agrave; mmWave. Những si&ecirc;u phẩm mới nh&agrave; Samsung hứa hẹn đem lại cho người d&ugrave;ng tốc độ sử dụng internet si&ecirc;u nhanh với c&aacute;c băng tần 5G. Đ&acirc;y l&agrave; nền tảng quan trọng cho những gi&acirc;y ph&uacute;t giải tr&iacute; tuyệt vời của bạn. Với 5G, bạn sẽ xem được những video 4K một c&aacute;ch trơn tru, hoặc chiến game trực tuyến đồ hoạ khủng mượt m&agrave; hơn.</p>

<p>Người d&ugrave;ng c&oacute; thể sử dụng 2 SIM vật l&yacute; hoặc eSIM tr&ecirc;n chiếc điện thoại n&agrave;y để ph&ugrave; hợp với c&ocirc;ng việc cũng như nhu cầu li&ecirc;n lạc của m&igrave;nh.</p>

<h3>Thiết kế ho&agrave;n to&agrave;n mới. Nhiều m&agrave;u sắc trẻ trung</h3>

<p>&nbsp;</p>

<p>Galaxy S21+ được giới thiệu với ngoại h&igrave;nh chứa đầy c&aacute;i nh&igrave;n thẩm mĩ của Samsung trong một sản phẩm flagship. Người d&ugrave;ng vẫn sẽ t&igrave;m thấy những điểm quen thuộc trong thiết kế của Samsung như hai mặt k&iacute;nh cường lực, khung viền kim loạ s&aacute;ng b&oacute;ng v&agrave; m&agrave;n h&igrave;nh Infinity-O. Tuy vậy, h&atilde;ng đ&atilde; l&agrave;m mới lại thiết kế của m&igrave;nh khi kh&eacute;o l&eacute;o đặt cụm camera v&agrave;o một miếng kim loại, ho&agrave; v&agrave;o phần viền của m&aacute;y. Th&ecirc;m v&agrave;o đ&oacute;, phong c&aacute;ch dual tone tạo n&ecirc;n vẻ ngo&agrave;i hấp dẫn ngay từ lần đầu nh&igrave;n thấy. Kh&aacute;ch h&agrave;ng c&oacute; thể tuỳ chọn ba phi&ecirc;n bản m&agrave;u cho chiếc Galaxy S21+ của m&igrave;nh, bao gồm đen nguy&ecirc;n bản, bạc ngẫu hứng v&agrave; t&iacute;m đam m&ecirc;. Giống như những đời si&ecirc;u phẩm trước, Galaxy S21+ cũng c&oacute; khả năng kh&aacute;ng nước v&agrave; bụi bẩn IP68.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-plus-1.jpg" style="height:249.037px; width:442.733px" /></p>

<p>&nbsp;</p>

<p>Galaxy S21+ chắc chắn sẽ l&agrave; một trong những smartphone c&oacute; m&agrave;n h&igrave;nh đ&atilde; mất trong thời điểm đầu năm 2021. Chiếc smartphone n&agrave;y sở hữu m&agrave;n h&igrave;nh Dynamic AMOLED 2X k&iacute;ch thước 6,7 inch tương tự thiết bị tiền nhiệm, độ ph&acirc;n giải 1080x2400. M&agrave;n h&igrave;nh n&agrave;y sở hữu dải m&agrave;u rộng DCI-P3, hỗ trợ chuẩn HDR10+, cho m&agrave;u sắc rực rỡ, sắc n&eacute;t từng chi tiết. Kh&ocirc;ng chỉ vậy, người d&ugrave;ng sẽ được trải nghiệm tần số qu&eacute;t 120Hz tr&ecirc;n tấm nền n&agrave;y, gi&uacute;p mọi thao t&aacute;c vuốt v&agrave; c&aacute;c pha h&agrave;nh động trở n&ecirc;n mượt m&agrave; hơn bao giờ hết.</p>

<h3>Camera đồng h&agrave;nh c&ugrave;ng bạn tr&ecirc;n mọi nẻo đường</h3>

<p>&nbsp;</p>

<p>Cụm camera được trang bị tr&ecirc;n Galaxy S21+ cũng c&oacute; phần cứng mạnh mẽ v&agrave; phần mềm được tối ưu ho&aacute; cực tốt. Samsung đ&atilde; trang bị cho thiết bị của m&igrave;nh ba camera ở mặt sau: camera ti&ecirc;u chuẩn 12MP, khẩu độ f/1.8, k&iacute;ch thước điểm ảnh lớn 1.8&mu;m; camera zoom 64MP, khẩu độ f/2.0 v&agrave; camera g&oacute;c si&ecirc;u rộng 12MP, ti&ecirc;u cự 13mm, khẩu độ f/2.2. Với độ ph&acirc;n giải lớn v&agrave; thuật to&aacute;n chụp ảnh được thiết kế ri&ecirc;ng, bạn c&oacute; thể zoom l&ecirc;n tới 30x tr&ecirc;n chiếc m&aacute;y n&agrave;y, đưa những khung cảnh ở xa lại gần lại tầm nh&igrave;n của bạn với độ chi tiết tối ưu. M&aacute;y cũng c&oacute; camera 10MP ở ph&iacute;a trước gi&uacute;p người d&ugrave;ng chụp ảnh selfie v&agrave; gọi video cực đ&atilde;.</p>

<p>&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-plus-2.jpg" style="height:261.128px; width:464.227px" /></p>

<p>&nbsp;</p>

<p>Samsung c&ograve;n đưa l&ecirc;n Galaxy S21+ h&agrave;ng loạt t&iacute;nh năng quay phim chụp h&igrave;nh hữu &iacute;ch. Đầu ti&ecirc;n, người d&ugrave;ng sẽ lập tức ấn tượng khi đ&acirc;y l&agrave; chiếc điện thoại hiếm hoi tr&ecirc;n thị trường sở hữu khả năng quay video 8K cực sắc n&eacute;t. H&igrave;nh ảnh tr&iacute;ch xuất từ video n&agrave;y c&oacute; độ ph&acirc;n giải l&ecirc;n tới 33MP. M&aacute;y cũng c&oacute; thể quay video 4K ở 60fps mượt m&agrave;. Để hỗ trợ người d&ugrave;ng quay phim tốt hơn, Samsung trang bị cả chống rung quang học cho ống k&iacute;nh v&agrave; t&iacute;nh năng quay phim si&ecirc;u chống rung, giup thước phim của bạn chuyển động mượt m&agrave; ngay cả khi di chuyển nhanh.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-plus-3.jpg" style="height:264.787px; width:470.733px" /></p>

<p>&nbsp;</p>

<p>Galaxy S21+ cũng nổi bật với t&iacute;nh năng chụp ảnh ch&acirc;n dung với c&aacute;c bộ lọc m&agrave;u chuy&ecirc;n nghiệp, đưa bạn v&agrave;o studio s&aacute;ng tạo bất tận. Bạn cũng sẽ tự tin chụp ảnh v&agrave;o buổi tối hay những địa điểm c&oacute; &aacute;nh s&aacute;ng phức tạp nhờ chế độ si&ecirc;u chụp đ&ecirc;m, đem lại độ s&aacute;ng v&agrave; chi tiết cho bức ảnh thiếu s&aacute;ng của bạn.</p>

<h3>Hiệu suất vượt trội. Thời lượng pin k&eacute;o d&agrave;i cả ng&agrave;y</h3>

<p>&nbsp;</p>

<p>Năm nay, Samsung đ&atilde; mang vi xử l&yacute; Exynos 2100 l&ecirc;n flagship của m&igrave;nh. Đ&acirc;y l&agrave; một con chip 8 nh&acirc;n với tốc độ tối đa l&ecirc;n tới 2,9GHz, đem lại tốc độ tối ưu trong mọi t&aacute;c vụ sử dụng. Galaxy S21+ sẽ gi&uacute;p bạn thực hiện được mọi t&aacute;c vụ một c&aacute;ch nhanh ch&oacute;ng, từ việc lướt web h&agrave;ng ng&agrave;y, cho tới chơi game đồ hoạ khủng v&agrave; xử l&yacute; video độ ph&acirc;n giải cao. Th&ecirc;m v&agrave;o đ&oacute;, dung lượng RAM 8GB sẽ gi&uacute;p bạn xử l&yacute; c&ocirc;ng việc đa nhiệm ho&agrave;n to&agrave;n trơn tru. Người d&ugrave;ng c&oacute; thể thoải m&aacute;i lưu trữ c&aacute;c tệp media v&agrave; th&ocirc;ng tin quan trọng trong bộ nhớ 128GB của m&aacute;y.</p>

<p>&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-plus-4.jpg" style="height:271.491px; width:482.652px" /></p>

<p>&nbsp;</p>

<p>Galaxy S21+ sở hữu vi&ecirc;n pin 4800mAh, đủ để cung cấp cho bạn một ng&agrave;y sử dụng với những t&aacute;c vụ hỗn hợp nặng. Samsung trang bị cho chiếc smartphone n&agrave;y h&agrave;ng loạt t&iacute;nh năng sạc đỉnh cao như sạc si&ecirc;u nhanh 25W v&agrave; sạc nhanh kh&ocirc;ng d&acirc;y 2.0, gi&uacute;p bạn nhanh ch&oacute;ng nối lại trải nghiệm dang dở của m&igrave;nh khi hết pin. T&iacute;nh năng Power Share gi&uacute;p bạn chia sẻ pin cho những phụ kiện hỗ trợ sạc kh&ocirc;ng d&acirc;y như chiếc tai nghe Galaxy Buds Pro v&agrave; AirPods.</p>

<h3>Tạm kết</h3>

<p>&nbsp;</p>

<p>Galaxy S21+ kh&ocirc;ng chỉ l&agrave; một chiếc điện thoại sang trọng, m&agrave; c&ograve;n l&agrave; một thiết bị mạnh mẽ, đem lại cho người d&ugrave;ng những gi&acirc;y ph&uacute;t l&agrave;m việc v&agrave; giải tr&iacute; cực đ&atilde;. Nếu bạn cần t&igrave;m một flagship Android đ&aacute;p ứng mọi nhu cầu sử dụng của m&igrave;nh th&igrave; đ&acirc;y l&agrave; một sự lựa chọn kh&ocirc;ng thể hợp l&yacute; hơn.</p>

<p>Hiện tại Galaxy S21+ được b&aacute;n ch&iacute;nh h&atilde;ng tại hệ thống Ho&agrave;ng H&agrave; với h&agrave;ng loạt ưu đ&atilde;i cực hấp dẫn. Sản phẩm được bảo h&agrave;nh 12 th&aacute;ng tại c&aacute;c trung t&acirc;m uỷ quyền của Samsung tr&ecirc;n to&agrave;n quốc. Bạn c&oacute; thể tới ngay chi nh&aacute;nh Ho&agrave;ng H&agrave; Mobile gần nhất hoặc đặt h&agrave;ng tr&ecirc;n website tiendung.com để sở hữu chiếc m&aacute;y n&agrave;y nh&eacute;!</p>

<p>&nbsp;</p>
', N'211341.jpg', N'211342.jpg', N'211343.jpg', 16, 1, 1, N'35313')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [LoaiSP], [SoLuotXemSP], [HangSX], [XuatXu], [GiaGoc], [GiaTien], [MoTa], [AnhDaiDien], [AnhNen], [AnhKhac], [SoLuong], [isnew], [ishot], [MaNCC]) VALUES (N'26674', N'Oppo A93 - 8GB/128GB - Chính hãng', N'64844', NULL, N'62575', N'Trung Quốc', CAST(7490000 AS Decimal(18, 0)), CAST(7490000 AS Decimal(18, 0)), N'<h2>Mua điện thoại Oppo A93 - 8GB/128GB gi&aacute; rẻ ch&iacute;nh h&atilde;ng tại Tiến Dũng</h2>

<p>&nbsp;</p>

<p>OPPO l&agrave; thương hiệu sản xuất smartphone đến từ Trung Quốc. Những năm gần đ&acirc;y, OPPO li&ecirc;n tục khẳng định c&aacute;c bước ph&aacute;t triển nhanh ch&oacute;ng v&agrave; mức độ phổ biến tại thị trường Việt Nam. Đ&acirc;y cũng l&agrave; tiền đề để thương hiệu từng bước chạm đến ph&acirc;n kh&uacute;c cao cấp hơn trong tương lai. Hiện tại, những điện thoại tầm trung của OPPO được rất nhiều người d&ugrave;ng tin tưởng v&agrave; lựa chọn. Trong đ&oacute;, chiếc OPPO A93 ch&iacute;nh h&atilde;ng c&oacute; nhiều điểm độc đ&aacute;o v&agrave; kh&aacute;c biệt. Nếu bạn đang t&igrave;m kiếm một chiếc smartphone ở gi&aacute; tầm trung th&igrave; đừng bỏ qua sản phẩm n&agrave;y nh&eacute;.&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/26/a93-1.jpg" style="height:249.047px; width:442.75px" /></p>

<h3>Thiết kế sang trọng với m&agrave;n h&igrave;nh sắc n&eacute;t</h3>

<p>&nbsp;</p>

<p>Cũng như những chiếc smartphone kh&aacute;c của nh&agrave; OPPO, chiếc OPPO A93 8GB/128GB ch&iacute;nh h&atilde;ng được ho&agrave;n thiện thiết kế tối đa. Tổng thể m&aacute;y l&agrave; thiết kế nguy&ecirc;n khối sang trọng. Mặt sau của m&aacute;y được phủ một lớp sơn nh&aacute;m gi&uacute;p m&aacute;y bớt b&aacute;m bụi v&agrave; v&acirc;n tay khi cầm. Đồng thời, n&oacute; cũng tạo cảm gi&aacute;c chắc chắn hơn. Chiếc OPPO A93 ch&iacute;nh h&atilde;ng c&oacute; trọng lượng khoảng 164g v&agrave; độ d&agrave;y chỉ 7.48 mm n&ecirc;n c&oacute; thể cầm thoải m&aacute;i khi sử dụng li&ecirc;n tục.&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/26/a93-2.jpg" style="height:254.078px; width:451.694px" /></p>

<p>Mặt trước của điện thoại OPPO A93 ch&iacute;nh h&atilde;ng l&agrave; m&agrave;n h&igrave;nh AMOLED 6.43 inch với độ ph&acirc;n giải Full HD+ (1080 x 2400 Pixels), đem lại chất lượng hiển thị h&igrave;nh ảnh sắc n&eacute;t v&agrave; độ tương phản cao. M&agrave;n h&igrave;nh n&agrave;y cũng đem đến trải nghiệm m&agrave;u sắc ch&acirc;n thực, đặc biệt l&agrave; khi xem c&aacute;c bộ phim bạn y&ecirc;u th&iacute;ch. Điểm trừ duy nhất l&agrave; phần viền m&agrave;n h&igrave;nh tr&ecirc;n OPPO A93 vẫn c&ograve;n hơi d&agrave;y. Nh&igrave;n chung, với một mức gi&aacute; như vậy, thiết kế chiếc OPPO A93 ch&iacute;nh h&atilde;ng vẫn nổi bật hơn so với c&aacute;c đối thủ kh&aacute;c trong c&ugrave;ng ph&acirc;n kh&uacute;c gi&aacute; n&agrave;y.&nbsp;</p>

<h3>Hiệu năng mạnh mẽ, chiến game cực đ&atilde;</h3>

<p>&nbsp;</p>

<p>Kh&ocirc;ng chỉ ho&agrave;n thiện về thiết kế, chiếc OPPO A93 8GB/128GB ch&iacute;nh h&atilde;ng c&ograve;n được n&acirc;ng cấp hiệu năng đ&aacute;ng kể. Nh&agrave; sản xuất đ&atilde; trang bị cho chiếc smartphone n&agrave;y con chip Mediatek Helio P95, đi k&egrave;m với RAM 8GB v&agrave; bộ nhớ trong 128GB. Điện thoại đạt 399 điểm l&otilde;i đơn v&agrave; 1.509 điểm đa l&otilde;i. Tuy chỉ l&agrave; con chip tầm trung nhưng n&oacute; vẫn đ&aacute;p ứng được nhu cầu chơi game đồ họa cao như PUBG Mobile, Li&ecirc;n qu&acirc;n Mobile, Call of Duty Mobile,&hellip;&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/26/a93-3.jpg" style="height:266.799px; width:463.75px" /></p>

<p>B&ecirc;n cạnh hiệu năng mạnh mẽ, trong qu&aacute; tr&igrave;nh chơi game m&aacute;y vẫn gặp t&igrave;nh trạng n&oacute;ng l&ecirc;n nhưng kh&ocirc;ng đ&aacute;ng kể. Tuy nhi&ecirc;n, v&igrave; m&aacute;y được ho&agrave;n thiện từ chất liệu nhựa, việc tản nhiệt cũng rất nhanh v&agrave; kh&ocirc;ng l&agrave;m ảnh hưởng đến trải nghiệm hay c&aacute;c phần kh&aacute;c của điện thoại. OPPO A93 ch&iacute;nh h&atilde;ng c&oacute; thời lượng pin 4000mAh với sử dụng 7 tiếng li&ecirc;n tục. Điện thoại cũng đi k&egrave;m với sạc nhanh 18W, bạn chỉ cần chờ khoảng 1 tiếng 45 ph&uacute;t để sạc đầy vi&ecirc;n pin n&agrave;y. N&oacute;i t&oacute;m lại, chiếc OPPO A93 8GB/128GB c&oacute; thể đ&aacute;p ứng được nhu cầu chơi một số game đồ họa v&agrave; c&aacute;c t&aacute;c vụ cơ bản của người d&ugrave;ng hiện nay.&nbsp;</p>

<h3>Hiệu năng chụp ảnh ấn tượng, vượt trội&nbsp;</h3>

<p>&nbsp;</p>

<p>Mặc d&ugrave; chỉ l&agrave; một chiếc smartphone nằm trong ph&acirc;n kh&uacute;c tầm trung nhưng hiệu năng chụp ảnh của chiếc OPPO A93 8GB/128GB ch&iacute;nh h&atilde;ng cũng rất ấn tượng. Mặt sau của điện thoại l&agrave; m&ocirc; đun vu&ocirc;ng trong đ&oacute; chứa cụm bốn camera. Bao gồm camera ch&iacute;nh 48MP khẩu độ f/1.7, camera g&oacute;c rộng c&oacute; độ ph&acirc;n giải 8 MP với khẩu độ f/2.2, camera Mono v&agrave; camera ch&acirc;n dung độ ph&acirc;n giải 2 MP, khẩu độ f/2.4. Hệ thống camera n&agrave;y mang đến những bức ảnh cực chi tiết. Đồng thời, n&oacute; cũng bắt được khoảnh khắc nhanh rất tốt.&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/26/a93-4.jpg" style="height:298.595px; width:448.172px" /></p>

<p>B&ecirc;n cạnh đ&oacute;, camera selfie của chiếc OPPO A93 8GB/128GB ch&iacute;nh h&atilde;ng cũng đem đến những bức ảnh rất nịnh mắt. Đ&acirc;y cũng l&agrave; điểm nổi bật về hiệu năng chụp ảnh của điện thoại OPPO so với c&aacute;c smartphone kh&aacute;c trong ph&acirc;n kh&uacute;c. Cuối c&ugrave;ng, chiếc smartphone n&agrave;y c&oacute; thể đ&aacute;p ứng được hầu hết nhu cầu sử dụng cơ bản của người d&ugrave;ng trong tầm gi&aacute;. Sản phẩm đang được b&aacute;n tr&ecirc;n hệ thống của Ho&agrave;ng H&agrave; Mobile với mức gi&aacute; ưu đ&atilde;i v&agrave; chế độ bảo h&agrave;nh ch&iacute;nh h&atilde;ng 12 th&aacute;ng. Tham khảo th&ecirc;m th&ocirc;ng tin v&agrave; đặt mua sản phẩm tại link: https://hoanghamobile.com/dien-thoai-di-dong/oppo-a93-8gb-128gb-chinh-hang</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', N'266741.jpg', N'266742.jpg', N'266743.jpg', 32, 1, 1, N'35313')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [LoaiSP], [SoLuotXemSP], [HangSX], [XuatXu], [GiaGoc], [GiaTien], [MoTa], [AnhDaiDien], [AnhNen], [AnhKhac], [SoLuong], [isnew], [ishot], [MaNCC]) VALUES (N'28525', N'Samsung Galaxy S21 Ultra 256GB 5G - Chính hãng', N'64844', NULL, N'72443', N'Trung Quốc', CAST(33990000 AS Decimal(18, 0)), CAST(33990000 AS Decimal(18, 0)), N'<h3>Mua điện thoại Samsung Galaxy S21 Ultra 5G gi&aacute; rẻ ch&iacute;nh h&atilde;ng tại Tiến Dũng</h3>

<p>Samsung l&agrave; một trong những nh&agrave; sản xuất dẫn đầu tr&ecirc;n thị trường điện thoại th&ocirc;ng minh nhiều năm qua. Sau th&agrave;nh c&ocirc;ng của d&ograve;ng Galaxy S20 series, Samsung đ&atilde; trở lại v&agrave; tiếp tục khẳng định vị thế cho d&ograve;ng flagship cao cấp của m&igrave;nh. D&ograve;ng Galaxy S21 series đ&aacute;nh dấu bước nhảy vọt với những c&ocirc;ng nghệ ti&ecirc;n tiến nhất hiện nay. Đ&aacute;ng ch&uacute; &yacute;, Galaxy S21 Ultra 5G l&agrave; phi&ecirc;n bản đầu ti&ecirc;n v&agrave; duy nhất trong d&ograve;ng sản phẩm năm nay được t&iacute;ch hợp c&ugrave;ng b&uacute;t S Pen. &ldquo;T&acirc;n binh khủng long&rdquo; n&agrave;y hứa hẹn sẽ dẫn đầu xu hướng v&agrave; tạo ra những trải nghiệm đẳng cấp, kh&aacute;c biệt cho người d&ugrave;ng.</p>

<p>&nbsp;</p>

<p><img src="file:///C:/Users/ADMINI~1/AppData/Local/Temp/msohtmlclip1/01/clip_image001.jpg" /></p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-ultra.jpg" style="height:301.822px; width:452.733px" /></p>

<h3>Thiết kế nguy&ecirc;n bản camera liền cạnh đẳng cấp</h3>

<p>Điện thoại Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng dẫn đầu cho xu hướng thiết kế mới, kh&aacute;c biệt ho&agrave;n to&agrave;n so với những smartphone hiện nay. Cụm camera nguy&ecirc;n khối được gắn liền với cạnh v&agrave; khung kim loại của m&aacute;y, mang lại cảm gi&aacute;c nam t&iacute;nh hơn v&agrave; v&ocirc; c&ugrave;ng tinh xảo. Điện thoại c&ograve;n được trang bị một lớp k&iacute;nh Corning&reg; Gorilla&reg; Glass Victus bền bỉ nhất hiện nay.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-ultra-2.jpg" style="height:273.962px; width:461.733px" /></p>

<p>&nbsp;</p>

<p><img src="file:///C:/Users/ADMINI~1/AppData/Local/Temp/msohtmlclip1/01/clip_image002.jpg" /></p>

<p>Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng sở hữu m&agrave;n h&igrave;nh AMOLED 2X 6.8 inch với tần số qu&eacute;t từ 10Hz - 120Hz mượt m&agrave;. Nhờ đ&oacute;, điện thoại c&oacute; thể mang đến trải nghiệm h&igrave;nh ảnh sống động, sắc n&eacute;t đến từng chi tiết nhưng vẫn tiết kiệm thời lượng pin đ&aacute;ng kể. Galaxy S21 Ultra 5G cung cấp h&igrave;nh ảnh s&aacute;ng hơn 25%, tối đa 1.500nits so với thế hệ cũ. C&ugrave;ng với tỷ lệ tương phản cải thiện 50% cho hiển thị r&otilde; n&eacute;t bất chấp mọi điều kiện. Nh&agrave; sản xuất cũng bổ sung t&iacute;nh năng Eye Comfort Shield hạn chế tối đa t&igrave;nh trạng mỏi mắt khi sử dụng li&ecirc;n tục. M&agrave;n h&igrave;nh của Galaxy S21 Ultra 5G tự tin đem đến cho người d&ugrave;ng trải nghiệm đa t&aacute;c vụ từ học tập, l&agrave;m việc đến giải tr&iacute; kh&ocirc;ng giới hạn.</p>

<h3>C&ocirc;ng nghệ camera vượt trội nhất từ Samsung</h3>

<p>Kh&ocirc;ng chỉ c&oacute; thiết kế b&ecirc;n ngo&agrave;i đẳng cấp, chiếc Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng c&ograve;n sở hữu hệ thống camera ti&ecirc;n tiến nhất hiện nay. M&ocirc;-đun camera h&igrave;nh chữ nhật chứa bốn cảm biến với một ống k&iacute;nh ch&iacute;nh 108MP. Ngo&agrave;i ra c&ograve;n c&oacute; một camera g&oacute;c si&ecirc;u rộng 12MP, camera tele si&ecirc;u rộng 10MP v&agrave; camera tele k&eacute;p 10MP. Hệ thống camera n&agrave;y hỗ trợ chụp ảnh HDR 12 bit với m&agrave;u sắc phong ph&uacute; hơn 64 lần v&agrave; dải động rộng hơn ba lần.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-ultra-3.jpg" style="height:232.969px; width:465.938px" /></p>

<p><img src="file:///C:/Users/ADMINI~1/AppData/Local/Temp/msohtmlclip1/01/clip_image003.jpg" /></p>

<p>B&ecirc;n cạnh đ&oacute;, Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng c&ograve;n hỗ trợ thu ph&oacute;ng chuẩn kh&ocirc;ng gian 100X, một ống k&iacute;nh zoom quang học 3X v&agrave; một ống k&iacute;nh zoom quang học 10X. Bạn thậm ch&iacute; c&oacute; thể tạo ra những thước phim chuy&ecirc;n nghiệp với t&iacute;nh năng quay video 4K ở tốc độ 60 khung h&igrave;nh/gi&acirc;y. Cảm biến chụp đ&ecirc;m đ&atilde; được cải tiến để giảm nhiễu v&agrave; bắt được nhiều &aacute;nh s&aacute;ng hơn. C&ocirc;ng nghệ Nona-binning 12MP được kết hợp mang đến những bức ảnh sắc n&eacute;t với chất lượng tuyệt vời. Ngo&agrave;i ra, n&oacute; c&ograve;n c&oacute; một camera selfie 40MP để ho&agrave;n thiện trải nghiệm chụp h&igrave;nh cho người d&ugrave;ng.</p>

<h3>Kết nối cực nhanh, tương th&iacute;ch cực đỉnh với S Pen</h3>

<p>Samsung Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng l&agrave; phi&ecirc;n bản duy nhất trong 3 biến thể tương th&iacute;ch với b&uacute;t S Pen ti&ecirc;u chuẩn. N&oacute; c&oacute; thể hỗ trợ c&aacute;c trải nghiệm từ vẽ, ghi ch&uacute;, chỉnh sửa h&igrave;nh ảnh đến chụp ảnh selfie chỉ với thao t&aacute;c cực đơn giản. Nhờ c&ocirc;ng nghệ từ Wacom, người d&ugrave;ng c&oacute; thể trải nghiệm b&uacute;t S Pen y&ecirc;u th&iacute;ch ngay tr&ecirc;n chiếc Galaxy S21 Ultra n&agrave;y. Kh&aacute;c với Galaxy Note, chiếc Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng kh&ocirc;ng c&oacute; khe cắm ri&ecirc;ng cho b&uacute;t S Pen. Thay v&agrave;o đ&oacute; bạn c&oacute; thể mua đựng chiếc b&uacute;t S Pen trong một cover b&aacute;n c&ugrave;ng m&aacute;y v&agrave; lấy ra sử dụng rất dễ d&agrave;ng.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-ultra-4.jpg" style="height:267.091px; width:475.356px" /></p>

<p>&nbsp;</p>

<p><img src="file:///C:/Users/ADMINI~1/AppData/Local/Temp/msohtmlclip1/01/clip_image004.jpg" /></p>

<p>Những năm qua, Samsung vẫn đang nỗ lực nghi&ecirc;n cứu để ph&aacute;t triển tốc độ kết nối tr&ecirc;n những chiếc smartphone của m&igrave;nh. Samsung Galaxy S21 Ultra 5G tự h&agrave;o l&agrave; một trong những điện thoại th&ocirc;ng minh đầu ti&ecirc;n hỗ trợ Wi-Fi 6E. Nhờ được cung cấp nhiều băng th&ocirc;ng hơn, kết nối Internet tr&ecirc;n chiếc smartphone n&agrave;y nhanh hơn gấp 4 lần, người d&ugrave;ng c&oacute; thể chia sẻ c&aacute;c nội dung chỉ trong nh&aacute;y mắt. So với d&ograve;ng Galaxy S20 series, kết nối mạng 5G tr&ecirc;n Galaxy S21 Ultra 5G đ&atilde; được cải thiện đ&aacute;ng kể. N&oacute; đ&atilde; giảm độ trễ kết nối xuống mức thấp nhất, cho người d&ugrave;ng trải nghiệm trực tuyến mượt m&agrave; hơn. Điện thoại Galaxy S21 Ultra 5G được trang bị con chip Exynos 2100 5nm mạnh mẽ v&agrave; tiết kiệm năng lượng hơn. N&oacute; cũng đi k&egrave;m với vi&ecirc;n pin 5000mAh c&oacute; thể sạc đầy 50% chỉ trong 30 ph&uacute;t.</p>

<p>Điện thoại Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng c&oacute; sẵn hai t&ugrave;y chọn m&agrave;u đen v&agrave; bạc. Kh&aacute;ch h&agrave;ng đặt mua tại Ho&agrave;ng H&agrave; Mobile sẽ nhận được mức gi&aacute; tốt nhất c&ugrave;ng nhiều ưu đ&atilde;i đặc biệt v&agrave; chế độ bảo h&agrave;nh 12 th&aacute;ng ch&iacute;nh h&atilde;ng. Tham khảo th&ecirc;m th&ocirc;ng tin sản phẩm tại đ&acirc;y: https://hoanghamobile.com/dat-hang/galaxy-s21-plus-s21-ultra</p>
', N'285251.jpg', N'285252.jpg', N'285253.jpg', 12, 1, 1, N'81113')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [LoaiSP], [SoLuotXemSP], [HangSX], [XuatXu], [GiaGoc], [GiaTien], [MoTa], [AnhDaiDien], [AnhNen], [AnhKhac], [SoLuong], [isnew], [ishot], [MaNCC]) VALUES (N'32665', N'Samsung Galaxy S21 Ultra 128GB 5G - Chính hãng', N'64844', NULL, N'72443', N'Trung Quốc', CAST(26300000 AS Decimal(18, 0)), CAST(26300000 AS Decimal(18, 0)), N'<h3>Mua điện thoại Samsung Galaxy S21 Ultra 5G gi&aacute; rẻ ch&iacute;nh h&atilde;ng tại Tiến Dũng</h3>

<p>Samsung l&agrave; một trong những nh&agrave; sản xuất dẫn đầu tr&ecirc;n thị trường điện thoại th&ocirc;ng minh nhiều năm qua. Sau th&agrave;nh c&ocirc;ng của d&ograve;ng Galaxy S20 series, Samsung đ&atilde; trở lại v&agrave; tiếp tục khẳng định vị thế cho d&ograve;ng flagship cao cấp của m&igrave;nh. D&ograve;ng Galaxy S21 series đ&aacute;nh dấu bước nhảy vọt với những c&ocirc;ng nghệ ti&ecirc;n tiến nhất hiện nay. Đ&aacute;ng ch&uacute; &yacute;, Galaxy S21 Ultra 5G l&agrave; phi&ecirc;n bản đầu ti&ecirc;n v&agrave; duy nhất trong d&ograve;ng sản phẩm năm nay được t&iacute;ch hợp c&ugrave;ng b&uacute;t S Pen. &ldquo;T&acirc;n binh khủng long&rdquo; n&agrave;y hứa hẹn sẽ dẫn đầu xu hướng v&agrave; tạo ra những trải nghiệm đẳng cấp, kh&aacute;c biệt cho người d&ugrave;ng.</p>

<p>&nbsp;</p>

<p><img src="file:///C:/Users/ADMINI~1/AppData/Local/Temp/msohtmlclip1/01/clip_image001.jpg" /></p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-ultra.jpg" style="height:301.822px; width:452.733px" /></p>

<h3>Thiết kế nguy&ecirc;n bản camera liền cạnh đẳng cấp</h3>

<p>Điện thoại Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng dẫn đầu cho xu hướng thiết kế mới, kh&aacute;c biệt ho&agrave;n to&agrave;n so với những smartphone hiện nay. Cụm camera nguy&ecirc;n khối được gắn liền với cạnh v&agrave; khung kim loại của m&aacute;y, mang lại cảm gi&aacute;c nam t&iacute;nh hơn v&agrave; v&ocirc; c&ugrave;ng tinh xảo. Điện thoại c&ograve;n được trang bị một lớp k&iacute;nh Corning&reg; Gorilla&reg; Glass Victus bền bỉ nhất hiện nay.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-ultra-2.jpg" style="height:273.962px; width:461.733px" /></p>

<p>&nbsp;</p>

<p><img src="file:///C:/Users/ADMINI~1/AppData/Local/Temp/msohtmlclip1/01/clip_image002.jpg" /></p>

<p>Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng sở hữu m&agrave;n h&igrave;nh AMOLED 2X 6.8 inch với tần số qu&eacute;t từ 10Hz - 120Hz mượt m&agrave;. Nhờ đ&oacute;, điện thoại c&oacute; thể mang đến trải nghiệm h&igrave;nh ảnh sống động, sắc n&eacute;t đến từng chi tiết nhưng vẫn tiết kiệm thời lượng pin đ&aacute;ng kể. Galaxy S21 Ultra 5G cung cấp h&igrave;nh ảnh s&aacute;ng hơn 25%, tối đa 1.500nits so với thế hệ cũ. C&ugrave;ng với tỷ lệ tương phản cải thiện 50% cho hiển thị r&otilde; n&eacute;t bất chấp mọi điều kiện. Nh&agrave; sản xuất cũng bổ sung t&iacute;nh năng Eye Comfort Shield hạn chế tối đa t&igrave;nh trạng mỏi mắt khi sử dụng li&ecirc;n tục. M&agrave;n h&igrave;nh của Galaxy S21 Ultra 5G tự tin đem đến cho người d&ugrave;ng trải nghiệm đa t&aacute;c vụ từ học tập, l&agrave;m việc đến giải tr&iacute; kh&ocirc;ng giới hạn.</p>

<h3>C&ocirc;ng nghệ camera vượt trội nhất từ Samsung</h3>

<p>Kh&ocirc;ng chỉ c&oacute; thiết kế b&ecirc;n ngo&agrave;i đẳng cấp, chiếc Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng c&ograve;n sở hữu hệ thống camera ti&ecirc;n tiến nhất hiện nay. M&ocirc;-đun camera h&igrave;nh chữ nhật chứa bốn cảm biến với một ống k&iacute;nh ch&iacute;nh 108MP. Ngo&agrave;i ra c&ograve;n c&oacute; một camera g&oacute;c si&ecirc;u rộng 12MP, camera tele si&ecirc;u rộng 10MP v&agrave; camera tele k&eacute;p 10MP. Hệ thống camera n&agrave;y hỗ trợ chụp ảnh HDR 12 bit với m&agrave;u sắc phong ph&uacute; hơn 64 lần v&agrave; dải động rộng hơn ba lần.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-ultra-3.jpg" style="height:232.969px; width:465.938px" /></p>

<p><img src="file:///C:/Users/ADMINI~1/AppData/Local/Temp/msohtmlclip1/01/clip_image003.jpg" /></p>

<p>B&ecirc;n cạnh đ&oacute;, Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng c&ograve;n hỗ trợ thu ph&oacute;ng chuẩn kh&ocirc;ng gian 100X, một ống k&iacute;nh zoom quang học 3X v&agrave; một ống k&iacute;nh zoom quang học 10X. Bạn thậm ch&iacute; c&oacute; thể tạo ra những thước phim chuy&ecirc;n nghiệp với t&iacute;nh năng quay video 4K ở tốc độ 60 khung h&igrave;nh/gi&acirc;y. Cảm biến chụp đ&ecirc;m đ&atilde; được cải tiến để giảm nhiễu v&agrave; bắt được nhiều &aacute;nh s&aacute;ng hơn. C&ocirc;ng nghệ Nona-binning 12MP được kết hợp mang đến những bức ảnh sắc n&eacute;t với chất lượng tuyệt vời. Ngo&agrave;i ra, n&oacute; c&ograve;n c&oacute; một camera selfie 40MP để ho&agrave;n thiện trải nghiệm chụp h&igrave;nh cho người d&ugrave;ng.</p>

<h3>Kết nối cực nhanh, tương th&iacute;ch cực đỉnh với S Pen</h3>

<p>Samsung Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng l&agrave; phi&ecirc;n bản duy nhất trong 3 biến thể tương th&iacute;ch với b&uacute;t S Pen ti&ecirc;u chuẩn. N&oacute; c&oacute; thể hỗ trợ c&aacute;c trải nghiệm từ vẽ, ghi ch&uacute;, chỉnh sửa h&igrave;nh ảnh đến chụp ảnh selfie chỉ với thao t&aacute;c cực đơn giản. Nhờ c&ocirc;ng nghệ từ Wacom, người d&ugrave;ng c&oacute; thể trải nghiệm b&uacute;t S Pen y&ecirc;u th&iacute;ch ngay tr&ecirc;n chiếc Galaxy S21 Ultra n&agrave;y. Kh&aacute;c với Galaxy Note, chiếc Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng kh&ocirc;ng c&oacute; khe cắm ri&ecirc;ng cho b&uacute;t S Pen. Thay v&agrave;o đ&oacute; bạn c&oacute; thể mua đựng chiếc b&uacute;t S Pen trong một cover b&aacute;n c&ugrave;ng m&aacute;y v&agrave; lấy ra sử dụng rất dễ d&agrave;ng.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-ultra-4.jpg" style="height:267.091px; width:475.356px" /></p>

<p>&nbsp;</p>

<p><img src="file:///C:/Users/ADMINI~1/AppData/Local/Temp/msohtmlclip1/01/clip_image004.jpg" /></p>

<p>Những năm qua, Samsung vẫn đang nỗ lực nghi&ecirc;n cứu để ph&aacute;t triển tốc độ kết nối tr&ecirc;n những chiếc smartphone của m&igrave;nh. Samsung Galaxy S21 Ultra 5G tự h&agrave;o l&agrave; một trong những điện thoại th&ocirc;ng minh đầu ti&ecirc;n hỗ trợ Wi-Fi 6E. Nhờ được cung cấp nhiều băng th&ocirc;ng hơn, kết nối Internet tr&ecirc;n chiếc smartphone n&agrave;y nhanh hơn gấp 4 lần, người d&ugrave;ng c&oacute; thể chia sẻ c&aacute;c nội dung chỉ trong nh&aacute;y mắt. So với d&ograve;ng Galaxy S20 series, kết nối mạng 5G tr&ecirc;n Galaxy S21 Ultra 5G đ&atilde; được cải thiện đ&aacute;ng kể. N&oacute; đ&atilde; giảm độ trễ kết nối xuống mức thấp nhất, cho người d&ugrave;ng trải nghiệm trực tuyến mượt m&agrave; hơn. Điện thoại Galaxy S21 Ultra 5G được trang bị con chip Exynos 2100 5nm mạnh mẽ v&agrave; tiết kiệm năng lượng hơn. N&oacute; cũng đi k&egrave;m với vi&ecirc;n pin 5000mAh c&oacute; thể sạc đầy 50% chỉ trong 30 ph&uacute;t.</p>

<p>Điện thoại Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng c&oacute; sẵn hai t&ugrave;y chọn m&agrave;u đen v&agrave; bạc. Kh&aacute;ch h&agrave;ng đặt mua tại Ho&agrave;ng H&agrave; Mobile sẽ nhận được mức gi&aacute; tốt nhất c&ugrave;ng nhiều ưu đ&atilde;i đặc biệt v&agrave; chế độ bảo h&agrave;nh 12 th&aacute;ng ch&iacute;nh h&atilde;ng. Tham khảo th&ecirc;m th&ocirc;ng tin sản phẩm tại đ&acirc;y: https://hoanghamobile.com/dat-hang/galaxy-s21-plus-s21-ultra</p>
', N'326651.jpg', N'326652.jpg', N'326653.jpg', 20, 1, 1, N'35313')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [LoaiSP], [SoLuotXemSP], [HangSX], [XuatXu], [GiaGoc], [GiaTien], [MoTa], [AnhDaiDien], [AnhNen], [AnhKhac], [SoLuong], [isnew], [ishot], [MaNCC]) VALUES (N'38131', N'Oppo Find X2 - Chính hãng', N'64844', NULL, N'62575', N'Trung Quốc', CAST(21990000 AS Decimal(18, 0)), CAST(21990000 AS Decimal(18, 0)), N'<h2>Mua điện thoại Oppo Find X2 ch&iacute;nh h&atilde;ng, gi&aacute; rẻ tại&nbsp;<a href="https://hoanghamobile.com/">T</a>iến Dũng</h2>

<p><em>Sau một thời gian vắng b&oacute;ng khỏi ph&acirc;n kh&uacute;c cao cấp, đầu năm 2020, Oppo đ&atilde; trở lại với chiếc flagship Oppo Find X2. Đ&acirc;y hứa hẹn l&agrave; một sản phẩm tiềm năng của Oppo với th&ocirc;ng số phần cứng si&ecirc;u khủng.</em></p>

<h3>Thiết kế</h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2020/03/13/oppo--dien-thoai-di-dong-oppo-find-x2-chinh-hang-1.png" /></p>

<p>Giống như những c&aacute;c smartphone đầu bảng trong thời gian trở lại đ&acirc;y, Oppo vẫn trung th&agrave;nh với thiết kế hai mặt k&iacute;nh v&agrave; khung viền kim loại. Oppo Find X2 cũng kh&ocirc;ng phải ngoại lệ khi được ho&agrave;n thiện với k&iacute;nh cường Gorilla Glass thế hệ thứ 6 v&agrave; viền bằng nh&ocirc;m. Đặc biệt, cả mặt trước v&agrave; mặt sau của chiếc điện thoại n&agrave;y được bo cong sang hai b&ecirc;n, mang lại cảm gi&aacute;c vuốt mượt m&agrave; hơn v&agrave; cầm nắm kh&ocirc;ng bị cấn.</p>

<p>Oppo cũng chơi lớn khi sản xuất th&ecirc;m phi&ecirc;n bản mặt sau bằng gốm ceramic (tuỳ v&agrave;o m&agrave;u sắc), đ&acirc;y l&agrave; đột ph&aacute; rất lớn của h&atilde;ng điện thoại n&agrave;y, kh&aacute;c hẳn với con đường m&agrave; c&aacute;c nh&agrave; sản xuất kh&aacute;c vẫn đang đi.</p>

<p>Mặt trước của Oppo Find X2 l&agrave; m&agrave;n h&igrave;nh k&iacute;ch thước 6.7-inch gần như tr&agrave;n viền. Ở g&oacute;c b&ecirc;n tr&aacute;i, m&agrave;n h&igrave;nh được &ldquo;đục&rdquo; một lỗ nhỏ cho camera trước của m&aacute;y. Thiết kế n&agrave;y Oppo tận dụng tối đa kh&ocirc;ng gian m&agrave;n h&igrave;nh, đạt được tỉ lệ 90.9% so với k&iacute;ch thước tổng thể.</p>

<p>Mặt lưng của Oppo Find X2 phi&ecirc;n bản m&agrave;u xanh kh&ocirc;ng chỉ l&agrave; một m&agrave;u trơn. Oppo đ&atilde; tạo ra hiệu ứng m&agrave;u gradient tr&ecirc;n mặt lưng n&agrave;y, khiến người d&ugrave;ng kh&ocirc;ng cảm thấy nh&agrave;m ch&aacute;n. Mặt k&iacute;nh n&agrave;y cũng c&oacute; những đường lượn s&oacute;ng, gi&uacute;p l&agrave;m giảm khả năng b&aacute;m dấu v&acirc;n tay. M&aacute;y cũng c&oacute; phi&ecirc;n bản m&agrave;u đen cổ điển nữa, nhưng chắc chắn sẽ kh&ocirc;ng lộng lẫy bằng m&agrave;u xanh đại dương n&agrave;y.</p>

<p>Oppo Find X2 cũng được trang bị khả năng chống nước, gi&uacute;p m&aacute;y kh&ocirc;ng bị ảnh hưởng nếu bạn l&agrave;m đổ nước hay gặp phải cơn mưa bất chợt.</p>

<h3>M&agrave;n h&igrave;nh</h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2020/03/13/oppo--dien-thoai-di-dong-oppo-find-x2-chinh-hang-2.png" /></p>

<p>M&agrave;n h&igrave;nh l&agrave; một trong những điểm s&aacute;ng của Oppo Find X2. Ngo&agrave;i tấm nền AMOLED độ ph&acirc;n giải 2K dường như trở th&agrave;nh ti&ecirc;u chuẩn flagship, Oppo mạnh tay mang c&ocirc;ng nghệ 120Hz l&ecirc;n chiếc m&aacute;y n&agrave;y. Điều n&agrave;y c&oacute; nghĩa l&agrave; m&agrave;n h&igrave;nh của m&aacute;y được l&agrave;m tươi 120 lần/gi&acirc;y. Do đ&oacute;, m&agrave;n h&igrave;nh của m&aacute;y cho cảm gi&aacute;c si&ecirc;u mượt m&agrave;. M&aacute;y hỗ trợ ti&ecirc;u chuẩn HDR10, độ phủ m&agrave;u DCI-P3 l&ecirc;n tới 100%. C&ocirc;ng nghệ n&agrave;y sẽ ph&aacute;t huy t&aacute;c dụng khi người d&ugrave;ng xem những bộ phim HDR tr&ecirc;n m&agrave;n h&igrave;nh n&agrave;y. Độ s&aacute;ng của tấm nền n&agrave;y cũng l&ecirc;n tới 800nit, do đ&oacute; việc sử dụng ngo&agrave;i trời kh&ocirc;ng phải một trở ngại với Oppo Find X2.</p>

<h3>Cấu h&igrave;nh v&agrave; phần mềm</h3>

<p>Giống như những chiếc flagship kh&aacute;c, Oppo Find X2 mang tr&ecirc;n m&igrave;nh cấu h&igrave;nh mạnh nhất v&agrave;o thời điểm đầu năm 2020 n&agrave;y. M&aacute;y được trang bị SoC Snapdragon 865 8 nh&acirc;n, chạy tr&ecirc;n tiến tr&igrave;nh 7nm v&agrave; đồ hoạ Adreno 650. B&ecirc;n cạnh đ&oacute; l&agrave; RAM l&ecirc;n tới 12GB v&agrave; 256GB bộ nhớ trong. Với cấu h&igrave;nh, Oppo Find X2 dễ d&agrave;ng lọt v&agrave;o top c&aacute;c smartphone khoẻ nhất trong năm nay. Sẽ hiếm c&oacute; game n&agrave;o gay kh&oacute; khăn được cho thiết bị của Oppo.</p>

<p>Find X2 chạy tr&ecirc;n Android 10 với giao diện ColorOS 7.1 mới nhất của Oppo.</p>

<h3>Camera</h3>

<p>Khả năng quay phim chụp ảnh l&agrave; điểm đ&aacute;ng tiền nhất tr&ecirc;n chiếc Oppo Find X2. V&agrave; nếu c&aacute;c bạn chưa biết th&igrave; Oppo Find X2 | X2 Pro đang l&agrave; bộ đ&ocirc;i điện thoại c&oacute;&nbsp;<strong>điểm DXOMARK cao nhất</strong>&nbsp;tr&ecirc;n thị trường.</p>

<p>Camera ch&iacute;nh của m&aacute;y c&oacute; độ ph&acirc;n giải 48MP, sử dụng cảm biến Sony IMX 586, khẩu độ&nbsp;<em>f</em>/1.7. Đ&acirc;y l&agrave; một chiếc camera rất tốt. Khả năng gộp 4 điểm ảnh l&agrave;m 1 gi&uacute;p m&aacute;y thu s&aacute;ng vượt trội hơn, cho ra những bức ảnh 12MP c&oacute; chất lượng si&ecirc;u tốt. B&ecirc;n cạnh đ&oacute; l&agrave; camera zoom 13MP v&agrave; camera g&oacute;c rộng 12MP. Phần cứng n&agrave;y đem lại cho Oppo Find X2 khả năng zoom chất lượng cao l&ecirc;n tới 20X. Phần mềm của m&aacute;y c&ograve;n hỗ trợ khả năng si&ecirc;u chống rung, gi&uacute;p đem lại những video mượt m&agrave; ngay cả khi bạn đang chạy. M&aacute;y cũng c&oacute; thể chụp macro với khoảng c&aacute;ch si&ecirc;u gần chỉ 3cm.</p>

<p>Oppo cũng đ&atilde; mang nhiều t&iacute;nh năng quay video rất tốt l&ecirc;n chiếc m&aacute;y n&agrave;y. Oppo Find X2 c&oacute; thể quay video với độ ph&acirc;n giải tối đa 4K ở 60 khung h&igrave;nh/gi&acirc;y. Th&ecirc;m vao đ&oacute; l&agrave; quay video HDR 10-bit, gi&uacute;p lưu lại nhiều th&ocirc;ng tin, cho ra những thước phim c&oacute; chất lượng rất cao.</p>

<p>Camera trước của m&aacute;y c&oacute; độ ph&acirc;n giải 32MP c&oacute; t&iacute;ch hợp tr&iacute; tuệ nh&acirc;n tạo. Chất lượng của camera n&agrave;y c&oacute; lẽ kh&ocirc;ng cần phải b&agrave;n luận nhiều v&igrave; Oppo đ&atilde; l&agrave;m rất tốt tr&ecirc;n c&aacute;c đời m&aacute;y cũ của m&igrave;nh.</p>

<h3>Pin v&agrave; sạc</h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2020/03/13/oppo--dien-thoai-di-dong-oppo-find-x2-chinh-hang-3.png" /></p>

<p>Oppo Find X2 sở hữu vi&ecirc;n pin dung lượng 4200mAh. Đ&acirc;y l&agrave; một dung lượng pin kh&aacute; lớn tr&ecirc;n thị trường smartphone hiện nay. Chiếc smartphone n&agrave;y ho&agrave;n to&agrave;n c&oacute; thể trụ được một ng&agrave;y d&agrave;i với cường độ sử dụng cao.</p>

<p>Giống như truyền thống của m&igrave;nh, Oppo rất tập trung v&agrave;o khả năng sạc của Find X2. Thiết bị n&agrave;y sử dụng c&ocirc;ng nghệ sạc nhanh SuperVOOC với c&ocirc;ng suất l&ecirc;n tới 65W. Đ&acirc;y l&agrave; một con số lớn nhất tr&ecirc;n thị trường. Bạn c&oacute; thể sạc đầy Find X2 chỉ với 38 ph&uacute;t &ndash; một tốc độ nhanh tới ch&oacute;ng mặt.</p>

<h3>Tạm kết</h3>

<p>C&oacute; thể thấy, Oppo Find X2 xứng đ&aacute;ng l&agrave; một chiếc flagship đầu bảng hiện nay. Chiếc smartphone n&agrave;y kh&ocirc;ng chỉ tốt gỗ m&agrave; c&ograve;n tốt cả nước sơn. Bạn chắc chắn sẽ kh&ocirc;ng cảm thấy thất vọng khi trải nghiệm si&ecirc;u phẩm n&agrave;y.</p>

<p>Hiện tại, Oppo Find X2 sắp sửa được đưa l&ecirc;n kệ tại Ho&agrave;ng H&agrave; Mobile. Ho&agrave;ng H&agrave; lu&ocirc;n tự h&agrave;o l&agrave; chuỗi b&aacute;n lẻ chuy&ecirc;n ph&acirc;n phối c&aacute;c sản phẩm di dộng ch&iacute;nh h&atilde;ng với mức gi&aacute; tốt nhất thị trường. H&atilde;y theo d&otilde;i website hoanghamobile.com để cập nhật th&ocirc;ng tin mới nhất về c&aacute;c sản phẩm điện thoại v&agrave; khuyến mại cực khủng nha!</p>

<p>&nbsp;</p>
', N'381311.jpg', N'381312.jpg', N'381313.jpg', 25, 1, 1, N'35313')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [LoaiSP], [SoLuotXemSP], [HangSX], [XuatXu], [GiaGoc], [GiaTien], [MoTa], [AnhDaiDien], [AnhNen], [AnhKhac], [SoLuong], [isnew], [ishot], [MaNCC]) VALUES (N'50705', N'Vsmart Active 3 - 6GB/64GB - Chính hãng', N'64844', NULL, N'76615', N'Việt Nam', CAST(3990000 AS Decimal(18, 0)), CAST(3990000 AS Decimal(18, 0)), N'<h2>Mua điện thoại Vsmart Active 3 6GB/64GB ch&iacute;nh h&atilde;ng, gi&aacute; rẻ tại Tiến Dũng&nbsp;Mobile</h2>

<p>Vsmart l&agrave; điện thoại th&ocirc;ng minh thuộc ph&acirc;n kh&uacute;c gi&aacute; rẻ được sản xuất bởi tập đo&agrave;n Vingroup. Mới đ&acirc;y, Vsmart Active 3 đ&atilde; ra mắt với nhiều t&iacute;nh năng hiện đại, cấu h&igrave;nh cao hơn thế hệ trước.</p>

<h3><strong>M&agrave;n h&igrave;nh tr&agrave;n viền c&ugrave;ng mặt lưng k&iacute;nh cao cấp</strong></h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2020/01/02/vsmart--dien-thoai-di-dong-vsmart-active-3-6gb-64gb-chinh-hang-1.jpg" /></p>

<p>Vsmart Active 3 sở hữu m&agrave;n h&igrave;nh tr&agrave;n viền với k&iacute;ch thước 6.39 inch. H&atilde;ng đ&atilde; bắt kịp xu hướng hiện nay khi sản xuất ra thiết bị c&oacute; thiết kế m&agrave;n h&igrave;nh ho&agrave;n hảo 100%. Tỉ lệ m&agrave;n h&igrave;nh l&ecirc;n tới 19.5:9 v&agrave; kh&ocirc;ng c&oacute; camera h&igrave;nh giọt nước hay đục lỗ ph&iacute;a trước. Như vậy bạn sẽ thoải m&aacute;i thao t&aacute;c một tay m&agrave; kh&ocirc;ng lo bị giới hạn bởi phần kh&ocirc;ng tr&agrave;n viền. Độ ph&acirc;n Full HD 2340 x 1080 sẽ mang đến h&igrave;nh ảnh hiển thị sắc n&eacute;t.</p>

<p>Mặt lưng c&ograve;n c&oacute; hiệu ứng chuyển m&agrave;u độc đ&aacute;o, đẹp mắt. Thiết kế n&agrave;y c&agrave;ng l&agrave;m tăng th&ecirc;m vẻ sang trọng cho sản phẩm.</p>

<h3><strong>Bộ ba camera sau kết hợp với camera selfie &ldquo;th&ograve; thụt&rdquo;</strong></h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2020/01/02/vsmart--dien-thoai-di-dong-vsmart-active-3-6gb-64gb-chinh-hang-2.jpg" /></p>

<p>Mặc d&ugrave; l&agrave; điện thoại thuộc ph&acirc;n kh&uacute;c gi&aacute; rẻ nhưng Vsmart Active 3 vẫn được trang bị tới ba camera sau. Trong đ&oacute; c&oacute; camera ch&iacute;nh 48 MP f/1.79; camera g&oacute;c si&ecirc;u rộng 118.8 độ 8 MP f/2.2 v&agrave; camera x&oacute;a ph&ocirc;ng chuy&ecirc;n nghiệp 2 MP. Bộ ba camera n&agrave;y chắc chắn sẽ mang đến những bức h&igrave;nh lung linh cho bạn. Đặc biệt khả năng chụp ảnh trong đ&ecirc;m tối của m&aacute;y cũng rất ấn tượng.</p>

<p>Camera selfie của Active 3 được thiết kế kiểu pop-up &ldquo;th&ograve; thụt&rdquo; với độ ph&acirc;n giải l&ecirc;n tới 16 MP. Ngay khi bạn chuyển sang chế độ selfie th&igrave; camera sẽ tự động đưa l&ecirc;n tr&ecirc;n một c&aacute;ch linh hoạt, nhanh ch&oacute;ng. B&ecirc;n cạnh đ&oacute;, Vsmart Active 3 cũng c&oacute; chế độ mở kh&oacute;a bằng v&acirc;n tay cực an to&agrave;n, tiện dụng.</p>

<h3><strong>Vsmart Active 3 sở hữu RAM 6 GB v&agrave; bộ nhớ trong 64 GB</strong></h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2020/01/02/vsmart--dien-thoai-di-dong-vsmart-active-3-6gb-64gb-chinh-hang-3.png" /></p>

<p>B&ecirc;n cạnh phi&ecirc;n bản RAM 4 GB th&igrave; m&aacute;y c&ograve;n c&oacute; cả phi&ecirc;n bản RAM 6 GB. Nhờ vậy người d&ugrave;ng c&oacute; thể xử l&yacute; c&aacute;c t&aacute;c vụ nhanh ch&oacute;ng hơn. Độ đa nhiệm cao cũng gi&uacute;p giải quyết c&ocirc;ng việc tốt hơn, giải tr&iacute; xem phim, lướt web hiệu quả hơn. B&ecirc;n cạnh đ&oacute; m&aacute;y c&ograve;n cho ph&eacute;p bạn chơi những tựa game nặng như Li&ecirc;n qu&acirc;n Mobile, PUBG, game đồ họa 3D...</p>

<p>Vsmart Active 3 c&ograve;n được trang bị bộ nhớ trong l&ecirc;n tới 64 GB. Đối với d&ograve;ng điện thoại gi&aacute; rẻ th&igrave; đ&acirc;y l&agrave; một dung lượng lưu trữ ấn tượng. N&oacute; sẽ gi&uacute;p bạn thoải m&aacute;i lưu giữ h&igrave;nh ảnh, video v&agrave; c&aacute;c dữ liệu quan trọng. Bạn sẽ kh&ocirc;ng c&ograve;n phải lo lắng c&oacute; n&ecirc;n x&oacute;a c&aacute;i n&agrave;y hay bỏ bớt c&aacute;i kia để c&oacute; th&ecirc;m dung lượng trống.</p>

<h3><strong>Hiệu năng ổn định nhờ chạy tr&ecirc;n chip Helio P60 8 nh&acirc;n</strong></h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2020/01/02/vsmart--dien-thoai-di-dong-vsmart-active-3-6gb-64gb-chinh-hang-4.jpg" /></p>

<p>Vsmart đ&atilde; trang bị cho Active 3 con chip Mediatek Helio P60 8 nh&acirc;n 64 bit với tốc độ 2.0 Ghz. N&oacute; sẽ mang đến hiệu năng ổn định c&ugrave;ng trải nghiệm mượt m&agrave; cho bạn. B&ecirc;n cạnh đ&oacute;, m&aacute;y c&ograve;n c&oacute; GPU Mali-G72 MP 3 với khả năng giải quyết nhanh ch&oacute;ng c&aacute;c thao t&aacute;c cơ bản v&agrave; đ&aacute;p ứng c&aacute;c game đồ họa nặng. Nhờ đ&oacute; tạo ra cho bạn những giờ trải nghiệm th&uacute; vị.</p>

<p>M&aacute;y sở hữu vi&ecirc;n pin 4020 mAh đ&aacute;p ứng thời gian sử dụng cả ng&agrave;y d&agrave;i. Bạn sẽ kh&ocirc;ng cần phải lo lắng pin sẽ hết bất chợt. Hơn nữa sạc nhanh đi k&egrave;m cũng sẽ gi&uacute;p sạc đầy pin nhanh ch&oacute;ng, thuận tiện.</p>

<p>Đặt mua Vsmart Active gi&aacute; rẻ, ch&iacute;nh h&atilde;ng tại&nbsp;<a href="https://hoanghamobile.com/">https://tiendungmobile.com/</a>.&nbsp; Kh&aacute;ch h&agrave;ng tham khảo th&ecirc;m những sản phẩm kh&aacute;c của Vsmart qua website&nbsp;<a href="https://hoanghamobile.com/vsmart-c2468.html">https://tiendungmobile.com/</a></p>

<p>&nbsp;</p>
', N'507051.jpg', N'507052.jpg', N'507053.jpg', NULL, 1, 1, N'81113')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [LoaiSP], [SoLuotXemSP], [HangSX], [XuatXu], [GiaGoc], [GiaTien], [MoTa], [AnhDaiDien], [AnhNen], [AnhKhac], [SoLuong], [isnew], [ishot], [MaNCC]) VALUES (N'62855', N'Vivo V20 - 8GB/128GB - Chính hãng', N'64844', NULL, N'27844', N'Trung Quốc', CAST(6750000 AS Decimal(18, 0)), CAST(6750000 AS Decimal(18, 0)), N'<h2>Mua điện thoại Vivo V20 gi&aacute; rẻ ch&iacute;nh h&atilde;ng tại Ho&agrave;ng H&agrave; Mobile</h2>

<p>L&agrave; một thương hiệu điện thoại chỉ mới xuất hiện tại Việt Nam kh&ocirc;ng l&acirc;u thế nhưng Vivo đ&atilde; tạo được nhiều dấu ấn s&acirc;u đậm trong l&ograve;ng người d&ugrave;ng. Những mẫu điện thoại của h&atilde;ng lu&ocirc;n c&oacute; một vẻ bề ngo&agrave;i b&oacute;ng bẩy, sang trọng đi k&egrave;m với nhiều t&iacute;nh năng thời thượng, ph&ugrave; hợp với xu thế, v&agrave; Vivo V20 &ndash; mẫu smartphone mới nhất của h&atilde;ng cũng kh&ocirc;ng phải l&agrave; một ngoại lệ.</p>

<h3>Thiết kế hiện đại với mặt lưng Gradient đẹp m&ecirc; mẩn</h3>

<p>Vivo V20 được kho&aacute;c b&ecirc;n ngo&agrave;i một &ldquo;bộ c&aacute;nh&rdquo; tuyệt đẹp, theo chuẩn xu hướng smartphone của năm 2020 được nhiều người d&ugrave;ng ưa th&iacute;ch. Phần khung viền của m&aacute;y được ho&agrave;n thiện từ kim loại chắc chắn v&agrave; bền bỉ, mặt trước lẫn mặt sau đều được trang bị một lớp k&iacute;nh cường lực với c&aacute;c g&oacute;c cạnh được bo tr&ograve;n mềm mại. V&agrave; v&igrave; cảm biến v&acirc;n tay đ&atilde; được t&iacute;ch hợp v&agrave;o b&ecirc;n trong m&agrave;n h&igrave;nh thế n&ecirc;n mặt sau của Vivo V20 lại c&agrave;ng tinh tế, nh&atilde; nhặn.</p>

<p>&nbsp;</p>

<p>Mặt lưng của Vivo V20 được thiết kế theo phong c&aacute;ch Gradient, mang tới cho người d&ugrave;ng những hiệu ứng chuyển m&agrave;u cực k&igrave; ảo diệu v&agrave; đẹp mắt với nhiều gam m&agrave;u kh&aacute;c nhau. Lớp k&iacute;nh đặc biệt c&ograve;n được phủ một lớp sơn mờ, vừa tăng t&iacute;nh thẩm mỹ cho m&aacute;y, lại vừa gi&uacute;p cảm gi&aacute;c cầm nắm của người d&ugrave;ng tốt hơn, hạn chế được t&igrave;nh trạng trơn trượt, cực k&igrave; ph&ugrave; hợp với những người tay ra nhiều mồ h&ocirc;i.</p>

<h3>M&agrave;n h&igrave;nh AMOLED Full HD sắc n&eacute;t</h3>

<p>Vivo V20 sở hữu một m&agrave;n h&igrave;nh c&oacute; k&iacute;ch thước 6.44 rộng lớn được thiết kế theo dạng giọt nước quen thuộc, độ ph&acirc;n giải Full HD tr&ecirc;n tấm nền AMOLED chất lượng cao. Với việc được trang bị m&agrave;n h&igrave;nh tấm nền AMOLED, Vivo V20 sẽ c&oacute; được khả năng hiển thị m&agrave;u sắc rực rỡ v&agrave; ch&acirc;n thực nhất c&oacute; thể c&ugrave;ng một g&oacute;c nh&igrave;n rộng. V&agrave; v&igrave; tấm nền của m&aacute;y l&agrave; AMOLED thế n&ecirc;n tất nhi&ecirc;n cảm biến v&acirc;n tay của m&aacute;y sẽ được nh&uacute;ng thẳng xuống dưới m&agrave;n h&igrave;nh.</p>

<p>&nbsp;</p>

<p>Vivo V20 cũng hỗ trợ người d&ugrave;ng 2 SIM 2 s&oacute;ng tiện lợi. Việc sử dụng được 2 SIM 2 s&oacute;ng c&ugrave;ng l&uacute;c sẽ gi&uacute;p cho người d&ugrave;ng c&oacute; thể sử dụng m&aacute;y được thuận tiện hơn m&agrave; kh&ocirc;ng phải sử dụng 2 m&aacute;y điện thoại. T&iacute;nh năng 2 SIM 2 s&oacute;ng sẽ đặc biệt hữu &iacute;ch d&agrave;nh cho những đối tượng người d&ugrave;ng l&agrave;m kinh doanh hoặc những t&agrave;i xế chạy xe &ocirc;m c&ocirc;ng nghệ.</p>

<h3>Camera selfie đẳng cấp, t&acirc;m điểm mọi &aacute;nh nh&igrave;n</h3>

<p>Vivo V20 được trang bị ống k&iacute;nh camera selfie cực khủng với độ ph&acirc;n giải l&ecirc;n tới 44MP. C&ugrave;ng với đ&oacute; l&agrave; v&ocirc; v&agrave;n những t&iacute;nh năng cực k&igrave; th&uacute; vị được t&iacute;ch hợp sẵn như: auto focus (tự động lấy n&eacute;t), Dual-View Video, Quay video selfie ổn định, Chụp selfie ban đ&ecirc;m, Selfie chuyển động v&agrave; quay video selfie độ ph&acirc;n giải 4K.</p>

<p>&nbsp;</p>

<p>Kh&ocirc;ng chỉ c&oacute; camera trước khủng, m&agrave; bộ ba camera sau của Vivo V20 cũng kh&ocirc;ng hề k&eacute;m cạnh. Hệ thống camera sau của m&aacute;y bao gồm cảm biến ch&iacute;nh độ ph&acirc;n giải l&ecirc;n tới 64MP, cảm biến g&oacute;c si&ecirc;u rộng 8MP v&agrave; cuối c&ugrave;ng l&agrave; một cảm biến 2MP hỗ trợ chụp ch&acirc;n dung x&oacute;a ph&ocirc;ng. Vivo V20 mang tới cho người d&ugrave;ng tới 3 lựa chọn m&agrave;u sắc l&agrave; Midnight Jazz, Moonlight Sonata v&agrave; Sunset Melody.</p>

<h3>Hiệu năng mượt m&agrave; với Snapdragon 720G</h3>

<p>Vivo V20 được cung cấp sức mạnh xử l&yacute; bởi con chip Snapdragon 720G của Qualcomm. Tuy kh&ocirc;ng phải l&agrave; một con chip mạnh nhất trong ph&acirc;n kh&uacute;c tầm trung nhưng cũng kh&ocirc;ng thể xem thường được sức mạnh của n&oacute;. Bạn đọc hẳn cũng đ&atilde; biết k&iacute; tự &ldquo;G&rdquo; được Qualcomm sư dụng trong sản phẩm của h&atilde;ng nhằm &aacute;m chỉ rằng bộ vi xử l&yacute; n&agrave;y được tạo ra để chuy&ecirc;n xử l&yacute; c&aacute;c t&aacute;c vụ đồ họa, gi&uacute;p người d&ugrave;ng v&agrave; đặc biệt l&agrave; c&aacute;c game thủ c&oacute; được những giờ ph&uacute;t chiến game ổn định, mượt m&agrave; nhất.</p>

<p>&nbsp;</p>

<p>Đi c&ugrave;ng với con chip Snapdragon 720G l&agrave; thanh RAM dung lượng 8GB c&ugrave;ng bộ nhớ trong l&ecirc;n tới 128GB. Dung lượng RAM 8GB khi kết hợp c&ugrave;ng Snapdragon 720G sẽ mang tới cho m&aacute;y một hiệu năng tốt nhất, kể cả với những t&aacute;c vụ th&ocirc;ng thường h&agrave;ng ng&agrave;y cho tới những tựa game nặng hiện nay. Vi&ecirc;n pin của m&aacute;y c&oacute; dung lượng l&agrave; 4000mAh, kết hợp với c&ocirc;ng nghệ sạc nhanh 33W, đủ để gi&uacute;p cho người d&ugrave;ng sử dụng được m&aacute;y trong một ng&agrave;y d&agrave;i m&agrave; kh&ocirc;ng lo phải sạc lại. Kể cả khi c&oacute; bị cạn kiệt năng lượng th&igrave; sạc nhanh 33W cũng sẽ gi&uacute;p người d&ugrave;ng bổ sung lại nhanh ch&oacute;ng nguồn năng lượng bị cạn kiệt trước đ&oacute;.</p>

<p>Để mua điện thoại Vivo V20 gi&aacute; tốt h&atilde;y đến ngay với&nbsp;<a href="https://hoanghamobile.com/">https://hoanghamobile.com/</a>. Chiếc smartphone n&agrave;y chắc chắn sẽ kh&ocirc;ng l&agrave;m bạn thất vọng. Tham khảo th&ecirc;m c&aacute;c sản phẩm kh&aacute;c của Vivo qua&nbsp;<a href="https://hoanghamobile.com/vivo-c2152.html">https://hoanghamobile.com/vivo-c2152.html</a></p>
', N'628551.jpg', N'628552.jpg', N'628553.jpg', 29, 1, 1, N'35313')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [LoaiSP], [SoLuotXemSP], [HangSX], [XuatXu], [GiaGoc], [GiaTien], [MoTa], [AnhDaiDien], [AnhNen], [AnhKhac], [SoLuong], [isnew], [ishot], [MaNCC]) VALUES (N'66531', N'Vsmart Joy 3 4GB/64GB White Pearl - Chính hãng', N'64844', NULL, N'76615', N'Việt Nam', CAST(2590000 AS Decimal(18, 0)), CAST(2590000 AS Decimal(18, 0)), N'<p><img src="https://hoanghamobile.com/Content/web/content-icon/no-item.png" /></p>

<p><a href="javascript:;">... NỘI DUNG ĐANG CẬP NHẬT ...</a></p>
', N'665311.jpg', N'665312.jpg', N'665313.jpg', NULL, 1, 1, N'35313')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [LoaiSP], [SoLuotXemSP], [HangSX], [XuatXu], [GiaGoc], [GiaTien], [MoTa], [AnhDaiDien], [AnhNen], [AnhKhac], [SoLuong], [isnew], [ishot], [MaNCC]) VALUES (N'70707', N'Samsung Galaxy S21 Plus 256GB 5G - Chính hãng', N'64844', NULL, N'72443', N'Trung Quốc', CAST(25200000 AS Decimal(18, 0)), CAST(25200000 AS Decimal(18, 0)), N'<h2>Mua Galaxy S21+ ch&iacute;nh h&atilde;ng gi&aacute; tốt tại Tiến Dũng</h2>

<p>&nbsp;</p>

<p>Mở đầu cuộc chơi flagship năm 2021, Samsung đ&atilde; giới thiệu chiếc Galaxy S21+ b&ecirc;n cạnh Galaxy S21 v&agrave; S21 Ultra. Đ&acirc;y l&agrave; một trong những chiếc m&aacute;y cao cấp nhất của Samsung hiện tại với đầu tư xứng đ&aacute;ng về cả phần cứng lẫn phần mềm.</p>

<h3>Kết nối 5G ho&agrave;n to&agrave;n mới</h3>

<p>&nbsp;</p>

<p>Năm 2021, Samsung đ&atilde; đem đến Việt Nam những chiếc điện thoại Galaxy S đầu ti&ecirc;n hỗ trợ 5G. Galaxy S21+ sử dụng hai chuẩn 5G được triển khai tại Việt Nam l&agrave; sub-6 v&agrave; mmWave. Những si&ecirc;u phẩm mới nh&agrave; Samsung hứa hẹn đem lại cho người d&ugrave;ng tốc độ sử dụng internet si&ecirc;u nhanh với c&aacute;c băng tần 5G. Đ&acirc;y l&agrave; nền tảng quan trọng cho những gi&acirc;y ph&uacute;t giải tr&iacute; tuyệt vời của bạn. Với 5G, bạn sẽ xem được những video 4K một c&aacute;ch trơn tru, hoặc chiến game trực tuyến đồ hoạ khủng mượt m&agrave; hơn.</p>

<p>Người d&ugrave;ng c&oacute; thể sử dụng 2 SIM vật l&yacute; hoặc eSIM tr&ecirc;n chiếc điện thoại n&agrave;y để ph&ugrave; hợp với c&ocirc;ng việc cũng như nhu cầu li&ecirc;n lạc của m&igrave;nh.</p>

<h3>Thiết kế ho&agrave;n to&agrave;n mới. Nhiều m&agrave;u sắc trẻ trung</h3>

<p>&nbsp;</p>

<p>Galaxy S21+ được giới thiệu với ngoại h&igrave;nh chứa đầy c&aacute;i nh&igrave;n thẩm mĩ của Samsung trong một sản phẩm flagship. Người d&ugrave;ng vẫn sẽ t&igrave;m thấy những điểm quen thuộc trong thiết kế của Samsung như hai mặt k&iacute;nh cường lực, khung viền kim loạ s&aacute;ng b&oacute;ng v&agrave; m&agrave;n h&igrave;nh Infinity-O. Tuy vậy, h&atilde;ng đ&atilde; l&agrave;m mới lại thiết kế của m&igrave;nh khi kh&eacute;o l&eacute;o đặt cụm camera v&agrave;o một miếng kim loại, ho&agrave; v&agrave;o phần viền của m&aacute;y. Th&ecirc;m v&agrave;o đ&oacute;, phong c&aacute;ch dual tone tạo n&ecirc;n vẻ ngo&agrave;i hấp dẫn ngay từ lần đầu nh&igrave;n thấy. Kh&aacute;ch h&agrave;ng c&oacute; thể tuỳ chọn ba phi&ecirc;n bản m&agrave;u cho chiếc Galaxy S21+ của m&igrave;nh, bao gồm đen nguy&ecirc;n bản, bạc ngẫu hứng v&agrave; t&iacute;m đam m&ecirc;. Giống như những đời si&ecirc;u phẩm trước, Galaxy S21+ cũng c&oacute; khả năng kh&aacute;ng nước v&agrave; bụi bẩn IP68.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-plus-1.jpg" style="height:249.037px; width:442.733px" /></p>

<p>&nbsp;</p>

<p>Galaxy S21+ chắc chắn sẽ l&agrave; một trong những smartphone c&oacute; m&agrave;n h&igrave;nh đ&atilde; mất trong thời điểm đầu năm 2021. Chiếc smartphone n&agrave;y sở hữu m&agrave;n h&igrave;nh Dynamic AMOLED 2X k&iacute;ch thước 6,7 inch tương tự thiết bị tiền nhiệm, độ ph&acirc;n giải 1080x2400. M&agrave;n h&igrave;nh n&agrave;y sở hữu dải m&agrave;u rộng DCI-P3, hỗ trợ chuẩn HDR10+, cho m&agrave;u sắc rực rỡ, sắc n&eacute;t từng chi tiết. Kh&ocirc;ng chỉ vậy, người d&ugrave;ng sẽ được trải nghiệm tần số qu&eacute;t 120Hz tr&ecirc;n tấm nền n&agrave;y, gi&uacute;p mọi thao t&aacute;c vuốt v&agrave; c&aacute;c pha h&agrave;nh động trở n&ecirc;n mượt m&agrave; hơn bao giờ hết.</p>

<h3>Camera đồng h&agrave;nh c&ugrave;ng bạn tr&ecirc;n mọi nẻo đường</h3>

<p>&nbsp;</p>

<p>Cụm camera được trang bị tr&ecirc;n Galaxy S21+ cũng c&oacute; phần cứng mạnh mẽ v&agrave; phần mềm được tối ưu ho&aacute; cực tốt. Samsung đ&atilde; trang bị cho thiết bị của m&igrave;nh ba camera ở mặt sau: camera ti&ecirc;u chuẩn 12MP, khẩu độ f/1.8, k&iacute;ch thước điểm ảnh lớn 1.8&mu;m; camera zoom 64MP, khẩu độ f/2.0 v&agrave; camera g&oacute;c si&ecirc;u rộng 12MP, ti&ecirc;u cự 13mm, khẩu độ f/2.2. Với độ ph&acirc;n giải lớn v&agrave; thuật to&aacute;n chụp ảnh được thiết kế ri&ecirc;ng, bạn c&oacute; thể zoom l&ecirc;n tới 30x tr&ecirc;n chiếc m&aacute;y n&agrave;y, đưa những khung cảnh ở xa lại gần lại tầm nh&igrave;n của bạn với độ chi tiết tối ưu. M&aacute;y cũng c&oacute; camera 10MP ở ph&iacute;a trước gi&uacute;p người d&ugrave;ng chụp ảnh selfie v&agrave; gọi video cực đ&atilde;.</p>

<p>&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-plus-2.jpg" style="height:261.128px; width:464.227px" /></p>

<p>&nbsp;</p>

<p>Samsung c&ograve;n đưa l&ecirc;n Galaxy S21+ h&agrave;ng loạt t&iacute;nh năng quay phim chụp h&igrave;nh hữu &iacute;ch. Đầu ti&ecirc;n, người d&ugrave;ng sẽ lập tức ấn tượng khi đ&acirc;y l&agrave; chiếc điện thoại hiếm hoi tr&ecirc;n thị trường sở hữu khả năng quay video 8K cực sắc n&eacute;t. H&igrave;nh ảnh tr&iacute;ch xuất từ video n&agrave;y c&oacute; độ ph&acirc;n giải l&ecirc;n tới 33MP. M&aacute;y cũng c&oacute; thể quay video 4K ở 60fps mượt m&agrave;. Để hỗ trợ người d&ugrave;ng quay phim tốt hơn, Samsung trang bị cả chống rung quang học cho ống k&iacute;nh v&agrave; t&iacute;nh năng quay phim si&ecirc;u chống rung, giup thước phim của bạn chuyển động mượt m&agrave; ngay cả khi di chuyển nhanh.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-plus-3.jpg" style="height:264.787px; width:470.733px" /></p>

<p>&nbsp;</p>

<p>Galaxy S21+ cũng nổi bật với t&iacute;nh năng chụp ảnh ch&acirc;n dung với c&aacute;c bộ lọc m&agrave;u chuy&ecirc;n nghiệp, đưa bạn v&agrave;o studio s&aacute;ng tạo bất tận. Bạn cũng sẽ tự tin chụp ảnh v&agrave;o buổi tối hay những địa điểm c&oacute; &aacute;nh s&aacute;ng phức tạp nhờ chế độ si&ecirc;u chụp đ&ecirc;m, đem lại độ s&aacute;ng v&agrave; chi tiết cho bức ảnh thiếu s&aacute;ng của bạn.</p>

<h3>Hiệu suất vượt trội. Thời lượng pin k&eacute;o d&agrave;i cả ng&agrave;y</h3>

<p>&nbsp;</p>

<p>Năm nay, Samsung đ&atilde; mang vi xử l&yacute; Exynos 2100 l&ecirc;n flagship của m&igrave;nh. Đ&acirc;y l&agrave; một con chip 8 nh&acirc;n với tốc độ tối đa l&ecirc;n tới 2,9GHz, đem lại tốc độ tối ưu trong mọi t&aacute;c vụ sử dụng. Galaxy S21+ sẽ gi&uacute;p bạn thực hiện được mọi t&aacute;c vụ một c&aacute;ch nhanh ch&oacute;ng, từ việc lướt web h&agrave;ng ng&agrave;y, cho tới chơi game đồ hoạ khủng v&agrave; xử l&yacute; video độ ph&acirc;n giải cao. Th&ecirc;m v&agrave;o đ&oacute;, dung lượng RAM 8GB sẽ gi&uacute;p bạn xử l&yacute; c&ocirc;ng việc đa nhiệm ho&agrave;n to&agrave;n trơn tru. Người d&ugrave;ng c&oacute; thể thoải m&aacute;i lưu trữ c&aacute;c tệp media v&agrave; th&ocirc;ng tin quan trọng trong bộ nhớ 256GB của m&aacute;y.</p>

<p>&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-plus-4.jpg" style="height:271.491px; width:482.652px" /></p>

<p>&nbsp;</p>

<p>Galaxy S21+ sở hữu vi&ecirc;n pin 4800mAh, đủ để cung cấp cho bạn một ng&agrave;y sử dụng với những t&aacute;c vụ hỗn hợp nặng. Samsung trang bị cho chiếc smartphone n&agrave;y h&agrave;ng loạt t&iacute;nh năng sạc đỉnh cao như sạc si&ecirc;u nhanh 25W v&agrave; sạc nhanh kh&ocirc;ng d&acirc;y 2.0, gi&uacute;p bạn nhanh ch&oacute;ng nối lại trải nghiệm dang dở của m&igrave;nh khi hết pin. T&iacute;nh năng Power Share gi&uacute;p bạn chia sẻ pin cho những phụ kiện hỗ trợ sạc kh&ocirc;ng d&acirc;y như chiếc tai nghe Galaxy Buds Pro v&agrave; AirPods.</p>

<h3>Tạm kết</h3>

<p>&nbsp;</p>

<p>Galaxy S21+ kh&ocirc;ng chỉ l&agrave; một chiếc điện thoại sang trọng, m&agrave; c&ograve;n l&agrave; một thiết bị mạnh mẽ, đem lại cho người d&ugrave;ng những gi&acirc;y ph&uacute;t l&agrave;m việc v&agrave; giải tr&iacute; cực đ&atilde;. Nếu bạn cần t&igrave;m một flagship Android đ&aacute;p ứng mọi nhu cầu sử dụng của m&igrave;nh th&igrave; đ&acirc;y l&agrave; một sự lựa chọn kh&ocirc;ng thể hợp l&yacute; hơn.</p>

<p>Hiện tại Galaxy S21+ được b&aacute;n ch&iacute;nh h&atilde;ng tại hệ thống Ho&agrave;ng H&agrave; với h&agrave;ng loạt ưu đ&atilde;i cực hấp dẫn. Sản phẩm được bảo h&agrave;nh 12 th&aacute;ng tại c&aacute;c trung t&acirc;m uỷ quyền của Samsung tr&ecirc;n to&agrave;n quốc. Bạn c&oacute; thể tới ngay chi nh&aacute;nh Ho&agrave;ng H&agrave; Mobile gần nhất hoặc đặt h&agrave;ng tr&ecirc;n website hoanghamobile.com để sở hữu chiếc m&aacute;y n&agrave;y nh&eacute;!</p>
', N'707071.jpg', N'707072.jpg', N'707073.jpg', 22, 1, 1, N'81113')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [LoaiSP], [SoLuotXemSP], [HangSX], [XuatXu], [GiaGoc], [GiaTien], [MoTa], [AnhDaiDien], [AnhNen], [AnhKhac], [SoLuong], [isnew], [ishot], [MaNCC]) VALUES (N'75462', N'iPhone 11 - 128GB - Chính hãng VN/A', N'64844', NULL, N'84680', N'Trung Quốc', CAST(21990000 AS Decimal(18, 0)), CAST(17592000 AS Decimal(18, 0)), N'<p>Tất cả iPhone ch&iacute;nh h&atilde;ng VN/A được ph&acirc;n phối tại Ho&agrave;ng H&agrave; Mobile đều được nhập trực tiếp từ C&ocirc;ng ty TNHH Apple Việt Nam. HoangHa Mobile l&agrave; nh&agrave; b&aacute;n lẻ ủy quyền ch&iacute;nh thức của Apple tại Việt Nam.</p>

<p><img alt="" src="https://hoanghamobile.com/Uploads/Content/2019/09/05/apple--dien-thoai-di-dong-iphone-11-64gb-chinh-hang-vn-a-1.JPG" /></p>

<p><em>Tem ICT c&oacute; tr&ecirc;n c&aacute;c sản phẩm iPhone ch&iacute;nh h&atilde;ng VN/A</em></p>

<h2><strong>Mua điện thoại iPhone 11 ch&iacute;nh h&atilde;ng, gi&aacute; rẻ tại&nbsp;<a href="https://hoanghamobile.com/">Ho&agrave;ng H&agrave; Mobile</a></strong></h2>

<p>iPhone 11 - si&ecirc;u phẩm được mong chờ nhất năm 2019 của Apple chuẩn bị ra mắt. Với những cải tiến vượt trội, phi&ecirc;n bản iPhone mới nhất hứa hẹn sẽ l&agrave;m b&ugrave;ng nổ thị trường c&ocirc;ng nghệ.</p>

<h3>Thiết kế cực kỳ ấn tượng với m&agrave;n h&igrave;nh c&oacute; độ ph&acirc;n giải cao</h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2019/09/05/apple--dien-thoai-di-dong-iphone-11-64gb-chinh-hang-vn-a-2.jpg" /></p>

<p>iPhone 11 vẫn sở hữu thiết kế tr&agrave;n viền với &ldquo;tai thỏ&rdquo; giống iPhone X. Viền bezel ph&iacute;a tr&ecirc;n v&agrave; dưới cũng được l&agrave;m gọn lại nhằm tối đa m&agrave;n h&igrave;nh sử dụng. C&ugrave;ng với đ&oacute;, 4 g&oacute;c của m&aacute;y cũng được bo tr&ograve;n nhẹ tạo cảm gi&aacute;c chắc chắn khi cầm tr&ecirc;n tay. Mặt lưng iPhone 11 l&agrave;m từ chất liệu k&iacute;nh n&ecirc;n rất sang trọng, tinh tế. Kh&aacute;c với c&aacute;c d&ograve;ng iPhone trước, sản phẩm n&agrave;y sẽ c&oacute; 6 m&agrave;u bản bạc, v&agrave;ng, xanh l&aacute;, trắng, đen đỏ.</p>

<p>C&ocirc;ng nghệ m&agrave;n h&igrave;nh LCD Retina mang đến chất lượng tốt nhất. Độ ph&acirc;n giải m&agrave;n h&igrave;nh 1125 x 2436 pixels hiển thị m&agrave;u sắc ch&iacute;nh x&aacute;c v&agrave; cho h&igrave;nh ảnh sắc n&eacute;t. M&agrave;n h&igrave;nh rộng 6.1 inch gi&uacute;p người sử dụng thoải m&aacute;i trải nghiệm xem phim, lướt web&hellip; Đặc biệt Apple đ&atilde; trang bị tần số qu&eacute;t từ 90 đến 120 Hz với 463 điểm m&agrave;u.</p>

<h3>Camera độc đ&aacute;o n&acirc;ng tầm chụp ảnh chuy&ecirc;n nghiệp</h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2019/09/05/apple--dien-thoai-di-dong-iphone-11-64gb-chinh-hang-vn-a-3.jpg" /></p>

<p>iPhone 11 vẫn sở hữu 2 camera nhưng thay v&igrave; đặt dọc như iPhone X th&igrave; ch&uacute;ng lại được sắp xếp theo h&igrave;nh vu&ocirc;ng. Đ&egrave;n flash cũng được đặt trong h&igrave;nh vu&ocirc;ng n&agrave;y. Trong đ&oacute; c&oacute; một camera ch&iacute;nh với độ ph&acirc;n giải 12MP gi&uacute;p bạn c&oacute; được những bức ảnh cực đẹp. Camera thứ hai c&oacute; g&oacute;c si&ecirc;u rộng 12 MP, ti&ecirc;u cự 13mm cho g&oacute;c chụp 120 độ.</p>

<p>C&aacute;c thuật to&aacute;n xử l&yacute; c&ugrave;ng được Apple n&acirc;ng cấp gồm chụp ch&acirc;n dung Potrait Mode, chụp ch&acirc;n dung đen trắng Highkey. Đồng thời tự động chuyển sang t&iacute;nh năng chụp đ&ecirc;m Night Mode khi nhận thấy thiếu &aacute;nh s&aacute;ng.</p>

<p>Camera selfie được n&acirc;ng cấp với độ ph&acirc;n giải l&ecirc;n đến 12MP. Đồng thời đ&egrave;n flash cũng được n&acirc;ng độ s&aacute;ng v&agrave; v&ugrave;ng chiếu s&aacute;ng rộng hơn. Nhờ đ&oacute;, bạn sẽ thoải m&aacute;i chụp ảnh kể cả ở những nơi &aacute;nh s&aacute;ng yếu. B&ecirc;n cạnh đ&oacute;, chế độ slow-motiton hứa hẹn sẽ trở th&agrave;nh một t&iacute;nh năng độc đ&aacute;o. Mỗi một sản phẩm mới của Apple đều được n&acirc;ng cấp camera nhằm tạo ra những trải nghiệm mới th&uacute; vị hơn cho người sử dụng.</p>

<h3>Pin dung lượng 3110 mAh n&acirc;ng thời gian nhiều hơn 1 giờ so với iPhone XR</h3>

<p>iPhone 11 ch&iacute;nh h&atilde;ng được trang bị pin c&oacute; dung lượng 3110 mAh. Với dung lượng như vậy th&igrave; chỉ một lần sạc l&agrave; c&oacute; thể sử dụng thoải m&aacute;i. Th&ecirc;m một điểm cộng nữa cho sản phẩm n&agrave;y đ&oacute; ch&iacute;nh l&agrave; c&ocirc;ng nghệ sạc kh&ocirc;ng d&acirc;y 15W. So với sạc kh&ocirc;ng d&acirc;y 7.5W hiện tại, sạc kh&ocirc;ng d&acirc;y 15W tăng tốc độ sạc l&ecirc;n 15% v&agrave; hiệu quả năng lượng cao hơn 30%. Mặc d&ugrave; l&agrave; c&ocirc;ng nghệ sạc nhanh nhưng vẫn đảm bảo iPhone kh&ocirc;ng qu&aacute; n&oacute;ng v&agrave; giảm 3 độ trong l&uacute;c sạc.</p>

<h3>Hiệu năng tối ưu với bộ xử l&yacute; Apple A13</h3>

<p><img src="https://hoanghamobile.com/Uploads/2021/02/05/ip-11.jpeg" /></p>

<p>&nbsp;</p>

<p>Bộ&nbsp;xử l&yacute; A13 được sản xuất độc quyền cho iPhone 11 nhằm tạo hiệu năng mạnh mẽ, tiết kiệm pin hiệu quả. Hơn nữa, hệ điều h&agrave;nh iOS v13.0 sẽ tăng tốc độ mở ứng dụng 40%, tốc độ hiển thị b&agrave;n ph&iacute;m 50%, tốc độ camera 70%. C&ocirc;ng nghệ Wi-fi 6 mới nhất cũng được đưa v&agrave;o iPhone 11 nhằm tăng tốc độ kết nối internet tới 40%.</p>

<p>Để thay thế cho 5G, Apple đ&atilde; ph&aacute;t triển c&ocirc;ng nghệ Modified Polyimide (MPI) thay v&igrave; Liquid Crystal Polymer (LCP). N&acirc;ng cấp băng th&ocirc;ng si&ecirc;u rộng gi&uacute;p kết nối mạng nhanh hơn.</p>

<p>Face ID cũng được cải thiện khi c&oacute; thể ph&acirc;n biệt tiền cảnh v&agrave; &aacute;nh xạ khu&ocirc;n mặt để mở kh&oacute;a nhanh ch&oacute;ng hơn. Apple đ&atilde; tăng cường &aacute;nh s&aacute;ng của đ&egrave;n chiếu nhằm tr&aacute;nh &aacute;nh s&aacute;ng của m&ocirc;i trường t&aacute;c động l&agrave;m ảnh hưởng đến hoạt động của Face&nbsp; ID. Nhờ đ&oacute; n&acirc;ng cao t&iacute;nh bảo mật cho sản phẩm.</p>
', N'754621.jpg', N'754622.jpg', N'754623.jpg', 41, 1, 1, N'81113')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [LoaiSP], [SoLuotXemSP], [HangSX], [XuatXu], [GiaGoc], [GiaTien], [MoTa], [AnhDaiDien], [AnhNen], [AnhKhac], [SoLuong], [isnew], [ishot], [MaNCC]) VALUES (N'83681', N'Vivo S1 Pro - 8GB/128GB - Chính hãng', N'64844', NULL, N'27844', N'Trung Quốc', CAST(5490000 AS Decimal(18, 0)), CAST(5490000 AS Decimal(18, 0)), N'<h2>Mua điện thoại Vivo S1 Pro 8GB/128GB gi&aacute; rẻ ch&iacute;nh h&atilde;ng tại Tiến Dũng</h2>

<p>Vivo l&agrave; thương hiệu sản xuất điện thoại th&ocirc;ng minh đến từ Trung Quốc. Những năm qua, Vivo đ&atilde; t&igrave;m được chỗ đứng của m&igrave;nh tại thị trường Việt Nam. C&aacute;c sản phẩm mang thương hiệu Vivo lu&ocirc;n nổi bật bởi thiết kế kh&aacute;c biệt trong ph&acirc;n kh&uacute;c gi&aacute;. C&ocirc;ng ty cũng nỗ lực cải thiện trải nghiệm người d&ugrave;ng tr&ecirc;n c&aacute;c thiết bị của m&igrave;nh. Cuối năm 2019, c&ocirc;ng ty giới thiệu đến người d&ugrave;ng Việt chiếc Vivo S1 Pro. Với thiết kế m&ocirc;-đun camera kim cương, Vivo S1 Pro 8GB/128GB l&agrave; sự lựa chọn tuyệt vời trong ph&acirc;n kh&uacute;c gi&aacute; tầm trung.&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/28/s1-pro-1.jpg" style="height:267.125px; width:474.889px" /></p>

<h3>Thiết kế hiện đại với m&agrave;n h&igrave;nh 6.38 inch</h3>

<p>&nbsp;</p>

<p>Nh&igrave;n chung, về thiết kế tổng thế chiếc Vivo S1 Pro 8GB/128GB ch&iacute;nh h&atilde;ng được ho&agrave;n thiện rất tốt. Điện thoại tr&ocirc;ng c&oacute; vẻ hơi d&agrave;y, khoảng 8.68 mm v&agrave; trọng lượng khoảng 188.7g, nếu cầm trong một thời gian d&agrave;i bạn c&oacute; thể cảm thấy nặng tay. Mặc d&ugrave; vậy, c&aacute;c cạnh đ&atilde; được bo tr&ograve;n v&agrave; mặt sau gọn g&agrave;ng n&ecirc;n cầm kh&aacute; chắc tay. Mặt lưng của m&aacute;y c&ograve;n c&oacute; một lớp sơn b&oacute;ng khiến n&oacute; tr&ocirc;ng b&oacute;ng bẩy hơn nhưng vẫn kh&ocirc;ng b&aacute;m dấu v&acirc;n tay.&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/28/s1-pro-2.jpg" style="height:306px; width:459px" /></p>

<p>Mặt trước của chiếc Vivo S1 Pro 8GB/128GB ch&iacute;nh h&atilde;ng l&agrave; m&agrave;n h&igrave;nh 6.38 inch với độ ph&acirc;n giải Full HD+ (1080 x 2340 Pixels). Tấm nền super AMOLED 16 triệu m&agrave;u cho chất lượng hiển thị h&igrave;nh ảnh sắc n&eacute;t, m&agrave;u ảnh ch&acirc;n thực v&agrave; độ tương phản cao. M&agrave;n h&igrave;nh chứa một cảm biến v&acirc;n tay hoạt động kh&aacute; nhạy. Ngo&agrave;i ra c&ograve;n c&oacute; t&iacute;nh năng mở kh&oacute;a bằng khu&ocirc;n mặt nhưng kh&ocirc;ng nhanh như c&aacute;c mẫu điện thoại cao cấp. Cạnh tr&ecirc;n m&agrave;n h&igrave;nh l&agrave; notch nhỏ, phần cằm của m&aacute;y kh&aacute; d&agrave;y nhưng c&aacute;c viền m&agrave;n h&igrave;nh mỏng đem lại trải nghiệm kh&ocirc;ng gian tối đa.&nbsp;</p>

<h3>Bộ tứ camera chụp ảnh ấn tượng&nbsp;</h3>

<p>&nbsp;</p>

<p>Ng&agrave;y nay, hầu hết người d&ugrave;ng đều coi chụp ảnh v&agrave; quay video như một nhu cầu cơ bản. C&aacute;c nh&agrave; sản xuất cũng đầu tư nhiều hơn cho hệ thống camera tr&ecirc;n những smartphone ph&acirc;n kh&uacute;c gi&aacute; tầm trung. Đối với chiếc Vivo S1 Pro 8GB/128GB ch&iacute;nh h&atilde;ng, nh&agrave; sản xuất trang bị cho n&oacute; bộ tứ camera được xếp trong m&ocirc;-đun h&igrave;nh kim cương đặt ở ch&iacute;nh giữa tạo cảm gi&aacute;c h&agrave;i h&ograve;a c&acirc;n đối. Đ&egrave;n flash LED cũng được đặt gọn g&agrave;ng trong m&ocirc;-đun n&agrave;y.&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/28/s1-pro-3.jpg" style="height:270px; width:447.514px" /></p>

<p>Trong đ&oacute; bao gồm camera ch&iacute;nh 48MP với khẩu độ f/1.8, camera g&oacute;c rộng 8MP với khẩu độ f/2.2, camera macro 2MP v&agrave; cảm biến độ s&acirc;u 2MP. Với hệ thống camera n&agrave;y, Vivo S1 Pro ch&iacute;nh h&atilde;ng c&oacute; thể đem lại những bức ảnh chụp chất lượng, r&otilde; r&agrave;ng chi tiết v&agrave; m&agrave;u sắc v&ocirc; c&ugrave;ng nghệ thuật. Độ tương phản h&igrave;nh ảnh tr&ecirc;n m&aacute;y cũng rất tốt, điểm trừ duy nhất l&agrave; m&aacute;y lấy n&eacute;t hơi l&acirc;u một ch&uacute;t. Trong điều kiện thiếu s&aacute;ng, c&aacute;c bức ảnh chụp vẫn đảm bảo chi tiết của vật thể. T&iacute;nh năng zoom tr&ecirc;n Vivo S1 Pro cũng kh&ocirc;ng g&acirc;y ra hiện tượng vỡ ảnh. B&ecirc;n cạnh đ&oacute;, n&oacute; c&ograve;n được trang bị th&ecirc;m camera selfie 32MP với khẩu độ f/2.0 ho&agrave;n thiện trải nghiệm chụp h&igrave;nh cho người d&ugrave;ng.</p>

<h3>Hiệu năng ổn định trong tầm gi&aacute;&nbsp;</h3>

<p>&nbsp;</p>

<p>Nh&agrave; sản xuất đ&atilde; trang bị cho chiếc Vivo S1 Pro 8GB/128GB ch&iacute;nh h&atilde;ng con chip Snapdragon 665 gồm 4 nh&acirc;n tốc độ 2.2 GHz v&agrave; 4 nh&acirc;n tốc độ 1.8 GHz đi k&egrave;m với đồ họa Adreno 610. Mặc d&ugrave; con chip n&agrave;y kh&aacute; cũ nhưng b&ugrave; lại m&aacute;y c&oacute; RAM 8GB v&agrave; bộ nhớ trong 128GB. Về khả năng chơi game th&igrave; Vivo S1 Pro ch&iacute;nh h&atilde;ng c&oacute; phần k&eacute;m cạnh so với c&aacute;c đối thủ trong c&ugrave;ng ph&acirc;n kh&uacute;c. Tuy nhi&ecirc;n, n&oacute; vẫn xử l&yacute; kh&aacute; tốt c&aacute;c t&aacute;c vụ h&agrave;ng ng&agrave;y như xem phim, lướt web v&agrave; một số tựa game nhẹ.&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/28/s1-pro-4.jpg" style="height:242.531px; width:431.167px" /></p>

<p>Chiếc Vivo S1 Pro 8GB/128GB ch&iacute;nh h&atilde;ng đi k&egrave;m với vi&ecirc;n pin 4500mAh c&oacute; thể đ&aacute;p ứng nhu cầu sử dụng trong suốt ng&agrave;y d&agrave;i. Ngo&agrave;i ra, n&oacute; c&ograve;n hỗ trợ bộ sạc nhanh 18W cho ph&eacute;p sạc đầy vi&ecirc;n pin chỉ trong 2 tiếng. Sản phẩm c&oacute; sẵn hai t&ugrave;y chọn m&agrave;u đen v&agrave; fancy sky, được b&aacute;n tr&ecirc;n hệ thống của Ho&agrave;ng H&agrave; Mobile với mức gi&aacute; ưu đ&atilde;i v&agrave; chế độ bảo h&agrave;nh 12 th&aacute;ng. Tham khảo th&ecirc;m th&ocirc;ng tin sản phẩm tại link: https://hoanghamobile.com/dien-thoai-di-dong/vivo-s1-pro-8gb-128gb-chinh-hang</p>
', N'836811.jpg', N'836812.jpg', N'836813.jpg', 11, 1, 1, N'81113')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [LoaiSP], [SoLuotXemSP], [HangSX], [XuatXu], [GiaGoc], [GiaTien], [MoTa], [AnhDaiDien], [AnhNen], [AnhKhac], [SoLuong], [isnew], [ishot], [MaNCC]) VALUES (N'84060', N'Vsmart Joy 3 - 2GB/32GB - Chính Hãng', N'64844', NULL, N'76615', N'Việt Nam', CAST(2290000 AS Decimal(18, 0)), CAST(2290000 AS Decimal(18, 0)), N'<h2>Mua điện thoại Vsmart Joy 3 - 2GB/32GB ch&iacute;nh h&atilde;ng, gi&aacute; rẻ tại Tiến Dũng&nbsp;Mobile</h2>

<p>Với một thiết kế hiện đại, Vsmart Joy 3 g&acirc;y ấn tượng với người d&ugrave;ng ngay từ c&aacute;i nh&igrave;n đầu ti&ecirc;n. Sản phẩm n&agrave;y đ&atilde; được n&acirc;ng cấp cả về hiệu năng v&agrave; pin so với thế hệ trước.</p>

<h3><strong>Thiết kế m&agrave;n h&igrave;nh giọt nước HD</strong></h3>

<p><img alt="" src="https://hoanghamobile.com/Uploads/Content/2020/02/07/vsmart--dien-thoai-di-dong-vsmart-joy-3-2gb-32gb-chinh-hang-1.jpg" /></p>

<p>Vsmart Joy 3 vẫn sở hữu m&agrave;n h&igrave;nh giọt nước quen thuộc. Thế nhưng với thiết kế tr&agrave;n viền, c&aacute;c thao t&aacute;c của bạn kh&ocirc;ng c&ograve;n bị giới hạn bởi c&aacute;c cạnh nữa. Viền m&agrave;n h&igrave;nh được chế t&aacute;c cong 2.5D tạo cảm gi&aacute;c liền mạch, dễ thao t&aacute;c. B&ecirc;n cạnh đ&oacute;, mặt lưng của m&aacute;y cũng c&oacute; c&aacute;c g&oacute;c bo tr&ograve;n mềm mại, mang t&iacute;nh thẩm mỹ cao. Hiệu ứng chuyển m&agrave;u độc đ&aacute;o l&agrave; một điểm hấp dẫn của sản phẩm n&agrave;y.</p>

<p>Với k&iacute;ch thước si&ecirc;u khủng l&ecirc;n tới 6.5 inch, m&agrave;n h&igrave;nh Vsmart Joy 3 mang đến cho bạn những h&igrave;nh ảnh v&ocirc; c&ugrave;ng sống động, ch&acirc;n thực. Mặc d&ugrave; c&oacute; m&agrave;n h&igrave;nh lớn nhưng k&iacute;ch thước của sản phẩm n&agrave;y lại kh&aacute; nhỏ gọn. Tấm nền IPS LCD c&ugrave;ng độ ph&acirc;n giải HD sẽ gi&uacute;p tăng độ s&aacute;ng v&agrave; độ tương phản khi sử dụng. Bạn chắc chắn sẽ c&oacute; những gi&acirc;y ph&uacute;t giải tr&iacute; tuyệt vời khi trải nghiệm Vsmart Joy 3.</p>

<h3><strong>Bộ 3 camera sắc n&eacute;t c&ugrave;ng camera selfie phong c&aacute;ch</strong></h3>

<p><img alt="" src="https://hoanghamobile.com/Uploads/Content/2020/02/07/vsmart--dien-thoai-di-dong-vsmart-joy-3-2gb-32gb-chinh-hang-2.jpg" /></p>

<p>Vsmart Joy 3 được trang bị tới ba camera sau cực kỳ chuy&ecirc;n nghiệp. Ấn tượng nhất l&agrave; camera ch&iacute;nh 13 MP với khả năng chụp ảnh sắc n&eacute;t trong điều kiện đủ &aacute;nh s&aacute;ng. Kể cả trong điều kiện thiếu &aacute;nh s&aacute;ng th&igrave; camera n&agrave;y vẫn mang đến những bức ảnh đầy t&iacute;nh nghệ thuật nhờ c&ocirc;ng nghệ nhận diện AI. B&ecirc;n cạnh đ&oacute;, m&aacute;y c&ograve;n c&oacute; camera g&oacute;c si&ecirc;u rộng 8 MP. N&oacute; c&oacute; g&oacute;c chụp l&ecirc;n tới 120 độ, rộng gấp đ&ocirc;i so với camera th&ocirc;ng thường. Cuối c&ugrave;ng l&agrave; camera mono với độ ph&acirc;n giải 2 MP.</p>

<p>Bộ ba camera cho ph&eacute;p bạn thoải m&aacute;i s&aacute;ng tạo, lưu giữ những khoảnh khắc đẹp nhất. Chế độ x&oacute;a ph&ocirc;ng sẽ gi&uacute;p l&agrave;m mờ nền một c&aacute;ch ảo diệu đồng thời l&agrave;m nổi bật chủ thể ch&iacute;nh. Ngo&agrave;i ra, m&aacute;y c&ograve;n c&oacute; một camera selfie 8 MP ở mặt trước. Camera n&agrave;y kh&ocirc;ng chỉ chụp ảnh sắc n&eacute;t m&agrave; c&ograve;n tự l&agrave;m đẹp bằng c&aacute;c chế độ x&oacute;a khuyết điểm, l&agrave;m mịn da, x&oacute;a ph&ocirc;ng...</p>

<h3><strong>Chip Snapdragon 632 mang đến hiệu năng ổn định</strong></h3>

<p><img alt="" src="https://hoanghamobile.com/Uploads/Content/2020/02/07/vsmart--dien-thoai-di-dong-vsmart-joy-3-2gb-32gb-chinh-hang-3.jpg" /></p>

<p>Vsmart Joy 3 được trang bị chip Snapdragon 632 đủ đ&aacute;p ứng nhu cầu sử dụng cơ bản. N&oacute; sẽ xử l&yacute; tốt mọi ứng dụng gi&uacute;p bạn lướt web, xem phim, nghe nhạc v&agrave; chơi c&aacute;c tựa game nhẹ. B&ecirc;n cạnh đ&oacute;, m&aacute;y c&ograve;n c&oacute; hệ điều h&agrave;nh VOS 2.5 mới nhất với giao diện dễ nh&igrave;n, dễ d&ugrave;ng. &nbsp;</p>

<p>Sản phẩm c&oacute; RAM 2 GB v&agrave; bộ nhớ trong 32 GB cho ph&eacute;p bạn thoải m&aacute;i lưu trữ dữ liệu. Nếu kh&ocirc;ng đủ th&igrave; cũng đừng lo bởi m&aacute;y c&ograve;n c&oacute; cả khe cắm thẻ nhớ micro SD với dung lượng l&ecirc;n tới 128 GB. Ngo&agrave;i ra, Vsmart Joy 3 cung cấp cả hai phương thức mở kh&oacute;a bao gồm nhận diện khu&ocirc;n mặt v&agrave; cảm biến v&acirc;n tay. Nhờ đ&oacute;, việc bảo mật sẽ tốt hơn đồng thời bạn cũng c&oacute; thể mở kh&oacute;a nhanh hơn.</p>

<h3><strong>Dung lượng pin khủng l&ecirc;n tới 5000 mAh</strong></h3>

<p><img alt="" src="https://hoanghamobile.com/Uploads/Content/2020/02/07/vsmart--dien-thoai-di-dong-vsmart-joy-3-2gb-32gb-chinh-hang-4.jpg" /></p>

<p>Vsmart Joy 3 sở hữu vi&ecirc;n pin với dung lượng si&ecirc;u khủng 5000 mAh. N&oacute; c&oacute; khả năng đ&aacute;p ứng tốt nhu cầu sử dụng trong hai ng&agrave;y liền. Cụ thể bạn sẽ c&oacute; 25 giờ xem video, 48 giờ gọi điện v&agrave; 143 giờ nghe nhạc. M&aacute;y c&ograve;n được trang bị sạc nhanh Quick Charge 3.0 18W. Nhờ đ&oacute; chỉ với 30 ph&uacute;t sạc l&agrave; bạn sẽ c&oacute; th&ecirc;m nửa ng&agrave;y sử dụng.</p>

<p>Truy cập trang&nbsp;<a href="https://hoanghamobile.com/">https://tiendungmobile.com/</a>&nbsp;để mua Vsmart Joy 3 gi&aacute; rẻ ngay h&ocirc;m nay. Kh&aacute;ch h&agrave;ng tham khảo th&ecirc;m những sản phẩm kh&aacute;c của Vsmart qua website&nbsp;<a href="https://hoanghamobile.com/vsmart-c2468.html">https://tiendungmobile.com/</a></p>

<p>&nbsp;</p>
', N'840601.jpg', N'840602.jpg', N'840603.jpg', NULL, 1, 1, N'35313')
GO
SET IDENTITY_INSERT [dbo].[Sanphamcanmua] ON 

INSERT [dbo].[Sanphamcanmua] ([ID], [MaSP], [Soluong], [Ngayketthuc], [Ngaydang], [Mota], [SanPham_Id], [NhaCungCap_Id]) VALUES (2048, N'04053', NULL, CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime), N'<h2>Mua Nokia 5.4 gi&aacute; rẻ ch&iacute;nh h&atilde;ng tại Tiến Dũng Mobile</h2>

<p>Nokia chắc chắn l&agrave; một thương hiệu điện thoại đ&atilde; kh&ocirc;ng c&ograve;n qu&aacute; xa lạ đối với ch&uacute;ng ta, v&agrave; mới đ&acirc;y h&atilde;ng đ&atilde; vừa cho ra mắt mẫu điện thoại mới với c&aacute;i t&ecirc;n Nokia 5.4, hứa hẹn sẽ l&agrave;m người d&ugrave;ng h&agrave;i l&ograve;ng bởi những thứ m&agrave; m&aacute;y đem lại.</p>

<h3>Thiết kế hiện đại, thời thượng</h3>

<p>Được ra mắt trong nửa cuối năm 2020, đầu năm 2021 thế n&ecirc;n tất nhi&ecirc;n Nokia 5.4 sẽ mang đầy đủ những đường n&eacute;t thiết kế thời thượng của những chiếc smartphone hiện đại. M&aacute;y được trang bị một m&agrave;n h&igrave;nh tr&agrave;n viền dạng đục lỗ với k&iacute;ch thước lớn l&ecirc;n tới 6.39 inch, tỉ lệ m&agrave;n h&igrave;nh đạt chuẩn 19.5:9, diện t&iacute;ch m&agrave;n h&igrave;nh chiếm tới 81.9% mặt trước, gi&uacute;p người d&ugrave;ng c&oacute; được một kh&ocirc;ng gian trải nghiệm rộng r&atilde;i, hiển thị được nhiều th&ocirc;ng tin nhất c&oacute; thể nhưng vẫn nằm gọn trong l&ograve;ng b&agrave;n tay của người d&ugrave;ng. Độ ph&acirc;n giải của m&agrave;n h&igrave;nh tuy chỉ dừng lại ở mức HD+, thế nhưng do được t&iacute;ch hợp tấm nền IPS LCD, vậy n&ecirc;n chất lượng hiển thị của m&aacute;y vẫn sẽ đảm bảo được độ sắc n&eacute;t, c&ugrave;ng g&oacute;c nh&igrave;n si&ecirc;u rộng. Với Nokia 5.4, người d&ugrave;ng vẫn c&oacute; thể thoải m&aacute;i thực hiện được c&aacute;c thao t&aacute;c cơ bản h&agrave;ng ng&agrave;y như lướt web, đoc b&aacute;o hay xem m&agrave; kh&ocirc;ng hề gặp một ch&uacute;t trở ngại hoặc kh&oacute; chịu n&agrave;o.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/13/ddd.jpg" /></p>

<p>&nbsp;</p>

<p>Nokia 5.4 c&oacute; lớp vỏ b&ecirc;n ngo&agrave;i được ho&agrave;n thiện từ nhựa giả k&iacute;nh v&ocirc; c&ugrave;ng bắt mắt v&agrave; sang trọng, đặc biệt phần mặt lưng của m&aacute;y c&ograve;n được Nokia thiết kế theo kiểu v&aacute;t cong 3D mềm mại về 2 cạnh b&ecirc;n, mang lại một cảm gi&aacute;c cấm nắm cực k&igrave; thoải m&aacute;i. Nokia 5.4 c&oacute; tất cả 2 phi&ecirc;n bản m&agrave;u sắc cho người d&ugrave;ng lựa chọn bao gồm m&agrave;u Xanh Polar Night v&agrave; Dusk T&iacute;m.</p>

<h3>Khả năng nhiếp ảnh tốt với bộ 4 camera</h3>

<p>Hệ thống camera của Nokia 5.4 cũng l&agrave; một ưu điểm kh&ocirc;ng thể kh&ocirc;ng nhắc tới. Tuy chỉ l&agrave; một mẫu điện thoại nằm ở ph&acirc;n kh&uacute;c gi&aacute; rẻ tầm trung, thế nhưng m&aacute;y cũng được trang bị một hệ thống camera sau với 4 cảm biến cực xịn bao gồm camera ch&iacute;nh 48MP, camera g&oacute;c si&ecirc;u rộng 5MP, v&agrave; camera macro c&ugrave;ng tele c&oacute; c&ugrave;ng độ ph&acirc;n giải 2MP. Camera sau của m&aacute;y cũng hỗ trợ lấy n&eacute;t tự động Auto Focus, HDR, chụp to&agrave;n cảnh, quay video 4K@30fps v&agrave; Full HD@30fps.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/13/bbb.jpg" /></p>

<p>Trong khi đ&oacute;, camera selfie ph&iacute;a trước sẽ c&oacute; độ ph&acirc;n giải l&agrave; 16MP, khẩu độ f/2.0, hỗ trợ quay video ở mức Ful HD 30 khung h&igrave;nh/gi&acirc;y. Với camera selfie n&agrave;y, Nokia 5.4 hứa hẹn sẽ mang tới cho người d&ugrave;ng những bức ảnh &ldquo;tự sướng&rdquo; sắc n&eacute;t c&ugrave;ng chất lượng tốt nhất.</p>

<h2>Hiệu năng mượt m&agrave; với vi xử l&yacute; Snapdragon 662</h2>

<p>Được Nokia ưu &aacute;i trang bị cho bộ vi xử l&yacute; &ldquo;quốc d&acirc;n&rdquo; ở ph&acirc;n kh&uacute;c gi&aacute; rẻ l&agrave; Snapdragon 662 8 nh&acirc;n, với tốc độ xung nhịp tối đa đạt 2.0GHz, được sản xuất tr&ecirc;n tiến tr&igrave;nh 11nm hiện đại, t&iacute;ch hợp bộ GPU xử l&yacute; đồ họa Adreno 610, Nokia 5.4 chắc chắn sẽ mang lại cho người d&ugrave;ng khả năng xử l&yacute; ổn định v&agrave; mượt m&agrave; nhất. Với Snapdragon 662, chắc chắn những t&aacute;c vụ cơ bản h&agrave;ng ng&agrave;y sẽ kh&ocirc;ng thể l&agrave;m kh&oacute; được bộ vi xử l&yacute; n&agrave;y, c&ograve;n việc giải tr&iacute; với những tựa game online phổ biến hiện nay như Li&ecirc;n Minh Tốc Chiến, PUBG Mobile hay Call of Duty Mobile, con chip n&agrave;y cũng c&oacute; thể ho&agrave;n to&agrave;n xử l&yacute; được tốt.</p>

<p>&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/13/aaa.jpg" /></p>

<p>Đi c&ugrave;ng với vi xử l&yacute; Snapdragon 662 l&agrave; bộ nhớ RAM 4GB gi&uacute;p cho người d&ugrave;ng c&oacute; thể thoải m&aacute;i sử dụng đa nhiệm c&aacute;c ứng dụng m&agrave; kh&ocirc;ng lo gặp phải t&igrave;nh trạng bị tr&agrave;n RAM như nhiều mẫu m&aacute;y gi&aacute; rẻ kh&aacute;c chỉ c&oacute; 2GB hoặc 3GB RAM. Bộ nhớ trong của m&aacute;y cũng l&agrave; một điểm cộng khi c&oacute; dung lượng l&ecirc;n tới 128GB cho người d&ugrave;ng c&oacute; thể thoải m&aacute;i lưu trữ dữ liệu, kh&ocirc;ng phải bận t&acirc;m tới việc hết kh&ocirc;ng gian lưu trữ.</p>

<h3>Dung lượng pin lớn 4000mAh</h3>

<p><a name="_heading=h.gjdgxs"></a>Cung cấp năng lượng cho Nokia 5.4 vẫn l&agrave; một vi&ecirc;n pin dung lượng kh&aacute; khủng ở thời điểm hiện tại &ndash; 4.000mAh, đặc biệt l&agrave; khi đi c&ugrave;ng với con chip Snapdragon 662 11nm tiết kiệm điện, m&aacute;y sẽ cho ph&eacute;p người d&ugrave;ng c&oacute; thể thoải m&aacute;i sử dụng trong cả 1 ng&agrave;y d&agrave;i, thậm ch&iacute; l&ecirc;n tới tận 2 ng&agrave;y mới cần phải sạc lại. Nokia 5.4 cũng được trang bị cổng sạc chuẩn USB Type-C, hiện đang được trang bị tr&ecirc;n hầu hết c&aacute;c mẫu điện thoại hiện nay.</p>

<p><a name="_heading=h.ijajcqs268vj"></a></p>

<p>Đến ngay với&nbsp;<a href="https://hoanghamobile.com/">https://tiendungmobile.xyz/</a>&nbsp;để mua điện thoại Nokia 5.4 gi&aacute; tốt nhất thị trường. Chiếc smartphone n&agrave;y chắc chắn sẽ kh&ocirc;ng l&agrave;m bạn thất vọng. Tham khảo th&ecirc;m c&aacute;c sản phẩm kh&aacute;c của Nokia tại đường link&nbsp;<a href="https://hoanghamobile.com/dien-thoai-di-dong/nokia%20">https://tiendungmobile.com/</a>&nbsp;Nội dung chi tiếtNội dung chi tiết</p>
', N'04053', N'81113')
INSERT [dbo].[Sanphamcanmua] ([ID], [MaSP], [Soluong], [Ngayketthuc], [Ngaydang], [Mota], [SanPham_Id], [NhaCungCap_Id]) VALUES (2046, N'10476', NULL, CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime), N'<p>Mua điện thoại di động Vivo V20 SE gi&aacute; rẻ ch&iacute;nh h&atilde;ng tại Tiến Dũng</p>

<p>Vivo l&agrave; thương hiệu sản xuất v&agrave; cung cấp c&aacute;c mẫu điện thoại th&ocirc;ng minh đến từ Trung Quốc. Tại thị trường Việt Nam, Vivo phải cạnh tranh với rất nhiều đối thủ lớn trong ph&acirc;n kh&uacute;c gi&aacute; tầm trung. Mặc d&ugrave; vậy, c&ocirc;ng ty vẫn khẳng định t&ecirc;n tuổi bởi chất lượng sản phẩm vượt trội v&agrave; thiết kế kh&aacute;c biệt. Cuối năm 2020, Vivo ch&iacute;nh thức giới thiệu đến người d&ugrave;ng Việt Nam chiếc điện thoại Vivo V20 SE. Đ&acirc;y l&agrave; chiếc smartphone với nhiều ưu điểm hấp dẫn m&agrave; bạn kh&ocirc;ng thể bỏ lỡ trong tầm gi&aacute; n&agrave;y.&nbsp;</p>

<p><img src="https://lh5.googleusercontent.com/jVBHYg_HOeRNq66tkmXyIYH3IfzXnQSlGYlO1GBZ3tO0obe_pCEKZjCV7442Whcw9nvu2byD5qkn2VGZYyrzOH309-cTgmxeVEeiBTkD8gNC3wNw1S_Bxtzf1C0sNiGH9VauYaw" style="height:351px; width:624px" /></p>

<p>Thiết kế hiện đại, bắt mắt với m&agrave;n h&igrave;nh lớn&nbsp;</p>

<p>Cũng như những chiếc smartphone kh&aacute;c nh&agrave; Vivo, chiếc Vivo V20 SE sở hữu ng&ocirc;n ngữ thiết kế hiện đại v&agrave; c&aacute;c chi tiết được ho&agrave;n thiện rất tốt. Phần khung viền bằng nhựa trọng lượng chỉ khoảng 171g n&ecirc;n cầm rất thoải m&aacute;i v&agrave; đầm tay. Mặt lưng của m&aacute;y được bo cong một c&aacute;ch tinh tế v&agrave; m&agrave;u sắc c&oacute; thể thay đổi t&ugrave;y theo &aacute;nh s&aacute;ng v&agrave; g&oacute;c nh&igrave;n. G&oacute;c tr&ecirc;n b&ecirc;n tr&aacute;i l&agrave; m&ocirc;-đun camera h&igrave;nh chữ nhật kh&aacute; nhỏ gọn. Ngoại h&igrave;nh b&ecirc;n ngo&agrave;i của Vivo V20 SE ch&iacute;nh h&atilde;ng được đ&aacute;nh gi&aacute; l&agrave; nổi bật khi đặt b&ecirc;n cạnh những chiếc smartphone kh&aacute;c.&nbsp;</p>

<p><img src="https://lh6.googleusercontent.com/Kqjna-YcLnkY_u8tM81VBNJ8QAkd_rFDM93IhSPwlc9S9SJfVsSJ2L8hDnTcu41U-HuTZacNr7ja7Dh3TGvfs7IwNfEE47ldSbhldHFk13k-OObFUguNwzg5_AEqvAcv6KpsE_0" style="height:361px; width:624px" /></p>

<p>Mặt trước của chiếc Vivo V20 SE ch&iacute;nh h&atilde;ng l&agrave; m&agrave;n h&igrave;nh AMOLED 6.44 inch với độ ph&acirc;n giải Full HD+ (1080 x 2400 Pixels). Nh&agrave; sản xuất lựa chọn kiểu m&agrave;n h&igrave;nh giọt nước phổ biến tr&ecirc;n c&aacute;c smartphone hiện nay. C&aacute;c viền m&agrave;n h&igrave;nh đ&atilde; được tinh giản c&ugrave;ng tỷ lệ 20:9 đem lại trải nghiệm kh&ocirc;ng gian tối đa cho người d&ugrave;ng. M&agrave;n h&igrave;nh của Vivo V20 SE hiển thị m&agrave;u sắc kh&aacute; ch&acirc;n thực v&agrave; bắt mắt, r&otilde; r&agrave;ng ngay cả khi sử dụng ngo&agrave;i trời.&nbsp;</p>

<p>Cụm 3 camera chụp h&igrave;nh ấn tượng</p>

<p>B&ecirc;n cạnh thiết kế nổi bật, hiệu năng chụp ảnh cũng l&agrave; một điểm s&aacute;ng tr&ecirc;n chiếc Vivo V20 SE ch&iacute;nh h&atilde;ng. Như đ&atilde; đề cập ở tr&ecirc;n, mặt sau của điện thoại l&agrave; m&ocirc;-đun camera h&igrave;nh chữ nhật chứa 3 cảm biến. Bao gồm camera g&oacute;c rộng 48 MP, khẩu độ f/1.8, hỗ trợ lấy n&eacute;t theo pha PDAF. Ngo&agrave;i ra c&ograve;n c&oacute; camera g&oacute;c si&ecirc;u rộng độ ph&acirc;n giải 8 MP, khẩu độ f/2.2 v&agrave; camera đo chiều s&acirc;u hỗ trợ x&oacute;a ph&ocirc;ng 2 MP, khẩu độ f/2.4. Với hệ thống camera n&agrave;y, Vivo V20 SE ch&iacute;nh h&atilde;ng c&oacute; thể đem lại những bức ảnh &ldquo;chất như nước cất&rdquo; v&agrave; nghệ thuật kh&ocirc;ng thua k&eacute;m g&igrave; c&aacute;c smartphone cao cấp.&nbsp;</p>

<p><img src="https://lh3.googleusercontent.com/xlOYMlfJUAO8aZPGugIUMr-y1Uoe0XeX-ja8K5JBcBimPaPQiF2dtEhLuSWDOYG1X1t9GoYWyxGtLVBbTTKzS9gPYHtfs_Chyb8dL2vRziER2G3yyECRgAXTxhXVcpRt7s1P4_I" style="height:415px; width:624px" /></p>

<p>Những bức ảnh chụp từ chiếc Vivo V20 SE được đ&aacute;nh gi&aacute; bắt chi tiết kh&aacute; tốt trong điều kiện thiếu s&aacute;ng. C&aacute;c h&igrave;nh ảnh chụp đ&ecirc;m c&oacute; thể hơi s&aacute;ng hơn so với b&igrave;nh thường. Đối với ảnh ch&acirc;n dung, m&aacute;y x&oacute;a ph&ocirc;ng ph&iacute;a sau kh&aacute; ổn. Ngo&agrave;i ra, camera selfie 32MP ở mặt trước cho m&agrave;u ảnh kh&aacute; nịnh mắt v&agrave; chi tiết ảnh tốt. Bạn cũng c&oacute; thể sử dụng hệ thống camera tr&ecirc;n Vivo V20 SE để ghi lại những đoạn video lưu giữ khoảnh khắc.&nbsp;&nbsp;</p>

<p>Hiệu năng ổn định với chip Snapdragon 665</p>

<p><img src="https://lh3.googleusercontent.com/xbRxfwWcP1iLVHK32Qu_Wt-EZkwSHVHv27WYt0B0Nm29tCTjDzjVHMsgjIRQ3A1EZHy0apLZomPxNx6DdEMnmmlfbs64efjfhB1KfSJjXb3aBDQjSVjKu-x9gOdNvIOPJftF0vc" style="height:351px; width:624px" /></p>

<p>Chiếc Vivo V20 SE ch&iacute;nh h&atilde;ng được nh&agrave; sản xuất trang bị con chip Snapdragon 665. Trong đ&oacute; bao gồm 4 nh&acirc;n tốc độ 2.0 GHz &amp; 4 nh&acirc;n tốc độ 1.8 GHz v&agrave; đồ họa Adreno 610. Với con chip n&agrave;y, điện thoại c&oacute; thể đ&aacute;p ứng c&aacute;c t&aacute;c vụ h&agrave;ng ng&agrave;y như lướt web, đọc v&agrave; nhắn tin, xem c&aacute;c trang mua sắm,&hellip; Với t&aacute;c vụ chơi game, tốc độ khung h&igrave;nh 60 FPS c&oacute; thể hiện thị c&aacute;c chi tiết nh&acirc;n vật v&agrave; hiệu ứng của m&aacute;y rất mượt m&agrave;. Vivo V20 SE ch&iacute;nh h&atilde;ng đi k&egrave;m với RAM 8GB v&agrave; bộ nhớ trong 128 GB. M&aacute;y sở hữu vi&ecirc;n pin 4100mAh v&agrave; sạc nhanh c&ocirc;ng suất 33W. Bạn ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m Vivo V20 SE sẽ đ&aacute;p ứng nhu cầu sử dụng li&ecirc;n tục trong ng&agrave;y d&agrave;i m&agrave; kh&ocirc;ng bị gi&aacute;n đoạn.&nbsp;</p>

<p>Sản phẩm đang được b&aacute;n tr&ecirc;n hệ thống của Ho&agrave;ng H&agrave; Mobile với mức gi&aacute; ưu đ&atilde;i v&agrave; chế độ bảo h&agrave;nh ch&iacute;nh h&atilde;ng 12 th&aacute;ng. Tham khảo th&ecirc;m th&ocirc;ng tin sản phẩm tại link: https://hoanghamobile.com/dien-thoai-di-dong/vivo-v20-se-chinh-hang</p>
', N'10476', N'35313')
INSERT [dbo].[Sanphamcanmua] ([ID], [MaSP], [Soluong], [Ngayketthuc], [Ngaydang], [Mota], [SanPham_Id], [NhaCungCap_Id]) VALUES (2036, N'13840', 43, CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2021-05-10T00:00:00.000' AS DateTime), N'<h1>fffff</h1>
', N'13840', N'35313')
INSERT [dbo].[Sanphamcanmua] ([ID], [MaSP], [Soluong], [Ngayketthuc], [Ngaydang], [Mota], [SanPham_Id], [NhaCungCap_Id]) VALUES (2037, N'16406', NULL, CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-11T00:00:00.000' AS DateTime), N'<h2>Mua Xiaomi Redmi Note 10 Pro 6GB/128GB ch&iacute;nh h&atilde;ng DGW gi&aacute; tốt nhất tại Tiến Dũng</h2>

<p>Thương hiệu Xiaomi của Trung Quốc từ trước đến nay vốn nổi tiếng l&agrave; h&atilde;ng điện thoại c&oacute; cấu h&igrave;nh khủng nhưng gi&aacute; th&agrave;nh lại rất b&igrave;nh d&acirc;n n&ecirc;n được nhiều người ưa chuộng. Trong số đ&oacute;, sản phẩm Redmi Note 10 Pro 6GB/128GB vừa ra mắt thị trường mới đ&acirc;y tự tin c&oacute; thể&nbsp;đ&aacute;p ứng ho&agrave;n hảo đủ mọi y&ecirc;u cầu về hiệu năng, lại c&oacute; mức gi&aacute; v&ocirc; c&ugrave;ng &ldquo;hợp t&uacute;i tiền&rdquo; m&agrave; tất cả MiFan kh&ocirc;ng n&ecirc;n bỏ lỡ.</p>

<h3>Thiết kế hiện đại, m&agrave;u sắc bắt mắt</h3>

<p>Sản phẩm Redmi Note 10 Pro được gia c&ocirc;ng từ khung kim loại nguy&ecirc;n khối, c&oacute; độ mỏng khoảng 8,1mm v&agrave; nặng 193g n&ecirc;n khi cầm nắm tr&ecirc;n tay kh&aacute; chắc chắn lại vẫn to&aacute;t l&ecirc;n sự sang trọng, thanh lịch.</p>

<p>M&agrave;n h&igrave;nh c&oacute; k&iacute;ch thước cực lớn, l&ecirc;n tới&nbsp;6.67 inch, kết hợp c&ugrave;ng&nbsp;camera selfie đục lỗ đặt ch&iacute;nh giữa v&agrave;&nbsp;mặt k&iacute;nh cong 3D gi&uacute;p cảm gi&aacute;c độ hiển thị tr&agrave;n viền lớn hơn cực đ&atilde; mắt.</p>

<p>C&ocirc;ng nghệ trang bị tr&ecirc;n m&agrave;n h&igrave;nh của Redmi Note 10 Pro l&agrave; tấm nền&nbsp;AMOLED c&oacute;&nbsp;độ ph&acirc;n giải Full HD+ (1080 x 2400 Pixels),&nbsp;hỗ trợ tần số qu&eacute;t 120Hz c&ugrave;ng tốc độ phản hồi cảm ứng 240Hz đem lại độ hiển thị sắc n&eacute;t, sống động.</p>

<p><img src="https://lh5.googleusercontent.com/oZyVed1-rKjfXbnMvifpSTG7Us81Ivd7G5XhF57kbFlEptNup-MJ3JWf_Y_itf_aIYgfGoNoH-ma38z69lI90U2_lh18-nWv7qH4NL5XD9bJVwgYKZz1cNk6UQrxM8PBfLgN_Ws" style="height:624px; width:624px" /></p>

<p>&nbsp;</p>

<p>Phần k&iacute;nh được l&agrave;m từ chất liệu k&iacute;nh cường lực Corning Gorilla Glass 5 gi&uacute;p chống trầy xước, hạn chế tối đa va đập cho người d&ugrave;ng trong qu&aacute; tr&igrave;nh sử dụng.&nbsp;Ngo&agrave;i ra, phần cạnh viền của chiếc Redmi Note 10 c&ograve;n l&agrave; cảm biến v&acirc;n tay si&ecirc;u nhạy, chỉ cần chạm nhẹ 1 lần l&agrave; c&oacute; thể mở kho&aacute; ngay lập tức.&nbsp;</p>

<p>Hiện đối với d&ograve;ng Redmi Note 10 Pro, h&atilde;ng Xiaomi cho ra mắt tổng cộng 3 phi&ecirc;n bản m&agrave;u m&aacute;y kh&aacute;c nhau để kh&aacute;ch h&agrave;ng chọn lựa gồm: &nbsp;X&aacute;m m&atilde; n&atilde;o (Onyx Gray), Xanh băng (Glacier Blue) v&agrave; Đồng Gradient (Gradient Bronze).</p>

<h3>Bộ tứ camera ho&agrave;n hảo trong mọi bối cảnh</h3>

<p>Điểm nổi bật nhất của sản phẩm Redmi Note 10 Pro ch&iacute;nh l&agrave; phần camera.&nbsp; Lần n&agrave;y, Xiaomi đ&atilde; tập trung trang bị cụm 4 camera xịn x&ograve; nhất cho sản phẩm mới của m&igrave;nh. Bao gồm: Camera ch&iacute;nh sử dụng cảm biến Samsung ISOCELL HM2 108MP c&oacute; khả năng pixel binning gộp 9 pixel th&agrave;nh 1, tạo ra c&aacute;c bức ảnh 12MP r&otilde; n&eacute;t hơn; 1 camera si&ecirc;u rộng 8MP; 1 camera tele-macro 5MP c&ugrave;ng 1 cảm biến độ s&acirc;u 2MP. C&ograve;n ở ph&iacute;a mặt trước, Redmi Note Pro 10 cũng sở hữu camera selffie 16MP, c&oacute; hỗ trợ l&agrave;m đẹp.</p>

<p><img src="https://lh4.googleusercontent.com/uQsC2_reNgp_f1DOxl45OoJwhqPsnoG7GHw0CpXf8yEh2wzJmgR6DYpNru8z56mMmw9I0MaHAZQ1DyCQfYXXB8bM6icomgMPI0u4sDgKVtHfnOTjA7ZDrtXYgAAy28-zG1CRd_0" style="height:312px; width:624px" /></p>

<p>&nbsp;</p>

<p>C&oacute; thể n&oacute;i, bộ tứ ho&agrave;n hảo n&agrave;y sẽ phối hợp với nhau v&ocirc; c&ugrave;ng ăn &yacute; gi&uacute;p người d&ugrave;ng thoải m&aacute;i t&aacute;c nghiệp trong trong mọi bối cảnh m&agrave; vẫn y&ecirc;n t&acirc;m cho ra những bức h&igrave;nh đẹp.&nbsp;</p>

<p>Th&ecirc;m một điểm cộng m&agrave; d&ograve;ng Redmi Note 10 Pro sở hữu ch&iacute;nh l&agrave; chế độ chụp ảnh v&agrave;o ban đ&ecirc;m. Ngay cả khi bạn đang ở trong điều kiện thiếu s&aacute;n. đừng lo v&igrave; chiếc smartphone n&agrave;y vẫn sẽ l&agrave;m tốt nhiệm vụ của m&igrave;nh, cho ra m&agrave;u ảnh c&oacute; &aacute;nh s&aacute;ng vừa đủ chứ kh&ocirc;ng hề tối om đ&acirc;u nh&eacute;.</p>

<h3>Hiệu năng mạnh mẽ, chơi game mượt m&agrave;</h3>

<p>Redmi Note 10 Pro sử dụng chip Snapdragon 732G 8 nh&acirc;n của Qualcom đem lại hiệu năng khủng v&agrave; khả năng xử l&yacute; tuyệt vời, mượt m&agrave; cho m&aacute;y. Với chipset n&agrave;y, c&aacute;c game thủ ho&agrave;n to&agrave;n c&oacute; thể thoải m&aacute;u chơi những tựa game online đ&ograve;i hỏi chất lượng cao c&ugrave;ng đồ họa sắc n&eacute;t như Li&ecirc;n Qu&acirc;n hay PUBG Mobile tr&ecirc;n ch&iacute;nh chiếc điện thoại th&acirc;n y&ecirc;u.</p>

<p>Với chiếc điện thoại th&ocirc;ng ming Redmi Note 10 Pro phi&ecirc;n bản 6GB RAM cũng sẽ gi&uacute;p người d&ugrave;ng đa nhiệm mượt m&agrave; m&agrave; kh&ocirc;ng lo giật lag.</p>

<p>Pin tr&acirc;u, hỗ trợ sạc nhanh thần tốc&nbsp;</p>

<p>Đối với thiết bị n&agrave;y, Xiaomi trang bị cho n&oacute; vi&ecirc;n pin Li-on với dung lượng 5020 mAh, gi&uacute;p bạn thoải m&aacute;i sử dụng để giải tr&iacute; hay l&agrave;m việc suốt nhiều giờ li&ecirc;n tiếp với năng suất cao. Ngay cả khi chơi game cũng kh&ocirc;ng ti&ecirc;u hao đ&aacute;ng kể thời lượng pin của m&aacute;y.</p>

<p><img src="https://lh3.googleusercontent.com/cv1eAHcjRD2Ot6nJDxIIWZbHfoxctT_MDNZoAvgoIs8YgoHg8glEyfSpXk0miwgRUYo7Vp-l8eSAAzKg-za9BZSGoJRdrP16LrXZQoZbwIuHcvrTuE7MmDS2dEom_YXypR3EYio" style="height:355px; width:533px" /></p>

<p>Điểm nổi bật hơn cả ch&iacute;nh l&agrave; m&aacute;y c&oacute; chế độ sạc nhanh v&agrave; cung cấp sẵn củ sạc si&ecirc;u tốc 33W trong hộp phụ kiện đi k&egrave;m. Bởi vậy, với chiếc Redmi Note 10 Pro, việc hết pin c&oacute; lẽ kh&ocirc;ng c&ograve;n l&agrave; nỗi lo &acirc;u của ch&uacute;ng ta mỗi khi đi ra ngo&agrave;i nữa.</p>

<p>N&oacute;i t&oacute;m lại, với tất cả những ưu điểm v&agrave; t&iacute;nh năng vượ trội như vậy lại sở hữu mức gi&aacute; cựchấp dẫn tại Ho&agrave;ng H&agrave; Mobile th&igrave; Xiaomi Redmi Note 10 Pro ch&iacute;nh l&agrave; gợi &yacute; thực sự đ&aacute;ng mua hiện nay.</p>
', N'16406', N'81113')
INSERT [dbo].[Sanphamcanmua] ([ID], [MaSP], [Soluong], [Ngayketthuc], [Ngaydang], [Mota], [SanPham_Id], [NhaCungCap_Id]) VALUES (2047, N'20152', NULL, CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime), N'<h1>Mua điện thoại Vivo Y12s 2021 ch&iacute;nh h&atilde;ng, gi&aacute; tốt tại Tiến Dũng</h1>

<p>Vivo Y12s l&agrave; chiếc smartphone c&oacute; thiết kế bắt mắt, cấu h&igrave;nh đ&aacute;p ứng tốt nhu cầu sử dụng cơ bản. Sản phẩm n&agrave;y hứa hẹn sẽ mang tới trải nghiệm th&uacute; vị cho người d&ugrave;ng.</p>

<h3>Thiết kế m&agrave;n h&igrave;nh giọt nước, k&iacute;ch thước 6.51 inch</h3>

<p>Vivo Y12s sở hữu thiết kế mặt lưng bắt mắt với hiệu ứng chuyển m&agrave;u gradient hiện đại. C&oacute; hai m&agrave;u xanh &aacute;nh băng v&agrave; đen huyền b&iacute; cho bạn chọn lựa. C&aacute;c g&oacute;c m&aacute;y đều được bo tr&ograve;n nhẹ nh&agrave;ng gi&uacute;p thoải m&aacute;i cầm tr&ecirc;n tay. Tr&ecirc;n th&acirc;n m&aacute;y c&ograve;n c&oacute; cảm biến v&acirc;n tay t&iacute;ch hợp với n&uacute;t nguồn cho ph&eacute;p mở kh&oacute;a nhanh ch&oacute;ng.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/04/08/111.jpg" style="height:312.903px; width:556.272px" /></p>

<p>M&agrave;n h&igrave;nh giọt nước tr&agrave;n viền kết hợp c&ugrave;ng mặt k&iacute;nh cong 2.5D sẽ mang đến trải nghiệm tuyệt vời khi chơi game, xem phim... Tấm nền IPS LCD, độ ph&acirc;n giải HD+ v&agrave; k&iacute;ch thước 6.51 inch cũng gi&uacute;p bạn trải nghiệm h&igrave;nh ảnh g&oacute;c rộng sống động hơn.</p>

<p>Vivo Y12s c&ograve;n c&oacute; khả năng t&aacute;i tạo m&agrave;u sống động v&agrave; cho ph&eacute;p sử dụng m&aacute;y trong mọi điều kiện &aacute;nh s&aacute;ng. Đặc biệt, bạn cũng kh&ocirc;ng phải lo mỏi mắt khi xem điện thoại trong thời gian d&agrave;i bởi đ&atilde; c&oacute; t&iacute;nh năng lọc &aacute;nh s&aacute;ng xanh.</p>

<h3>Camera AI th&ocirc;ng minh, hỗ trợ selfie g&oacute;c rộng</h3>

<p>Vivo Y12s được trang bị camera k&eacute;p với camera ch&iacute;nh độ ph&acirc;n giải 12MP khẩu độ f/2.2 v&agrave; camera phụ độ ph&acirc;n giải 2MP khẩu độ f/2.4. Bộ đ&ocirc;i camera n&agrave;y c&oacute; thuật to&aacute;n x&oacute;a ph&ocirc;ng mới nhất gi&uacute;p l&agrave;m mở hậu cảnh một c&aacute;ch tinh tế. Nhờ đ&oacute;, bạn sẽ sở hữu những bức ảnh ch&acirc;n dung chuy&ecirc;n nghiệp, c&oacute; chiều s&acirc;u hơn. B&ecirc;n cạnh đ&oacute;, m&aacute;y c&ograve;n c&oacute; c&aacute;c t&iacute;nh năng như l&agrave;m đẹp, x&oacute;a ph&ocirc;ng, lấy n&eacute;t tự động... Đặc biệt, nếu th&iacute;ch bạn c&oacute; thể quay video chất lượng 1080p @ 30 fps.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/04/08/222.jpg" style="height:378.788px; width:569.748px" /></p>

<p>Ph&iacute;a trước l&agrave; camera selfie 8MP khẩu độ f/1.8. Camera n&agrave;y mang đến chất lượng ảnh sắc n&eacute;t, tự động lấy n&eacute;t v&agrave; hộ trợ l&agrave;m đẹp bằng AI Beautify. B&ecirc;n cạnh đ&oacute;, bạn c&oacute; thể chụp ảnh g&oacute;c rộng v&agrave; quay video 1080p tương tự như camera sau. H&atilde;y thoải sức s&aacute;ng tạo v&agrave; lưu giữ những h&igrave;nh ảnh &yacute; nghĩa. Đặc biệt, Vivo Y12s c&ograve;n c&oacute; c&ocirc;ng nghệ nhận diện khu&ocirc;n mặt th&ocirc;ng minh để mở kh&oacute;a nhanh ch&oacute;ng.</p>

<h3>Hiệu năng ổn định, xứng đ&aacute;ng với mức gi&aacute;</h3>

<p>Vivo Y12s được trang bị chip tầm trung MediaTek Helio P35 8 nh&acirc;n mang đến khả năng xử l&yacute; t&aacute;c vụ mượt m&agrave;. M&aacute;y c&ograve;n c&oacute; RAM 3GB, bộ nhớ trong 32GB cho ph&eacute;p giải tr&iacute; thoải m&aacute;i với nhiều ứng dụng kh&aacute;c nhau, chơi game kh&ocirc;ng lo bị giật. Thiết bị n&agrave;y hỗ trợ tới 3 khe cắm thẻ nhớ gi&uacute;p mở rộng bộ nhớ l&ecirc;n đến 256GB. Nhờ đ&oacute;, bạn c&oacute; thể dễ d&agrave;ng lưu trữ h&igrave;nh ảnh, video, b&agrave;i h&aacute;t m&agrave; kh&ocirc;ng lo đầy dung lượng.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/04/08/333.jpg" style="height:337.312px; width:599.667px" /></p>

<p>&nbsp;</p>

<p>Vivo Y12s chạy tr&ecirc;n hệ điều h&agrave;nh Android 10 ti&ecirc;n tiến của Google. Đi k&egrave;m với đ&oacute; l&agrave; c&ocirc;ng nghệ Multi-Turbo 3.0 với khả năng tối ưu h&oacute;a t&agrave;i nguy&ecirc;n hệ thống, giảm giật lag khi chơi game. Đặc biệt, m&aacute;y c&ograve;n c&oacute; chế độ Ultra-Game Mode, Rung 4D 2.0 gi&uacute;p ngăn cửa số bật l&ecirc;n, chặn th&ocirc;ng b&aacute;o, cuộc gọi cho ph&eacute;p bạn ch&igrave;m đắm ho&agrave;n to&agrave;n v&agrave;o những tr&ograve; chơi th&uacute; vị.</p>

<h3>Dung lượng pin khủng 5000 mAh</h3>

<p>Vivo đ&atilde; trang bị cho Y12s vi&ecirc;n pin chuẩn Li-Po với dung lượng l&ecirc;n tới 5000 mAh. Ch&iacute;nh v&igrave; vậy, bạn c&oacute; thể thoải m&aacute;i sử dụng đến tận 2 ng&agrave;y m&agrave; kh&ocirc;ng lo hết pin. Đặc biệt, c&ocirc;ng nghệ tiết kiệm năng lượng th&ocirc;ng minh tr&ecirc;n chiếc điện thoại n&agrave;y c&ograve;n cho ph&eacute;p bạn xem phim HD trong 16,3 giờ v&agrave; chơi game trong 8,9 giờ li&ecirc;n tục.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/04/08/444.png" style="height:308.912px; width:598.667px" /></p>

<p>Từ thiết kế cho đến cấu h&igrave;nh v&agrave; dung lượng pin, Vivo Y12s đều được đ&aacute;nh gi&aacute; l&agrave; ổn trong ph&acirc;n kh&uacute;c điện thoại tầm trung. Nếu bạn muốn sở hữu sản phẩm ch&iacute;nh h&atilde;ng, gi&aacute; tốt th&igrave; h&atilde;y đến ngay Ho&agrave;ng H&agrave; Mobile.</p>
', N'20152', N'35313')
INSERT [dbo].[Sanphamcanmua] ([ID], [MaSP], [Soluong], [Ngayketthuc], [Ngaydang], [Mota], [SanPham_Id], [NhaCungCap_Id]) VALUES (2039, N'21134', NULL, CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-11T00:00:00.000' AS DateTime), N'<h2>Mua Galaxy S21+ ch&iacute;nh h&atilde;ng gi&aacute; tốt tại Tiến Dũng</h2>

<p>&nbsp;</p>

<p>Mở đầu cuộc chơi flagship năm 2021, Samsung đ&atilde; giới thiệu chiếc Galaxy S21+ b&ecirc;n cạnh Galaxy S21 v&agrave; S21 Ultra. Đ&acirc;y l&agrave; một trong những chiếc m&aacute;y cao cấp nhất của Samsung hiện tại với đầu tư xứng đ&aacute;ng về cả phần cứng lẫn phần mềm.</p>

<h3>Kết nối 5G ho&agrave;n to&agrave;n mới</h3>

<p>&nbsp;</p>

<p>Năm 2021, Samsung đ&atilde; đem đến Việt Nam những chiếc điện thoại Galaxy S đầu ti&ecirc;n hỗ trợ 5G. Galaxy S21+ sử dụng hai chuẩn 5G được triển khai tại Việt Nam l&agrave; sub-6 v&agrave; mmWave. Những si&ecirc;u phẩm mới nh&agrave; Samsung hứa hẹn đem lại cho người d&ugrave;ng tốc độ sử dụng internet si&ecirc;u nhanh với c&aacute;c băng tần 5G. Đ&acirc;y l&agrave; nền tảng quan trọng cho những gi&acirc;y ph&uacute;t giải tr&iacute; tuyệt vời của bạn. Với 5G, bạn sẽ xem được những video 4K một c&aacute;ch trơn tru, hoặc chiến game trực tuyến đồ hoạ khủng mượt m&agrave; hơn.</p>

<p>Người d&ugrave;ng c&oacute; thể sử dụng 2 SIM vật l&yacute; hoặc eSIM tr&ecirc;n chiếc điện thoại n&agrave;y để ph&ugrave; hợp với c&ocirc;ng việc cũng như nhu cầu li&ecirc;n lạc của m&igrave;nh.</p>

<h3>Thiết kế ho&agrave;n to&agrave;n mới. Nhiều m&agrave;u sắc trẻ trung</h3>

<p>&nbsp;</p>

<p>Galaxy S21+ được giới thiệu với ngoại h&igrave;nh chứa đầy c&aacute;i nh&igrave;n thẩm mĩ của Samsung trong một sản phẩm flagship. Người d&ugrave;ng vẫn sẽ t&igrave;m thấy những điểm quen thuộc trong thiết kế của Samsung như hai mặt k&iacute;nh cường lực, khung viền kim loạ s&aacute;ng b&oacute;ng v&agrave; m&agrave;n h&igrave;nh Infinity-O. Tuy vậy, h&atilde;ng đ&atilde; l&agrave;m mới lại thiết kế của m&igrave;nh khi kh&eacute;o l&eacute;o đặt cụm camera v&agrave;o một miếng kim loại, ho&agrave; v&agrave;o phần viền của m&aacute;y. Th&ecirc;m v&agrave;o đ&oacute;, phong c&aacute;ch dual tone tạo n&ecirc;n vẻ ngo&agrave;i hấp dẫn ngay từ lần đầu nh&igrave;n thấy. Kh&aacute;ch h&agrave;ng c&oacute; thể tuỳ chọn ba phi&ecirc;n bản m&agrave;u cho chiếc Galaxy S21+ của m&igrave;nh, bao gồm đen nguy&ecirc;n bản, bạc ngẫu hứng v&agrave; t&iacute;m đam m&ecirc;. Giống như những đời si&ecirc;u phẩm trước, Galaxy S21+ cũng c&oacute; khả năng kh&aacute;ng nước v&agrave; bụi bẩn IP68.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-plus-1.jpg" style="height:249.037px; width:442.733px" /></p>

<p>&nbsp;</p>

<p>Galaxy S21+ chắc chắn sẽ l&agrave; một trong những smartphone c&oacute; m&agrave;n h&igrave;nh đ&atilde; mất trong thời điểm đầu năm 2021. Chiếc smartphone n&agrave;y sở hữu m&agrave;n h&igrave;nh Dynamic AMOLED 2X k&iacute;ch thước 6,7 inch tương tự thiết bị tiền nhiệm, độ ph&acirc;n giải 1080x2400. M&agrave;n h&igrave;nh n&agrave;y sở hữu dải m&agrave;u rộng DCI-P3, hỗ trợ chuẩn HDR10+, cho m&agrave;u sắc rực rỡ, sắc n&eacute;t từng chi tiết. Kh&ocirc;ng chỉ vậy, người d&ugrave;ng sẽ được trải nghiệm tần số qu&eacute;t 120Hz tr&ecirc;n tấm nền n&agrave;y, gi&uacute;p mọi thao t&aacute;c vuốt v&agrave; c&aacute;c pha h&agrave;nh động trở n&ecirc;n mượt m&agrave; hơn bao giờ hết.</p>

<h3>Camera đồng h&agrave;nh c&ugrave;ng bạn tr&ecirc;n mọi nẻo đường</h3>

<p>&nbsp;</p>

<p>Cụm camera được trang bị tr&ecirc;n Galaxy S21+ cũng c&oacute; phần cứng mạnh mẽ v&agrave; phần mềm được tối ưu ho&aacute; cực tốt. Samsung đ&atilde; trang bị cho thiết bị của m&igrave;nh ba camera ở mặt sau: camera ti&ecirc;u chuẩn 12MP, khẩu độ f/1.8, k&iacute;ch thước điểm ảnh lớn 1.8&mu;m; camera zoom 64MP, khẩu độ f/2.0 v&agrave; camera g&oacute;c si&ecirc;u rộng 12MP, ti&ecirc;u cự 13mm, khẩu độ f/2.2. Với độ ph&acirc;n giải lớn v&agrave; thuật to&aacute;n chụp ảnh được thiết kế ri&ecirc;ng, bạn c&oacute; thể zoom l&ecirc;n tới 30x tr&ecirc;n chiếc m&aacute;y n&agrave;y, đưa những khung cảnh ở xa lại gần lại tầm nh&igrave;n của bạn với độ chi tiết tối ưu. M&aacute;y cũng c&oacute; camera 10MP ở ph&iacute;a trước gi&uacute;p người d&ugrave;ng chụp ảnh selfie v&agrave; gọi video cực đ&atilde;.</p>

<p>&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-plus-2.jpg" style="height:261.128px; width:464.227px" /></p>

<p>&nbsp;</p>

<p>Samsung c&ograve;n đưa l&ecirc;n Galaxy S21+ h&agrave;ng loạt t&iacute;nh năng quay phim chụp h&igrave;nh hữu &iacute;ch. Đầu ti&ecirc;n, người d&ugrave;ng sẽ lập tức ấn tượng khi đ&acirc;y l&agrave; chiếc điện thoại hiếm hoi tr&ecirc;n thị trường sở hữu khả năng quay video 8K cực sắc n&eacute;t. H&igrave;nh ảnh tr&iacute;ch xuất từ video n&agrave;y c&oacute; độ ph&acirc;n giải l&ecirc;n tới 33MP. M&aacute;y cũng c&oacute; thể quay video 4K ở 60fps mượt m&agrave;. Để hỗ trợ người d&ugrave;ng quay phim tốt hơn, Samsung trang bị cả chống rung quang học cho ống k&iacute;nh v&agrave; t&iacute;nh năng quay phim si&ecirc;u chống rung, giup thước phim của bạn chuyển động mượt m&agrave; ngay cả khi di chuyển nhanh.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-plus-3.jpg" style="height:264.787px; width:470.733px" /></p>

<p>&nbsp;</p>

<p>Galaxy S21+ cũng nổi bật với t&iacute;nh năng chụp ảnh ch&acirc;n dung với c&aacute;c bộ lọc m&agrave;u chuy&ecirc;n nghiệp, đưa bạn v&agrave;o studio s&aacute;ng tạo bất tận. Bạn cũng sẽ tự tin chụp ảnh v&agrave;o buổi tối hay những địa điểm c&oacute; &aacute;nh s&aacute;ng phức tạp nhờ chế độ si&ecirc;u chụp đ&ecirc;m, đem lại độ s&aacute;ng v&agrave; chi tiết cho bức ảnh thiếu s&aacute;ng của bạn.</p>

<h3>Hiệu suất vượt trội. Thời lượng pin k&eacute;o d&agrave;i cả ng&agrave;y</h3>

<p>&nbsp;</p>

<p>Năm nay, Samsung đ&atilde; mang vi xử l&yacute; Exynos 2100 l&ecirc;n flagship của m&igrave;nh. Đ&acirc;y l&agrave; một con chip 8 nh&acirc;n với tốc độ tối đa l&ecirc;n tới 2,9GHz, đem lại tốc độ tối ưu trong mọi t&aacute;c vụ sử dụng. Galaxy S21+ sẽ gi&uacute;p bạn thực hiện được mọi t&aacute;c vụ một c&aacute;ch nhanh ch&oacute;ng, từ việc lướt web h&agrave;ng ng&agrave;y, cho tới chơi game đồ hoạ khủng v&agrave; xử l&yacute; video độ ph&acirc;n giải cao. Th&ecirc;m v&agrave;o đ&oacute;, dung lượng RAM 8GB sẽ gi&uacute;p bạn xử l&yacute; c&ocirc;ng việc đa nhiệm ho&agrave;n to&agrave;n trơn tru. Người d&ugrave;ng c&oacute; thể thoải m&aacute;i lưu trữ c&aacute;c tệp media v&agrave; th&ocirc;ng tin quan trọng trong bộ nhớ 128GB của m&aacute;y.</p>

<p>&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-plus-4.jpg" style="height:271.491px; width:482.652px" /></p>

<p>&nbsp;</p>

<p>Galaxy S21+ sở hữu vi&ecirc;n pin 4800mAh, đủ để cung cấp cho bạn một ng&agrave;y sử dụng với những t&aacute;c vụ hỗn hợp nặng. Samsung trang bị cho chiếc smartphone n&agrave;y h&agrave;ng loạt t&iacute;nh năng sạc đỉnh cao như sạc si&ecirc;u nhanh 25W v&agrave; sạc nhanh kh&ocirc;ng d&acirc;y 2.0, gi&uacute;p bạn nhanh ch&oacute;ng nối lại trải nghiệm dang dở của m&igrave;nh khi hết pin. T&iacute;nh năng Power Share gi&uacute;p bạn chia sẻ pin cho những phụ kiện hỗ trợ sạc kh&ocirc;ng d&acirc;y như chiếc tai nghe Galaxy Buds Pro v&agrave; AirPods.</p>

<h3>Tạm kết</h3>

<p>&nbsp;</p>

<p>Galaxy S21+ kh&ocirc;ng chỉ l&agrave; một chiếc điện thoại sang trọng, m&agrave; c&ograve;n l&agrave; một thiết bị mạnh mẽ, đem lại cho người d&ugrave;ng những gi&acirc;y ph&uacute;t l&agrave;m việc v&agrave; giải tr&iacute; cực đ&atilde;. Nếu bạn cần t&igrave;m một flagship Android đ&aacute;p ứng mọi nhu cầu sử dụng của m&igrave;nh th&igrave; đ&acirc;y l&agrave; một sự lựa chọn kh&ocirc;ng thể hợp l&yacute; hơn.</p>

<p>Hiện tại Galaxy S21+ được b&aacute;n ch&iacute;nh h&atilde;ng tại hệ thống Ho&agrave;ng H&agrave; với h&agrave;ng loạt ưu đ&atilde;i cực hấp dẫn. Sản phẩm được bảo h&agrave;nh 12 th&aacute;ng tại c&aacute;c trung t&acirc;m uỷ quyền của Samsung tr&ecirc;n to&agrave;n quốc. Bạn c&oacute; thể tới ngay chi nh&aacute;nh Ho&agrave;ng H&agrave; Mobile gần nhất hoặc đặt h&agrave;ng tr&ecirc;n website tiendung.com để sở hữu chiếc m&aacute;y n&agrave;y nh&eacute;!</p>

<p>&nbsp;</p>
', N'21134', N'35313')
INSERT [dbo].[Sanphamcanmua] ([ID], [MaSP], [Soluong], [Ngayketthuc], [Ngaydang], [Mota], [SanPham_Id], [NhaCungCap_Id]) VALUES (2043, N'26674', NULL, CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-11T00:00:00.000' AS DateTime), N'<h2>Mua điện thoại Oppo A93 - 8GB/128GB gi&aacute; rẻ ch&iacute;nh h&atilde;ng tại Tiến Dũng</h2>

<p>&nbsp;</p>

<p>OPPO l&agrave; thương hiệu sản xuất smartphone đến từ Trung Quốc. Những năm gần đ&acirc;y, OPPO li&ecirc;n tục khẳng định c&aacute;c bước ph&aacute;t triển nhanh ch&oacute;ng v&agrave; mức độ phổ biến tại thị trường Việt Nam. Đ&acirc;y cũng l&agrave; tiền đề để thương hiệu từng bước chạm đến ph&acirc;n kh&uacute;c cao cấp hơn trong tương lai. Hiện tại, những điện thoại tầm trung của OPPO được rất nhiều người d&ugrave;ng tin tưởng v&agrave; lựa chọn. Trong đ&oacute;, chiếc OPPO A93 ch&iacute;nh h&atilde;ng c&oacute; nhiều điểm độc đ&aacute;o v&agrave; kh&aacute;c biệt. Nếu bạn đang t&igrave;m kiếm một chiếc smartphone ở gi&aacute; tầm trung th&igrave; đừng bỏ qua sản phẩm n&agrave;y nh&eacute;.&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/26/a93-1.jpg" style="height:249.047px; width:442.75px" /></p>

<h3>Thiết kế sang trọng với m&agrave;n h&igrave;nh sắc n&eacute;t</h3>

<p>&nbsp;</p>

<p>Cũng như những chiếc smartphone kh&aacute;c của nh&agrave; OPPO, chiếc OPPO A93 8GB/128GB ch&iacute;nh h&atilde;ng được ho&agrave;n thiện thiết kế tối đa. Tổng thể m&aacute;y l&agrave; thiết kế nguy&ecirc;n khối sang trọng. Mặt sau của m&aacute;y được phủ một lớp sơn nh&aacute;m gi&uacute;p m&aacute;y bớt b&aacute;m bụi v&agrave; v&acirc;n tay khi cầm. Đồng thời, n&oacute; cũng tạo cảm gi&aacute;c chắc chắn hơn. Chiếc OPPO A93 ch&iacute;nh h&atilde;ng c&oacute; trọng lượng khoảng 164g v&agrave; độ d&agrave;y chỉ 7.48 mm n&ecirc;n c&oacute; thể cầm thoải m&aacute;i khi sử dụng li&ecirc;n tục.&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/26/a93-2.jpg" style="height:254.078px; width:451.694px" /></p>

<p>Mặt trước của điện thoại OPPO A93 ch&iacute;nh h&atilde;ng l&agrave; m&agrave;n h&igrave;nh AMOLED 6.43 inch với độ ph&acirc;n giải Full HD+ (1080 x 2400 Pixels), đem lại chất lượng hiển thị h&igrave;nh ảnh sắc n&eacute;t v&agrave; độ tương phản cao. M&agrave;n h&igrave;nh n&agrave;y cũng đem đến trải nghiệm m&agrave;u sắc ch&acirc;n thực, đặc biệt l&agrave; khi xem c&aacute;c bộ phim bạn y&ecirc;u th&iacute;ch. Điểm trừ duy nhất l&agrave; phần viền m&agrave;n h&igrave;nh tr&ecirc;n OPPO A93 vẫn c&ograve;n hơi d&agrave;y. Nh&igrave;n chung, với một mức gi&aacute; như vậy, thiết kế chiếc OPPO A93 ch&iacute;nh h&atilde;ng vẫn nổi bật hơn so với c&aacute;c đối thủ kh&aacute;c trong c&ugrave;ng ph&acirc;n kh&uacute;c gi&aacute; n&agrave;y.&nbsp;</p>

<h3>Hiệu năng mạnh mẽ, chiến game cực đ&atilde;</h3>

<p>&nbsp;</p>

<p>Kh&ocirc;ng chỉ ho&agrave;n thiện về thiết kế, chiếc OPPO A93 8GB/128GB ch&iacute;nh h&atilde;ng c&ograve;n được n&acirc;ng cấp hiệu năng đ&aacute;ng kể. Nh&agrave; sản xuất đ&atilde; trang bị cho chiếc smartphone n&agrave;y con chip Mediatek Helio P95, đi k&egrave;m với RAM 8GB v&agrave; bộ nhớ trong 128GB. Điện thoại đạt 399 điểm l&otilde;i đơn v&agrave; 1.509 điểm đa l&otilde;i. Tuy chỉ l&agrave; con chip tầm trung nhưng n&oacute; vẫn đ&aacute;p ứng được nhu cầu chơi game đồ họa cao như PUBG Mobile, Li&ecirc;n qu&acirc;n Mobile, Call of Duty Mobile,&hellip;&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/26/a93-3.jpg" style="height:266.799px; width:463.75px" /></p>

<p>B&ecirc;n cạnh hiệu năng mạnh mẽ, trong qu&aacute; tr&igrave;nh chơi game m&aacute;y vẫn gặp t&igrave;nh trạng n&oacute;ng l&ecirc;n nhưng kh&ocirc;ng đ&aacute;ng kể. Tuy nhi&ecirc;n, v&igrave; m&aacute;y được ho&agrave;n thiện từ chất liệu nhựa, việc tản nhiệt cũng rất nhanh v&agrave; kh&ocirc;ng l&agrave;m ảnh hưởng đến trải nghiệm hay c&aacute;c phần kh&aacute;c của điện thoại. OPPO A93 ch&iacute;nh h&atilde;ng c&oacute; thời lượng pin 4000mAh với sử dụng 7 tiếng li&ecirc;n tục. Điện thoại cũng đi k&egrave;m với sạc nhanh 18W, bạn chỉ cần chờ khoảng 1 tiếng 45 ph&uacute;t để sạc đầy vi&ecirc;n pin n&agrave;y. N&oacute;i t&oacute;m lại, chiếc OPPO A93 8GB/128GB c&oacute; thể đ&aacute;p ứng được nhu cầu chơi một số game đồ họa v&agrave; c&aacute;c t&aacute;c vụ cơ bản của người d&ugrave;ng hiện nay.&nbsp;</p>

<h3>Hiệu năng chụp ảnh ấn tượng, vượt trội&nbsp;</h3>

<p>&nbsp;</p>

<p>Mặc d&ugrave; chỉ l&agrave; một chiếc smartphone nằm trong ph&acirc;n kh&uacute;c tầm trung nhưng hiệu năng chụp ảnh của chiếc OPPO A93 8GB/128GB ch&iacute;nh h&atilde;ng cũng rất ấn tượng. Mặt sau của điện thoại l&agrave; m&ocirc; đun vu&ocirc;ng trong đ&oacute; chứa cụm bốn camera. Bao gồm camera ch&iacute;nh 48MP khẩu độ f/1.7, camera g&oacute;c rộng c&oacute; độ ph&acirc;n giải 8 MP với khẩu độ f/2.2, camera Mono v&agrave; camera ch&acirc;n dung độ ph&acirc;n giải 2 MP, khẩu độ f/2.4. Hệ thống camera n&agrave;y mang đến những bức ảnh cực chi tiết. Đồng thời, n&oacute; cũng bắt được khoảnh khắc nhanh rất tốt.&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/26/a93-4.jpg" style="height:298.595px; width:448.172px" /></p>

<p>B&ecirc;n cạnh đ&oacute;, camera selfie của chiếc OPPO A93 8GB/128GB ch&iacute;nh h&atilde;ng cũng đem đến những bức ảnh rất nịnh mắt. Đ&acirc;y cũng l&agrave; điểm nổi bật về hiệu năng chụp ảnh của điện thoại OPPO so với c&aacute;c smartphone kh&aacute;c trong ph&acirc;n kh&uacute;c. Cuối c&ugrave;ng, chiếc smartphone n&agrave;y c&oacute; thể đ&aacute;p ứng được hầu hết nhu cầu sử dụng cơ bản của người d&ugrave;ng trong tầm gi&aacute;. Sản phẩm đang được b&aacute;n tr&ecirc;n hệ thống của Ho&agrave;ng H&agrave; Mobile với mức gi&aacute; ưu đ&atilde;i v&agrave; chế độ bảo h&agrave;nh ch&iacute;nh h&atilde;ng 12 th&aacute;ng. Tham khảo th&ecirc;m th&ocirc;ng tin v&agrave; đặt mua sản phẩm tại link: https://hoanghamobile.com/dien-thoai-di-dong/oppo-a93-8gb-128gb-chinh-hang</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', N'26674', N'35313')
INSERT [dbo].[Sanphamcanmua] ([ID], [MaSP], [Soluong], [Ngayketthuc], [Ngaydang], [Mota], [SanPham_Id], [NhaCungCap_Id]) VALUES (2040, N'28525', NULL, CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-11T00:00:00.000' AS DateTime), N'<h3>Mua điện thoại Samsung Galaxy S21 Ultra 5G gi&aacute; rẻ ch&iacute;nh h&atilde;ng tại Tiến Dũng</h3>

<p>Samsung l&agrave; một trong những nh&agrave; sản xuất dẫn đầu tr&ecirc;n thị trường điện thoại th&ocirc;ng minh nhiều năm qua. Sau th&agrave;nh c&ocirc;ng của d&ograve;ng Galaxy S20 series, Samsung đ&atilde; trở lại v&agrave; tiếp tục khẳng định vị thế cho d&ograve;ng flagship cao cấp của m&igrave;nh. D&ograve;ng Galaxy S21 series đ&aacute;nh dấu bước nhảy vọt với những c&ocirc;ng nghệ ti&ecirc;n tiến nhất hiện nay. Đ&aacute;ng ch&uacute; &yacute;, Galaxy S21 Ultra 5G l&agrave; phi&ecirc;n bản đầu ti&ecirc;n v&agrave; duy nhất trong d&ograve;ng sản phẩm năm nay được t&iacute;ch hợp c&ugrave;ng b&uacute;t S Pen. &ldquo;T&acirc;n binh khủng long&rdquo; n&agrave;y hứa hẹn sẽ dẫn đầu xu hướng v&agrave; tạo ra những trải nghiệm đẳng cấp, kh&aacute;c biệt cho người d&ugrave;ng.</p>

<p>&nbsp;</p>

<p><img src="file:///C:/Users/ADMINI~1/AppData/Local/Temp/msohtmlclip1/01/clip_image001.jpg" /></p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-ultra.jpg" style="height:301.822px; width:452.733px" /></p>

<h3>Thiết kế nguy&ecirc;n bản camera liền cạnh đẳng cấp</h3>

<p>Điện thoại Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng dẫn đầu cho xu hướng thiết kế mới, kh&aacute;c biệt ho&agrave;n to&agrave;n so với những smartphone hiện nay. Cụm camera nguy&ecirc;n khối được gắn liền với cạnh v&agrave; khung kim loại của m&aacute;y, mang lại cảm gi&aacute;c nam t&iacute;nh hơn v&agrave; v&ocirc; c&ugrave;ng tinh xảo. Điện thoại c&ograve;n được trang bị một lớp k&iacute;nh Corning&reg; Gorilla&reg; Glass Victus bền bỉ nhất hiện nay.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-ultra-2.jpg" style="height:273.962px; width:461.733px" /></p>

<p>&nbsp;</p>

<p><img src="file:///C:/Users/ADMINI~1/AppData/Local/Temp/msohtmlclip1/01/clip_image002.jpg" /></p>

<p>Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng sở hữu m&agrave;n h&igrave;nh AMOLED 2X 6.8 inch với tần số qu&eacute;t từ 10Hz - 120Hz mượt m&agrave;. Nhờ đ&oacute;, điện thoại c&oacute; thể mang đến trải nghiệm h&igrave;nh ảnh sống động, sắc n&eacute;t đến từng chi tiết nhưng vẫn tiết kiệm thời lượng pin đ&aacute;ng kể. Galaxy S21 Ultra 5G cung cấp h&igrave;nh ảnh s&aacute;ng hơn 25%, tối đa 1.500nits so với thế hệ cũ. C&ugrave;ng với tỷ lệ tương phản cải thiện 50% cho hiển thị r&otilde; n&eacute;t bất chấp mọi điều kiện. Nh&agrave; sản xuất cũng bổ sung t&iacute;nh năng Eye Comfort Shield hạn chế tối đa t&igrave;nh trạng mỏi mắt khi sử dụng li&ecirc;n tục. M&agrave;n h&igrave;nh của Galaxy S21 Ultra 5G tự tin đem đến cho người d&ugrave;ng trải nghiệm đa t&aacute;c vụ từ học tập, l&agrave;m việc đến giải tr&iacute; kh&ocirc;ng giới hạn.</p>

<h3>C&ocirc;ng nghệ camera vượt trội nhất từ Samsung</h3>

<p>Kh&ocirc;ng chỉ c&oacute; thiết kế b&ecirc;n ngo&agrave;i đẳng cấp, chiếc Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng c&ograve;n sở hữu hệ thống camera ti&ecirc;n tiến nhất hiện nay. M&ocirc;-đun camera h&igrave;nh chữ nhật chứa bốn cảm biến với một ống k&iacute;nh ch&iacute;nh 108MP. Ngo&agrave;i ra c&ograve;n c&oacute; một camera g&oacute;c si&ecirc;u rộng 12MP, camera tele si&ecirc;u rộng 10MP v&agrave; camera tele k&eacute;p 10MP. Hệ thống camera n&agrave;y hỗ trợ chụp ảnh HDR 12 bit với m&agrave;u sắc phong ph&uacute; hơn 64 lần v&agrave; dải động rộng hơn ba lần.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-ultra-3.jpg" style="height:232.969px; width:465.938px" /></p>

<p><img src="file:///C:/Users/ADMINI~1/AppData/Local/Temp/msohtmlclip1/01/clip_image003.jpg" /></p>

<p>B&ecirc;n cạnh đ&oacute;, Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng c&ograve;n hỗ trợ thu ph&oacute;ng chuẩn kh&ocirc;ng gian 100X, một ống k&iacute;nh zoom quang học 3X v&agrave; một ống k&iacute;nh zoom quang học 10X. Bạn thậm ch&iacute; c&oacute; thể tạo ra những thước phim chuy&ecirc;n nghiệp với t&iacute;nh năng quay video 4K ở tốc độ 60 khung h&igrave;nh/gi&acirc;y. Cảm biến chụp đ&ecirc;m đ&atilde; được cải tiến để giảm nhiễu v&agrave; bắt được nhiều &aacute;nh s&aacute;ng hơn. C&ocirc;ng nghệ Nona-binning 12MP được kết hợp mang đến những bức ảnh sắc n&eacute;t với chất lượng tuyệt vời. Ngo&agrave;i ra, n&oacute; c&ograve;n c&oacute; một camera selfie 40MP để ho&agrave;n thiện trải nghiệm chụp h&igrave;nh cho người d&ugrave;ng.</p>

<h3>Kết nối cực nhanh, tương th&iacute;ch cực đỉnh với S Pen</h3>

<p>Samsung Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng l&agrave; phi&ecirc;n bản duy nhất trong 3 biến thể tương th&iacute;ch với b&uacute;t S Pen ti&ecirc;u chuẩn. N&oacute; c&oacute; thể hỗ trợ c&aacute;c trải nghiệm từ vẽ, ghi ch&uacute;, chỉnh sửa h&igrave;nh ảnh đến chụp ảnh selfie chỉ với thao t&aacute;c cực đơn giản. Nhờ c&ocirc;ng nghệ từ Wacom, người d&ugrave;ng c&oacute; thể trải nghiệm b&uacute;t S Pen y&ecirc;u th&iacute;ch ngay tr&ecirc;n chiếc Galaxy S21 Ultra n&agrave;y. Kh&aacute;c với Galaxy Note, chiếc Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng kh&ocirc;ng c&oacute; khe cắm ri&ecirc;ng cho b&uacute;t S Pen. Thay v&agrave;o đ&oacute; bạn c&oacute; thể mua đựng chiếc b&uacute;t S Pen trong một cover b&aacute;n c&ugrave;ng m&aacute;y v&agrave; lấy ra sử dụng rất dễ d&agrave;ng.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-ultra-4.jpg" style="height:267.091px; width:475.356px" /></p>

<p>&nbsp;</p>

<p><img src="file:///C:/Users/ADMINI~1/AppData/Local/Temp/msohtmlclip1/01/clip_image004.jpg" /></p>

<p>Những năm qua, Samsung vẫn đang nỗ lực nghi&ecirc;n cứu để ph&aacute;t triển tốc độ kết nối tr&ecirc;n những chiếc smartphone của m&igrave;nh. Samsung Galaxy S21 Ultra 5G tự h&agrave;o l&agrave; một trong những điện thoại th&ocirc;ng minh đầu ti&ecirc;n hỗ trợ Wi-Fi 6E. Nhờ được cung cấp nhiều băng th&ocirc;ng hơn, kết nối Internet tr&ecirc;n chiếc smartphone n&agrave;y nhanh hơn gấp 4 lần, người d&ugrave;ng c&oacute; thể chia sẻ c&aacute;c nội dung chỉ trong nh&aacute;y mắt. So với d&ograve;ng Galaxy S20 series, kết nối mạng 5G tr&ecirc;n Galaxy S21 Ultra 5G đ&atilde; được cải thiện đ&aacute;ng kể. N&oacute; đ&atilde; giảm độ trễ kết nối xuống mức thấp nhất, cho người d&ugrave;ng trải nghiệm trực tuyến mượt m&agrave; hơn. Điện thoại Galaxy S21 Ultra 5G được trang bị con chip Exynos 2100 5nm mạnh mẽ v&agrave; tiết kiệm năng lượng hơn. N&oacute; cũng đi k&egrave;m với vi&ecirc;n pin 5000mAh c&oacute; thể sạc đầy 50% chỉ trong 30 ph&uacute;t.</p>

<p>Điện thoại Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng c&oacute; sẵn hai t&ugrave;y chọn m&agrave;u đen v&agrave; bạc. Kh&aacute;ch h&agrave;ng đặt mua tại Ho&agrave;ng H&agrave; Mobile sẽ nhận được mức gi&aacute; tốt nhất c&ugrave;ng nhiều ưu đ&atilde;i đặc biệt v&agrave; chế độ bảo h&agrave;nh 12 th&aacute;ng ch&iacute;nh h&atilde;ng. Tham khảo th&ecirc;m th&ocirc;ng tin sản phẩm tại đ&acirc;y: https://hoanghamobile.com/dat-hang/galaxy-s21-plus-s21-ultra</p>
', N'28525', N'81113')
INSERT [dbo].[Sanphamcanmua] ([ID], [MaSP], [Soluong], [Ngayketthuc], [Ngaydang], [Mota], [SanPham_Id], [NhaCungCap_Id]) VALUES (2038, N'32665', NULL, CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-11T00:00:00.000' AS DateTime), N'<h3>Mua điện thoại Samsung Galaxy S21 Ultra 5G gi&aacute; rẻ ch&iacute;nh h&atilde;ng tại Tiến Dũng</h3>

<p>Samsung l&agrave; một trong những nh&agrave; sản xuất dẫn đầu tr&ecirc;n thị trường điện thoại th&ocirc;ng minh nhiều năm qua. Sau th&agrave;nh c&ocirc;ng của d&ograve;ng Galaxy S20 series, Samsung đ&atilde; trở lại v&agrave; tiếp tục khẳng định vị thế cho d&ograve;ng flagship cao cấp của m&igrave;nh. D&ograve;ng Galaxy S21 series đ&aacute;nh dấu bước nhảy vọt với những c&ocirc;ng nghệ ti&ecirc;n tiến nhất hiện nay. Đ&aacute;ng ch&uacute; &yacute;, Galaxy S21 Ultra 5G l&agrave; phi&ecirc;n bản đầu ti&ecirc;n v&agrave; duy nhất trong d&ograve;ng sản phẩm năm nay được t&iacute;ch hợp c&ugrave;ng b&uacute;t S Pen. &ldquo;T&acirc;n binh khủng long&rdquo; n&agrave;y hứa hẹn sẽ dẫn đầu xu hướng v&agrave; tạo ra những trải nghiệm đẳng cấp, kh&aacute;c biệt cho người d&ugrave;ng.</p>

<p>&nbsp;</p>

<p><img src="file:///C:/Users/ADMINI~1/AppData/Local/Temp/msohtmlclip1/01/clip_image001.jpg" /></p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-ultra.jpg" style="height:301.822px; width:452.733px" /></p>

<h3>Thiết kế nguy&ecirc;n bản camera liền cạnh đẳng cấp</h3>

<p>Điện thoại Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng dẫn đầu cho xu hướng thiết kế mới, kh&aacute;c biệt ho&agrave;n to&agrave;n so với những smartphone hiện nay. Cụm camera nguy&ecirc;n khối được gắn liền với cạnh v&agrave; khung kim loại của m&aacute;y, mang lại cảm gi&aacute;c nam t&iacute;nh hơn v&agrave; v&ocirc; c&ugrave;ng tinh xảo. Điện thoại c&ograve;n được trang bị một lớp k&iacute;nh Corning&reg; Gorilla&reg; Glass Victus bền bỉ nhất hiện nay.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-ultra-2.jpg" style="height:273.962px; width:461.733px" /></p>

<p>&nbsp;</p>

<p><img src="file:///C:/Users/ADMINI~1/AppData/Local/Temp/msohtmlclip1/01/clip_image002.jpg" /></p>

<p>Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng sở hữu m&agrave;n h&igrave;nh AMOLED 2X 6.8 inch với tần số qu&eacute;t từ 10Hz - 120Hz mượt m&agrave;. Nhờ đ&oacute;, điện thoại c&oacute; thể mang đến trải nghiệm h&igrave;nh ảnh sống động, sắc n&eacute;t đến từng chi tiết nhưng vẫn tiết kiệm thời lượng pin đ&aacute;ng kể. Galaxy S21 Ultra 5G cung cấp h&igrave;nh ảnh s&aacute;ng hơn 25%, tối đa 1.500nits so với thế hệ cũ. C&ugrave;ng với tỷ lệ tương phản cải thiện 50% cho hiển thị r&otilde; n&eacute;t bất chấp mọi điều kiện. Nh&agrave; sản xuất cũng bổ sung t&iacute;nh năng Eye Comfort Shield hạn chế tối đa t&igrave;nh trạng mỏi mắt khi sử dụng li&ecirc;n tục. M&agrave;n h&igrave;nh của Galaxy S21 Ultra 5G tự tin đem đến cho người d&ugrave;ng trải nghiệm đa t&aacute;c vụ từ học tập, l&agrave;m việc đến giải tr&iacute; kh&ocirc;ng giới hạn.</p>

<h3>C&ocirc;ng nghệ camera vượt trội nhất từ Samsung</h3>

<p>Kh&ocirc;ng chỉ c&oacute; thiết kế b&ecirc;n ngo&agrave;i đẳng cấp, chiếc Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng c&ograve;n sở hữu hệ thống camera ti&ecirc;n tiến nhất hiện nay. M&ocirc;-đun camera h&igrave;nh chữ nhật chứa bốn cảm biến với một ống k&iacute;nh ch&iacute;nh 108MP. Ngo&agrave;i ra c&ograve;n c&oacute; một camera g&oacute;c si&ecirc;u rộng 12MP, camera tele si&ecirc;u rộng 10MP v&agrave; camera tele k&eacute;p 10MP. Hệ thống camera n&agrave;y hỗ trợ chụp ảnh HDR 12 bit với m&agrave;u sắc phong ph&uacute; hơn 64 lần v&agrave; dải động rộng hơn ba lần.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-ultra-3.jpg" style="height:232.969px; width:465.938px" /></p>

<p><img src="file:///C:/Users/ADMINI~1/AppData/Local/Temp/msohtmlclip1/01/clip_image003.jpg" /></p>

<p>B&ecirc;n cạnh đ&oacute;, Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng c&ograve;n hỗ trợ thu ph&oacute;ng chuẩn kh&ocirc;ng gian 100X, một ống k&iacute;nh zoom quang học 3X v&agrave; một ống k&iacute;nh zoom quang học 10X. Bạn thậm ch&iacute; c&oacute; thể tạo ra những thước phim chuy&ecirc;n nghiệp với t&iacute;nh năng quay video 4K ở tốc độ 60 khung h&igrave;nh/gi&acirc;y. Cảm biến chụp đ&ecirc;m đ&atilde; được cải tiến để giảm nhiễu v&agrave; bắt được nhiều &aacute;nh s&aacute;ng hơn. C&ocirc;ng nghệ Nona-binning 12MP được kết hợp mang đến những bức ảnh sắc n&eacute;t với chất lượng tuyệt vời. Ngo&agrave;i ra, n&oacute; c&ograve;n c&oacute; một camera selfie 40MP để ho&agrave;n thiện trải nghiệm chụp h&igrave;nh cho người d&ugrave;ng.</p>

<h3>Kết nối cực nhanh, tương th&iacute;ch cực đỉnh với S Pen</h3>

<p>Samsung Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng l&agrave; phi&ecirc;n bản duy nhất trong 3 biến thể tương th&iacute;ch với b&uacute;t S Pen ti&ecirc;u chuẩn. N&oacute; c&oacute; thể hỗ trợ c&aacute;c trải nghiệm từ vẽ, ghi ch&uacute;, chỉnh sửa h&igrave;nh ảnh đến chụp ảnh selfie chỉ với thao t&aacute;c cực đơn giản. Nhờ c&ocirc;ng nghệ từ Wacom, người d&ugrave;ng c&oacute; thể trải nghiệm b&uacute;t S Pen y&ecirc;u th&iacute;ch ngay tr&ecirc;n chiếc Galaxy S21 Ultra n&agrave;y. Kh&aacute;c với Galaxy Note, chiếc Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng kh&ocirc;ng c&oacute; khe cắm ri&ecirc;ng cho b&uacute;t S Pen. Thay v&agrave;o đ&oacute; bạn c&oacute; thể mua đựng chiếc b&uacute;t S Pen trong một cover b&aacute;n c&ugrave;ng m&aacute;y v&agrave; lấy ra sử dụng rất dễ d&agrave;ng.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-ultra-4.jpg" style="height:267.091px; width:475.356px" /></p>

<p>&nbsp;</p>

<p><img src="file:///C:/Users/ADMINI~1/AppData/Local/Temp/msohtmlclip1/01/clip_image004.jpg" /></p>

<p>Những năm qua, Samsung vẫn đang nỗ lực nghi&ecirc;n cứu để ph&aacute;t triển tốc độ kết nối tr&ecirc;n những chiếc smartphone của m&igrave;nh. Samsung Galaxy S21 Ultra 5G tự h&agrave;o l&agrave; một trong những điện thoại th&ocirc;ng minh đầu ti&ecirc;n hỗ trợ Wi-Fi 6E. Nhờ được cung cấp nhiều băng th&ocirc;ng hơn, kết nối Internet tr&ecirc;n chiếc smartphone n&agrave;y nhanh hơn gấp 4 lần, người d&ugrave;ng c&oacute; thể chia sẻ c&aacute;c nội dung chỉ trong nh&aacute;y mắt. So với d&ograve;ng Galaxy S20 series, kết nối mạng 5G tr&ecirc;n Galaxy S21 Ultra 5G đ&atilde; được cải thiện đ&aacute;ng kể. N&oacute; đ&atilde; giảm độ trễ kết nối xuống mức thấp nhất, cho người d&ugrave;ng trải nghiệm trực tuyến mượt m&agrave; hơn. Điện thoại Galaxy S21 Ultra 5G được trang bị con chip Exynos 2100 5nm mạnh mẽ v&agrave; tiết kiệm năng lượng hơn. N&oacute; cũng đi k&egrave;m với vi&ecirc;n pin 5000mAh c&oacute; thể sạc đầy 50% chỉ trong 30 ph&uacute;t.</p>

<p>Điện thoại Galaxy S21 Ultra 5G ch&iacute;nh h&atilde;ng c&oacute; sẵn hai t&ugrave;y chọn m&agrave;u đen v&agrave; bạc. Kh&aacute;ch h&agrave;ng đặt mua tại Ho&agrave;ng H&agrave; Mobile sẽ nhận được mức gi&aacute; tốt nhất c&ugrave;ng nhiều ưu đ&atilde;i đặc biệt v&agrave; chế độ bảo h&agrave;nh 12 th&aacute;ng ch&iacute;nh h&atilde;ng. Tham khảo th&ecirc;m th&ocirc;ng tin sản phẩm tại đ&acirc;y: https://hoanghamobile.com/dat-hang/galaxy-s21-plus-s21-ultra</p>
', N'32665', N'35313')
INSERT [dbo].[Sanphamcanmua] ([ID], [MaSP], [Soluong], [Ngayketthuc], [Ngaydang], [Mota], [SanPham_Id], [NhaCungCap_Id]) VALUES (2042, N'38131', NULL, CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-11T00:00:00.000' AS DateTime), N'<h2>Mua điện thoại Oppo Find X2 ch&iacute;nh h&atilde;ng, gi&aacute; rẻ tại&nbsp;<a href="https://hoanghamobile.com/">T</a>iến Dũng</h2>

<p><em>Sau một thời gian vắng b&oacute;ng khỏi ph&acirc;n kh&uacute;c cao cấp, đầu năm 2020, Oppo đ&atilde; trở lại với chiếc flagship Oppo Find X2. Đ&acirc;y hứa hẹn l&agrave; một sản phẩm tiềm năng của Oppo với th&ocirc;ng số phần cứng si&ecirc;u khủng.</em></p>

<h3>Thiết kế</h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2020/03/13/oppo--dien-thoai-di-dong-oppo-find-x2-chinh-hang-1.png" /></p>

<p>Giống như những c&aacute;c smartphone đầu bảng trong thời gian trở lại đ&acirc;y, Oppo vẫn trung th&agrave;nh với thiết kế hai mặt k&iacute;nh v&agrave; khung viền kim loại. Oppo Find X2 cũng kh&ocirc;ng phải ngoại lệ khi được ho&agrave;n thiện với k&iacute;nh cường Gorilla Glass thế hệ thứ 6 v&agrave; viền bằng nh&ocirc;m. Đặc biệt, cả mặt trước v&agrave; mặt sau của chiếc điện thoại n&agrave;y được bo cong sang hai b&ecirc;n, mang lại cảm gi&aacute;c vuốt mượt m&agrave; hơn v&agrave; cầm nắm kh&ocirc;ng bị cấn.</p>

<p>Oppo cũng chơi lớn khi sản xuất th&ecirc;m phi&ecirc;n bản mặt sau bằng gốm ceramic (tuỳ v&agrave;o m&agrave;u sắc), đ&acirc;y l&agrave; đột ph&aacute; rất lớn của h&atilde;ng điện thoại n&agrave;y, kh&aacute;c hẳn với con đường m&agrave; c&aacute;c nh&agrave; sản xuất kh&aacute;c vẫn đang đi.</p>

<p>Mặt trước của Oppo Find X2 l&agrave; m&agrave;n h&igrave;nh k&iacute;ch thước 6.7-inch gần như tr&agrave;n viền. Ở g&oacute;c b&ecirc;n tr&aacute;i, m&agrave;n h&igrave;nh được &ldquo;đục&rdquo; một lỗ nhỏ cho camera trước của m&aacute;y. Thiết kế n&agrave;y Oppo tận dụng tối đa kh&ocirc;ng gian m&agrave;n h&igrave;nh, đạt được tỉ lệ 90.9% so với k&iacute;ch thước tổng thể.</p>

<p>Mặt lưng của Oppo Find X2 phi&ecirc;n bản m&agrave;u xanh kh&ocirc;ng chỉ l&agrave; một m&agrave;u trơn. Oppo đ&atilde; tạo ra hiệu ứng m&agrave;u gradient tr&ecirc;n mặt lưng n&agrave;y, khiến người d&ugrave;ng kh&ocirc;ng cảm thấy nh&agrave;m ch&aacute;n. Mặt k&iacute;nh n&agrave;y cũng c&oacute; những đường lượn s&oacute;ng, gi&uacute;p l&agrave;m giảm khả năng b&aacute;m dấu v&acirc;n tay. M&aacute;y cũng c&oacute; phi&ecirc;n bản m&agrave;u đen cổ điển nữa, nhưng chắc chắn sẽ kh&ocirc;ng lộng lẫy bằng m&agrave;u xanh đại dương n&agrave;y.</p>

<p>Oppo Find X2 cũng được trang bị khả năng chống nước, gi&uacute;p m&aacute;y kh&ocirc;ng bị ảnh hưởng nếu bạn l&agrave;m đổ nước hay gặp phải cơn mưa bất chợt.</p>

<h3>M&agrave;n h&igrave;nh</h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2020/03/13/oppo--dien-thoai-di-dong-oppo-find-x2-chinh-hang-2.png" /></p>

<p>M&agrave;n h&igrave;nh l&agrave; một trong những điểm s&aacute;ng của Oppo Find X2. Ngo&agrave;i tấm nền AMOLED độ ph&acirc;n giải 2K dường như trở th&agrave;nh ti&ecirc;u chuẩn flagship, Oppo mạnh tay mang c&ocirc;ng nghệ 120Hz l&ecirc;n chiếc m&aacute;y n&agrave;y. Điều n&agrave;y c&oacute; nghĩa l&agrave; m&agrave;n h&igrave;nh của m&aacute;y được l&agrave;m tươi 120 lần/gi&acirc;y. Do đ&oacute;, m&agrave;n h&igrave;nh của m&aacute;y cho cảm gi&aacute;c si&ecirc;u mượt m&agrave;. M&aacute;y hỗ trợ ti&ecirc;u chuẩn HDR10, độ phủ m&agrave;u DCI-P3 l&ecirc;n tới 100%. C&ocirc;ng nghệ n&agrave;y sẽ ph&aacute;t huy t&aacute;c dụng khi người d&ugrave;ng xem những bộ phim HDR tr&ecirc;n m&agrave;n h&igrave;nh n&agrave;y. Độ s&aacute;ng của tấm nền n&agrave;y cũng l&ecirc;n tới 800nit, do đ&oacute; việc sử dụng ngo&agrave;i trời kh&ocirc;ng phải một trở ngại với Oppo Find X2.</p>

<h3>Cấu h&igrave;nh v&agrave; phần mềm</h3>

<p>Giống như những chiếc flagship kh&aacute;c, Oppo Find X2 mang tr&ecirc;n m&igrave;nh cấu h&igrave;nh mạnh nhất v&agrave;o thời điểm đầu năm 2020 n&agrave;y. M&aacute;y được trang bị SoC Snapdragon 865 8 nh&acirc;n, chạy tr&ecirc;n tiến tr&igrave;nh 7nm v&agrave; đồ hoạ Adreno 650. B&ecirc;n cạnh đ&oacute; l&agrave; RAM l&ecirc;n tới 12GB v&agrave; 256GB bộ nhớ trong. Với cấu h&igrave;nh, Oppo Find X2 dễ d&agrave;ng lọt v&agrave;o top c&aacute;c smartphone khoẻ nhất trong năm nay. Sẽ hiếm c&oacute; game n&agrave;o gay kh&oacute; khăn được cho thiết bị của Oppo.</p>

<p>Find X2 chạy tr&ecirc;n Android 10 với giao diện ColorOS 7.1 mới nhất của Oppo.</p>

<h3>Camera</h3>

<p>Khả năng quay phim chụp ảnh l&agrave; điểm đ&aacute;ng tiền nhất tr&ecirc;n chiếc Oppo Find X2. V&agrave; nếu c&aacute;c bạn chưa biết th&igrave; Oppo Find X2 | X2 Pro đang l&agrave; bộ đ&ocirc;i điện thoại c&oacute;&nbsp;<strong>điểm DXOMARK cao nhất</strong>&nbsp;tr&ecirc;n thị trường.</p>

<p>Camera ch&iacute;nh của m&aacute;y c&oacute; độ ph&acirc;n giải 48MP, sử dụng cảm biến Sony IMX 586, khẩu độ&nbsp;<em>f</em>/1.7. Đ&acirc;y l&agrave; một chiếc camera rất tốt. Khả năng gộp 4 điểm ảnh l&agrave;m 1 gi&uacute;p m&aacute;y thu s&aacute;ng vượt trội hơn, cho ra những bức ảnh 12MP c&oacute; chất lượng si&ecirc;u tốt. B&ecirc;n cạnh đ&oacute; l&agrave; camera zoom 13MP v&agrave; camera g&oacute;c rộng 12MP. Phần cứng n&agrave;y đem lại cho Oppo Find X2 khả năng zoom chất lượng cao l&ecirc;n tới 20X. Phần mềm của m&aacute;y c&ograve;n hỗ trợ khả năng si&ecirc;u chống rung, gi&uacute;p đem lại những video mượt m&agrave; ngay cả khi bạn đang chạy. M&aacute;y cũng c&oacute; thể chụp macro với khoảng c&aacute;ch si&ecirc;u gần chỉ 3cm.</p>

<p>Oppo cũng đ&atilde; mang nhiều t&iacute;nh năng quay video rất tốt l&ecirc;n chiếc m&aacute;y n&agrave;y. Oppo Find X2 c&oacute; thể quay video với độ ph&acirc;n giải tối đa 4K ở 60 khung h&igrave;nh/gi&acirc;y. Th&ecirc;m vao đ&oacute; l&agrave; quay video HDR 10-bit, gi&uacute;p lưu lại nhiều th&ocirc;ng tin, cho ra những thước phim c&oacute; chất lượng rất cao.</p>

<p>Camera trước của m&aacute;y c&oacute; độ ph&acirc;n giải 32MP c&oacute; t&iacute;ch hợp tr&iacute; tuệ nh&acirc;n tạo. Chất lượng của camera n&agrave;y c&oacute; lẽ kh&ocirc;ng cần phải b&agrave;n luận nhiều v&igrave; Oppo đ&atilde; l&agrave;m rất tốt tr&ecirc;n c&aacute;c đời m&aacute;y cũ của m&igrave;nh.</p>

<h3>Pin v&agrave; sạc</h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2020/03/13/oppo--dien-thoai-di-dong-oppo-find-x2-chinh-hang-3.png" /></p>

<p>Oppo Find X2 sở hữu vi&ecirc;n pin dung lượng 4200mAh. Đ&acirc;y l&agrave; một dung lượng pin kh&aacute; lớn tr&ecirc;n thị trường smartphone hiện nay. Chiếc smartphone n&agrave;y ho&agrave;n to&agrave;n c&oacute; thể trụ được một ng&agrave;y d&agrave;i với cường độ sử dụng cao.</p>

<p>Giống như truyền thống của m&igrave;nh, Oppo rất tập trung v&agrave;o khả năng sạc của Find X2. Thiết bị n&agrave;y sử dụng c&ocirc;ng nghệ sạc nhanh SuperVOOC với c&ocirc;ng suất l&ecirc;n tới 65W. Đ&acirc;y l&agrave; một con số lớn nhất tr&ecirc;n thị trường. Bạn c&oacute; thể sạc đầy Find X2 chỉ với 38 ph&uacute;t &ndash; một tốc độ nhanh tới ch&oacute;ng mặt.</p>

<h3>Tạm kết</h3>

<p>C&oacute; thể thấy, Oppo Find X2 xứng đ&aacute;ng l&agrave; một chiếc flagship đầu bảng hiện nay. Chiếc smartphone n&agrave;y kh&ocirc;ng chỉ tốt gỗ m&agrave; c&ograve;n tốt cả nước sơn. Bạn chắc chắn sẽ kh&ocirc;ng cảm thấy thất vọng khi trải nghiệm si&ecirc;u phẩm n&agrave;y.</p>

<p>Hiện tại, Oppo Find X2 sắp sửa được đưa l&ecirc;n kệ tại Ho&agrave;ng H&agrave; Mobile. Ho&agrave;ng H&agrave; lu&ocirc;n tự h&agrave;o l&agrave; chuỗi b&aacute;n lẻ chuy&ecirc;n ph&acirc;n phối c&aacute;c sản phẩm di dộng ch&iacute;nh h&atilde;ng với mức gi&aacute; tốt nhất thị trường. H&atilde;y theo d&otilde;i website hoanghamobile.com để cập nhật th&ocirc;ng tin mới nhất về c&aacute;c sản phẩm điện thoại v&agrave; khuyến mại cực khủng nha!</p>

<p>&nbsp;</p>
', N'38131', N'35313')
INSERT [dbo].[Sanphamcanmua] ([ID], [MaSP], [Soluong], [Ngayketthuc], [Ngaydang], [Mota], [SanPham_Id], [NhaCungCap_Id]) VALUES (2051, N'50705', NULL, CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime), N'<h2>Mua điện thoại Vsmart Active 3 6GB/64GB ch&iacute;nh h&atilde;ng, gi&aacute; rẻ tại Tiến Dũng&nbsp;Mobile</h2>

<p>Vsmart l&agrave; điện thoại th&ocirc;ng minh thuộc ph&acirc;n kh&uacute;c gi&aacute; rẻ được sản xuất bởi tập đo&agrave;n Vingroup. Mới đ&acirc;y, Vsmart Active 3 đ&atilde; ra mắt với nhiều t&iacute;nh năng hiện đại, cấu h&igrave;nh cao hơn thế hệ trước.</p>

<h3><strong>M&agrave;n h&igrave;nh tr&agrave;n viền c&ugrave;ng mặt lưng k&iacute;nh cao cấp</strong></h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2020/01/02/vsmart--dien-thoai-di-dong-vsmart-active-3-6gb-64gb-chinh-hang-1.jpg" /></p>

<p>Vsmart Active 3 sở hữu m&agrave;n h&igrave;nh tr&agrave;n viền với k&iacute;ch thước 6.39 inch. H&atilde;ng đ&atilde; bắt kịp xu hướng hiện nay khi sản xuất ra thiết bị c&oacute; thiết kế m&agrave;n h&igrave;nh ho&agrave;n hảo 100%. Tỉ lệ m&agrave;n h&igrave;nh l&ecirc;n tới 19.5:9 v&agrave; kh&ocirc;ng c&oacute; camera h&igrave;nh giọt nước hay đục lỗ ph&iacute;a trước. Như vậy bạn sẽ thoải m&aacute;i thao t&aacute;c một tay m&agrave; kh&ocirc;ng lo bị giới hạn bởi phần kh&ocirc;ng tr&agrave;n viền. Độ ph&acirc;n Full HD 2340 x 1080 sẽ mang đến h&igrave;nh ảnh hiển thị sắc n&eacute;t.</p>

<p>Mặt lưng c&ograve;n c&oacute; hiệu ứng chuyển m&agrave;u độc đ&aacute;o, đẹp mắt. Thiết kế n&agrave;y c&agrave;ng l&agrave;m tăng th&ecirc;m vẻ sang trọng cho sản phẩm.</p>

<h3><strong>Bộ ba camera sau kết hợp với camera selfie &ldquo;th&ograve; thụt&rdquo;</strong></h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2020/01/02/vsmart--dien-thoai-di-dong-vsmart-active-3-6gb-64gb-chinh-hang-2.jpg" /></p>

<p>Mặc d&ugrave; l&agrave; điện thoại thuộc ph&acirc;n kh&uacute;c gi&aacute; rẻ nhưng Vsmart Active 3 vẫn được trang bị tới ba camera sau. Trong đ&oacute; c&oacute; camera ch&iacute;nh 48 MP f/1.79; camera g&oacute;c si&ecirc;u rộng 118.8 độ 8 MP f/2.2 v&agrave; camera x&oacute;a ph&ocirc;ng chuy&ecirc;n nghiệp 2 MP. Bộ ba camera n&agrave;y chắc chắn sẽ mang đến những bức h&igrave;nh lung linh cho bạn. Đặc biệt khả năng chụp ảnh trong đ&ecirc;m tối của m&aacute;y cũng rất ấn tượng.</p>

<p>Camera selfie của Active 3 được thiết kế kiểu pop-up &ldquo;th&ograve; thụt&rdquo; với độ ph&acirc;n giải l&ecirc;n tới 16 MP. Ngay khi bạn chuyển sang chế độ selfie th&igrave; camera sẽ tự động đưa l&ecirc;n tr&ecirc;n một c&aacute;ch linh hoạt, nhanh ch&oacute;ng. B&ecirc;n cạnh đ&oacute;, Vsmart Active 3 cũng c&oacute; chế độ mở kh&oacute;a bằng v&acirc;n tay cực an to&agrave;n, tiện dụng.</p>

<h3><strong>Vsmart Active 3 sở hữu RAM 6 GB v&agrave; bộ nhớ trong 64 GB</strong></h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2020/01/02/vsmart--dien-thoai-di-dong-vsmart-active-3-6gb-64gb-chinh-hang-3.png" /></p>

<p>B&ecirc;n cạnh phi&ecirc;n bản RAM 4 GB th&igrave; m&aacute;y c&ograve;n c&oacute; cả phi&ecirc;n bản RAM 6 GB. Nhờ vậy người d&ugrave;ng c&oacute; thể xử l&yacute; c&aacute;c t&aacute;c vụ nhanh ch&oacute;ng hơn. Độ đa nhiệm cao cũng gi&uacute;p giải quyết c&ocirc;ng việc tốt hơn, giải tr&iacute; xem phim, lướt web hiệu quả hơn. B&ecirc;n cạnh đ&oacute; m&aacute;y c&ograve;n cho ph&eacute;p bạn chơi những tựa game nặng như Li&ecirc;n qu&acirc;n Mobile, PUBG, game đồ họa 3D...</p>

<p>Vsmart Active 3 c&ograve;n được trang bị bộ nhớ trong l&ecirc;n tới 64 GB. Đối với d&ograve;ng điện thoại gi&aacute; rẻ th&igrave; đ&acirc;y l&agrave; một dung lượng lưu trữ ấn tượng. N&oacute; sẽ gi&uacute;p bạn thoải m&aacute;i lưu giữ h&igrave;nh ảnh, video v&agrave; c&aacute;c dữ liệu quan trọng. Bạn sẽ kh&ocirc;ng c&ograve;n phải lo lắng c&oacute; n&ecirc;n x&oacute;a c&aacute;i n&agrave;y hay bỏ bớt c&aacute;i kia để c&oacute; th&ecirc;m dung lượng trống.</p>

<h3><strong>Hiệu năng ổn định nhờ chạy tr&ecirc;n chip Helio P60 8 nh&acirc;n</strong></h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2020/01/02/vsmart--dien-thoai-di-dong-vsmart-active-3-6gb-64gb-chinh-hang-4.jpg" /></p>

<p>Vsmart đ&atilde; trang bị cho Active 3 con chip Mediatek Helio P60 8 nh&acirc;n 64 bit với tốc độ 2.0 Ghz. N&oacute; sẽ mang đến hiệu năng ổn định c&ugrave;ng trải nghiệm mượt m&agrave; cho bạn. B&ecirc;n cạnh đ&oacute;, m&aacute;y c&ograve;n c&oacute; GPU Mali-G72 MP 3 với khả năng giải quyết nhanh ch&oacute;ng c&aacute;c thao t&aacute;c cơ bản v&agrave; đ&aacute;p ứng c&aacute;c game đồ họa nặng. Nhờ đ&oacute; tạo ra cho bạn những giờ trải nghiệm th&uacute; vị.</p>

<p>M&aacute;y sở hữu vi&ecirc;n pin 4020 mAh đ&aacute;p ứng thời gian sử dụng cả ng&agrave;y d&agrave;i. Bạn sẽ kh&ocirc;ng cần phải lo lắng pin sẽ hết bất chợt. Hơn nữa sạc nhanh đi k&egrave;m cũng sẽ gi&uacute;p sạc đầy pin nhanh ch&oacute;ng, thuận tiện.</p>

<p>Đặt mua Vsmart Active gi&aacute; rẻ, ch&iacute;nh h&atilde;ng tại&nbsp;<a href="https://hoanghamobile.com/">https://tiendungmobile.com/</a>.&nbsp; Kh&aacute;ch h&agrave;ng tham khảo th&ecirc;m những sản phẩm kh&aacute;c của Vsmart qua website&nbsp;<a href="https://hoanghamobile.com/vsmart-c2468.html">https://tiendungmobile.com/</a></p>

<p>&nbsp;</p>
', N'50705', N'81113')
INSERT [dbo].[Sanphamcanmua] ([ID], [MaSP], [Soluong], [Ngayketthuc], [Ngaydang], [Mota], [SanPham_Id], [NhaCungCap_Id]) VALUES (2044, N'62855', NULL, CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime), N'<h2>Mua điện thoại Vivo V20 gi&aacute; rẻ ch&iacute;nh h&atilde;ng tại Ho&agrave;ng H&agrave; Mobile</h2>

<p>L&agrave; một thương hiệu điện thoại chỉ mới xuất hiện tại Việt Nam kh&ocirc;ng l&acirc;u thế nhưng Vivo đ&atilde; tạo được nhiều dấu ấn s&acirc;u đậm trong l&ograve;ng người d&ugrave;ng. Những mẫu điện thoại của h&atilde;ng lu&ocirc;n c&oacute; một vẻ bề ngo&agrave;i b&oacute;ng bẩy, sang trọng đi k&egrave;m với nhiều t&iacute;nh năng thời thượng, ph&ugrave; hợp với xu thế, v&agrave; Vivo V20 &ndash; mẫu smartphone mới nhất của h&atilde;ng cũng kh&ocirc;ng phải l&agrave; một ngoại lệ.</p>

<h3>Thiết kế hiện đại với mặt lưng Gradient đẹp m&ecirc; mẩn</h3>

<p>Vivo V20 được kho&aacute;c b&ecirc;n ngo&agrave;i một &ldquo;bộ c&aacute;nh&rdquo; tuyệt đẹp, theo chuẩn xu hướng smartphone của năm 2020 được nhiều người d&ugrave;ng ưa th&iacute;ch. Phần khung viền của m&aacute;y được ho&agrave;n thiện từ kim loại chắc chắn v&agrave; bền bỉ, mặt trước lẫn mặt sau đều được trang bị một lớp k&iacute;nh cường lực với c&aacute;c g&oacute;c cạnh được bo tr&ograve;n mềm mại. V&agrave; v&igrave; cảm biến v&acirc;n tay đ&atilde; được t&iacute;ch hợp v&agrave;o b&ecirc;n trong m&agrave;n h&igrave;nh thế n&ecirc;n mặt sau của Vivo V20 lại c&agrave;ng tinh tế, nh&atilde; nhặn.</p>

<p>&nbsp;</p>

<p>Mặt lưng của Vivo V20 được thiết kế theo phong c&aacute;ch Gradient, mang tới cho người d&ugrave;ng những hiệu ứng chuyển m&agrave;u cực k&igrave; ảo diệu v&agrave; đẹp mắt với nhiều gam m&agrave;u kh&aacute;c nhau. Lớp k&iacute;nh đặc biệt c&ograve;n được phủ một lớp sơn mờ, vừa tăng t&iacute;nh thẩm mỹ cho m&aacute;y, lại vừa gi&uacute;p cảm gi&aacute;c cầm nắm của người d&ugrave;ng tốt hơn, hạn chế được t&igrave;nh trạng trơn trượt, cực k&igrave; ph&ugrave; hợp với những người tay ra nhiều mồ h&ocirc;i.</p>

<h3>M&agrave;n h&igrave;nh AMOLED Full HD sắc n&eacute;t</h3>

<p>Vivo V20 sở hữu một m&agrave;n h&igrave;nh c&oacute; k&iacute;ch thước 6.44 rộng lớn được thiết kế theo dạng giọt nước quen thuộc, độ ph&acirc;n giải Full HD tr&ecirc;n tấm nền AMOLED chất lượng cao. Với việc được trang bị m&agrave;n h&igrave;nh tấm nền AMOLED, Vivo V20 sẽ c&oacute; được khả năng hiển thị m&agrave;u sắc rực rỡ v&agrave; ch&acirc;n thực nhất c&oacute; thể c&ugrave;ng một g&oacute;c nh&igrave;n rộng. V&agrave; v&igrave; tấm nền của m&aacute;y l&agrave; AMOLED thế n&ecirc;n tất nhi&ecirc;n cảm biến v&acirc;n tay của m&aacute;y sẽ được nh&uacute;ng thẳng xuống dưới m&agrave;n h&igrave;nh.</p>

<p>&nbsp;</p>

<p>Vivo V20 cũng hỗ trợ người d&ugrave;ng 2 SIM 2 s&oacute;ng tiện lợi. Việc sử dụng được 2 SIM 2 s&oacute;ng c&ugrave;ng l&uacute;c sẽ gi&uacute;p cho người d&ugrave;ng c&oacute; thể sử dụng m&aacute;y được thuận tiện hơn m&agrave; kh&ocirc;ng phải sử dụng 2 m&aacute;y điện thoại. T&iacute;nh năng 2 SIM 2 s&oacute;ng sẽ đặc biệt hữu &iacute;ch d&agrave;nh cho những đối tượng người d&ugrave;ng l&agrave;m kinh doanh hoặc những t&agrave;i xế chạy xe &ocirc;m c&ocirc;ng nghệ.</p>

<h3>Camera selfie đẳng cấp, t&acirc;m điểm mọi &aacute;nh nh&igrave;n</h3>

<p>Vivo V20 được trang bị ống k&iacute;nh camera selfie cực khủng với độ ph&acirc;n giải l&ecirc;n tới 44MP. C&ugrave;ng với đ&oacute; l&agrave; v&ocirc; v&agrave;n những t&iacute;nh năng cực k&igrave; th&uacute; vị được t&iacute;ch hợp sẵn như: auto focus (tự động lấy n&eacute;t), Dual-View Video, Quay video selfie ổn định, Chụp selfie ban đ&ecirc;m, Selfie chuyển động v&agrave; quay video selfie độ ph&acirc;n giải 4K.</p>

<p>&nbsp;</p>

<p>Kh&ocirc;ng chỉ c&oacute; camera trước khủng, m&agrave; bộ ba camera sau của Vivo V20 cũng kh&ocirc;ng hề k&eacute;m cạnh. Hệ thống camera sau của m&aacute;y bao gồm cảm biến ch&iacute;nh độ ph&acirc;n giải l&ecirc;n tới 64MP, cảm biến g&oacute;c si&ecirc;u rộng 8MP v&agrave; cuối c&ugrave;ng l&agrave; một cảm biến 2MP hỗ trợ chụp ch&acirc;n dung x&oacute;a ph&ocirc;ng. Vivo V20 mang tới cho người d&ugrave;ng tới 3 lựa chọn m&agrave;u sắc l&agrave; Midnight Jazz, Moonlight Sonata v&agrave; Sunset Melody.</p>

<h3>Hiệu năng mượt m&agrave; với Snapdragon 720G</h3>

<p>Vivo V20 được cung cấp sức mạnh xử l&yacute; bởi con chip Snapdragon 720G của Qualcomm. Tuy kh&ocirc;ng phải l&agrave; một con chip mạnh nhất trong ph&acirc;n kh&uacute;c tầm trung nhưng cũng kh&ocirc;ng thể xem thường được sức mạnh của n&oacute;. Bạn đọc hẳn cũng đ&atilde; biết k&iacute; tự &ldquo;G&rdquo; được Qualcomm sư dụng trong sản phẩm của h&atilde;ng nhằm &aacute;m chỉ rằng bộ vi xử l&yacute; n&agrave;y được tạo ra để chuy&ecirc;n xử l&yacute; c&aacute;c t&aacute;c vụ đồ họa, gi&uacute;p người d&ugrave;ng v&agrave; đặc biệt l&agrave; c&aacute;c game thủ c&oacute; được những giờ ph&uacute;t chiến game ổn định, mượt m&agrave; nhất.</p>

<p>&nbsp;</p>

<p>Đi c&ugrave;ng với con chip Snapdragon 720G l&agrave; thanh RAM dung lượng 8GB c&ugrave;ng bộ nhớ trong l&ecirc;n tới 128GB. Dung lượng RAM 8GB khi kết hợp c&ugrave;ng Snapdragon 720G sẽ mang tới cho m&aacute;y một hiệu năng tốt nhất, kể cả với những t&aacute;c vụ th&ocirc;ng thường h&agrave;ng ng&agrave;y cho tới những tựa game nặng hiện nay. Vi&ecirc;n pin của m&aacute;y c&oacute; dung lượng l&agrave; 4000mAh, kết hợp với c&ocirc;ng nghệ sạc nhanh 33W, đủ để gi&uacute;p cho người d&ugrave;ng sử dụng được m&aacute;y trong một ng&agrave;y d&agrave;i m&agrave; kh&ocirc;ng lo phải sạc lại. Kể cả khi c&oacute; bị cạn kiệt năng lượng th&igrave; sạc nhanh 33W cũng sẽ gi&uacute;p người d&ugrave;ng bổ sung lại nhanh ch&oacute;ng nguồn năng lượng bị cạn kiệt trước đ&oacute;.</p>

<p>Để mua điện thoại Vivo V20 gi&aacute; tốt h&atilde;y đến ngay với&nbsp;<a href="https://hoanghamobile.com/">https://hoanghamobile.com/</a>. Chiếc smartphone n&agrave;y chắc chắn sẽ kh&ocirc;ng l&agrave;m bạn thất vọng. Tham khảo th&ecirc;m c&aacute;c sản phẩm kh&aacute;c của Vivo qua&nbsp;<a href="https://hoanghamobile.com/vivo-c2152.html">https://hoanghamobile.com/vivo-c2152.html</a></p>
', N'62855', N'35313')
INSERT [dbo].[Sanphamcanmua] ([ID], [MaSP], [Soluong], [Ngayketthuc], [Ngaydang], [Mota], [SanPham_Id], [NhaCungCap_Id]) VALUES (2049, N'66531', NULL, CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime), N'<p><img src="https://hoanghamobile.com/Content/web/content-icon/no-item.png" /></p>

<p><a href="javascript:;">... NỘI DUNG ĐANG CẬP NHẬT ...</a></p>
', N'66531', N'35313')
INSERT [dbo].[Sanphamcanmua] ([ID], [MaSP], [Soluong], [Ngayketthuc], [Ngaydang], [Mota], [SanPham_Id], [NhaCungCap_Id]) VALUES (2041, N'70707', NULL, CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-11T00:00:00.000' AS DateTime), N'<h2>Mua Galaxy S21+ ch&iacute;nh h&atilde;ng gi&aacute; tốt tại Tiến Dũng</h2>

<p>&nbsp;</p>

<p>Mở đầu cuộc chơi flagship năm 2021, Samsung đ&atilde; giới thiệu chiếc Galaxy S21+ b&ecirc;n cạnh Galaxy S21 v&agrave; S21 Ultra. Đ&acirc;y l&agrave; một trong những chiếc m&aacute;y cao cấp nhất của Samsung hiện tại với đầu tư xứng đ&aacute;ng về cả phần cứng lẫn phần mềm.</p>

<h3>Kết nối 5G ho&agrave;n to&agrave;n mới</h3>

<p>&nbsp;</p>

<p>Năm 2021, Samsung đ&atilde; đem đến Việt Nam những chiếc điện thoại Galaxy S đầu ti&ecirc;n hỗ trợ 5G. Galaxy S21+ sử dụng hai chuẩn 5G được triển khai tại Việt Nam l&agrave; sub-6 v&agrave; mmWave. Những si&ecirc;u phẩm mới nh&agrave; Samsung hứa hẹn đem lại cho người d&ugrave;ng tốc độ sử dụng internet si&ecirc;u nhanh với c&aacute;c băng tần 5G. Đ&acirc;y l&agrave; nền tảng quan trọng cho những gi&acirc;y ph&uacute;t giải tr&iacute; tuyệt vời của bạn. Với 5G, bạn sẽ xem được những video 4K một c&aacute;ch trơn tru, hoặc chiến game trực tuyến đồ hoạ khủng mượt m&agrave; hơn.</p>

<p>Người d&ugrave;ng c&oacute; thể sử dụng 2 SIM vật l&yacute; hoặc eSIM tr&ecirc;n chiếc điện thoại n&agrave;y để ph&ugrave; hợp với c&ocirc;ng việc cũng như nhu cầu li&ecirc;n lạc của m&igrave;nh.</p>

<h3>Thiết kế ho&agrave;n to&agrave;n mới. Nhiều m&agrave;u sắc trẻ trung</h3>

<p>&nbsp;</p>

<p>Galaxy S21+ được giới thiệu với ngoại h&igrave;nh chứa đầy c&aacute;i nh&igrave;n thẩm mĩ của Samsung trong một sản phẩm flagship. Người d&ugrave;ng vẫn sẽ t&igrave;m thấy những điểm quen thuộc trong thiết kế của Samsung như hai mặt k&iacute;nh cường lực, khung viền kim loạ s&aacute;ng b&oacute;ng v&agrave; m&agrave;n h&igrave;nh Infinity-O. Tuy vậy, h&atilde;ng đ&atilde; l&agrave;m mới lại thiết kế của m&igrave;nh khi kh&eacute;o l&eacute;o đặt cụm camera v&agrave;o một miếng kim loại, ho&agrave; v&agrave;o phần viền của m&aacute;y. Th&ecirc;m v&agrave;o đ&oacute;, phong c&aacute;ch dual tone tạo n&ecirc;n vẻ ngo&agrave;i hấp dẫn ngay từ lần đầu nh&igrave;n thấy. Kh&aacute;ch h&agrave;ng c&oacute; thể tuỳ chọn ba phi&ecirc;n bản m&agrave;u cho chiếc Galaxy S21+ của m&igrave;nh, bao gồm đen nguy&ecirc;n bản, bạc ngẫu hứng v&agrave; t&iacute;m đam m&ecirc;. Giống như những đời si&ecirc;u phẩm trước, Galaxy S21+ cũng c&oacute; khả năng kh&aacute;ng nước v&agrave; bụi bẩn IP68.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-plus-1.jpg" style="height:249.037px; width:442.733px" /></p>

<p>&nbsp;</p>

<p>Galaxy S21+ chắc chắn sẽ l&agrave; một trong những smartphone c&oacute; m&agrave;n h&igrave;nh đ&atilde; mất trong thời điểm đầu năm 2021. Chiếc smartphone n&agrave;y sở hữu m&agrave;n h&igrave;nh Dynamic AMOLED 2X k&iacute;ch thước 6,7 inch tương tự thiết bị tiền nhiệm, độ ph&acirc;n giải 1080x2400. M&agrave;n h&igrave;nh n&agrave;y sở hữu dải m&agrave;u rộng DCI-P3, hỗ trợ chuẩn HDR10+, cho m&agrave;u sắc rực rỡ, sắc n&eacute;t từng chi tiết. Kh&ocirc;ng chỉ vậy, người d&ugrave;ng sẽ được trải nghiệm tần số qu&eacute;t 120Hz tr&ecirc;n tấm nền n&agrave;y, gi&uacute;p mọi thao t&aacute;c vuốt v&agrave; c&aacute;c pha h&agrave;nh động trở n&ecirc;n mượt m&agrave; hơn bao giờ hết.</p>

<h3>Camera đồng h&agrave;nh c&ugrave;ng bạn tr&ecirc;n mọi nẻo đường</h3>

<p>&nbsp;</p>

<p>Cụm camera được trang bị tr&ecirc;n Galaxy S21+ cũng c&oacute; phần cứng mạnh mẽ v&agrave; phần mềm được tối ưu ho&aacute; cực tốt. Samsung đ&atilde; trang bị cho thiết bị của m&igrave;nh ba camera ở mặt sau: camera ti&ecirc;u chuẩn 12MP, khẩu độ f/1.8, k&iacute;ch thước điểm ảnh lớn 1.8&mu;m; camera zoom 64MP, khẩu độ f/2.0 v&agrave; camera g&oacute;c si&ecirc;u rộng 12MP, ti&ecirc;u cự 13mm, khẩu độ f/2.2. Với độ ph&acirc;n giải lớn v&agrave; thuật to&aacute;n chụp ảnh được thiết kế ri&ecirc;ng, bạn c&oacute; thể zoom l&ecirc;n tới 30x tr&ecirc;n chiếc m&aacute;y n&agrave;y, đưa những khung cảnh ở xa lại gần lại tầm nh&igrave;n của bạn với độ chi tiết tối ưu. M&aacute;y cũng c&oacute; camera 10MP ở ph&iacute;a trước gi&uacute;p người d&ugrave;ng chụp ảnh selfie v&agrave; gọi video cực đ&atilde;.</p>

<p>&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-plus-2.jpg" style="height:261.128px; width:464.227px" /></p>

<p>&nbsp;</p>

<p>Samsung c&ograve;n đưa l&ecirc;n Galaxy S21+ h&agrave;ng loạt t&iacute;nh năng quay phim chụp h&igrave;nh hữu &iacute;ch. Đầu ti&ecirc;n, người d&ugrave;ng sẽ lập tức ấn tượng khi đ&acirc;y l&agrave; chiếc điện thoại hiếm hoi tr&ecirc;n thị trường sở hữu khả năng quay video 8K cực sắc n&eacute;t. H&igrave;nh ảnh tr&iacute;ch xuất từ video n&agrave;y c&oacute; độ ph&acirc;n giải l&ecirc;n tới 33MP. M&aacute;y cũng c&oacute; thể quay video 4K ở 60fps mượt m&agrave;. Để hỗ trợ người d&ugrave;ng quay phim tốt hơn, Samsung trang bị cả chống rung quang học cho ống k&iacute;nh v&agrave; t&iacute;nh năng quay phim si&ecirc;u chống rung, giup thước phim của bạn chuyển động mượt m&agrave; ngay cả khi di chuyển nhanh.</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-plus-3.jpg" style="height:264.787px; width:470.733px" /></p>

<p>&nbsp;</p>

<p>Galaxy S21+ cũng nổi bật với t&iacute;nh năng chụp ảnh ch&acirc;n dung với c&aacute;c bộ lọc m&agrave;u chuy&ecirc;n nghiệp, đưa bạn v&agrave;o studio s&aacute;ng tạo bất tận. Bạn cũng sẽ tự tin chụp ảnh v&agrave;o buổi tối hay những địa điểm c&oacute; &aacute;nh s&aacute;ng phức tạp nhờ chế độ si&ecirc;u chụp đ&ecirc;m, đem lại độ s&aacute;ng v&agrave; chi tiết cho bức ảnh thiếu s&aacute;ng của bạn.</p>

<h3>Hiệu suất vượt trội. Thời lượng pin k&eacute;o d&agrave;i cả ng&agrave;y</h3>

<p>&nbsp;</p>

<p>Năm nay, Samsung đ&atilde; mang vi xử l&yacute; Exynos 2100 l&ecirc;n flagship của m&igrave;nh. Đ&acirc;y l&agrave; một con chip 8 nh&acirc;n với tốc độ tối đa l&ecirc;n tới 2,9GHz, đem lại tốc độ tối ưu trong mọi t&aacute;c vụ sử dụng. Galaxy S21+ sẽ gi&uacute;p bạn thực hiện được mọi t&aacute;c vụ một c&aacute;ch nhanh ch&oacute;ng, từ việc lướt web h&agrave;ng ng&agrave;y, cho tới chơi game đồ hoạ khủng v&agrave; xử l&yacute; video độ ph&acirc;n giải cao. Th&ecirc;m v&agrave;o đ&oacute;, dung lượng RAM 8GB sẽ gi&uacute;p bạn xử l&yacute; c&ocirc;ng việc đa nhiệm ho&agrave;n to&agrave;n trơn tru. Người d&ugrave;ng c&oacute; thể thoải m&aacute;i lưu trữ c&aacute;c tệp media v&agrave; th&ocirc;ng tin quan trọng trong bộ nhớ 256GB của m&aacute;y.</p>

<p>&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/16/s21-plus-4.jpg" style="height:271.491px; width:482.652px" /></p>

<p>&nbsp;</p>

<p>Galaxy S21+ sở hữu vi&ecirc;n pin 4800mAh, đủ để cung cấp cho bạn một ng&agrave;y sử dụng với những t&aacute;c vụ hỗn hợp nặng. Samsung trang bị cho chiếc smartphone n&agrave;y h&agrave;ng loạt t&iacute;nh năng sạc đỉnh cao như sạc si&ecirc;u nhanh 25W v&agrave; sạc nhanh kh&ocirc;ng d&acirc;y 2.0, gi&uacute;p bạn nhanh ch&oacute;ng nối lại trải nghiệm dang dở của m&igrave;nh khi hết pin. T&iacute;nh năng Power Share gi&uacute;p bạn chia sẻ pin cho những phụ kiện hỗ trợ sạc kh&ocirc;ng d&acirc;y như chiếc tai nghe Galaxy Buds Pro v&agrave; AirPods.</p>

<h3>Tạm kết</h3>

<p>&nbsp;</p>

<p>Galaxy S21+ kh&ocirc;ng chỉ l&agrave; một chiếc điện thoại sang trọng, m&agrave; c&ograve;n l&agrave; một thiết bị mạnh mẽ, đem lại cho người d&ugrave;ng những gi&acirc;y ph&uacute;t l&agrave;m việc v&agrave; giải tr&iacute; cực đ&atilde;. Nếu bạn cần t&igrave;m một flagship Android đ&aacute;p ứng mọi nhu cầu sử dụng của m&igrave;nh th&igrave; đ&acirc;y l&agrave; một sự lựa chọn kh&ocirc;ng thể hợp l&yacute; hơn.</p>

<p>Hiện tại Galaxy S21+ được b&aacute;n ch&iacute;nh h&atilde;ng tại hệ thống Ho&agrave;ng H&agrave; với h&agrave;ng loạt ưu đ&atilde;i cực hấp dẫn. Sản phẩm được bảo h&agrave;nh 12 th&aacute;ng tại c&aacute;c trung t&acirc;m uỷ quyền của Samsung tr&ecirc;n to&agrave;n quốc. Bạn c&oacute; thể tới ngay chi nh&aacute;nh Ho&agrave;ng H&agrave; Mobile gần nhất hoặc đặt h&agrave;ng tr&ecirc;n website hoanghamobile.com để sở hữu chiếc m&aacute;y n&agrave;y nh&eacute;!</p>
', N'70707', N'81113')
INSERT [dbo].[Sanphamcanmua] ([ID], [MaSP], [Soluong], [Ngayketthuc], [Ngaydang], [Mota], [SanPham_Id], [NhaCungCap_Id]) VALUES (2035, N'75462', NULL, CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2021-05-10T00:00:00.000' AS DateTime), N'<p>Tất cả iPhone ch&iacute;nh h&atilde;ng VN/A được ph&acirc;n phối tại Ho&agrave;ng H&agrave; Mobile đều được nhập trực tiếp từ C&ocirc;ng ty TNHH Apple Việt Nam. HoangHa Mobile l&agrave; nh&agrave; b&aacute;n lẻ ủy quyền ch&iacute;nh thức của Apple tại Việt Nam.</p>

<p><img alt="" src="https://hoanghamobile.com/Uploads/Content/2019/09/05/apple--dien-thoai-di-dong-iphone-11-64gb-chinh-hang-vn-a-1.JPG" /></p>

<p><em>Tem ICT c&oacute; tr&ecirc;n c&aacute;c sản phẩm iPhone ch&iacute;nh h&atilde;ng VN/A</em></p>

<h2><strong>Mua điện thoại iPhone 11 ch&iacute;nh h&atilde;ng, gi&aacute; rẻ tại&nbsp;<a href="https://hoanghamobile.com/">Ho&agrave;ng H&agrave; Mobile</a></strong></h2>

<p>iPhone 11 - si&ecirc;u phẩm được mong chờ nhất năm 2019 của Apple chuẩn bị ra mắt. Với những cải tiến vượt trội, phi&ecirc;n bản iPhone mới nhất hứa hẹn sẽ l&agrave;m b&ugrave;ng nổ thị trường c&ocirc;ng nghệ.</p>

<h3>Thiết kế cực kỳ ấn tượng với m&agrave;n h&igrave;nh c&oacute; độ ph&acirc;n giải cao</h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2019/09/05/apple--dien-thoai-di-dong-iphone-11-64gb-chinh-hang-vn-a-2.jpg" /></p>

<p>iPhone 11 vẫn sở hữu thiết kế tr&agrave;n viền với &ldquo;tai thỏ&rdquo; giống iPhone X. Viền bezel ph&iacute;a tr&ecirc;n v&agrave; dưới cũng được l&agrave;m gọn lại nhằm tối đa m&agrave;n h&igrave;nh sử dụng. C&ugrave;ng với đ&oacute;, 4 g&oacute;c của m&aacute;y cũng được bo tr&ograve;n nhẹ tạo cảm gi&aacute;c chắc chắn khi cầm tr&ecirc;n tay. Mặt lưng iPhone 11 l&agrave;m từ chất liệu k&iacute;nh n&ecirc;n rất sang trọng, tinh tế. Kh&aacute;c với c&aacute;c d&ograve;ng iPhone trước, sản phẩm n&agrave;y sẽ c&oacute; 6 m&agrave;u bản bạc, v&agrave;ng, xanh l&aacute;, trắng, đen đỏ.</p>

<p>C&ocirc;ng nghệ m&agrave;n h&igrave;nh LCD Retina mang đến chất lượng tốt nhất. Độ ph&acirc;n giải m&agrave;n h&igrave;nh 1125 x 2436 pixels hiển thị m&agrave;u sắc ch&iacute;nh x&aacute;c v&agrave; cho h&igrave;nh ảnh sắc n&eacute;t. M&agrave;n h&igrave;nh rộng 6.1 inch gi&uacute;p người sử dụng thoải m&aacute;i trải nghiệm xem phim, lướt web&hellip; Đặc biệt Apple đ&atilde; trang bị tần số qu&eacute;t từ 90 đến 120 Hz với 463 điểm m&agrave;u.</p>

<h3>Camera độc đ&aacute;o n&acirc;ng tầm chụp ảnh chuy&ecirc;n nghiệp</h3>

<p><img src="https://hoanghamobile.com/Uploads/Content/2019/09/05/apple--dien-thoai-di-dong-iphone-11-64gb-chinh-hang-vn-a-3.jpg" /></p>

<p>iPhone 11 vẫn sở hữu 2 camera nhưng thay v&igrave; đặt dọc như iPhone X th&igrave; ch&uacute;ng lại được sắp xếp theo h&igrave;nh vu&ocirc;ng. Đ&egrave;n flash cũng được đặt trong h&igrave;nh vu&ocirc;ng n&agrave;y. Trong đ&oacute; c&oacute; một camera ch&iacute;nh với độ ph&acirc;n giải 12MP gi&uacute;p bạn c&oacute; được những bức ảnh cực đẹp. Camera thứ hai c&oacute; g&oacute;c si&ecirc;u rộng 12 MP, ti&ecirc;u cự 13mm cho g&oacute;c chụp 120 độ.</p>

<p>C&aacute;c thuật to&aacute;n xử l&yacute; c&ugrave;ng được Apple n&acirc;ng cấp gồm chụp ch&acirc;n dung Potrait Mode, chụp ch&acirc;n dung đen trắng Highkey. Đồng thời tự động chuyển sang t&iacute;nh năng chụp đ&ecirc;m Night Mode khi nhận thấy thiếu &aacute;nh s&aacute;ng.</p>

<p>Camera selfie được n&acirc;ng cấp với độ ph&acirc;n giải l&ecirc;n đến 12MP. Đồng thời đ&egrave;n flash cũng được n&acirc;ng độ s&aacute;ng v&agrave; v&ugrave;ng chiếu s&aacute;ng rộng hơn. Nhờ đ&oacute;, bạn sẽ thoải m&aacute;i chụp ảnh kể cả ở những nơi &aacute;nh s&aacute;ng yếu. B&ecirc;n cạnh đ&oacute;, chế độ slow-motiton hứa hẹn sẽ trở th&agrave;nh một t&iacute;nh năng độc đ&aacute;o. Mỗi một sản phẩm mới của Apple đều được n&acirc;ng cấp camera nhằm tạo ra những trải nghiệm mới th&uacute; vị hơn cho người sử dụng.</p>

<h3>Pin dung lượng 3110 mAh n&acirc;ng thời gian nhiều hơn 1 giờ so với iPhone XR</h3>

<p>iPhone 11 ch&iacute;nh h&atilde;ng được trang bị pin c&oacute; dung lượng 3110 mAh. Với dung lượng như vậy th&igrave; chỉ một lần sạc l&agrave; c&oacute; thể sử dụng thoải m&aacute;i. Th&ecirc;m một điểm cộng nữa cho sản phẩm n&agrave;y đ&oacute; ch&iacute;nh l&agrave; c&ocirc;ng nghệ sạc kh&ocirc;ng d&acirc;y 15W. So với sạc kh&ocirc;ng d&acirc;y 7.5W hiện tại, sạc kh&ocirc;ng d&acirc;y 15W tăng tốc độ sạc l&ecirc;n 15% v&agrave; hiệu quả năng lượng cao hơn 30%. Mặc d&ugrave; l&agrave; c&ocirc;ng nghệ sạc nhanh nhưng vẫn đảm bảo iPhone kh&ocirc;ng qu&aacute; n&oacute;ng v&agrave; giảm 3 độ trong l&uacute;c sạc.</p>

<h3>Hiệu năng tối ưu với bộ xử l&yacute; Apple A13</h3>

<p><img src="https://hoanghamobile.com/Uploads/2021/02/05/ip-11.jpeg" /></p>

<p>&nbsp;</p>

<p>Bộ&nbsp;xử l&yacute; A13 được sản xuất độc quyền cho iPhone 11 nhằm tạo hiệu năng mạnh mẽ, tiết kiệm pin hiệu quả. Hơn nữa, hệ điều h&agrave;nh iOS v13.0 sẽ tăng tốc độ mở ứng dụng 40%, tốc độ hiển thị b&agrave;n ph&iacute;m 50%, tốc độ camera 70%. C&ocirc;ng nghệ Wi-fi 6 mới nhất cũng được đưa v&agrave;o iPhone 11 nhằm tăng tốc độ kết nối internet tới 40%.</p>

<p>Để thay thế cho 5G, Apple đ&atilde; ph&aacute;t triển c&ocirc;ng nghệ Modified Polyimide (MPI) thay v&igrave; Liquid Crystal Polymer (LCP). N&acirc;ng cấp băng th&ocirc;ng si&ecirc;u rộng gi&uacute;p kết nối mạng nhanh hơn.</p>

<p>Face ID cũng được cải thiện khi c&oacute; thể ph&acirc;n biệt tiền cảnh v&agrave; &aacute;nh xạ khu&ocirc;n mặt để mở kh&oacute;a nhanh ch&oacute;ng hơn. Apple đ&atilde; tăng cường &aacute;nh s&aacute;ng của đ&egrave;n chiếu nhằm tr&aacute;nh &aacute;nh s&aacute;ng của m&ocirc;i trường t&aacute;c động l&agrave;m ảnh hưởng đến hoạt động của Face&nbsp; ID. Nhờ đ&oacute; n&acirc;ng cao t&iacute;nh bảo mật cho sản phẩm.</p>
', N'75462', N'81113')
INSERT [dbo].[Sanphamcanmua] ([ID], [MaSP], [Soluong], [Ngayketthuc], [Ngaydang], [Mota], [SanPham_Id], [NhaCungCap_Id]) VALUES (2045, N'83681', NULL, CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime), N'<h2>Mua điện thoại Vivo S1 Pro 8GB/128GB gi&aacute; rẻ ch&iacute;nh h&atilde;ng tại Tiến Dũng</h2>

<p>Vivo l&agrave; thương hiệu sản xuất điện thoại th&ocirc;ng minh đến từ Trung Quốc. Những năm qua, Vivo đ&atilde; t&igrave;m được chỗ đứng của m&igrave;nh tại thị trường Việt Nam. C&aacute;c sản phẩm mang thương hiệu Vivo lu&ocirc;n nổi bật bởi thiết kế kh&aacute;c biệt trong ph&acirc;n kh&uacute;c gi&aacute;. C&ocirc;ng ty cũng nỗ lực cải thiện trải nghiệm người d&ugrave;ng tr&ecirc;n c&aacute;c thiết bị của m&igrave;nh. Cuối năm 2019, c&ocirc;ng ty giới thiệu đến người d&ugrave;ng Việt chiếc Vivo S1 Pro. Với thiết kế m&ocirc;-đun camera kim cương, Vivo S1 Pro 8GB/128GB l&agrave; sự lựa chọn tuyệt vời trong ph&acirc;n kh&uacute;c gi&aacute; tầm trung.&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/28/s1-pro-1.jpg" style="height:267.125px; width:474.889px" /></p>

<h3>Thiết kế hiện đại với m&agrave;n h&igrave;nh 6.38 inch</h3>

<p>&nbsp;</p>

<p>Nh&igrave;n chung, về thiết kế tổng thế chiếc Vivo S1 Pro 8GB/128GB ch&iacute;nh h&atilde;ng được ho&agrave;n thiện rất tốt. Điện thoại tr&ocirc;ng c&oacute; vẻ hơi d&agrave;y, khoảng 8.68 mm v&agrave; trọng lượng khoảng 188.7g, nếu cầm trong một thời gian d&agrave;i bạn c&oacute; thể cảm thấy nặng tay. Mặc d&ugrave; vậy, c&aacute;c cạnh đ&atilde; được bo tr&ograve;n v&agrave; mặt sau gọn g&agrave;ng n&ecirc;n cầm kh&aacute; chắc tay. Mặt lưng của m&aacute;y c&ograve;n c&oacute; một lớp sơn b&oacute;ng khiến n&oacute; tr&ocirc;ng b&oacute;ng bẩy hơn nhưng vẫn kh&ocirc;ng b&aacute;m dấu v&acirc;n tay.&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/28/s1-pro-2.jpg" style="height:306px; width:459px" /></p>

<p>Mặt trước của chiếc Vivo S1 Pro 8GB/128GB ch&iacute;nh h&atilde;ng l&agrave; m&agrave;n h&igrave;nh 6.38 inch với độ ph&acirc;n giải Full HD+ (1080 x 2340 Pixels). Tấm nền super AMOLED 16 triệu m&agrave;u cho chất lượng hiển thị h&igrave;nh ảnh sắc n&eacute;t, m&agrave;u ảnh ch&acirc;n thực v&agrave; độ tương phản cao. M&agrave;n h&igrave;nh chứa một cảm biến v&acirc;n tay hoạt động kh&aacute; nhạy. Ngo&agrave;i ra c&ograve;n c&oacute; t&iacute;nh năng mở kh&oacute;a bằng khu&ocirc;n mặt nhưng kh&ocirc;ng nhanh như c&aacute;c mẫu điện thoại cao cấp. Cạnh tr&ecirc;n m&agrave;n h&igrave;nh l&agrave; notch nhỏ, phần cằm của m&aacute;y kh&aacute; d&agrave;y nhưng c&aacute;c viền m&agrave;n h&igrave;nh mỏng đem lại trải nghiệm kh&ocirc;ng gian tối đa.&nbsp;</p>

<h3>Bộ tứ camera chụp ảnh ấn tượng&nbsp;</h3>

<p>&nbsp;</p>

<p>Ng&agrave;y nay, hầu hết người d&ugrave;ng đều coi chụp ảnh v&agrave; quay video như một nhu cầu cơ bản. C&aacute;c nh&agrave; sản xuất cũng đầu tư nhiều hơn cho hệ thống camera tr&ecirc;n những smartphone ph&acirc;n kh&uacute;c gi&aacute; tầm trung. Đối với chiếc Vivo S1 Pro 8GB/128GB ch&iacute;nh h&atilde;ng, nh&agrave; sản xuất trang bị cho n&oacute; bộ tứ camera được xếp trong m&ocirc;-đun h&igrave;nh kim cương đặt ở ch&iacute;nh giữa tạo cảm gi&aacute;c h&agrave;i h&ograve;a c&acirc;n đối. Đ&egrave;n flash LED cũng được đặt gọn g&agrave;ng trong m&ocirc;-đun n&agrave;y.&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/28/s1-pro-3.jpg" style="height:270px; width:447.514px" /></p>

<p>Trong đ&oacute; bao gồm camera ch&iacute;nh 48MP với khẩu độ f/1.8, camera g&oacute;c rộng 8MP với khẩu độ f/2.2, camera macro 2MP v&agrave; cảm biến độ s&acirc;u 2MP. Với hệ thống camera n&agrave;y, Vivo S1 Pro ch&iacute;nh h&atilde;ng c&oacute; thể đem lại những bức ảnh chụp chất lượng, r&otilde; r&agrave;ng chi tiết v&agrave; m&agrave;u sắc v&ocirc; c&ugrave;ng nghệ thuật. Độ tương phản h&igrave;nh ảnh tr&ecirc;n m&aacute;y cũng rất tốt, điểm trừ duy nhất l&agrave; m&aacute;y lấy n&eacute;t hơi l&acirc;u một ch&uacute;t. Trong điều kiện thiếu s&aacute;ng, c&aacute;c bức ảnh chụp vẫn đảm bảo chi tiết của vật thể. T&iacute;nh năng zoom tr&ecirc;n Vivo S1 Pro cũng kh&ocirc;ng g&acirc;y ra hiện tượng vỡ ảnh. B&ecirc;n cạnh đ&oacute;, n&oacute; c&ograve;n được trang bị th&ecirc;m camera selfie 32MP với khẩu độ f/2.0 ho&agrave;n thiện trải nghiệm chụp h&igrave;nh cho người d&ugrave;ng.</p>

<h3>Hiệu năng ổn định trong tầm gi&aacute;&nbsp;</h3>

<p>&nbsp;</p>

<p>Nh&agrave; sản xuất đ&atilde; trang bị cho chiếc Vivo S1 Pro 8GB/128GB ch&iacute;nh h&atilde;ng con chip Snapdragon 665 gồm 4 nh&acirc;n tốc độ 2.2 GHz v&agrave; 4 nh&acirc;n tốc độ 1.8 GHz đi k&egrave;m với đồ họa Adreno 610. Mặc d&ugrave; con chip n&agrave;y kh&aacute; cũ nhưng b&ugrave; lại m&aacute;y c&oacute; RAM 8GB v&agrave; bộ nhớ trong 128GB. Về khả năng chơi game th&igrave; Vivo S1 Pro ch&iacute;nh h&atilde;ng c&oacute; phần k&eacute;m cạnh so với c&aacute;c đối thủ trong c&ugrave;ng ph&acirc;n kh&uacute;c. Tuy nhi&ecirc;n, n&oacute; vẫn xử l&yacute; kh&aacute; tốt c&aacute;c t&aacute;c vụ h&agrave;ng ng&agrave;y như xem phim, lướt web v&agrave; một số tựa game nhẹ.&nbsp;</p>

<p><img src="https://hoanghamobile.com/Uploads/2021/01/28/s1-pro-4.jpg" style="height:242.531px; width:431.167px" /></p>

<p>Chiếc Vivo S1 Pro 8GB/128GB ch&iacute;nh h&atilde;ng đi k&egrave;m với vi&ecirc;n pin 4500mAh c&oacute; thể đ&aacute;p ứng nhu cầu sử dụng trong suốt ng&agrave;y d&agrave;i. Ngo&agrave;i ra, n&oacute; c&ograve;n hỗ trợ bộ sạc nhanh 18W cho ph&eacute;p sạc đầy vi&ecirc;n pin chỉ trong 2 tiếng. Sản phẩm c&oacute; sẵn hai t&ugrave;y chọn m&agrave;u đen v&agrave; fancy sky, được b&aacute;n tr&ecirc;n hệ thống của Ho&agrave;ng H&agrave; Mobile với mức gi&aacute; ưu đ&atilde;i v&agrave; chế độ bảo h&agrave;nh 12 th&aacute;ng. Tham khảo th&ecirc;m th&ocirc;ng tin sản phẩm tại link: https://hoanghamobile.com/dien-thoai-di-dong/vivo-s1-pro-8gb-128gb-chinh-hang</p>
', N'83681', N'81113')
INSERT [dbo].[Sanphamcanmua] ([ID], [MaSP], [Soluong], [Ngayketthuc], [Ngaydang], [Mota], [SanPham_Id], [NhaCungCap_Id]) VALUES (2050, N'84060', NULL, CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime), N'<h2>Mua điện thoại Vsmart Joy 3 - 2GB/32GB ch&iacute;nh h&atilde;ng, gi&aacute; rẻ tại Tiến Dũng&nbsp;Mobile</h2>

<p>Với một thiết kế hiện đại, Vsmart Joy 3 g&acirc;y ấn tượng với người d&ugrave;ng ngay từ c&aacute;i nh&igrave;n đầu ti&ecirc;n. Sản phẩm n&agrave;y đ&atilde; được n&acirc;ng cấp cả về hiệu năng v&agrave; pin so với thế hệ trước.</p>

<h3><strong>Thiết kế m&agrave;n h&igrave;nh giọt nước HD</strong></h3>

<p><img alt="" src="https://hoanghamobile.com/Uploads/Content/2020/02/07/vsmart--dien-thoai-di-dong-vsmart-joy-3-2gb-32gb-chinh-hang-1.jpg" /></p>

<p>Vsmart Joy 3 vẫn sở hữu m&agrave;n h&igrave;nh giọt nước quen thuộc. Thế nhưng với thiết kế tr&agrave;n viền, c&aacute;c thao t&aacute;c của bạn kh&ocirc;ng c&ograve;n bị giới hạn bởi c&aacute;c cạnh nữa. Viền m&agrave;n h&igrave;nh được chế t&aacute;c cong 2.5D tạo cảm gi&aacute;c liền mạch, dễ thao t&aacute;c. B&ecirc;n cạnh đ&oacute;, mặt lưng của m&aacute;y cũng c&oacute; c&aacute;c g&oacute;c bo tr&ograve;n mềm mại, mang t&iacute;nh thẩm mỹ cao. Hiệu ứng chuyển m&agrave;u độc đ&aacute;o l&agrave; một điểm hấp dẫn của sản phẩm n&agrave;y.</p>

<p>Với k&iacute;ch thước si&ecirc;u khủng l&ecirc;n tới 6.5 inch, m&agrave;n h&igrave;nh Vsmart Joy 3 mang đến cho bạn những h&igrave;nh ảnh v&ocirc; c&ugrave;ng sống động, ch&acirc;n thực. Mặc d&ugrave; c&oacute; m&agrave;n h&igrave;nh lớn nhưng k&iacute;ch thước của sản phẩm n&agrave;y lại kh&aacute; nhỏ gọn. Tấm nền IPS LCD c&ugrave;ng độ ph&acirc;n giải HD sẽ gi&uacute;p tăng độ s&aacute;ng v&agrave; độ tương phản khi sử dụng. Bạn chắc chắn sẽ c&oacute; những gi&acirc;y ph&uacute;t giải tr&iacute; tuyệt vời khi trải nghiệm Vsmart Joy 3.</p>

<h3><strong>Bộ 3 camera sắc n&eacute;t c&ugrave;ng camera selfie phong c&aacute;ch</strong></h3>

<p><img alt="" src="https://hoanghamobile.com/Uploads/Content/2020/02/07/vsmart--dien-thoai-di-dong-vsmart-joy-3-2gb-32gb-chinh-hang-2.jpg" /></p>

<p>Vsmart Joy 3 được trang bị tới ba camera sau cực kỳ chuy&ecirc;n nghiệp. Ấn tượng nhất l&agrave; camera ch&iacute;nh 13 MP với khả năng chụp ảnh sắc n&eacute;t trong điều kiện đủ &aacute;nh s&aacute;ng. Kể cả trong điều kiện thiếu &aacute;nh s&aacute;ng th&igrave; camera n&agrave;y vẫn mang đến những bức ảnh đầy t&iacute;nh nghệ thuật nhờ c&ocirc;ng nghệ nhận diện AI. B&ecirc;n cạnh đ&oacute;, m&aacute;y c&ograve;n c&oacute; camera g&oacute;c si&ecirc;u rộng 8 MP. N&oacute; c&oacute; g&oacute;c chụp l&ecirc;n tới 120 độ, rộng gấp đ&ocirc;i so với camera th&ocirc;ng thường. Cuối c&ugrave;ng l&agrave; camera mono với độ ph&acirc;n giải 2 MP.</p>

<p>Bộ ba camera cho ph&eacute;p bạn thoải m&aacute;i s&aacute;ng tạo, lưu giữ những khoảnh khắc đẹp nhất. Chế độ x&oacute;a ph&ocirc;ng sẽ gi&uacute;p l&agrave;m mờ nền một c&aacute;ch ảo diệu đồng thời l&agrave;m nổi bật chủ thể ch&iacute;nh. Ngo&agrave;i ra, m&aacute;y c&ograve;n c&oacute; một camera selfie 8 MP ở mặt trước. Camera n&agrave;y kh&ocirc;ng chỉ chụp ảnh sắc n&eacute;t m&agrave; c&ograve;n tự l&agrave;m đẹp bằng c&aacute;c chế độ x&oacute;a khuyết điểm, l&agrave;m mịn da, x&oacute;a ph&ocirc;ng...</p>

<h3><strong>Chip Snapdragon 632 mang đến hiệu năng ổn định</strong></h3>

<p><img alt="" src="https://hoanghamobile.com/Uploads/Content/2020/02/07/vsmart--dien-thoai-di-dong-vsmart-joy-3-2gb-32gb-chinh-hang-3.jpg" /></p>

<p>Vsmart Joy 3 được trang bị chip Snapdragon 632 đủ đ&aacute;p ứng nhu cầu sử dụng cơ bản. N&oacute; sẽ xử l&yacute; tốt mọi ứng dụng gi&uacute;p bạn lướt web, xem phim, nghe nhạc v&agrave; chơi c&aacute;c tựa game nhẹ. B&ecirc;n cạnh đ&oacute;, m&aacute;y c&ograve;n c&oacute; hệ điều h&agrave;nh VOS 2.5 mới nhất với giao diện dễ nh&igrave;n, dễ d&ugrave;ng. &nbsp;</p>

<p>Sản phẩm c&oacute; RAM 2 GB v&agrave; bộ nhớ trong 32 GB cho ph&eacute;p bạn thoải m&aacute;i lưu trữ dữ liệu. Nếu kh&ocirc;ng đủ th&igrave; cũng đừng lo bởi m&aacute;y c&ograve;n c&oacute; cả khe cắm thẻ nhớ micro SD với dung lượng l&ecirc;n tới 128 GB. Ngo&agrave;i ra, Vsmart Joy 3 cung cấp cả hai phương thức mở kh&oacute;a bao gồm nhận diện khu&ocirc;n mặt v&agrave; cảm biến v&acirc;n tay. Nhờ đ&oacute;, việc bảo mật sẽ tốt hơn đồng thời bạn cũng c&oacute; thể mở kh&oacute;a nhanh hơn.</p>

<h3><strong>Dung lượng pin khủng l&ecirc;n tới 5000 mAh</strong></h3>

<p><img alt="" src="https://hoanghamobile.com/Uploads/Content/2020/02/07/vsmart--dien-thoai-di-dong-vsmart-joy-3-2gb-32gb-chinh-hang-4.jpg" /></p>

<p>Vsmart Joy 3 sở hữu vi&ecirc;n pin với dung lượng si&ecirc;u khủng 5000 mAh. N&oacute; c&oacute; khả năng đ&aacute;p ứng tốt nhu cầu sử dụng trong hai ng&agrave;y liền. Cụ thể bạn sẽ c&oacute; 25 giờ xem video, 48 giờ gọi điện v&agrave; 143 giờ nghe nhạc. M&aacute;y c&ograve;n được trang bị sạc nhanh Quick Charge 3.0 18W. Nhờ đ&oacute; chỉ với 30 ph&uacute;t sạc l&agrave; bạn sẽ c&oacute; th&ecirc;m nửa ng&agrave;y sử dụng.</p>

<p>Truy cập trang&nbsp;<a href="https://hoanghamobile.com/">https://tiendungmobile.com/</a>&nbsp;để mua Vsmart Joy 3 gi&aacute; rẻ ngay h&ocirc;m nay. Kh&aacute;ch h&agrave;ng tham khảo th&ecirc;m những sản phẩm kh&aacute;c của Vsmart qua website&nbsp;<a href="https://hoanghamobile.com/vsmart-c2468.html">https://tiendungmobile.com/</a></p>

<p>&nbsp;</p>
', N'84060', N'35313')
SET IDENTITY_INSERT [dbo].[Sanphamcanmua] OFF
GO
INSERT [dbo].[SanPhamKhuyenMai] ([MaKM], [MaSP], [MoTa], [GiamGia]) VALUES (N'60750', N'75462', N'<p>Khuyến m&atilde;i th&agrave;nh vi&ecirc;n mới</p>
', 20)
INSERT [dbo].[SanPhamKhuyenMai] ([MaKM], [MaSP], [MoTa], [GiamGia]) VALUES (N'76337', N'13840', N'<p>Mua nhiều giảm nhiều</p>
', 10)
GO
SET IDENTITY_INSERT [dbo].[sysdiagrams] ON 

INSERT [dbo].[sysdiagrams] ([name], [principal_id], [diagram_id], [version], [definition]) VALUES (N'Diagram_0', 1, 1, 1, 0xD0CF11E0A1B11AE1000000000000000000000000000000003E000300FEFF0900060000000000000000000000010000000100000000000000001000002F00000001000000FEFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF31000000030000000400000005000000060000000700000008000000090000000A0000000B000000FEFFFFFF0D0000000E0000000F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B0000001C0000001D0000001E0000001F000000200000002100000022000000230000002400000025000000260000002700000028000000290000002A0000002B0000002C0000002D0000002E000000FEFFFFFFFEFFFFFF4E000000FEFFFFFF330000003400000035000000360000003700000038000000390000003A0000003B0000003C0000003D0000003E0000003F000000400000004100000042000000430000004400000045000000460000004700000048000000490000004A0000004B0000004C0000004D000000FEFFFFFF4F00000050000000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52006F006F007400200045006E00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500FFFFFFFFFFFFFFFF020000000000000000000000000000000000000000000000000000000000000020B30C0641CED60130000000C0060000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000020000008E120000000000006F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040002010100000004000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000C0000000244000000000000010043006F006D0070004F0062006A0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000005F00000000000000000434000A1E500C05000080F20000000F00FFFF46000000F2000000007D000032A300009358000097EA000020B400000598FFFFCF400000DE805B10F195D011B0A000AA00BDCB5C000008003000000000020000030000003C006B0000000900000000000000D9E6B0E91C81D011AD5100A0C90F5739F43B7F847F61C74385352986E1D552F8A0327DB2D86295428D98273C25A2DA2D00002800430000000000000053444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C00002800430000000000000051444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C3C0000009811000000BC010000003000A5090000070000800F000000A2020000008000000800008053636847726964001815000010A4000042696E684C75616E00007800A50900000700008010000000620000000180000050000080436F6E74726F6C000CF5FFFFF59E000052656C6174696F6E736869702027464B5F5F42696E684C75616E5F5F4D614B485F5F353930363341343727206265747765656E20274173704E657455736572732720616E64202742696E684C75616E2700002800B50100000700008011000000310000006B00000002800000436F6E74726F6C000EEAFFFFD0B6000000003800A50900000700008012000000AE020000008000000E0000805363684772696400AC2600008A66000043686954696574446F6E48616E67000000003400A5090000070000801A000000A402000000800000090000805363684772696400840300008A660000446F6E48616E674B4800000000008000A5090000070000801B000000520000000180000056000080436F6E74726F6C00A8190000656B000052656C6174696F6E736869702027464B5F5F43686954696574446F6E5F5F4D6144485F5F354145453832423927206265747765656E2027446F6E48616E674B482720616E64202743686954696574446F6E48616E6727000000002800B5010000070000801C000000310000006F00000002800000436F6E74726F6C003E150000AB6D000000003000A5090000070000801F000000A202000000800000080000805363684772696400B42D0000004B00004769616F4469656E00003400A50900000700008020000000A8020000008000000B000080536368477269646EF6540000EE98000048616E6753616E587561740000002C00A509000007000080240000009A0200000080000004000080536368477269646E68100000004B00004C696E6B00003000A509000007000080280000009E0200000080000006000080536368477269646E8C55000070AD00004C6F61695350646E00007400A5090000070000803E0000005A000000018000004C000080436F6E74726F6C6E2D2B0000DEAC000052656C6174696F6E736869702027464B5F5F42696E684C75616E5F5F4D6153505F5F353946413545383027206265747765656E202753616E5068616D2720616E64202742696E684C75616E2700002800B5010000070000803F000000310000006B00000002800000436F6E74726F6C00DC2A000067BC000000007C00A50900000700008040000000620000000180000054000080436F6E74726F6C6E753B00004F73000052656C6174696F6E736869702027464B5F5F43686954696574446F6E5F5F4D6153505F5F354245324136463227206265747765656E202753616E5068616D2720616E64202743686954696574446F6E48616E672700002800B50100000700008041000000310000006F00000002800000436F6E74726F6C6E9F3D0000277D000000007800A50900000700008044000000520000000180000050000080436F6E74726F6C6E304900000FA3000052656C6174696F6E736869702027464B5F5F53616E5068616D5F5F48616E6753585F5F363933434132313027206265747765656E202748616E6753616E587561742720616E64202753616E5068616D2700002800B50100000700008045000000310000006D00000002800000436F6E74726F6C000D4600009FA2000000007400A5090000070000804600000052000000018000004B000080436F6E74726F6C6E3049000005AD000052656C6174696F6E736869702027464B5F5F53616E5068616D5F5F4C6F616953505F5F364133304336343927206265747765656E20274C6F616953502720616E64202753616E5068616D275000002800B50100000700008047000000310000006D00000002800000436F6E74726F6C007447000095AC000000008000A5090000070000804E000000520000000180000058000080436F6E74726F6C6E1B2E000063C7000052656C6174696F6E736869702027464B5F5F53616E5068616D4B68755F5F4D614B4D5F5F364331393045424227206265747765656E20274B687579656E4D61692720616E64202753616E5068616D4B687579656E4D61692700002800B5010000070000804F000000310000006F00000002800000436F6E74726F6C6E64250000F3C6000000008000A50900000700008050000000620000000180000056000080436F6E74726F6C6E6B450000DEAC000052656C6174696F6E736869702027464B5F5F53616E5068616D4B68755F5F4D6153505F5F364430443332463427206265747765656E202753616E5068616D2720616E64202753616E5068616D4B687579656E4D616927000000002800B50100000700008051000000310000006F00000002800000436F6E74726F6C6EC731000091B5000000007C00A50900000700008054000000520000000180000054000080436F6E74726F6C6E304900007B91000052656C6174696F6E736869702027464B5F5F54686F6E67536F4B79545F5F4D6153505F5F364530313537324427206265747765656E202753616E5068616D2720616E64202754686F6E67536F4B7954687561742700002800B50100000700008055000000310000006F00000002800000436F6E74726F6C6E5A450000C193000000003000A5090000070000803D000000A00200000080000007000080536368477269646EFA3200009885000053616E5068616D6E00003800A5090000070000807D000000AC020000008000000D000080536368477269646EC81900009885000053616E7068616D63616E6D756108000000003800A50900000700008053000000AE020000008000000E0000805363684772696400F65400006C84000054686F6E67536F4B795468756174000000007800A5090000070000808400000052000000018000004D000080436F6E74726F6C6E812C0000238F000052656C6174696F6E736869702027464B5F53616E7068616D63616E6D75615F53616E5068616D27206265747765656E202753616E5068616D2720616E64202753616E7068616D63616E6D756127616D2700002800B50100000700008085000000310000006300000002800000436F6E74726F6C6EEE270000B38E000000003400A50900000700008086000000A6020000008000000A000080536368477269646ED4FEFFFF988500004E686143756E67436170000000007C00A50900000700008087000000520000000180000053000080436F6E74726F6C6E321200005797000052656C6174696F6E736869702027464B5F53616E7068616D63616E6D75615F4E686143756E6743617027206265747765656E20274E686143756E674361702720616E64202753616E7068616D63616E6D7561272700002800B50100000700008088000000310000006900000002800000436F6E74726F6C001C0D00009D99000000003800A5090000070000804D000000B202000000800000100000805363684772696400FA320000F2C1000053616E5068616D4B687579656E4D616900003800A50900000700008004000000B0020000008000000F000080536368477269646EC6DFFFFF926D00004173704E657455736572526F6C65730000003400A50900000700008023000000A40200000080000009000080536368477269646E0618000088C200004B687579656E4D616970000000003400A50900000700008001000000A8020000008000000B000080536368477269646E00B5FFFFA46A00004173704E6574526F6C65736100008400A509000007000080A1000000520000000180000059000080436F6E74726F6C6EF1DFFFFF4875000052656C6174696F6E736869702027464B5F4173704E657455736572526F6C65735F4173704E6574557365727327206265747765656E20274173704E657455736572732720616E6420274173704E657455736572526F6C65732700000000002800B501000007000080A2000000310000006F00000002800000436F6E74726F6C0037E2FFFF077A000000008400A509000007000080A7000000520000000180000059000080436F6E74726F6C6E02CBFFFF916C000052656C6174696F6E736869702027464B5F4173704E657455736572526F6C65735F4173704E6574526F6C657327206265747765656E20274173704E6574526F6C65732720616E6420274173704E657455736572526F6C65732700000000002800B501000007000080A8000000310000006F00000002800000436F6E74726F6C6E84CCFFFFD76E000000007800A509000007000080C700000052000000018000004D000080436F6E74726F6C6E0CF5FFFF637C000052656C6174696F6E736869702027464B5F446F6E48616E674B485F4173704E6574557365727327206265747765656E20274173704E657455736572732720616E642027446F6E48616E674B4827616D2700002800B501000007000080C8000000310000006300000002800000436F6E74726F6C00D0F4FFFFF37B000000003400A50900000700008007000000A8020000008000000B000080536368477269640030DFFFFF647D00004173704E657455736572730000003000A509000007000080DC0000009C0200000080000005000080536368477269646E24450000206700004B686F535069646E00003400A509000007000080DD000000A4020000008000000900008053636847726964002A5D0000B6670000546F6E6753504B686F00000000006C00A509000007000080DE000000520000000180000041000080436F6E74726F6C6E4F550000E96E000052656C6174696F6E736869702027464B5F546F6E6753504B686F5F4B686F535027206265747765656E20274B686F53502720616E642027546F6E6753504B686F2700610000002800B501000007000080DF000000310000005700000002800000436F6E74726F6C6EBD5300002F71000000006800A509000007000080E100000052000000018000003D000080436F6E74726F6C6E23440000837C000052656C6174696F6E736869702027464B5F4B686F53505F53616E5068616D27206265747765656E202753616E5068616D2720616E6420274B686F53502700000000002800B501000007000080E2000000310000005300000002800000436F6E74726F6C0069460000BF81000000003400A509000007000080E3000000A40200000080000009000080536368477269646E18CAFFFFC0A800005573657241646D696E00000000007000A509000007000080E90000006A0000000180000047000080436F6E74726F6C6E87DBFFFF23BD000052656C6174696F6E736869702027464B5F42696E684C75616E5F5573657241646D696E27206265747765656E20275573657241646D696E2720616E64202742696E684C75616E270000002800B501000007000080EA000000310000005D00000002800000436F6E74726F6C00D2EBFFFFF3D1000000003800A509000007000080EB000000AE020000008000000E000080536368477269646E82C9FFFFD68300005573657241646D696E526F6C6573000000007C00A509000007000080EC000000620000000180000053000080436F6E74726F6C6EF5CAFFFF1F93000052656C6174696F6E736869702027464B5F5573657241646D696E526F6C65735F5573657241646D696E27206265747765656E20275573657241646D696E2720616E6420275573657241646D696E526F6C6573276100002800B501000007000080ED000000310000006900000002800000436F6E74726F6C0091D3FFFFE398000000008000A509000007000080EE000000520000000180000057000080436F6E74726F6C0081C8FFFF6071000052656C6174696F6E736869702027464B5F5573657241646D696E526F6C65735F4173704E6574526F6C657327206265747765656E20274173704E6574526F6C65732720616E6420275573657241646D696E526F6C6573270000002800B501000007000080EF000000310000006D00000002800000436F6E74726F6C6E2AB7FFFFB077000000007400A509000007000080F10000006A0000000180000049000080436F6E74726F6C6E60ADFFFFA559000052656C6174696F6E736869702027464B5F446F6E48616E674B485F5573657241646D696E27206265747765656E20275573657241646D696E2720616E642027446F6E48616E674B4827674B4800002800B501000007000080F2000000310000005F00000002800000436F6E74726F6C6E3BAFFFFFBE5F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000214334120800000041170000CE1B0000785634120700000014010000420069006E0068004C00750061006E000000005D04000003000080220B000000FFFF6604000022082000007604000000626F6F6C65616E00004D617070696E67537472696E677300010000007E0400000057696E33324150497C5365727669636520537472756374757265737C51554552595F534552564943455F434F4E4649477C647753657276696365547970657C534552564943455F494E5445524143544956455F50524F434553530000446973706C61794E616D6500084000000D002C00000003000000290000000A00008023080000001E05000003000080220B000000FFFF2605000022082000003605000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A7290000511F0000000000002D0100000B0000000C000000070000001C010000F70800005307000049020000D0020000FE010000DD04000047040000850200004704000064050000B1030000000000000100000041170000CE1B000000000000090000000900000002000000020000001C0100009B0A00000000000001000000F2130000DA0A000000000000030000000300000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000009000000420069006E0068004C00750061006E00000004000B0038F6FFFF8CA000008DFDFFFF8CA000008DFDFFFF80BB00001815000080BB00000000000002000000F0F0F000000000000000000000000000000000000100000011000000000000000EEAFFFFD0B60000D01200005801000032000000010000020000D012000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611C0046004B005F005F00420069006E0068004C00750061006E005F005F004D0061004B0048005F005F0035003900300036003300410034003700214334120800000041170000800F0000785634120700000014010000430068006900540069006500740044006F006E00480061006E006700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F70800005307000049020000D0020000FE010000DD04000047040000850200004704000064050000B1030000000000000100000041170000800F000000000000040000000400000002000000020000001C0100009B0A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000F000000430068006900540069006500740044006F006E00480061006E0067000000214334120800000050170000FD1A000078563412070000001401000044006F006E00480061006E0067004B004800000020364C0484BE4B04D0E64B0450365E045C365E048CFC4B04F4FC4B041CFD4B0428FD4B04C0C44B0434FD4B048CFD4B047CFF4B0464C74B04E4FF4B041CC24B04CCE14B0458004C0408CA4B04C8375E04A8385E0474034C0468304C04D4385E04E0385E0450395E04683A5E04AC3B5E04683C5E04743C5E04EC3C5E04CC3D5E04F83D5E048C3E5E04F025510458894C04706E3F04F86F3F04FC3E5E0414405E048C713F0480405E043C415E0448415E04B8415E0498425E0498275104F8275104902A5104C4425E0414FB5004C8FD5004CCB04C043CB14C0460B6000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000097210000000000002D0100000C0000000C000000070000001C010000F70800005307000049020000D0020000FE010000DD04000047040000850200004704000064050000B1030000000000000100000050170000FD1A0000000000000A0000000A00000002000000020000001C010000AA0A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000A00000044006F006E00480061006E0067004B004800000002000B00D41A0000FC6C0000AC260000FC6C00000000000002000000F0F0F00000000000000000000000000000000000010000001C000000000000003E150000AB6D0000F01300005801000045000000010000020000F013000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F00430068006900540069006500740044006F006E005F005F004D006100440048005F005F003500410045004500380032004200390021433412080000002F170000471100007856341207000000140100004700690061006F004400690065006E0000005604BC7E600418CA5E0440BF5C045CBF5C048CE2560478BF5C04641A540448255404B4EC5604F025540484C05C0490C15C0420275404A04B57049CC25C04B8C25C04B84B5704484C5704602754046C4D5704D4C25C04F0C25C04FCC35C0418C45C0434C45C04AC4D570450C45C046CC45C04A4C45C0430755704B4165504AC195504F4C45C04541A550444C55C0400E85C04841B55041CE85C0438E85C0454E85C0470E85C048CE85C04C41B5504A8E85C04C81E550448225504C4E85C04F0225504B0AD5704E0E85C042024550464B25704FCE85C0418B7570418E9000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F70800005307000049020000D0020000FE010000DD04000047040000850200004704000064050000B103000000000000010000002F1700004711000000000000030000000300000002000000020000001C0100009B0A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000090000004700690061006F004400690065006E00000021433412080000002E17000032130000785634120700000014010000480061006E006700530061006E0058007500610074000000343867049C38670420396704C4396704683A6704D03A6704383B6704C03B6704CC566904D8566904102F6C042C2F6C04482F6C04542F6C04802F6C049C2F6C04A82F6C04D42F6C04E02F6C04EC2F6C04F82F6C043C346C0448346C04CC356C04DC986C04F8986C0414996C0430996C044C996C0468996C0484996C0490996C049C996C04D8996C04E4996C04F0996C042C9A6C04489A6C04549A6C04809A6C049C9A6C04B89A6C04C49A6C04D09A6C04A49C6C04C09D6C04CC9D6C04F49F6C0400A06C0408B16C0454D96C048C0B6D0414B16C04F0EF000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F70800005307000049020000D0020000FE010000DD04000047040000850200004704000064050000B103000000000000010000002E1700003213000000000000040000000400000002000000020000001C0100009B0A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C000000480061006E006700530061006E0058007500610074000000214334120800000041170000EA1100007856341207000000140100004C0069006E006B0000007F0410327F0498347F042C377F04B4397F04483C7F04D03E7F0464417F04EC437F0480467F0408497F049C4B7F047CB580047CE0800464E085043CE1850414CD800418B88004C0BA8004ACCF80045CBD800404C08004A0C2800448C58004E4C780048CCA8004F0E280048CE580047CAD800434E88004D0EA800478ED800414F08004BCF2800458F5800400F880049CFA800444FD8004E0FF8004600A810488028104F40C8104240581049C0F810434128104A4E18504EC128104F0E28504D4E385043CE48504D407810488E5850460E68504C8E6850414E8850414158104C4178104541A000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F70800005307000049020000D0020000FE010000DD04000047040000850200004704000064050000B1030000000000000100000041170000EA11000000000000050000000500000002000000020000001C010000AA0A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005200000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000050000004C0069006E006B00000021433412080000002E170000810F00007856341207000000140100004C006F006100690053005000000044048C0F44042C324C04281D4C0460364C0440DA470414E9470420E9470418335E0488335E049C0F4804DC2F48046C474804545F4804D0894804541D4C04ACCC4B0428355E04381F4C04B8B1480470E44B0410E148047013490478324904AC6F4904F076490470AF4904BCAF4904ECAF49049CB6490460D0490464014A0494355E04844F4A04F8364C04641F4C0448534A04B08F4A0428344C04C8AC4A04B8B24A04BCE94A0490F24A047C1F4B04284C4B04A4694B0478B14B0484B14B04ACB14B04F0B14B0424B24B0468B24B049CB24B04E0B24B0414B34B0458B34B048CB3000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F70800005307000049020000D0020000FE010000DD04000047040000850200004704000064050000B103000000000000010000002E170000810F000000000000020000000200000002000000020000001C0100009B0A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000070000004C006F006100690053005000000003000B001C3E000095AF00001C3E00006EBE0000592C00006EBE00000000000002000000F0F0F00000000000000000000000000000000000010000003F00000000000000DC2A000067BC0000B31200005801000032000000010000020000B312000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611C0046004B005F005F00420069006E0068004C00750061006E005F005F004D006100530050005F005F003500390046004100350045003800300004000B00744000009885000074400000DE7F0000F03C0000DE7F0000F03C00000A7600000000000002000000F0F0F000000000000000000000000000000000000100000041000000000000009F3D0000277D0000B61300005801000035000000010000020000B613000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F00430068006900540069006500740044006F006E005F005F004D006100530050005F005F003500420045003200410036004600320002000B00F6540000A6A400005C4A0000A6A400000000000002000000F0F0F000000000000000000000000000000000000100000045000000000000000D4600009FA200002A14000058010000370000000100000200002A14000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611D0046004B005F005F00530061006E005000680061006D005F005F00480061006E006700530058005F005F003600390033004300410032003100300002000B008C5500009CAE00005C4A00009CAE00000000000002000000F0F0F000000000000000000000000000000000000100000047000000000000007447000095AC00007C13000058010000410000000100000200007C13000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611D0046004B005F005F00530061006E005000680061006D005F005F004C006F0061006900530050005F005F003600410033003000430036003400390002000B00472F0000FAC80000FA320000FAC800000000000002000000F0F0F00000000000000000000000000000000000010000004F0000000000000064250000F3C600001115000058010000390000000100000200001115000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F00530061006E005000680061006D004B00680075005F005F004D0061004B004D005F005F003600430031003900300045004200420004000B00D449000095AF0000D449000098B70000E646000098B70000E6460000F2C100000000000002000000F0F0F00000000000000000000000000000000000010000005100000000000000C731000091B50000F31400005801000031000000010000020000F314000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F00530061006E005000680061006D004B00680075005F005F004D006100530050005F005F003600440030004400330032004600340002000B005C4A000012930000F6540000129300000000000002000000F0F0F000000000000000000000000000000000000100000055000000000000005A450000C19300009D14000058010000320000000100000200009D14000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F00540068006F006E00670053006F004B00790054005F005F004D006100530050005F005F0036004500300031003500370032004400214334120800000062170000FD290000785634120700000014010000530061006E005000680061006D00000000000000000000800000000000000000000000000100000000000000F002515F00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A7290000DD230000000000002D0100000D0000000C000000070000001C010000F70800005307000049020000D0020000FE010000DD04000047040000850200004704000064050000B1030000000000000100000062170000FD290000000000000F0000000C00000002000000020000001C010000600900000000000001000000F2130000DA0A000000000000030000000300000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000008000000530061006E005000680061006D0000002143341208000000E5130000631B0000785634120700000014010000530061006E007000680061006D00630061006E006D0075006100000069006E005C0041007000700044006100740061005C004C006F00630061006C005C00490073006F006C006100740065006400530074006F0072006100670065005C006C00330077007A0079003200760035002E00320032006C005C007A00780031006500660071006B0068002E007200320065005C005000750062006C00690073006800650072002E0032006E006A0061006800610032006300750077007A006A0061006900790031006B00640062007A0072006E00760069006A007800620033006200780079006E005C00410073007300000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002326000099180000000000002D010000080000000C000000070000001C010000160800009F06000049020000D0020000FE0100006504000047040000850200004704000064050000B10300000000000001000000E5130000631B000000000000060000000600000002000000020000001C010000AC0800000000000001000000661200009408000000000000020000000200000002000000020000001C010000160800000100000000000000661200000804000000000000000000000000000002000000020000001C010000160800000000000000000000E42D00001224000000000000000000000D00000004000000040000001C010000160800008D090000DC05000078563412040000006400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000E000000530061006E007000680061006D00630061006E006D0075006100000021433412080000002017000082130000785634120700000014010000540068006F006E00670053006F004B00790054006800750061007400000087042C5F82045C5F82048C5F820490958804DC9688047C618204AC618204DC6182040053880438538804D86382040864820438648204ECED870438EF870428668204586682048866820410F0870478F0870484688204B4688204E4688204C4F18704A8F28704D46A8204046B8204346B8204AC56880410F38704306D8204606D8204906D82045CF4870434F58704806F8204B06F8204E06F8204D05688049CF58704DC7182040C7282043C728204E8F68704CCF787042C7482045C7482048C74820434F8870480F9870488768204B876000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F70800005307000049020000D0020000FE010000DD04000047040000850200004704000064050000B10300000000000001000000201700008213000000000000030000000300000002000000020000001C0100009B0A00000000000001000000F2130000DA0A000000000000030000000300000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000F000000540068006F006E00670053006F004B00790054006800750061007400000002000B00FA320000BA900000AD2D0000BA9000000000000002000000F0F0F00000000000000000000000000000000000010000008500000000000000EE270000B38E0000C81000005801000032000000010000020000C810000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61180046004B005F00530061006E007000680061006D00630061006E006D00750061005F00530061006E005000680061006D0021433412080000008A140000841B00007856341207000000140100004E0068006100430075006E0067004300610070000000730069006F006E003D0032002E0030002E0030002E0030002C002000430075006C0074007500720065003D006E00650075007400720061006C002C0020005000750062006C00690063004B006500790054006F006B0065006E003D0062003700370061003500630035003600310039003300340065003000380039000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000036220000141B0000000000002D010000090000000C000000070000001C01000026070000DC05000049020000D0020000FE010000DE03000047040000850200004704000064050000B103000000000000010000008A140000841B000000000000070000000700000002000000020000001C010000150900000000000001000000D91000006806000000000000010000000100000002000000020000001C010000260700000100000000000000D91000000804000000000000000000000000000002000000020000001C0100002607000000000000000000003D2900004724000000000000000000000D00000004000000040000001C010000260700007F0800003705000078563412040000005E00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000B0000004E0068006100430075006E006700430061007000000002000B005E130000EE980000C8190000EE9800000000000002000000F0F0F000000000000000000000000000000000000100000088000000000000001C0D00009D990000ED1200005801000032000000010000020000ED12000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611B0046004B005F00530061006E007000680061006D00630061006E006D00750061005F004E0068006100430075006E006700430061007000214334120800000054170000350F0000785634120700000014010000530061006E005000680061006D004B0068007500790065006E004D00610069000000830428048804740588042479830454798304847983045006880464688804807B8304B07B8304E07B830464668604B0678604D07D8304007E8304307E830488688604F06886042C8083045C8083048C8083043C6A8604206B86047C828304AC828304DC828304886B8604D46C8604D88483040885830438858304AC6D8604146E8604288783045887830488878304606F86044470860484898304B4898304E4898304AC708604F8718604D48B8304048C8304348C8304D072860438738604308E8304608E8304908E83048474000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F70800005307000049020000D0020000FE010000DD04000047040000850200004704000064050000B1030000000000000100000054170000350F000000000000040000000400000002000000020000001C010000AA0A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000011000000530061006E005000680061006D004B0068007500790065006E004D00610069000000214334120800000041170000710A00007856341207000000140100004100730070004E0065007400550073006500720052006F006C00650073000000530074007500640069006F002E0050006C006100740066006F0072006D002E00570069006E0064006F0077004D0061006E006100670065006D0065006E0074002C002000560065007200730069006F006E003D00310030002E0030002E0030002E0030002C002000430075006C0074007500720065003D006E00650075007400720061006C002C0020005000750062006C00690063004B006500790054006F006B0065006E003D006200300033006600350066003700660031003100640035003000610033006100000000000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F70800005307000049020000D0020000FE010000DD04000047040000850200004704000064050000B1030000000000000100000041170000710A000000000000020000000200000002000000020000001C0100009B0A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000100000004100730070004E0065007400550073006500720052006F006C00650073000000214334120800000041170000881500007856341207000000140100004B0068007500790065006E004D0061006900000068CB8104E4CB8104F0CB81040CCC81047CCC810488CC8104C8CC81041CCD810408CE810414CE8104D0CE8104DCCE81041CCF810428CF810434CF8104A4CF8104BCCF8104FCCF8104CCD08104D8D0810418D18104A41286040C13860440D28104FCD28104B8D3810404D4810410D4810464148604C4D481043C158604A415860404D68104F016860400D9810420D98104A0D981045CDA81049CDA8104A8DA8104FCDA8104B8DB8104F8DB810404DC810458DC810414DD810454DD810460DD8104C0DD810414DE810400DF81040CDF8104ACDF810468E08104DCE0000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A72900007F180000000000002D010000080000000C000000070000001C010000F70800005307000049020000D0020000FE010000DD04000047040000850200004704000064050000B10300000000000001000000411700008815000000000000060000000600000002000000020000001C0100009B0A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000A0000004B0068007500790065006E004D0061006900000021433412080000002E170000730900007856341207000000140100004100730070004E006500740052006F006C0065007300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F70800005307000049020000D0020000FE010000DD04000047040000850200004704000064050000B103000000000000010000002E1700007309000000000000020000000200000002000000020000001C0100009B0A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C0000004100730070004E006500740052006F006C0065007300000002000B0088E1FFFF647D000088E1FFFF037800000000000002000000F0F0F0000000000000000000000000000000000001000000A20000000000000037E2FFFF077A00000913000058010000320000000100000200000913000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F004100730070004E0065007400550073006500720052006F006C00650073005F004100730070004E00650074005500730065007200730002000B002ECCFFFF286E0000C6DFFFFF286E00000000000002000000F0F0F0000000000000000000000000000000000001000000A80000000000000084CCFFFFD76E0000ED1200005801000032000000010000020000ED12000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611E0046004B005F004100730070004E0065007400550073006500720052006F006C00650073005F004100730070004E006500740052006F006C006500730002000B0038F6FFFFFA7D000084030000FA7D00000000000002000000F0F0F0000000000000000000000000000000000001000000C800000000000000D0F4FFFFF37B00001C10000058010000320000000100000200001C10000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61180046004B005F0044006F006E00480061006E0067004B0048005F004100730070004E006500740055007300650072007300214334120800000008170000883300007856341207000000140100004100730070004E006500740055007300650072007300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A7290000DD230000000000002D0100000D0000000C000000070000001C010000F70800005307000049020000D0020000FE010000DD04000047040000850200004704000064050000B10300000000000001000000081700008833000000000000130000000C00000002000000020000001C010000150900000000000001000000F2130000DA0A000000000000030000000300000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C0000004100730070004E00650074005500730065007200730000002143341208000000571100001E1800007856341207000000140100004B0068006F0053005000000073006500720073005C00410064006D0069006E005C0041007000700044006100740061005C004C006F00630061006C005C00490073006F006C006100740065006400530074006F0072006100670065005C006C00330077007A0079003200760035002E00320032006C005C007A00780031006500660071006B0068002E007200320065005C005000750062006C00690073006800650072002E0032006E006A0061006800610032006300750077007A006A0061006900790031006B00640062007A0072006E00760069006A007800620033006200780079006E005C00410073007300000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000571100001E180000000000002D0100000D0000000C000000070000001C010000160800009F06000049020000D0020000FE0100006504000047040000850200004704000064050000B10300000000000001000000661200000804000000000000000000000000000002000000020000001C010000160800000000000001000000661200000804000000000000000000000000000002000000020000001C010000160800000100000000000000661200000804000000000000000000000000000002000000020000001C010000160800000000000000000000E42D00001224000000000000000000000D00000004000000040000001C010000160800008D090000DC05000078563412040000005400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000060000004B0068006F005300500000002143341208000000EA1100006813000078563412070000001401000054006F006E006700530050004B0068006F0000007200730069006F006E003D0032002E0030002E0030002E0030002C002000430075006C0074007500720065003D006E00650075007400720061006C002C0020005000750062006C00690063004B006500790054006F006B0065006E003D0062003700370061003500630035003600310039003300340065003000380039000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000EA11000068130000000000002D0100000D0000000C000000070000001C010000160800009F06000049020000D0020000FE0100006504000047040000850200004704000064050000B10300000000000001000000661200000804000000000000000000000000000002000000020000001C010000160800000000000001000000661200000804000000000000000000000000000002000000020000001C010000160800000100000000000000661200000804000000000000000000000000000002000000020000001C010000160800000000000000000000E42D00001224000000000000000000000D00000004000000040000001C010000160800008D090000DC05000078563412040000005C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000A00000054006F006E006700530050004B0068006F00000002000B007B560000807000002A5D0000807000000000000002000000F0F0F0000000000000000000000000000000000001000000DF00000000000000BD5300002F7100002B0C000058010000320000000100000200002B0C000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61120046004B005F0054006F006E006700530050004B0068006F005F004B0068006F005300500002000B00BA45000098850000BA4500003E7F00000000000002000000F0F0F0000000000000000000000000000000000001000000E20000000000000069460000BF8100000A0B000058010000320000000100000200000A0B000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61100046004B005F004B0068006F00530050005F00530061006E005000680061006D0021433412080000009B1200002C2400007856341207000000140100005500730065007200410064006D0069006E0000000000008000000000000000000000000001000000000000007005B06D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C0000003400000000000000000000009B1200002C240000000000002D0100000D0000000C000000070000001C010000160800009F06000049020000D0020000FE0100006504000047040000850200004704000064050000B10300000000000001000000661200000804000000000000000000000000000002000000020000001C010000160800000000000001000000661200000804000000000000000000000000000002000000020000001C010000160800000100000000000000661200000804000000000000000000000000000002000000020000001C010000160800000000000000000000E42D00001224000000000000000000000D00000004000000040000001C010000160800008D090000DC05000078563412040000005C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000A0000005500730065007200410064006D0069006E00000005000B00B3DCFFFF0CC6000066F0FFFF0CC6000066F0FFFF44D10000AE15000044D10000AE150000DEBF00000000000002000000F0F0F0000000000000000000000000000000000001000000EA00000000000000D2EBFFFFF3D100004A0D0000580100002C0000000100000200004A0D000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61150046004B005F00420069006E0068004C00750061006E005F005500730065007200410064006D0069006E0021433412080000004F120000041200007856341207000000140100005500730065007200410064006D0069006E0052006F006C0065007300000000000000000001000000000000007005B06D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C0000003400000000000000000000004F12000004120000000000002D0100000D0000000C000000070000001C010000160800009F06000049020000D0020000FE0100006504000047040000850200004704000064050000B10300000000000001000000661200000804000000000000000000000000000002000000020000001C010000160800000000000001000000661200000804000000000000000000000000000002000000020000001C010000160800000100000000000000661200000804000000000000000000000000000002000000020000001C010000160800000000000000000000E42D00001224000000000000000000000D00000004000000040000001C010000160800008D090000DC05000078563412040000006600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000F0000005500730065007200410064006D0069006E0052006F006C0065007300000004000B00E2D2FFFFC0A80000E2D2FFFF5398000070CCFFFF5398000070CCFFFFDA9500000000000002000000F0F0F0000000000000000000000000000000000001000000ED0000000000000091D3FFFFE39800001F11000058010000370000000100000200001F11000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611B0046004B005F005500730065007200410064006D0069006E0052006F006C00650073005F005500730065007200410064006D0069006E0002000B0018CAFFFF1774000018CAFFFFD68300000000000002000000F0F0F0000000000000000000000000000000000001000000EF000000000000002AB7FFFFB07700003F12000058010000190000000100000200003F12000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611D0046004B005F005500730065007200410064006D0069006E0052006F006C00650073005F004100730070004E006500740052006F006C006500730005000B0018CAFFFF56A900008CAEFFFF56A900008CAEFFFFD15A00001A040000D15A00001A0400008A6600000000000002000000F0F0F0000000000000000000000000000000000001000000F2000000000000003BAFFFFFBE5F0000DF0E00005801000032000000010000020000DF0E000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61160046004B005F0044006F006E00480061006E0067004B0048005F005500730065007200410064006D0069006E0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000FEFFFFFFFEFFFFFF0400000005000000060000000700000008000000090000000A0000000B0000000C0000000D0000000E0000000F00000010000000110000001200000013000000140000001500000016000000170000001800000019000000FEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0100FEFF030A0000FFFFFFFF00000000000000000000000000000000170000004D6963726F736F66742044445320466F726D20322E300010000000456D626564646564204F626A6563740000000000F439B271000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B0000004E61BC00000000000000000000000000000000000000000000000000000000000000000000000000000000000000DBE6B0E91C81D011AD5100A0C90F5739000002007041010641CED601020200001048450000000000000000000000000000000000A40100004400610074006100200053006F0075007200630065003D004E0047005500590045004E0048004900450050005C00530051004C0045005800500052004500530053003B0049006E0069007400690061006C00200043006100740061006C006F0067003D005700650062004700690061007900480061006E00670048006900650075003B005000650072007300690073007400200053006500630075007200690074007900200049006E0066006F003D0054007200750065003B0055007300650072002000490044003D00730061003B004D0075006C007400690070006C00650041006300740069007600650052006500730075006C00740053006500740073003D00460061006C000300440064007300530074007200650061006D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160002000300000006000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000032000000343600000000000053006300680065006D00610020005500440056002000440065006600610075006C0074000000000000000000000000000000000000000000000000000000000026000200FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000020000001600000000000000440053005200450046002D0053004300480045004D0041002D0043004F004E00540045004E0054005300000000000000000000000000000000000000000000002C0002010500000007000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000003000000AE0500000000000053006300680065006D00610020005500440056002000440065006600610075006C007400200050006F007300740020005600360000000000000000000000000036000200FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000001A00000012000000000000000C0000000598FFFFCF4000000100260000007300630068005F006C006100620065006C0073005F00760069007300690062006C0065000000010000000B0000001E000000B8C2FFFF2E500000075100005A6700006400000000000000000000000000000000000000000000000000010000000100000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700310035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C0031003600360035000000040000000400000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700310035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C0031003600360035000000070000000700000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300320035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000000F0000000F00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700310035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000001000000010000000000000004A00000001025A5E01000000640062006F00000046004B005F005F00420069006E0068004C00750061006E005F005F004D0061004B0048005F005F003500390030003600330041003400370000000000000000000000C402000000001100000011000000100000000800000001C6521838C652180000000000000000AD070000000000120000001200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700310035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000001A0000001A00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700330030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000001B0000001B000000000000004E00000001025A5E01000000640062006F00000046004B005F005F00430068006900540069006500740044006F006E005F005F004D006100440048005F005F003500410045004500380032004200390000000000000000000000C402000000001C0000001C0000001B0000000800000001C55218F8C552180000000000000000AD0700000000001F0000001F00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700310035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C0031003600360035000000200000002000000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700310035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C0031003600360035000000230000002300000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700310035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C0031003600360035000000240000002400000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700330030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C0031003600360035000000280000002800000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700310035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000003D0000003D00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003400300030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000003E0000003E000000000000004A00000001025A5E01000000640062006F00000046004B005F005F00420069006E0068004C00750061006E005F005F004D006100530050005F005F003500390046004100350045003800300000000000000000000000C402000000003F0000003F0000003E0000000800000001C5521878C552180000000000000000AD0700000000004000000040000000000000004E000000016A2D6101000000640062006F00000046004B005F005F00430068006900540069006500740044006F006E005F005F004D006100530050005F005F003500420045003200410036004600320000000000000000000000C402000000004100000041000000400000000800000001C1521878C152180000000000000000AD0700000000004400000044000000000000004C000000016A2D6101000000640062006F00000046004B005F005F00530061006E005000680061006D005F005F00480061006E006700530058005F005F003600390033004300410032003100300000000000000000000000C402000000004500000045000000440000000800000001C4521838C452180000000000000000AD0700000000004600000046000000000000004C00000001025A5E01000000640062006F00000046004B005F005F00530061006E005000680061006D005F005F004C006F0061006900530050005F005F003600410033003000430036003400390000000000000000000000C402000000004700000047000000460000000800000001C1521838C152180000000000000000AD0700000000004D0000004D00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700330030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000004E0000004E000000000000004E000000016A2D6101000000640062006F00000046004B005F005F00530061006E005000680061006D004B00680075005F005F004D0061004B004D005F005F003600430031003900300045004200420000000000000000000000C402000000004F0000004F0000004E0000000800000001C7521878C752180000000000000000AD0700000000005000000050000000000000004E0000000100350001000000640062006F00000046004B005F005F00530061006E005000680061006D004B00680075005F005F004D006100530050005F005F003600440030004400330032004600340000000000000000000000C402000000005100000051000000500000000800000001C35218F8C352180000000000000000AD070000000000530000005300000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700310035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000005400000054000000000000004E000000016A2D6101000000640062006F00000046004B005F005F00540068006F006E00670053006F004B00790054005F005F004D006100530050005F005F003600450030003100350037003200440000000000000000000000C402000000005500000055000000540000000800000001C2521878C252180000000000000000AD0700000000007D0000007D00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003000370030002C0031002C0031003600390035002C0035002C0031003100320035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003000370030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003000370030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003000370030002C00310032002C0032003400340035002C00310031002C00310035003000300000008400000084000000000000004200000001FFFFFF01000000640062006F00000046004B005F00530061006E007000680061006D00630061006E006D00750061005F00530061006E005000680061006D0000000000000000000000C402000000008500000085000000840000000800000001C85218F8C852180000000000000000AD070000000000860000008600000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003800000034002C0030002C003200380034002C0030002C0031003800330030002C0031002C0031003500300030002C0035002C003900390030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300320035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0031003800330030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0031003800330030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0031003800330030002C00310032002C0032003100370035002C00310031002C00310033003300350000008700000087000000000000004800000001FFFFFF01000000640062006F00000046004B005F00530061006E007000680061006D00630061006E006D00750061005F004E0068006100430075006E00670043006100700000000000000000000000C402000000008800000088000000870000000800000001C6521878C652180000000000000000AD070000000000A1000000A1000000000000004E0000000100300001000000640062006F00000046004B005F004100730070004E0065007400550073006500720052006F006C00650073005F004100730070004E00650074005500730065007200730000000000000000000000C40200000000A2000000A2000000A10000000800000001C2521838C252180000000000000000AD070000000000A7000000A7000000000000004E000000016A2D6101000000640062006F00000046004B005F004100730070004E0065007400550073006500720052006F006C00650073005F004100730070004E006500740052006F006C006500730000000000000000000000C40200000000A8000000A8000000A70000000800000001C75218F8C752180000000000000000AD070000000000C7000000C7000000000000004200000001FFFFFF01000000640062006F00000046004B005F0044006F006E00480061006E0067004B0048005F004100730070004E00650074005500730065007200730000000000000000000000C40200000000C8000000C8000000C70000000800000001B95218B8B952180000000000000000AD070000000000DC000000DC00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003000370030002C0031002C0031003600390035002C0035002C0031003100320035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003000370030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003000370030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003000370030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003000370030002C00310032002C0032003400340035002C00310031002C0031003500300030000000DD000000DD00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003000370030002C0031002C0031003600390035002C0035002C0031003100320035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003000370030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003000370030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003000370030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003000370030002C00310032002C0032003400340035002C00310031002C0031003500300030000000DE000000DE000000000000003600000001406F1801000000640062006F00000046004B005F0054006F006E006700530050004B0068006F005F004B0068006F005300500000000000000000000000C40200000000DF000000DF000000DE0000000800000001BA521838BA52180000000000000000AD070000000000E1000000E1000000000000003200000001406F1801000000640062006F00000046004B005F004B0068006F00530050005F00530061006E005000680061006D0000000000000000000000C40200000000E2000000E2000000E10000000800000001C65218F8C652180000000000000000AD070000000000E3000000E300000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003000370030002C0031002C0031003600390035002C0035002C0031003100320035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003000370030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003000370030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003000370030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003000370030002C00310032002C0032003400340035002C00310031002C0031003500300030000000E9000000E9000000000000003C000000016A2D6101000000640062006F00000046004B005F00420069006E0068004C00750061006E005F005500730065007200410064006D0069006E0000000000000000000000C40200000000EA000000EA000000E90000000800000001C5521838C552180000000000000000AD070000000000EB000000EB00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003000370030002C0031002C0031003600390035002C0035002C0031003100320035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003000370030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003000370030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003000370030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003000370030002C00310032002C0032003400340035002C00310031002C0031003500300030000000EC000000EC000000000000004800000001FFFFFF01000000640062006F00000046004B005F005500730065007200410064006D0069006E0052006F006C00650073005F005500730065007200410064006D0069006E0000000000000000000000C40200000000ED000000ED000000EC0000000800000001C15218B8C152180000000000000000AD070000000000EE000000EE000000000000004C0000000100350001000000640062006F00000046004B005F005500730065007200410064006D0069006E0052006F006C00650073005F004100730070004E006500740052006F006C006500730000000000000000000000C40200000000EF000000EF000000EE0000000800000001C55218B8C552180000000000000000AD070000000000F1000000F1000000000000003E00000001006F0001000000640062006F00000046004B005F0044006F006E00480061006E0067004B0048005F005500730065007200410064006D0069006E0000000000000000000000C40200000000F2000000F2000000F10000000800000001C8521838C852180000000000000000AD07000000000064000000EE00000001000000EB0000004700000000000000A70000000100000004000000570000004C000000C7000000070000001A0000004D0000009C00000010000000070000000F000000C30000009A000000A1000000070000000400000006000000050000001B0000001A00000012000000630000006000000044000000200000003D00000072000000B70000004E000000230000004D000000610000006400000046000000280000003D0000004E000000D9000000E10000003D000000DC0000003E00000001000000540000003D000000530000007B0000007C000000500000003D0000004D0000004D00000042000000400000003D000000120000002C0000004B0000003E0000003D0000000F00000025000000A5000000840000003D0000007D000000720000006700000087000000860000007D0000008500000082000000DE000000DC000000DD0000005700000056000000F1000000E30000001A0000003E00000000000000EC000000E3000000EB0000001C00000009000000E9000000E30000000F000000A10000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000730065003B005000610063006B00650074002000530069007A0065003D0034003000390036003B004100700070006C00690063006100740069006F006E0020004E0061006D0065003D0022004D006900630072006F0073006F00660074002000530051004C00200053006500720076006500720020004D0061006E006100670065006D0065006E0074002000530074007500640069006F002200000000800500140000004400690061006700720061006D005F0030000000000226001E0000005500730065007200410064006D0069006E0052006F006C0065007300000008000000640062006F00000000022600140000005500730065007200410064006D0069006E00000008000000640062006F000000000226001400000054006F006E006700530050004B0068006F00000008000000640062006F000000000226000C0000004B0068006F0053005000000008000000640062006F00000000022600160000004E0068006100430075006E006700430061007000000008000000640062006F000000000226001C000000530061006E007000680061006D00630061006E006D0075006100000008000000640062006F000000000226001E000000540068006F006E00670053006F004B00790054006800750061007400000008000000640062006F0000000002260022000000530061006E005000680061006D004B0068007500790065006E004D0061006900000008000000640062006F0000000002260010000000530061006E005000680061006D00000008000000640062006F000000000226000E0000004C006F006100690053005000000008000000640062006F000000000226000A0000004C0069006E006B00000008000000640062006F00000000022600140000004B0068007500790065006E004D0061006900000008000000640062006F0000000002260018000000480061006E006700530061006E005800750061007400000008000000640062006F00000000022600120000004700690061006F004400690065006E00000008000000640062006F000000000226001400000044006F006E00480061006E0067004B004800000008000000640062006F000000000226001E000000430068006900540069006500740044006F006E00480061006E006700000008000000640062006F0000000002260012000000420069006E0068004C00750061006E00000008000000640062006F00000000022600180000004100730070004E006500740055007300650072007300000008000000640062006F00000000022600200000004100730070004E0065007400550073006500720052006F006C0065007300000008000000640062006F00000000022400180000004100730070004E006500740052006F006C0065007300000008000000640062006F00000001000000D68509B3BB6BF2459AB8371664F0327008004E0000007B00310036003300340043004400440037002D0030003800380038002D0034003200450033002D0039004600410032002D004200360044003300320035003600330042003900310044007D000000000000000000000000000000000000000000010003000000000000000C0000000B00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062885214)
INSERT [dbo].[sysdiagrams] ([name], [principal_id], [diagram_id], [version], [definition]) VALUES (N'Diagram_1', 1, 2, 1, 0xD0CF11E0A1B11AE1000000000000000000000000000000003E000300FEFF0900060000000000000000000000010000000100000000000000001000003200000001000000FEFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF34000000030000000400000005000000060000000700000008000000090000000A0000000B000000FEFFFFFF0D0000000E0000000F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B0000001C0000001D0000001E0000001F000000200000002100000022000000230000002400000025000000260000002700000028000000290000002A0000002B0000002C0000002D0000002E0000002F0000003000000031000000FEFFFFFFFEFFFFFF53000000FEFFFFFF360000003700000038000000390000003A0000003B0000003C0000003D0000003E0000003F000000400000004100000042000000430000004400000045000000460000004700000048000000490000004A0000004B0000004C0000004D0000004E0000004F000000500000005100000052000000FEFFFFFF5400000055000000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52006F006F007400200045006E00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500FFFFFFFFFFFFFFFF0200000000000000000000000000000000000000000000000000000000000000807D600355D5D6013300000080070000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000201FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000200000006120000000000006F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040002010100000004000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000C000000004B000000000000010043006F006D0070004F0062006A0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000005F00000000000000000430000A1E100C05000080430000000F00FFFF43000000007D000032A3000093580000F8B40000FD4F010000000000A63C0000DE805B10F195D011B0A000AA00BDCB5C0000080030000000000200000300000038002B00000009000000D9E6B0E91C81D011AD5100A0C90F5739F43B7F847F61C74385352986E1D552F8A0327DB2D86295428D98273C25A2DA2D00002C0043200000000000000000000053444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C00002C0043200000000000000000000051444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C3B0000001011000000BB010000003400A50900000700008001000000A8020000008000000B0000805363684772696400000000008AB100004173704E6574526F6C65730000003800A50900000700008002000000B2020000008000001000008053636847726964000A410000BE2300004173704E657455736572436C61696D7300003800A50900000700008003000000B20200000080000010000080536368477269640038310000647D00004173704E6574557365724C6F67696E7300003800A50900000700008004000000B0020000008000000F0000805363684772696400000000009E9D00004173704E657455736572526F6C65730000008400A50900000700008005000000520000000180000059000080436F6E74726F6C00210A000054A5000052656C6174696F6E736869702027464B5F4173704E657455736572526F6C65735F4173704E6574526F6C657327206265747765656E20274173704E6574526F6C65732720616E6420274173704E657455736572526F6C65732700000000002800B50100000700008006000000310000006F00000002800000436F6E74726F6C00670C0000A5AB000000003400A50900000700008007000000A8020000008000000B0000805363684772696400000000002A5D00004173704E657455736572736C00008400A50900000700008008000000520000000180000059000080436F6E74726F6C00210A00008A91000052656C6174696F6E736869702027464B5F4173704E657455736572526F6C65735F4173704E6574557365727327206265747765656E20274173704E657455736572732720616E6420274173704E657455736572526F6C65732700000000002800B50100000700008009000000310000006F00000002800000436F6E74726F6C00670C00004398000000008400A5090000070000800A00000062000000018000005A000080436F6E74726F6C0015160000B377000052656C6174696F6E736869702027464B5F5F4173704E65745573655F5F55736572495F5F353533354139363327206265747765656E20274173704E657455736572732720616E6420274173704E6574557365724C6F67696E7327000000002800B5010000070000800B000000310000006F00000002800000436F6E74726F6C00FE1E0000CF81000000008400A5090000070000800C00000062000000018000005B000080436F6E74726F6C0015160000E129000052656C6174696F6E736869702027464B5F4173704E657455736572436C61696D735F4173704E6574557365727327206265747765656E20274173704E657455736572732720616E6420274173704E657455736572436C61696D73270000002800B5010000070000800D000000310000007100000002800000436F6E74726F6C00581E00005C38000000003000A5090000070000800E000000A202000000800000080000805363684772696400D02000006A4A000042696E684C75616E00007800A5090000070000800F000000620000000180000050000080436F6E74726F6C0015160000FF56000052656C6174696F6E736869702027464B5F5F42696E684C75616E5F5F4D614B485F5F353930363341343727206265747765656E20274173704E657455736572732720616E64202742696E684C75616E2700002800B50100000700008010000000310000006B00000002800000436F6E74726F6C000C1F0000056B000000003800A50900000700008011000000AE020000008000000E000080536368477269640072510000D8BD000043686954696574446F6E48616E67000000003400A50900000700008012000000A40200000080000009000080536368477269640072510000A8930000446F6E48616E674B4872736C00007800A5090000070000801300000062000000018000004D000080436F6E74726F6C00151600007579000052656C6174696F6E736869702027464B5F446F6E48616E674B485F4173704E6574557365727327206265747765656E20274173704E657455736572732720616E642027446F6E48616E674B4827616E2700002800B50100000700008014000000310000006300000002800000436F6E74726F6C00010E0000BFA4000000008000A50900000700008015000000520000000180000056000080436F6E74726F6C00935B0000B5B1000052656C6174696F6E736869702027464B5F5F43686954696574446F6E5F5F4D6144485F5F354145453832423927206265747765656E2027446F6E48616E674B482720616E64202743686954696574446F6E48616E6727610000002800B50100000700008016000000310000006F00000002800000436F6E74726F6C00D95D000059B8000000003000A50900000700008017000000A20200000080000008000080536368477269640000000000000000004769616F4469656E00003400A50900000700008018000000A8020000008000000B000080536368477269646EA65900005EFB000048616E6753616E587561740000003000A509000007000080190000009C02000000800000050000805363684772696400D6380000901401004B686F535069640000003400A5090000070000801A000000A402000000800000090000805363684772696400A659000012DE00004B687579656E4D616900000000002C00A5090000070000801B0000009A0200000080000004000080536368477269640028230000000000004C696E6B00003000A5090000070000801C0000009E02000000800000060000805363684772696400A6590000901401004C6F61695350640000003400A5090000070000801D000000A6020000008000000A00008053636847726964009C18000052CB00004E686143756E67436170736C00003000A5090000070000801E000000A00200000080000007000080536368477269646ED63800002ED1000053616E5068616D6E00006800A5090000070000801F00000062000000018000003D000080436F6E74726F6C00CB410000A2FB000052656C6174696F6E736869702027464B5F4B686F53505F53616E5068616D27206265747765656E202753616E5068616D2720616E6420274B686F53502700000000002800B50100000700008020000000310000005300000002800000436F6E74726F6C00A9370000210C010000007400A5090000070000802100000062000000018000004C000080436F6E74726F6C000D2B00007D63000052656C6174696F6E736869702027464B5F5F42696E684C75616E5F5F4D6153505F5F353946413545383027206265747765656E202753616E5068616D2720616E64202742696E684C75616E2700002800B50100000700008022000000310000006B00000002800000436F6E74726F6C6E372D00000DA5000000007C00A50900000700008023000000620000000180000054000080436F6E74726F6C006142000087BC000052656C6174696F6E736869702027464B5F5F43686954696574446F6E5F5F4D6153505F5F354245324136463227206265747765656E202753616E5068616D2720616E64202743686954696574446F6E48616E672700002800B50100000700008024000000310000006F00000002800000436F6E74726F6C00644A0000ACBB000000007800A50900000700008025000000620000000180000050000080436F6E74726F6C00EB4E000023E7000052656C6174696F6E736869702027464B5F5F53616E5068616D5F5F48616E6753585F5F363933434132313027206265747765656E202748616E6753616E587561742720616E64202753616E5068616D2700002800B50100000700008026000000310000006D00000002800000436F6E74726F6C00E2570000FEEC000000007400A5090000070000802700000062000000018000004B000080436F6E74726F6C00A94300009EFB000052656C6174696F6E736869702027464B5F5F53616E5068616D5F5F4C6F616953505F5F364133304336343927206265747765656E20274C6F616953502720616E64202753616E5068616D275000002800B50100000700008028000000310000006D00000002800000436F6E74726F6C00544E0000190F010000003800A50900000700008029000000AC020000008000000D000080536368477269646E9C1800008CEB000053616E7068616D63616E6D756108000000007800A5090000070000802A00000062000000018000004D000080436F6E74726F6C6EB12E000071E6000052656C6174696F6E736869702027464B5F53616E7068616D63616E6D75615F53616E5068616D27206265747765656E202753616E5068616D2720616E64202753616E7068616D63616E6D75612700000000002800B5010000070000802B000000310000006300000002800000436F6E74726F6C008F1F0000E1EA000000007C00A5090000070000802C000000520000000180000053000080436F6E74726F6C00BD22000073DF000052656C6174696F6E736869702027464B5F53616E7068616D63616E6D75615F4E686143756E6743617027206265747765656E20274E686143756E674361702720616E64202753616E7068616D63616E6D7561272700002800B5010000070000802D000000310000006900000002800000436F6E74726F6C00B8100000B9E6000000003800A5090000070000802E000000B202000000800000100000805363684772696400A6590000E0C4000053616E5068616D4B687579656E4D616900008000A5090000070000802F000000520000000180000058000080436F6E74726F6C00C76300008CD1000052656C6174696F6E736869702027464B5F5F53616E5068616D4B68755F5F4D614B4D5F5F364331393045424227206265747765656E20274B687579656E4D61692720616E64202753616E5068616D4B687579656E4D61692700002800B50100000700008030000000310000006F00000002800000436F6E74726F6C000D66000045D7000000008000A50900000700008031000000620000000180000056000080436F6E74726F6C00EB4E000003CB000052656C6174696F6E736869702027464B5F5F53616E5068616D4B68755F5F4D6153505F5F364430443332463427206265747765656E202753616E5068616D2720616E64202753616E5068616D4B687579656E4D616927692700002800B50100000700008032000000310000006F00000002800000436F6E74726F6C00E25700000CDD000000003400A50900000700008033000000A8020000008000000B000080536368477269646EE2680000000000007379736469616772616D736F00003800A50900000700008034000000AE020000008000000E0000805363684772696400427200009CAE000054686F6E67536F4B7954687561746E7300007C00A50900000700008035000000620000000180000054000080436F6E74726F6C0023440000CDB8000052656C6174696F6E736869702027464B5F5F54686F6E67536F4B79545F5F4D6153505F5F364530313537324427206265747765656E202753616E5068616D2720616E64202754686F6E67536F4B7954687561742700002800B50100000700008036000000310000006F00000002800000436F6E74726F6C6E905A000016BF000000003400A50900000700008037000000A4020000008000000900008053636847726964009C18000014180100546F6E6753504B686F75796500006C00A50900000700008038000000520000000180000041000080436F6E74726F6C00B12E0000EF1C010052656C6174696F6E736869702027464B5F546F6E6753504B686F5F4B686F535027206265747765656E20274B686F53502720616E642027546F6E6753504B686F2700000000002800B50100000700008039000000310000005700000002800000436F6E74726F6C00592E00007F1C010000003800A5090000070000803A000000AE020000008000000E0000805363684772696400BA45000000000000547261636B696E67616374696F6E6D7300003400A5090000070000803B000000A4020000008000000900008053636847726964000A410000F03C00005573657241646D696E72526F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000214334120800000041170000710A00007856341207000000140100004100730070004E006500740052006F006C006500730000000000000000000000000000000100000000000000D008C56200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000710A000000000000020000000200000002000000020000001C010000E60A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C0000004100730070004E006500740052006F006C00650073000000214334120800000041170000670F00007856341207000000140100004100730070004E0065007400550073006500720043006C00610069006D007300000097190800000000000000060000000000000000000000000100000001000000000000A49CE65AD401FB5AD49CE65A5CB9FD5AD401FB5A6801FB5A20E6E65A5CB9FD5AD401FB5A6801FB5AD04A110316000100002F1103E04A1103170001000C2F1103F04A110318000100182F1103004B110319000100242F1103704A110310000100302F1103804A1103110001003C2F1103504A11030E000100482F1103604A11030F000100542F1103504B11031E000100602F1103604B11031F0001006C2F1103304B11031C000100782F000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000670F000000000000040000000400000002000000020000001C010000E60A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000110000004100730070004E0065007400550073006500720043006C00610069006D0073000000214334120800000041170000EC0C00007856341207000000140100004100730070004E006500740055007300650072004C006F00670069006E00730000006C190900000000000000060000000000000000000000000100000001000000000000BC05110318C9FA5A30E6E65AD401FB5A0C6FFB5A3427E75A000400000200000003000000050000000C00000000000000DF0300002004000001000000030000000500000098FEFFFF000000002A0400004704000001000000030000000500000098FEFFFF000000002A040000FC04000000000000000000000600000098FEFFFF000000002A040000190500000E000000030000000500000094FEFFFF000000002A0400002A0500000200000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000EC0C000000000000030000000300000002000000020000001C010000E60A00000000000001000000F2130000DA0A000000000000030000000300000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000110000004100730070004E006500740055007300650072004C006F00670069006E0073000000214334120800000041170000710A00007856341207000000140100004100730070004E0065007400550073006500720052006F006C006500730000002000460069006C00650073002000280078003800360029005C004D006900630072006F0073006F00660074002000530051004C0020005300650072007600650072005C003100320030005C0054006F006F006C0073005C00420069006E006E005C004D0061006E006100670065006D0065006E007400530074007500640069006F005C0054006F006F006C0073005C005600440054005C004400610074006100440065007300690067006E006500720073002E0064006C006C005C00320000006C2F1103304B11031C000100782F000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000710A000000000000020000000200000002000000020000001C010000E60A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000100000004100730070004E0065007400550073006500720052006F006C0065007300000002000B00B80B00008AB10000B80B00000FA800000000000002000000F0F0F00000000000000000000000000000000000010000000600000000000000670C0000A5AB0000ED1200005801000038000000010000020000ED12000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F004100730070004E0065007400550073006500720052006F006C00650073005F004100730070004E006500740052006F006C0065007300214334120800000041170000173700007856341207000000140100004100730070004E00650074005500730065007200730000000000000070026B1958FD971908000000000000000A0000000000000000000000000100000001000000000000A49CE65AD401FB5AD49CE65A5CB9FD5A6CDA1D0118C9FA5A20E6E65A5CB9FD5AD401FB5A6801FB5AD04A110316000100002F1103E04A1103170001000C2F1103F04A110318000100182F1103004B110319000100242F1103704A110310000100302F1103804A1103110001003C2F1103504A11030E000100482F1103604A11030F000100542F1103504B11031E000100602F1103604B11031F0001006C2F1103304B11031C000100782F000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A7290000DD230000000000002D0100000D0000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC070000460500000000000001000000411700001737000000000000140000000C00000002000000020000001C010000E60A00000000000001000000F2130000DA0A000000000000030000000300000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C0000004100730070004E006500740055007300650072007300000002000B00B80B000041940000B80B00009E9D00000000000002000000F0F0F00000000000000000000000000000000000010000000900000000000000670C0000439800000913000058010000320000000100000200000913000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F004100730070004E0065007400550073006500720052006F006C00650073005F004100730070004E00650074005500730065007200730004000B00411700004A7900005D1E00004A7900005D1E0000D683000038310000D68300000000000002000000F0F0F00000000000000000000000000000000000010000000B00000000000000FE1E0000CF810000D41300005801000032000000010000020000D413000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F004100730070004E00650074005500730065005F005F00550073006500720049005F005F003500350033003500410039003600330004000B0041170000C6750000A91D0000C6750000A91D00005C2B00000A4100005C2B00000000000002000000F0F0F00000000000000000000000000000000000010000000D00000000000000581E00005C3800007C130000580100003B0000000100000200007C13000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611F0046004B005F004100730070004E0065007400550073006500720043006C00610069006D0073005F004100730070004E006500740055007300650072007300214334120800000041170000CE1B0000785634120700000014010000420069006E0068004C00750061006E0000000000A0699C1900000000A0699C19A8FD97190500000000000000030000000000000000000000000100000001000000000000D401FB5A0C6FFB5A3427E75AD0ED1D01DCED1D01E8ED1D01F4ED1D0110EE1D0154EE1D0160EE1D019CEE1D01A8EE1D01C4EF1D0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A7290000511F0000000000002D0100000B0000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000CE1B000000000000090000000900000002000000020000001C010000E60A00000000000001000000F2130000DA0A000000000000030000000300000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000009000000420069006E0068004C00750061006E00000004000B0041170000887700005D1E0000887700005D1E00007A580000D02000007A5800000000000002000000F0F0F000000000000000000000000000000000000100000010000000000000000C1F0000056B0000D01200005801000032000000010000020000D012000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611C0046004B005F005F00420069006E0068004C00750061006E005F005F004D0061004B0048005F005F0035003900300036003300410034003700214334120800000041170000670F0000785634120700000014010000430068006900540069006500740044006F006E00480061006E00670000009C1968FD97190500000000000000030000000000000000000000000100000001000000000000D401FB5A0C6FFB5A3427E75A5CB9FD5A6CDA1D0118C9FA5A20E6E65A5CB9FD5AD401FB5A6801FB5AD04A110316000100002F1103E04A1103170001000C2F1103F04A110318000100182F1103004B110319000100242F1103704A110310000100302F1103804A1103110001003C2F1103504A11030E000100482F1103604A11030F000100542F1103504B11031E000100602F1103604B11031F0001006C2F1103304B11031C000100782F000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000670F000000000000040000000400000002000000020000001C010000E60A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000F000000430068006900540069006500740044006F006E00480061006E0067000000214334120800000041170000C420000078563412070000001401000044006F006E00480061006E0067004B004800000070026B190000000070026B1968FD97190600000000000000060000000000000000000000000100000001000000000000A49CE65AD401FB5AD49CE65A5CB9FD5AD401FB5A6801FB5A20E6E65A5CB9FD5AD401FB5A6801FB5AD04A110316000100002F1103E04A1103170001000C2F1103F04A110318000100182F1103004B110319000100242F1103704A110310000100302F1103804A1103110001003C2F1103504A11030E000100482F1103604A11030F000100542F1103504B11031E000100602F1103604B11031F0001006C2F1103304B11031C000100782F000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A7290000DD230000000000002D0100000D0000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000C4200000000000000B0000000B00000002000000020000001C010000E60A00000000000001000000F2130000DA0A000000000000030000000300000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000A00000044006F006E00480061006E0067004B004800000004000B00411700000C7B0000A91D00000C7B0000A91D000010A400007251000010A400000000000002000000F0F0F00000000000000000000000000000000000010000001400000000000000010E0000BFA400001C10000058010000310000000100000200001C10000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61180046004B005F0044006F006E00480061006E0067004B0048005F004100730070004E00650074005500730065007200730002000B002A5D00006CB400002A5D0000D8BD00000000000002000000F0F0F00000000000000000000000000000000000010000001600000000000000D95D000059B80000F01300005801000031000000010000020000F013000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F00430068006900540069006500740044006F006E005F005F004D006100440048005F005F0035004100450045003800320042003900214334120800000041170000EC0C00007856341207000000140100004700690061006F004400690065006E00000000001800000001000000100000001D0000000700000002000000250000000B0000000200000039000000FFFFFFFF020000003E000000FFFFFFFF0200000041000000220000000200000044000000240000000200000050000000330000000200000059000000A9000000020000006F000000FFFFFFFF020000008100000039000000020000008F00000044000000020000009600000045000000100000009C0000004C00000002000000D80000007200000002000000E20000007400000010000000F40000007F00000010000000F900000084000000020000000001000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000EC0C000000000000030000000300000002000000020000001C010000E60A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000090000004700690061006F004400690065006E000000214334120800000041170000670F0000785634120700000014010000480061006E006700530061006E00580075006100740000000000000000000000000000000100000000000000D008C56200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000670F000000000000040000000400000002000000020000001C010000E60A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C000000480061006E006700530061006E00580075006100740000002143341208000000411700005D1400007856341207000000140100004B0068006F0053005000000000000000000000000000000000AC984000000000000010400100000000000000000000000E000000050000001801000000000000000000000000000000000000F800000000000000050000000000000000000000020000000000000000AC984000000000000000000000000000AC98400000000000000040040000002000000030000000000000000000000000A4984000000000000010400000000000000040000000000000004000000000000000000100000000000000050000000000000040000000010000000000000000000040000000000000104004000000200000002000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A72900007F180000000000002D010000080000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC070000460500000000000001000000411700005D14000000000000060000000600000002000000020000001C010000E60A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000060000004B0068006F005300500000002143341208000000411700005D1400007856341207000000140100004B0068007500790065006E004D00610069000000000000000000000005000000010000000000000000000000182AB90B00000000060000000A0000000000000018B7B50B000000000000000000000000000000000200000011000000000000000000000000000000000000000100000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000007013C9750C0ABA0B0C0ABA0B000000000000000000000000040000000000000000000000000000000200000000000000400ABA0B0000000000000000500ABA0B1C000000000000000C000000010000000001000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A72900007F180000000000002D010000080000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC070000460500000000000001000000411700005D14000000000000060000000600000002000000020000001C010000E60A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000A0000004B0068007500790065006E004D00610069000000214334120800000041170000E21100007856341207000000140100004C0069006E006B00000000000000000000000000000000000000000005000000010000000000000000000000702AB90B00000000060000000A0000000000000068B5B50B000000000000000000000000000000000200000011000000000000000000000000000000000000000100000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000007013C975BC0CBA0BBC0CBA0B000000000000000000000000040000000000000000000000000000000200000000000000F00CBA0BFFFFFFFF00000000000DBA0B1B000000000000000C000000010000000001000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000E211000000000000050000000500000002000000020000001C010000E60A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005200000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000050000004C0069006E006B000000214334120800000041170000710A00007856341207000000140100004C006F00610069005300500000000000000000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000710A000000000000020000000200000002000000020000001C010000E60A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000070000004C006F0061006900530050000000214334120800000041170000D81600007856341207000000140100004E0068006100430075006E0067004300610070000000000000AC984000000000000010400100000000000000000000000E000000050000001801000000000000000000000000000000000000F800000000000000050000000000000000000000020000000000000000AC984000000000000000000000000000AC98400000000000000040040000002000000030000000000000000000000000A4984000000000000010400000000000000040000000000000004000000000000000000100000000000000050000000000000040000000010000000000000000000040000000000000104004000000200000002000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A7290000C51A0000000000002D010000090000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000D816000000000000070000000700000002000000020000001C010000E60A00000000000001000000F21300004E06000000000000010000000100000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005E00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000B0000004E0068006100430075006E00670043006100700000002143341208000000411700002B2D0000785634120700000014010000530061006E005000680061006D000000000000000000000000000000000000000000000000000000000000000000000088B1FD5A88B1FD5A98B1FD5A98B1FD5AA0B1FD5AA0B1FD5AA8B1FD5AA8B1FD5AB0B1FD5AB0B1FD5AB8B1FD5AB8B1FD5AC0B1FD5AC0B1FD5AC8B1FD5AC8B1FD5AD0B1FD5AD0B1FD5AD8B1FD5AD8B1FD5AE0B1FD5AE0B1FD5AE8B1FD5AE8B1FD5AF0B1FD5AF0B1FD5AF8B1FD5AF8B1FD5A00B2FD5A00B2FD5A08B2FD5A08B2FD5A10B2FD5A10B2FD5A18B2FD5A18B2FD5A20B2FD5A20B2FD5A28B2FD5A28B2FD5A30B2FD5A30B2FD5A38B2FD5A38B2FD5A40B2FD5A40B2FD5A48B2FD5A48B2000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A7290000DD230000000000002D0100000D0000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC070000460500000000000001000000411700002B2D000000000000100000000C00000002000000020000001C010000E60A00000000000001000000F2130000DA0A000000000000030000000300000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000008000000530061006E005000680061006D00000004000B006243000059FE000062430000D41101008E440000D41101008E440000901401000000000002000000F0F0F00000000000000000000000000000000000010000002000000000000000A9370000210C01000A0B000058010000390000000100000200000A0B000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61100046004B005F004B0068006F00530050005F00530061006E005000680061006D0004000B00364200002ED1000036420000B3BD0000882C0000B3BD0000882C0000386600000000000002000000F0F0F00000000000000000000000000000000000010000002200000000000000372D00000DA50000B31200005801000032000000010000020000B312000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611C0046004B005F005F00420069006E0068004C00750061006E005F005F004D006100530050005F005F003500390046004100350045003800300004000B00F84300002ED10000F8430000B3BD00002A5D0000B3BD00002A5D00003FCD00000000000002000000F0F0F00000000000000000000000000000000000010000002400000000000000644A0000ACBB0000B61300005801000039000000010000020000B613000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F00430068006900540069006500740044006F006E005F005F004D006100530050005F005F003500420045003200410036004600320004000B00A6590000FC02010033570000FC020100335700009EE80000175000009EE800000000000002000000F0F0F00000000000000000000000000000000000010000002600000000000000E2570000FEEC00002A140000580100003E0000000100000200002A14000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611D0046004B005F005F00530061006E005000680061006D005F005F00480061006E006700530058005F005F003600390033004300410032003100300004000B005E650000901401005E6500002011010024450000201101002445000059FE00000000000002000000F0F0F00000000000000000000000000000000000010000002800000000000000544E0000190F01007C13000058010000320000000100000200007C13000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611D0046004B005F005F00530061006E005000680061006D005F005F004C006F0061006900530050005F005F003600410033003000430036003400390021433412080000004117000053190000785634120700000014010000530061006E007000680061006D00630061006E006D007500610000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000EC8C10F00020008000000000000000000000000000000000000000000000000000000000000000000000000000000000CD0900C47BA47800C000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A72900000B1D0000000000002D0100000A0000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC070000460500000000000001000000411700005319000000000000080000000800000002000000020000001C010000E60A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000E000000530061006E007000680061006D00630061006E006D0075006100000004000B00D638000008E800000631000008E800000631000070F80000DD2F000070F800000000000002000000F0F0F00000000000000000000000000000000000010000002B000000000000008F1F0000E1EA0000C81000005801000032000000010000020000C810000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61180046004B005F00530061006E007000680061006D00630061006E006D00750061005F00530061006E005000680061006D0002000B00542400002AE20000542400008CEB00000000000002000000F0F0F00000000000000000000000000000000000010000002D00000000000000B8100000B9E60000ED1200005801000039000000010000020000ED12000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611B0046004B005F00530061006E007000680061006D00630061006E006D00750061005F004E0068006100430075006E006700430061007000214334120800000041170000670F0000785634120700000014010000530061006E005000680061006D004B0068007500790065006E004D00610069000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000978D7BF10029008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000670F000000000000040000000400000002000000020000001C010000E60A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000011000000530061006E005000680061006D004B0068007500790065006E004D0061006900000002000B005E65000012DE00005E65000047D400000000000002000000F0F0F000000000000000000000000000000000000100000030000000000000000D66000045D700001115000058010000410000000100000200001115000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611E0046004B005F005F00530061006E005000680061006D004B00680075005F005F004D0061004B004D005F005F003600430031003900300045004200420004000B0017500000DCE6000033570000DCE60000335700007ECC0000A65900007ECC00000000000002000000F0F0F00000000000000000000000000000000000010000003200000000000000E25700000CDD0000F31400005801000031000000010000020000F314000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611E0046004B005F005F00530061006E005000680061006D004B00680075005F005F004D006100530050005F005F0036004400300044003300320046003400214334120800000041170000E21100007856341207000000140100007300790073006400690061006700720061006D00730000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A9805DF400030080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000E211000000000000050000000500000002000000020000001C010000E60A00000000000001000000F2130000DA0A000000000000030000000300000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C0000007300790073006400690061006700720061006D0073000000214334120800000041170000EC0C0000785634120700000014010000540068006F006E00670053006F004B0079005400680075006100740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000096817AF5000A008000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000EC0C000000000000030000000300000002000000020000001C010000E60A00000000000001000000F2130000DA0A000000000000030000000300000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000F000000540068006F006E00670053006F004B00790054006800750061007400000004000B00BA4500002ED10000BA45000067BE0000FA7D000067BE0000FA7D000088BB00000000000002000000F0F0F00000000000000000000000000000000000010000003600000000000000905A000016BF00009D14000058010000320000000100000200009D14000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611E0046004B005F005F00540068006F006E00670053006F004B00790054005F005F004D006100530050005F005F0036004500300031003500370032004400214334120800000041170000EC0C000078563412070000001401000054006F006E006700530050004B0068006F000000880000008A0000008C0000008E00000090000000920000009400000096000000980000009A0000009C0000009E000000A0000000A2000000A4000000A6000000A8000000AA000000AC000000AE000000B0000000B2000000B4000000B6000000B8000000BA000000BC000000BE000000C0000000C2000000C4000000C6000000C800000000000000608F94F7001C00800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A729000039160000000000002D010000070000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC07000046050000000000000100000041170000EC0C000000000000030000000300000002000000020000001C010000E60A00000000000001000000F21300009408000000000000020000000200000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000A00000054006F006E006700530050004B0068006F00000002000B00D6380000861E0100DD2F0000861E01000000000002000000F0F0F00000000000000000000000000000000000010000003900000000000000592E00007F1C01002B0C000058010000350000000100000200002B0C000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61120046004B005F0054006F006E006700530050004B0068006F005F004B0068006F00530050002143341208000000411700005D14000078563412070000001401000054007200610063006B0069006E00670061006300740069006F006E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008E8072F40002008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A72900007F180000000000002D010000080000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC070000460500000000000001000000411700005D14000000000000060000000600000002000000020000001C010000E60A00000000000001000000F21300004E06000000000000010000000100000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000006600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000F00000054007200610063006B0069006E00670061006300740069006F006E000000214334120800000041170000173700007856341207000000140100005500730065007200410064006D0069006E0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000A7290000DD230000000000002D0100000D0000000C000000070000001C010000F708000053070000390300000B040000D0020000DD04000018060000A203000018060000BC070000460500000000000001000000411700001737000000000000140000000C00000002000000020000001C010000E60A00000000000001000000F21300004E06000000000000010000000100000002000000020000001C010000F70800000100000000000000F21300000804000000000000000000000000000002000000020000001C010000F7080000000000000000000055320000DD23000000000000000000000D00000004000000040000001C010000F70800009B0A00008106000078563412040000005C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000A0000005500730065007200410064006D0069006E0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000FEFFFFFFFEFFFFFF0400000005000000060000000700000008000000090000000A0000000B0000000C0000000D0000000E0000000F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B0000001C000000FEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0100FEFF030A0000FFFFFFFF00000000000000000000000000000000170000004D6963726F736F66742044445320466F726D20322E300010000000456D626564646564204F626A6563740000000000F439B271000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B0000004E61BC00000000000000000000000000000000000000000000000000000000000000000000000000000000000000DBE6B0E91C81D011AD5100A0C90F573900000200C0375C0355D5D601020200001048450000000000000000000000000000000000A40100004400610074006100200053006F0075007200630065003D004E0047005500590045004E0048004900450050005C00530051004C0045005800500052004500530053003B0049006E0069007400690061006C00200043006100740061006C006F0067003D005700650062004700690061007900480061006E00670048006900650075003B005000650072007300690073007400200053006500630075007200690074007900200049006E0066006F003D0054007200750065003B0055007300650072002000490044003D00730061003B004D0075006C007400690070006C00650041006300740069007600650052006500730075006C00740053006500740073003D00460061006C000300440064007300530074007200650061006D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160002000300000006000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000035000000443B00000000000053006300680065006D00610020005500440056002000440065006600610075006C0074000000000000000000000000000000000000000000000000000000000026000200FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000020000001600000000000000440053005200450046002D0053004300480045004D0041002D0043004F004E00540045004E0054005300000000000000000000000000000000000000000000002C0002010500000007000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000003000000460600000000000053006300680065006D00610020005500440056002000440065006600610075006C007400200050006F007300740020005600360000000000000000000000000036000200FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000001D00000012000000000000000C00000000000000A63C00000100260000007300630068005F006C006100620065006C0073005F00760069007300690062006C0065000000010000000B0000001E000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000010000000100000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C0031003600360035000000020000000200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C0031003600360035000000030000000300000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C0031003600360035000000040000000400000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000000500000005000000000000004E000000016A7E2501000000640062006F00000046004B005F004100730070004E0065007400550073006500720052006F006C00650073005F004100730070004E006500740052006F006C006500730000000000000000000000C402000000000600000006000000050000000800000001699C1960699C190000000000000000AD0F0000010000070000000700000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000000800000008000000000000004E0000000100780001000000640062006F00000046004B005F004100730070004E0065007400550073006500720052006F006C00650073005F004100730070004E00650074005500730065007200730000000000000000000000C402000000000900000009000000080000000800000001875C1990875C190000000000000000AD0F00000100000A0000000A000000000000004E000000016A7E2501000000640062006F00000046004B005F005F004100730070004E00650074005500730065005F005F00550073006500720049005F005F003500350033003500410039003600330000000000000000000000C402000000000B0000000B0000000A00000008000000016F5C19106F5C190000000000000000AD0F00000100000C0000000C00000000000000500000000100780001000000640062006F00000046004B005F004100730070004E0065007400550073006500720043006C00610069006D0073005F004100730070004E00650074005500730065007200730000000000000000000000C402000000000D0000000D0000000C0000000800000001755C1910755C190000000000000000AD0F00000100000E0000000E00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000000F0000000F000000000000004A000000016A7E2501000000640062006F00000046004B005F005F00420069006E0068004C00750061006E005F005F004D0061004B0048005F005F003500390030003600330041003400370000000000000000000000C4020000000010000000100000000F0000000800000001EDD70610EDD7060000000000000000AD0F0000010000110000001100000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C0031003600360035000000120000001200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C0031003600360035000000130000001300000000000000420000000100000001000000640062006F00000046004B005F0044006F006E00480061006E0067004B0048005F004100730070004E00650074005500730065007200730000000000000000000000C402000000001400000014000000130000000800000001FDD70690FDD7060000000000000000AD0F00000100001500000015000000000000004E000000016A7E2501000000640062006F00000046004B005F005F00430068006900540069006500740044006F006E005F005F004D006100440048005F005F003500410045004500380032004200390000000000000000000000C40200000000160000001600000015000000080000000146B00BE046B00B0000000000000000AD0F0000010000170000001700000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C0031003600360035000000180000001800000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C0031003600360035000000190000001900000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000001A0000001A00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000001B0000001B00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000001C0000001C00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000001D0000001D00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000001E0000001E00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000001F0000001F00000000000000320000000100000001000000640062006F00000046004B005F004B0068006F00530050005F00530061006E005000680061006D0000000000000000000000C4020000000020000000200000001F00000008000000013DB619003DB6190000000000000000AD0F00000100002100000021000000000000004A0000000100350001000000640062006F00000046004B005F005F00420069006E0068004C00750061006E005F005F004D006100530050005F005F003500390046004100350045003800300000000000000000000000C4020000000022000000220000002100000008000000013FB619003FB6190000000000000000AD0F00000100002300000023000000000000004E000000016A7E2501000000640062006F00000046004B005F005F00430068006900540069006500740044006F006E005F005F004D006100530050005F005F003500420045003200410036004600320000000000000000000000C4020000000024000000240000002300000008000000013DB619803DB6190000000000000000AD0F00000100002500000025000000000000004C000000016A7E2501000000640062006F00000046004B005F005F00530061006E005000680061006D005F005F00480061006E006700530058005F005F003600390033004300410032003100300000000000000000000000C40200000000260000002600000025000000080000000139B6190039B6190000000000000000AD0F00000100002700000027000000000000004C000000016A7E2501000000640062006F00000046004B005F005F00530061006E005000680061006D005F005F004C006F0061006900530050005F005F003600410033003000430036003400390000000000000000000000C4020000000028000000280000002700000008000000013BB619003BB6190000000000000000AD0F0000010000290000002900000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000002A0000002A00000000000000420000000148305E01000000640062006F00000046004B005F00530061006E007000680061006D00630061006E006D00750061005F00530061006E005000680061006D0000000000000000000000C402000000002B0000002B0000002A000000080000000147B6198047B6190000000000000000AD0F00000100002C0000002C00000000000000480000000148305E01000000640062006F00000046004B005F00530061006E007000680061006D00630061006E006D00750061005F004E0068006100430075006E00670043006100700000000000000000000000C402000000002D0000002D0000002C000000080000000141B6190041B6190000000000000000AD0F00000100002E0000002E00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000002F0000002F000000000000004E000000016A7E2501000000640062006F00000046004B005F005F00530061006E005000680061006D004B00680075005F005F004D0061004B004D005F005F003600430031003900300045004200420000000000000000000000C4020000000030000000300000002F000000080000000141B6194041B6190000000000000000AD0F00000100003100000031000000000000004E000000016A7E2501000000640062006F00000046004B005F005F00530061006E005000680061006D004B00680075005F005F004D006100530050005F005F003600440030004400330032004600340000000000000000000000C40200000000320000003200000031000000080000000142B6194042B6190000000000000000AD0F0000010000330000003300000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C0031003600360035000000340000003400000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000003500000035000000000000004E000000016A7E2501000000640062006F00000046004B005F005F00540068006F006E00670053006F004B00790054005F005F004D006100530050005F005F003600450030003100350037003200440000000000000000000000C40200000000360000003600000035000000080000000143B619C043B6190000000000000000AD0F0000010000370000003700000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C0031003600360035000000380000003800000000000000360000000100000001000000640062006F00000046004B005F0054006F006E006700530050004B0068006F005F004B0068006F005300500000000000000000000000C40200000000390000003900000038000000080000000145B6190045B6190000000000000000AD0F00000100003A0000003A00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000003B0000003B00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200390035002C0031002C0031003800370035002C0035002C0031003200340035000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200390035000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200390035002C00310032002C0032003700310035002C00310031002C00310036003600350000005A0000000500000001000000040000002600000027000000130000000700000012000000B1000000820000000F000000070000000E000000A50000007A0000000C00000007000000020000009F000000640000000A0000000700000003000000AB000000600000000800000007000000040000002700000026000000150000001200000011000000270000002600000025000000180000001E000000640000009B0000003800000019000000370000006C000000610000002F0000001A0000002E0000002600000027000000270000001C0000001E00000026000000290000002C0000001D000000290000002700000026000000350000001E000000340000002A00000027000000310000001E0000002E00000095000000640000002A0000001E000000290000009800000077000000230000001E000000110000002400000027000000210000001E0000000E0000001E000000270000001F0000001E0000001900000023000000260000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000730065003B005000610063006B00650074002000530069007A0065003D0034003000390036003B004100700070006C00690063006100740069006F006E0020004E0061006D0065003D0022004D006900630072006F0073006F00660074002000530051004C00200053006500720076006500720020004D0061006E006100670065006D0065006E0074002000530074007500640069006F002200000000800500140000004400690061006700720061006D005F003100000000022600180000004100730070004E006500740052006F006C0065007300000008000000640062006F00000000022600220000004100730070004E0065007400550073006500720043006C00610069006D007300000008000000640062006F00000000022600220000004100730070004E006500740055007300650072004C006F00670069006E007300000008000000640062006F00000000022600200000004100730070004E0065007400550073006500720052006F006C0065007300000008000000640062006F00000000022600180000004100730070004E006500740055007300650072007300000008000000640062006F0000000002260012000000420069006E0068004C00750061006E00000008000000640062006F000000000226001E000000430068006900540069006500740044006F006E00480061006E006700000008000000640062006F000000000226001400000044006F006E00480061006E0067004B004800000008000000640062006F00000000022600120000004700690061006F004400690065006E00000008000000640062006F0000000002260018000000480061006E006700530061006E005800750061007400000008000000640062006F000000000226000C0000004B0068006F0053005000000008000000640062006F00000000022600140000004B0068007500790065006E004D0061006900000008000000640062006F000000000226000A0000004C0069006E006B00000008000000640062006F000000000226000E0000004C006F006100690053005000000008000000640062006F00000000022600160000004E0068006100430075006E006700430061007000000008000000640062006F0000000002260010000000530061006E005000680061006D00000008000000640062006F000000000226001C000000530061006E007000680061006D00630061006E006D0075006100000008000000640062006F0000000002260022000000530061006E005000680061006D004B0068007500790065006E004D0061006900000008000000640062006F00000000022600180000007300790073006400690061006700720061006D007300000008000000640062006F000000000226001E000000540068006F006E00670053006F004B00790054006800750061007400000008000000640062006F000000000226001400000054006F006E006700530050004B0068006F00000008000000640062006F000000000226001E00000054007200610063006B0069006E00670061006300740069006F006E00000008000000640062006F00000000022400140000005500730065007200410064006D0069006E00000008000000640062006F00000001000000D68509B3BB6BF2459AB8371664F0327008004E0000007B00310036003300340043004400440037002D0030003800380038002D0034003200450033002D0039004600410032002D004200360044003300320035003600330042003900310044007D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062885214)
SET IDENTITY_INSERT [dbo].[sysdiagrams] OFF
GO
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'04053', N'Bộ nhớ trong (ROM): ', N'128GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'04053', N'Công nghệ màn hình:', N'IPS LCD')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'04053', N'Độ phân giải:', N'HD+ (720 x 1560 Pixels), Chính 48 MP & Phụ 5 MP, 2 MP, 2 MP, 16 MP')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'04053', N'Dung lượng pin:', N'4000 mAh')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'04053', N'Màn hình rộng:', N'6.39"')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'04053', N'Mạng di động:', N'Hỗ trợ 4G')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'04053', N'RAM:', N'4GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'04053', N'Số khe sim:', N'2 Nano SIM')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'04053', N'Trọng lượng:', N'181g')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'10476', N'Bộ nhớ trong (ROM): ', N'128GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'10476', N'Công nghệ màn hình:', N'AMOLED')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'10476', N'Độ phân giải:', N' Full HD+ (1080 x 2400 Pixels), Chính 48 MP & Phụ 8 MP, 2 MP, 32 MP')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'10476', N'Dung lượng pin:', N'4100 mAh')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'10476', N'Màn hình rộng:', N'6.43"')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'10476', N'Mạng di động:', N'Hỗ trợ 4G')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'10476', N'RAM:', N'8GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'10476', N'Số khe sim:', N'2 Nano SIM')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'10476', N'Trọng lượng:', N'171 g')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'13840', N'Bộ nhớ trong (ROM): ', N'128 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'13840', N'Chip xử lý (CPU):', N'Snapdragon 678 8 nhân')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'13840', N'Công nghệ màn hình:', N'AMOLED')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'13840', N'Độ phân giải:', N'Full HD+ (1080 x 2400 Pixels), Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP, 13 MP')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'13840', N'Dung lượng pin:', N'5000 mAh')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'13840', N'Hệ điều hành: ', N'Android 11')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'13840', N'Màn hình rộng:', N'6.43"')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'13840', N'Mạng di động:', N'Hỗ trợ 4G')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'13840', N'RAM:', N'6 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'13840', N'Số khe sim: ', N'2 Nano SIM')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'16406', N'Bộ nhớ trong (ROM):', N'128 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'16406', N'Chip xử lý (CPU):', N'Snapdragon 732G 8 nhân')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'16406', N'Công nghệ màn hình:', N'AMOLED')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'16406', N'Độ phân giải:', N'Full HD+ (1080 x 2400 Pixels), Chính 108 MP & Phụ 8 MP, 5 MP, 2 MP, 16 MP')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'16406', N'Dung lượng pin:', N'5020 mAh')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'16406', N'Hệ điều hành: ', N'Android 11')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'16406', N'Màn hình rộng:', N'6.67"')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'16406', N'Mạng di động:', N'Hỗ trợ 4G')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'16406', N'RAM:', N' 6 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'16406', N'Số khe sim:', N'2 Nano SIM')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'20152', N'Bộ nhớ trong (ROM):', N'32 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'20152', N'Chip xử lý (CPU):', N'Snapdragon 439 8 nhân')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'20152', N'Công nghệ màn hình:', N'IPS LCD')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'20152', N'Độ phân giải:', N'HD+ (720 x 1600 Pixels), Chính 13 MP & Phụ 2 MP, 8 MP')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'20152', N'Dung lượng pin:', N'5000 mAh')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'20152', N'Hệ điều hành: ', N'Android 11')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'20152', N'Mạng di động:', N' Hỗ trợ 4G')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'20152', N'RAM:', N'3 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'20152', N'Số khe sim:', N'2 Nano SIM')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'21134', N'Bộ nhớ trong (ROM):', N'128 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'21134', N'Chip xử lý (CPU):', N'Exynos 2100 8 nhân')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'21134', N'Công nghệ màn hình:', N'Dynamic AMOLED 2X')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'21134', N'Độ phân giải:', N'Full HD+ (1080 x 2400 Pixels), Chính 12 MP & Phụ 64 MP, 12 MP, 10 MP')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'21134', N'Dung lượng pin:', N'4800 mAh')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'21134', N'Màn hình rộng:', N'6.7"')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'21134', N'Mạng di động:', N'Hỗ trợ 5G')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'21134', N'RAM:', N'8 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'21134', N'Số khe sim:', N' 2 Nano SIM hoặc 1 Nano SIM + 1 eSIM')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'21134', N'Trọng lượng:', N'170 g')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'26674', N'Bộ nhớ trong (ROM): ', N'128GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'26674', N'Công nghệ màn hình:', N'AMOLED')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'26674', N'Độ phân giải:', N' Full HD+ (1080 x 2400 Pixels), Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP, Chính 16 MP & Phụ 2 MP')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'26674', N'Dung lượng pin:', N'4000 mAh')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'26674', N'Màn hình rộng:', N'6.43"')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'26674', N'Mạng di động:', N'Hỗ trợ 4G')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'26674', N'RAM:', N'8GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'26674', N'Số khe sim:', N'2 Nano SIM')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'26674', N'Trọng lượng:', N'164 g')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'28525', N'Bộ nhớ trong (ROM):', N'256 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'28525', N'Chip xử lý (CPU):', N'Exynos 2100 8 nhân')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'28525', N'Công nghệ màn hình: ', N'Dynamic AMOLED 2X')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'28525', N'Độ phân giải:', N'2K+ (1440 x 3200 Pixels), Chính 108 MP & Phụ 12 MP, 10 MP, 10 MP, 40 MP')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'28525', N'Dung lượng pin: ', N'5000 mAh')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'28525', N'Màn hình rộng:', N'6.8"')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'28525', N'Mạng di động:', N'Hỗ trợ 5G')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'28525', N'RAM:', N'12 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'28525', N'Số khe sim:', N'2 Nano SIM hoặc 1 Nano SIM + 1 eSIM')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'28525', N'Trọng lượng:', N'228 g')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'32665', N'Bộ nhớ trong (ROM):', N'128 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'32665', N'Chip xử lý (CPU):', N'Exynos 2100 8 nhân')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'32665', N'Công nghệ màn hình:', N'Dynamic AMOLED 2X')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'32665', N'Độ phân giải:', N'2K+ (1440 x 3200 Pixels), Chính 108 MP & Phụ 12 MP, 10 MP, 10 MP, 40 MP')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'32665', N'Dung lượng pin: ', N'5000 mAh')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'32665', N'Màn hình rộng:', N'6.8"')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'32665', N'Mạng di động: ', N'Hỗ trợ 5G')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'32665', N'RAM: ', N'12 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'32665', N'Số khe sim:', N'2 Nano SIM hoặc 1 Nano SIM + 1 eSIM')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'32665', N'Trọng lượng:', N'228 g')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'38131', N'Bộ nhớ trong (ROM): ', N' 256 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'38131', N'Công nghệ màn hình:', N'AMOLED')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'38131', N'Độ phân giải:', N'2K+ (1440 x 3168 Pixels), Chính 48 MP & Phụ 13 MP, 12 MP, 32 MP')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'38131', N'Dung lượng pin:', N'4200 mAh')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'38131', N'Màn hình rộng:', N'6.78"')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'38131', N'Mạng di động:', N'Hỗ trợ 5G')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'38131', N'RAM:', N'12GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'38131', N'Số khe sim:', N'2 Nano SIM')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'38131', N'Trọng lượng:', N'Màu đen 209 g - Màu xanh 192 g')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'50705', N'Bộ nhớ trong (ROM): ', N'64GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'50705', N'Công nghệ màn hình:', N'AMOLED')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'50705', N'Độ phân giải:', N'Full HD+ (1080 x 2340 Pixels), Chính 48 MP & Phụ 8 MP, 2 MP, 16 MP')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'50705', N'Dung lượng pin:', N'4000 mAh')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'50705', N'Màn hình rộng:', N'6.38"')
GO
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'50705', N'Mạng di động:', N'Hỗ trợ 4G')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'50705', N'RAM:', N'6GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'50705', N'Số khe sim:', N'2 Nano SIM (SIM 2 chung khe thẻ nhớ)')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'50705', N'Trọng lượng:', N'171 g')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'62855', N'Bộ nhớ trong (ROM): ', N'128GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'62855', N'Công nghệ màn hình:', N'AMOLED')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'62855', N'Độ phân giải:', N'Full HD+ (1080 x 2400 Pixels), Chính 12 MP & Phụ 64 MP, 12 MP, 10 MP')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'62855', N'Dung lượng pin:', N'4000 mAh')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'62855', N'Màn hình rộng:', N'6.43"')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'62855', N'Mạng di động:', N'Hỗ trợ 4G')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'62855', N'RAM:', N'8GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'62855', N'Số khe sim:', N'2 Nano SIM')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'62855', N'Trọng lượng:', N'171 g')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'66531', N'Bộ nhớ trong (ROM):', N'64 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'66531', N'Công nghệ màn hình:', N'IPS LCD')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'66531', N'Độ phân giải:', N'HD+ (720 x 1600 Pixels), Chính 13 MP & Phụ 8 MP, 2 MP, 8 MP')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'66531', N'Dung lượng pin: ', N'5000 mAh')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'66531', N'Màn hình rộng:', N'6.5"')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'66531', N'Mạng di động:', N'Hỗ trợ 4G')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'66531', N'RAM:', N'4GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'66531', N'Số khe sim:', N' Hỗ trợ 4G')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'66531', N'Số khe sim:', N'2 Nano SIM')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'66531', N'Trọng lượng:', N'192 g')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'70707', N'Bộ nhớ trong (ROM):', N'256 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'70707', N'Chip xử lý (CPU):', N'Exynos 2100 8 nhân')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'70707', N'Công nghệ màn hình:', N'Dynamic AMOLED 2X')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'70707', N'Độ phân giải:', N'Full HD+ (1080 x 2400 Pixels), Chính 12 MP & Phụ 64 MP, 12 MP, 10 MP')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'70707', N'Dung lượng pin: ', N'4800 mAh')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'70707', N'Màn hình rộng:', N'6.7"')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'70707', N'Mạng di động:', N'Hỗ trợ 5G')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'70707', N'RAM:', N'8 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'70707', N'Số khe sim:', N' 2 Nano SIM hoặc 1 Nano SIM + 1 eSIM')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'70707', N'Trọng lượng:', N'170 g')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'75462', N'Bộ nhớ trong (ROM):', N'128 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'75462', N'Chip xử lý (CPU):', N' Apple A13 Bionic 6 nhân')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'75462', N'Công nghệ màn hình:', N'IPS LCD')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'75462', N'Độ phân giải:', N'828 x 1792 Pixels, 2 camera 12 MP, 12 M')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'75462', N'Dung lượng pin:', N'3110 mAh')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'75462', N'Hệ điều hành:', N' iOS 14')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'75462', N'Màn hình rộng:', N'6.1"')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'75462', N'Mạng di động:', N'Hỗ trợ 4G')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'75462', N'RAM:', N'4 GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'75462', N'Số khe sim:', N'1 Nano SIM & 1 eSIM')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'75462', N'Trọng lượng:', N'194 g')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'83681', N'Bộ nhớ trong (ROM):', N'128GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'83681', N'Công nghệ màn hình:', N'Super AMOLED')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'83681', N'Độ phân giải:', N'Full HD+ (1080 x 2340 Pixels), Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP, 32 MP')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'83681', N'Dung lượng pin:', N'4500 mAh')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'83681', N'Màn hình rộng:', N'6.38"')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'83681', N'Mạng di động:', N'Hỗ trợ 4G')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'83681', N'RAM:', N'8GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'83681', N'Số khe sim:', N'2 Nano SIM')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'83681', N'Trọng lượng:', N'171 g')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'84060', N'Bộ nhớ trong (ROM): ', N'32GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'84060', N'Công nghệ màn hình:', N'IPS LCD')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'84060', N'Độ phân giải:', N' HD+ (720 x 1600 Pixels), Chính 13 MP & Phụ 8 MP, 2 MP, 8 MP')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'84060', N'Dung lượng pin:', N'5000 mAh')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'84060', N'Màn hình rộng:', N'6.43"')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'84060', N'RAM:', N'2GB')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'84060', N'Số khe sim:', N'2 Nano SIM')
INSERT [dbo].[ThongSoKyThuat] ([MaSP], [ThuocTinh], [GiaTri]) VALUES (N'84060', N'Trọng lượng:', N'192 g')
GO
INSERT [dbo].[TongSPKho] ([IDKho], [IDSP], [SL]) VALUES (N'17275', N'70707', 22)
INSERT [dbo].[TongSPKho] ([IDKho], [IDSP], [SL]) VALUES (N'24156', N'20152', 25)
INSERT [dbo].[TongSPKho] ([IDKho], [IDSP], [SL]) VALUES (N'25854', N'75462', 41)
INSERT [dbo].[TongSPKho] ([IDKho], [IDSP], [SL]) VALUES (N'27576', N'16406', 22)
INSERT [dbo].[TongSPKho] ([IDKho], [IDSP], [SL]) VALUES (N'32738', N'10476', 16)
INSERT [dbo].[TongSPKho] ([IDKho], [IDSP], [SL]) VALUES (N'40504', N'83681', 11)
INSERT [dbo].[TongSPKho] ([IDKho], [IDSP], [SL]) VALUES (N'42630', N'28525', 12)
INSERT [dbo].[TongSPKho] ([IDKho], [IDSP], [SL]) VALUES (N'48824', N'21134', 16)
INSERT [dbo].[TongSPKho] ([IDKho], [IDSP], [SL]) VALUES (N'63745', N'13840', 26)
INSERT [dbo].[TongSPKho] ([IDKho], [IDSP], [SL]) VALUES (N'67356', N'32665', 20)
INSERT [dbo].[TongSPKho] ([IDKho], [IDSP], [SL]) VALUES (N'77565', N'62855', 29)
INSERT [dbo].[TongSPKho] ([IDKho], [IDSP], [SL]) VALUES (N'80176', N'26674', 32)
INSERT [dbo].[TongSPKho] ([IDKho], [IDSP], [SL]) VALUES (N'86188', N'38131', 25)
GO
SET IDENTITY_INSERT [dbo].[Trackingaction] ON 

INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (1231, N' ', N'48406', N'SanPham', N'Index', CAST(N'2020-10-22T22:04:43.897' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (2229, N' ', N'48406', N'SanPham', N'Index', CAST(N'2020-10-23T18:55:30.283' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (3229, N' ', N'06866', N'SanPham', N'Index', CAST(N'2020-10-24T23:54:00.880' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (3230, N' ', N'32477', N'SanPham', N'Index', CAST(N'2020-10-24T23:57:47.150' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (3231, N' ', N'06866', N'SanPham', N'Index', CAST(N'2020-10-25T00:01:20.933' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (3232, N' ', N'06866', N'SanPham', N'Index', CAST(N'2020-10-25T00:17:30.800' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (3233, N' ', N'06866', N'SanPham', N'Index', CAST(N'2020-10-25T00:18:54.580' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (3234, N' ', N'32477', N'SanPham', N'Index', CAST(N'2020-10-25T00:19:35.657' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (3235, N' ', N'32477', N'SanPham', N'Index', CAST(N'2020-10-25T00:20:27.403' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (3236, N' ', N'13511', N'SanPham', N'Index', CAST(N'2020-10-25T00:34:45.163' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (3237, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T11:23:37.400' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (3238, N' ', N'60036', N'SanPham', N'Index', CAST(N'2020-10-25T11:24:17.387' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4229, N' ', N'20365', N'SanPham', N'Index', CAST(N'2020-10-25T17:25:59.467' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4230, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T17:26:32.260' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4231, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T17:35:42.460' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4232, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T17:35:51.917' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4233, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T17:36:12.470' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4234, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T17:40:14.283' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4235, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T17:41:53.960' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4236, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T17:42:12.420' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4237, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T17:42:36.670' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4238, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T17:43:23.730' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4239, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T17:43:33.953' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4240, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T17:43:52.627' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4241, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T17:58:28.330' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4242, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T17:58:57.613' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4243, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:01:18.700' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4244, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:01:57.400' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4245, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:02:10.500' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4246, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:02:36.507' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4247, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:04:16.230' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4248, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:04:35.573' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4249, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:06:00.470' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4250, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:06:34.870' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4251, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:07:39.267' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4252, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:08:27.567' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4253, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:08:40.817' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4254, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:08:44.437' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4255, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:10:36.753' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4256, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:11:12.770' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4257, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:11:58.757' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4258, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:12:13.277' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4259, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:12:43.177' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4260, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:24:57.450' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4261, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:25:13.460' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4262, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:25:40.547' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4263, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:26:04.970' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4264, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:26:18.667' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4265, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:27:04.700' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4266, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:27:27.837' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4267, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:28:48.310' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4268, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:29:01.500' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4269, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:29:16.457' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4270, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:29:24.997' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4271, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:29:32.320' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4272, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:29:40.303' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4273, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:30:00.757' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4274, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:30:18.920' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4275, N' ', N'20365', N'SanPham', N'Index', CAST(N'2020-10-25T18:31:43.990' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4276, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-10-25T18:34:21.920' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4277, N' ', N'06866', N'SanPham', N'Index', CAST(N'2020-10-25T21:43:05.430' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4278, N' ', N'20365', N'SanPham', N'Index', CAST(N'2020-10-25T21:43:56.860' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (4279, N' ', N'20365', N'SanPham', N'Index', CAST(N'2020-10-25T21:44:12.110' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (5229, N' ', N'06866', N'SanPham', N'Index', CAST(N'2020-10-27T22:25:44.457' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (5230, N' ', N'34704', N'SanPham', N'Index', CAST(N'2020-11-01T19:05:14.783' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (5231, N' ', N'34704', N'SanPham', N'Index', CAST(N'2020-11-01T19:05:16.843' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (5232, N'khachhanghiepns', N'01125', N'SanPham', N'Index', CAST(N'2020-11-01T19:28:16.870' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (6230, N' ', N'34704', N'SanPham', N'Index', CAST(N'2020-11-03T20:31:11.157' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (7230, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-11-09T21:30:07.250' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (7231, N' ', N'20365', N'SanPham', N'Index', CAST(N'2020-11-09T21:44:26.143' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (7232, N' ', N'13511', N'SanPham', N'Index', CAST(N'2020-11-09T21:48:51.310' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (7233, N' ', N'13511', N'SanPham', N'Index', CAST(N'2020-11-09T21:51:50.247' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (7234, N' ', N'20365', N'SanPham', N'Index', CAST(N'2020-11-09T22:03:03.220' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (7235, N' ', N'34704', N'SanPham', N'Index', CAST(N'2020-11-13T21:44:34.653' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (8235, N' ', N'34704', N'SanPham', N'Index', CAST(N'2020-11-30T21:43:29.437' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (8236, N' ', N'06866', N'SanPham', N'Index', CAST(N'2020-12-07T22:57:44.453' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (9236, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-12-15T16:36:39.933' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (9237, N'khachhanghiepns', N'01125', N'SanPham', N'Index', CAST(N'2020-12-15T16:38:51.770' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (9238, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-12-15T17:10:47.367' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (10236, N' ', N'60036', N'SanPham', N'Index', CAST(N'2020-12-16T22:19:19.107' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (10237, N'administrator', N'01125', N'SanPham', N'Index', CAST(N'2020-12-17T21:58:40.913' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (10238, N'administrator', N'01125', N'SanPham', N'Index', CAST(N'2020-12-17T21:58:48.100' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (10239, N'administrator', N'48406', N'SanPham', N'Index', CAST(N'2020-12-17T21:59:27.693' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (10240, N'administrator', N'20365', N'SanPham', N'Index', CAST(N'2020-12-17T22:00:35.997' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (10241, N' ', N'06866', N'SanPham', N'Index', CAST(N'2020-12-18T22:42:57.400' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (10242, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-12-18T22:52:06.943' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (10243, N' ', N'41112', N'SanPham', N'Index', CAST(N'2020-12-18T22:58:04.427' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (10244, N'thuhuyenptit', N'73015', N'SanPham', N'Index', CAST(N'2020-12-23T13:40:03.457' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (10245, N'thuhuyenptit', N'01125', N'SanPham', N'Index', CAST(N'2020-12-23T13:40:27.647' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (10246, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-12-23T14:53:03.660' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (11246, N'administrator', N'20365', N'SanPham', N'Index', CAST(N'2020-12-23T21:43:16.513' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (11247, N'administrator', N'01125', N'SanPham', N'Index', CAST(N'2020-12-23T21:43:33.973' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (12246, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-12-27T17:13:43.477' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (12247, N' ', N'78261', N'SanPham', N'Index', CAST(N'2020-12-27T17:39:33.537' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (12248, N' ', N'01125', N'SanPham', N'Index', CAST(N'2020-12-27T18:03:43.443' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (12249, N' ', N'78261', N'SanPham', N'Index', CAST(N'2020-12-27T18:04:17.337' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (13246, N' ', N'20337', N'SanPham', N'Index', CAST(N'2021-01-01T13:18:12.480' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (13247, N' ', N'47670', N'SanPham', N'Index', CAST(N'2021-01-01T13:47:30.493' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (13248, N' ', N'47670', N'SanPham', N'Index', CAST(N'2021-01-01T13:52:06.170' AS DateTime))
GO
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (13249, N' ', N'61547', N'SanPham', N'Index', CAST(N'2021-01-01T13:52:11.997' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (13250, N' ', N'83417', N'SanPham', N'Index', CAST(N'2021-01-01T14:00:02.793' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (13251, N' ', N'61547', N'SanPham', N'Index', CAST(N'2021-01-01T14:22:35.887' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (13252, N' ', N'20337', N'SanPham', N'Index', CAST(N'2021-01-01T14:25:51.557' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (13253, N'khachhanghiepns', N'45736', N'SanPham', N'Index', CAST(N'2021-01-01T14:36:53.400' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (13254, N'khachhanghiepns', N'45736', N'SanPham', N'Index', CAST(N'2021-01-01T14:37:04.983' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (13255, N'khachhanghiepns', N'45736', N'SanPham', N'Index', CAST(N'2021-01-01T14:38:00.327' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (13256, N' ', N'20337', N'SanPham', N'Index', CAST(N'2021-01-01T18:34:15.183' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (13257, N' ', N'22744', N'SanPham', N'Index', CAST(N'2021-01-01T18:34:40.980' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (13258, N' ', N'22744', N'SanPham', N'Index', CAST(N'2021-01-01T18:35:11.707' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (13259, N' ', N'20337', N'SanPham', N'Index', CAST(N'2021-01-06T20:35:39.367' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (13260, N' ', N'20337', N'SanPham', N'Index', CAST(N'2021-01-06T20:43:04.570' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (13261, N' ', N'61547', N'SanPham', N'Index', CAST(N'2021-01-06T21:00:28.870' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (13262, N' ', N'61547', N'SanPham', N'Index', CAST(N'2021-01-06T21:01:04.617' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (14259, N' ', N'20337', N'SanPham', N'Index', CAST(N'2021-01-07T22:55:29.600' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (14260, N' ', N'06668', N'SanPham', N'Index', CAST(N'2021-01-07T22:55:41.217' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (14261, N' ', N'88043', N'SanPham', N'Index', CAST(N'2021-01-09T09:11:17.987' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (14262, N' ', N'22808', N'SanPham', N'Index', CAST(N'2021-01-09T09:12:08.813' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (15259, N' ', N'72212', N'SanPham', N'Index', CAST(N'2021-01-12T21:13:30.197' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (15260, N' ', N'72212', N'SanPham', N'Index', CAST(N'2021-01-12T21:13:44.137' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (15261, N' ', N'72212', N'SanPham', N'Index', CAST(N'2021-01-12T21:14:07.987' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (15262, N' ', N'12155', N'SanPham', N'Index', CAST(N'2021-01-12T21:14:23.800' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (15263, N' ', N'12155', N'SanPham', N'Index', CAST(N'2021-01-12T21:14:34.707' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (15264, N' ', N'22744', N'SanPham', N'Index', CAST(N'2021-01-12T21:19:22.130' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (15265, N' ', N'22744', N'SanPham', N'Index', CAST(N'2021-01-12T21:19:51.690' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (15266, N' ', N'12155', N'SanPham', N'Index', CAST(N'2021-01-12T21:20:38.487' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (15267, N'thuhuyenptit', N'46411', N'SanPham', N'Index', CAST(N'2021-01-20T20:00:54.647' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (15268, N'testkhachhang', N'22744', N'SanPham', N'Index', CAST(N'2021-01-21T14:35:01.700' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (15269, N'testkhachhang', N'41833', N'SanPham', N'Index', CAST(N'2021-01-21T14:35:46.160' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (15270, N'testkhachhang', N'41833', N'SanPham', N'Index', CAST(N'2021-01-21T14:35:53.957' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (15271, N' ', N'41833', N'SanPham', N'Index', CAST(N'2021-01-21T14:43:40.370' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (15272, N'testkhachhang', N'41833', N'SanPham', N'Index', CAST(N'2021-01-21T14:44:06.750' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (15273, N'testkhachhang', N'41833', N'SanPham', N'Index', CAST(N'2021-01-21T14:52:15.213' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (15274, N'administrator', N'06668', N'SanPham', N'Index', CAST(N'2021-01-21T14:57:15.707' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (16268, N' ', N'22808', N'SanPham', N'Index', CAST(N'2021-01-21T16:40:37.307' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (16269, N'khachhanghiepnstest', N'20337', N'SanPham', N'Index', CAST(N'2021-01-21T16:54:48.917' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (16270, N'khachhanghiepnstest', N'20337', N'SanPham', N'Index', CAST(N'2021-01-21T16:55:08.833' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (16271, N'testkhachhang', N'20337', N'SanPham', N'Index', CAST(N'2021-01-21T17:02:17.927' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (16272, N'testkhachhang', N'06668', N'SanPham', N'Index', CAST(N'2021-01-21T18:21:20.310' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (16273, N'testkhachhang', N'06668', N'SanPham', N'Index', CAST(N'2021-01-21T18:22:38.327' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (16274, N'testkhachhang', N'06668', N'SanPham', N'Index', CAST(N'2021-01-21T18:23:12.400' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (16275, N'testkhachhang', N'06668', N'SanPham', N'Index', CAST(N'2021-01-21T18:23:38.240' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (17268, N'administrator', N'20337', N'SanPham', N'Index', CAST(N'2021-01-24T17:12:52.803' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (17269, N' ', N'72212', N'SanPham', N'Index', CAST(N'2021-01-24T20:16:26.603' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (17270, N' ', N'72212', N'SanPham', N'Index', CAST(N'2021-01-24T20:17:43.207' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (17271, N'thuhuyenptit', N'72212', N'SanPham', N'Index', CAST(N'2021-01-24T20:18:43.233' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (18268, N'thuhuyenptit', N'20337', N'SanPham', N'Index', CAST(N'2021-01-25T10:42:17.597' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (18269, N' ', N'20337', N'SanPham', N'Index', CAST(N'2021-01-25T11:28:31.703' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19267, N' ', N'06668', N'SanPham', N'Index', CAST(N'2021-03-20T21:40:16.870' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19268, N' ', N'06668', N'SanPham', N'Index', CAST(N'2021-03-20T21:40:57.777' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19269, N' ', N'06668', N'SanPham', N'Index', CAST(N'2021-03-20T21:40:58.493' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19270, N' ', N'06668', N'SanPham', N'Index', CAST(N'2021-03-20T21:42:10.193' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19271, N' ', N'06668', N'SanPham', N'Index', CAST(N'2021-03-20T21:42:45.403' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19272, N' ', N'06668', N'SanPham', N'Index', CAST(N'2021-03-20T21:42:55.380' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19273, N' ', N'06668', N'SanPham', N'Index', CAST(N'2021-03-20T21:48:59.910' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19274, N' ', N'06668', N'SanPham', N'Index', CAST(N'2021-03-20T22:45:52.420' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19275, N' ', N'12155', N'SanPham', N'Index', CAST(N'2021-03-20T23:10:36.350' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19276, N' ', N'12155', N'SanPham', N'Index', CAST(N'2021-03-20T23:17:38.937' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19277, N' ', N'82676', N'SanPham', N'Index', CAST(N'2021-03-20T23:26:03.613' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19278, N' ', N'82676', N'SanPham', N'Index', CAST(N'2021-03-20T23:28:40.093' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19279, N' ', N'25401', N'SanPham', N'Index', CAST(N'2021-03-20T23:58:46.457' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19280, N' ', N'25401', N'SanPham', N'Index', CAST(N'2021-03-20T23:58:56.167' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19281, N' ', N'25401', N'SanPham', N'Index', CAST(N'2021-03-21T00:01:07.757' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19282, N' ', N'54456', N'SanPham', N'Index', CAST(N'2021-03-21T01:20:04.503' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19283, N' ', N'80251', N'SanPham', N'Index', CAST(N'2021-03-21T01:20:17.453' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19284, N' ', N'82676', N'SanPham', N'Index', CAST(N'2021-03-21T01:20:35.133' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19285, N' ', N'80251', N'SanPham', N'Index', CAST(N'2021-04-28T21:28:40.187' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19286, N' ', N'82676', N'SanPham', N'Index', CAST(N'2021-04-28T21:28:51.827' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19287, N' ', N'20337', N'SanPham', N'Index', CAST(N'2021-05-04T22:41:37.603' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19288, N' ', N'12155', N'SanPham', N'Index', CAST(N'2021-05-04T22:42:10.167' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19289, N'administrator', N'75462', N'SanPham', N'Index', CAST(N'2021-05-10T01:43:08.573' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19290, N'administrator', N'75462', N'SanPham', N'Index', CAST(N'2021-05-10T01:51:16.470' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19291, N'administrator', N'75462', N'SanPham', N'Index', CAST(N'2021-05-10T01:53:04.327' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19292, N' ', N'75462', N'SanPham', N'Index', CAST(N'2021-05-10T20:26:14.897' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19293, N' ', N'75462', N'SanPham', N'Index', CAST(N'2021-05-10T20:26:22.080' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19294, N' ', N'13840', N'SanPham', N'Index', CAST(N'2021-05-10T22:03:08.400' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19295, N' ', N'13840', N'SanPham', N'Index', CAST(N'2021-05-10T22:04:42.603' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19296, N' ', N'13840', N'SanPham', N'Index', CAST(N'2021-05-10T22:37:39.113' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19297, N' ', N'13840', N'SanPham', N'Index', CAST(N'2021-05-11T00:46:08.093' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19298, N'administrator', N'13840', N'SanPham', N'Index', CAST(N'2021-05-11T00:50:23.483' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19299, N'administrator', N'16406', N'SanPham', N'Index', CAST(N'2021-05-11T01:15:46.240' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19300, N'administrator', N'13840', N'SanPham', N'Index', CAST(N'2021-05-11T01:16:14.740' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19301, N'administrator', N'32665', N'SanPham', N'Index', CAST(N'2021-05-11T23:10:39.690' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19302, N'administrator', N'28525', N'SanPham', N'Index', CAST(N'2021-05-12T00:02:16.227' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19303, N'administrator', N'26674', N'SanPham', N'Index', CAST(N'2021-05-12T00:02:42.550' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19304, N'administrator', N'26674', N'SanPham', N'Index', CAST(N'2021-05-12T00:02:58.287' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19305, N'administrator', N'32665', N'SanPham', N'Index', CAST(N'2021-05-12T00:03:02.507' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19306, N'administrator', N'28525', N'SanPham', N'Index', CAST(N'2021-05-12T00:03:06.903' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19307, N'administrator', N'13840', N'SanPham', N'Index', CAST(N'2021-05-12T00:03:13.280' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19308, N'administrator', N'16406', N'SanPham', N'Index', CAST(N'2021-05-12T00:03:18.973' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19309, N'administrator', N'21134', N'SanPham', N'Index', CAST(N'2021-05-12T00:03:26.067' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19310, N'administrator', N'10476', N'SanPham', N'Index', CAST(N'2021-05-12T00:39:37.100' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19311, N'administrator', N'04053', N'SanPham', N'Index', CAST(N'2021-05-12T22:21:49.203' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19312, N'customer', N'20152', N'SanPham', N'Index', CAST(N'2021-05-13T00:38:39.897' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19313, N'customer', N'13840', N'SanPham', N'Index', CAST(N'2021-05-13T00:38:45.423' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19314, N'customer', N'20152', N'SanPham', N'Index', CAST(N'2021-05-13T00:38:56.890' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19315, N'customer', N'04053', N'SanPham', N'Index', CAST(N'2021-05-13T00:39:03.253' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19316, N'customer', N'10476', N'SanPham', N'Index', CAST(N'2021-05-13T00:39:18.567' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19317, N'customer', N'04053', N'SanPham', N'Index', CAST(N'2021-05-13T00:39:29.910' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19318, N'customer', N'21134', N'SanPham', N'Index', CAST(N'2021-05-13T00:39:40.113' AS DateTime))
GO
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19319, N'customer', N'04053', N'SanPham', N'Index', CAST(N'2021-05-13T00:40:09.503' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19320, N'customer', N'21134', N'SanPham', N'Index', CAST(N'2021-05-13T00:40:19.457' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19321, N' ', N'10476', N'SanPham', N'Index', CAST(N'2021-05-13T00:47:52.657' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19322, N' ', N'04053', N'SanPham', N'Index', CAST(N'2021-05-13T00:52:20.543' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19323, N' ', N'16406', N'SanPham', N'Index', CAST(N'2021-05-13T00:52:40.850' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19324, N'administrator', N'16406', N'SanPham', N'Index', CAST(N'2021-05-13T00:56:25.087' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19325, N'administrator', N'10476', N'SanPham', N'Index', CAST(N'2021-05-13T00:56:33.503' AS DateTime))
INSERT [dbo].[Trackingaction] ([Id], [Username], [MaSP], [Controller], [Action], [Ngaythuchien]) VALUES (19326, N'administrator', N'38131', N'SanPham', N'Index', CAST(N'2021-05-13T01:10:36.057' AS DateTime))
SET IDENTITY_INSERT [dbo].[Trackingaction] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__sysdiagr__532EC1542C36A995]    Script Date: 5/13/2021 1:44:33 AM ******/
ALTER TABLE [dbo].[sysdiagrams] ADD UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ('noavatar.jpg') FOR [Avatar]
GO
ALTER TABLE [dbo].[BinhLuan] ADD  DEFAULT ('C') FOR [DaTraLoi]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ('NOTTT') FOR [LoaiSP]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ('NOTTT') FOR [HangSX]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHangKH] ([MaDH])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonHangKH]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[KhoSP]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([HangSX])
REFERENCES [dbo].[HangSanXuat] ([HangSX])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([LoaiSP])
REFERENCES [dbo].[LoaiSP] ([MaLoai])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Sanphamcanmua]  WITH CHECK ADD FOREIGN KEY([NhaCungCap_Id])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[Sanphamcanmua]  WITH CHECK ADD FOREIGN KEY([SanPham_Id])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[SanPhamKhuyenMai]  WITH CHECK ADD FOREIGN KEY([MaKM])
REFERENCES [dbo].[KhuyenMai] ([MaKM])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPhamKhuyenMai]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ThongSoKyThuat]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TongSPKho]  WITH CHECK ADD FOREIGN KEY([IDKho])
REFERENCES [dbo].[KhoSP] ([IDKho])
GO
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_alterdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
	


GO
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_creatediagram]
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	


GO
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_dropdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	


GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition]
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	


GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagrams]
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	


GO
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_renamediagram]
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	


GO
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 5/13/2021 1:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_upgraddiagrams]
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	


GO
