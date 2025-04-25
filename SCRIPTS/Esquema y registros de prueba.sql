USE [InventarioGrupoCastores]
GO
/****** Object:  Table [dbo].[Movimientos]    Script Date: 25/04/2025 14:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimientos](
	[idMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[fkIdProducto] [int] NOT NULL,
	[tipoMovimiento] [varchar](9) NOT NULL,
	[cantidad] [int] NOT NULL,
	[fkIdUsuario] [int] NOT NULL,
	[fechaMovimiento] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 25/04/2025 14:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
	[cantidad] [int] NOT NULL,
	[estatus] [varchar](8) NULL,
	[fechaRegistro] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 25/04/2025 14:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 25/04/2025 14:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[correo] [varchar](50) NULL,
	[contrasena] [varchar](25) NULL,
	[fkIdRol] [int] NULL,
	[estatus] [varchar](8) NULL,
 CONSTRAINT [PK__Usuarios__645723A60325DDFA] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Movimientos] ON 
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (1, 1, N'Entrada', 10, 1, CAST(N'2025-04-24T20:53:50.330' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (2, 1, N'Entrada', 10, 1, CAST(N'2025-04-24T20:56:43.337' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (3, 1, N'Entrada', 5, 1, CAST(N'2025-04-24T21:00:01.797' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (4, 1, N'Entrada', 3, 1, CAST(N'2025-04-24T21:03:07.190' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (5, 2, N'Entrada', 3, 1, CAST(N'2025-04-24T21:05:18.357' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (6, 2, N'Entrada', 5, 1, CAST(N'2025-04-24T21:07:32.757' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (7, 4, N'Entrada', 50, 1, CAST(N'2025-04-24T21:07:53.517' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (8, 3, N'Entrada', 10, 1, CAST(N'2025-04-24T21:09:36.163' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (9, 3, N'Entrada', 5, 1, CAST(N'2025-04-24T21:19:10.770' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (10, 2, N'Entrada', 3, 1, CAST(N'2025-04-24T21:25:44.810' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (11, 2, N'Entrada', 37, 1, CAST(N'2025-04-24T21:27:46.543' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (12, 3, N'Entrada', 5, 1, CAST(N'2025-04-24T21:39:35.043' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (13, 3, N'Entrada', 5, 1, CAST(N'2025-04-24T23:38:59.603' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (14, 2, N'Entrada', 5, 1, CAST(N'2025-04-25T00:36:05.277' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (15, 4, N'Entrada', 60, 1, CAST(N'2025-04-25T00:36:14.780' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (16, 6, N'Entrada', 5, 1, CAST(N'2025-04-25T00:36:28.997' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (17, 4, N'Entrada', 90, 1, CAST(N'2025-04-25T00:36:40.603' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (18, 1, N'Entrada', 60, 1, CAST(N'2025-04-25T00:36:48.847' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (19, 1, N'Salida', 10, 2, CAST(N'2025-04-25T11:46:27.680' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (20, 2, N'Salida', 5, 2, CAST(N'2025-04-25T11:46:27.720' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (21, 1, N'Salida', 40, 2, CAST(N'2025-04-25T11:48:03.120' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (22, 2, N'Salida', 20, 2, CAST(N'2025-04-25T11:48:03.163' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (23, 1, N'Salida', 50, 2, CAST(N'2025-04-25T11:49:03.883' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (24, 2, N'Salida', 20, 2, CAST(N'2025-04-25T11:49:03.930' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (25, 2, N'Salida', 15, 2, CAST(N'2025-04-25T11:50:04.227' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (26, 6, N'Salida', 3, 2, CAST(N'2025-04-25T11:50:04.270' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (27, 2, N'Salida', 2, 2, CAST(N'2025-04-25T12:45:03.103' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (28, 6, N'Salida', 1, 2, CAST(N'2025-04-25T12:45:03.150' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (29, 1, N'Entrada', 50, 1, CAST(N'2025-04-25T12:45:50.400' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (30, 5, N'Entrada', 122, 1, CAST(N'2025-04-25T12:45:58.673' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (31, 6, N'Entrada', 3, 1, CAST(N'2025-04-25T12:46:03.000' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (32, 7, N'Entrada', 5, 1, CAST(N'2025-04-25T12:46:48.663' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (33, 8, N'Entrada', 50, 1, CAST(N'2025-04-25T13:13:10.130' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (34, 9, N'Entrada', 50, 1, CAST(N'2025-04-25T13:21:32.993' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (35, 10, N'Entrada', 50, 1, CAST(N'2025-04-25T13:27:47.677' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (36, 4, N'Entrada', 5, 1, CAST(N'2025-04-25T13:51:12.680' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (37, 6, N'Entrada', 6, 1, CAST(N'2025-04-25T13:58:14.810' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (38, 3, N'Entrada', 25, 1, CAST(N'2025-04-25T13:58:26.230' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (39, 4, N'Salida', 100, 2, CAST(N'2025-04-25T14:03:19.753' AS DateTime))
GO
INSERT [dbo].[Movimientos] ([idMovimiento], [fkIdProducto], [tipoMovimiento], [cantidad], [fkIdUsuario], [fechaMovimiento]) VALUES (40, 9, N'Salida', 5, 2, CAST(N'2025-04-25T14:03:19.763' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Movimientos] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 
GO
INSERT [dbo].[Productos] ([id], [nombre], [descripcion], [cantidad], [estatus], [fechaRegistro]) VALUES (1, N'Amazon Fire TV', N'Decodificador de amazon', 50, N'Inactivo', CAST(N'2024-02-02T12:12:22.000' AS DateTime))
GO
INSERT [dbo].[Productos] ([id], [nombre], [descripcion], [cantidad], [estatus], [fechaRegistro]) VALUES (2, N'Canaleta 20x50', N'Canaletas de acero', 13, N'Activo', CAST(N'2025-01-01T20:22:00.000' AS DateTime))
GO
INSERT [dbo].[Productos] ([id], [nombre], [descripcion], [cantidad], [estatus], [fechaRegistro]) VALUES (3, N'Parches Multiusos', N'Parches de multiples usos industriales', 50, N'Activo', CAST(N'2025-04-24T15:29:22.313' AS DateTime))
GO
INSERT [dbo].[Productos] ([id], [nombre], [descripcion], [cantidad], [estatus], [fechaRegistro]) VALUES (4, N'Termos 1L', N'Termos con capacidad de 1L', 105, N'Activo', CAST(N'2025-04-24T15:31:46.733' AS DateTime))
GO
INSERT [dbo].[Productos] ([id], [nombre], [descripcion], [cantidad], [estatus], [fechaRegistro]) VALUES (5, N'Pegamento para CPVC', N'Pegamento para uso particular', 122, N'Activo', CAST(N'2025-04-24T19:43:33.990' AS DateTime))
GO
INSERT [dbo].[Productos] ([id], [nombre], [descripcion], [cantidad], [estatus], [fechaRegistro]) VALUES (6, N'Kola Loka Goterito', N'Kola Loka de goterito', 10, N'Activo', CAST(N'2025-04-24T19:47:48.897' AS DateTime))
GO
INSERT [dbo].[Productos] ([id], [nombre], [descripcion], [cantidad], [estatus], [fechaRegistro]) VALUES (7, N'Martillos', N'Martillos mago de madera marca truper', 5, N'Activo', CAST(N'2025-04-25T12:46:42.113' AS DateTime))
GO
INSERT [dbo].[Productos] ([id], [nombre], [descripcion], [cantidad], [estatus], [fechaRegistro]) VALUES (8, N'Regla de madera ', N'Rega de madera opc.', 50, N'Activo', CAST(N'2025-04-25T13:12:35.187' AS DateTime))
GO
INSERT [dbo].[Productos] ([id], [nombre], [descripcion], [cantidad], [estatus], [fechaRegistro]) VALUES (9, N'Lamina 20x60', N'Lamina ejemplo', 45, N'Activo', CAST(N'2025-04-25T13:20:44.640' AS DateTime))
GO
INSERT [dbo].[Productos] ([id], [nombre], [descripcion], [cantidad], [estatus], [fechaRegistro]) VALUES (10, N'Silicon 50ml', N'ejemplo', 50, N'Inactivo', CAST(N'2025-04-25T13:27:10.330' AS DateTime))
GO
INSERT [dbo].[Productos] ([id], [nombre], [descripcion], [cantidad], [estatus], [fechaRegistro]) VALUES (11, N'Desodorante ', N'desodorante ejemplo', 0, N'Activo', CAST(N'2025-04-25T13:50:37.470' AS DateTime))
GO
INSERT [dbo].[Productos] ([id], [nombre], [descripcion], [cantidad], [estatus], [fechaRegistro]) VALUES (12, N'Termos 2L', N'Termos capacidad 2L', 0, N'Activo', CAST(N'2025-04-25T13:57:34.267' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([id], [descripcion]) VALUES (1, N'Administrador')
GO
INSERT [dbo].[Roles] ([id], [descripcion]) VALUES (2, N'Almacenista')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [correo], [contrasena], [fkIdRol], [estatus]) VALUES (1, N'José Gabriel Lira Chaires', N'gabrielchaires01@gmail.com', N'12345', 1, N'Activo')
GO
INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [correo], [contrasena], [fkIdRol], [estatus]) VALUES (2, N'Juan Pérez Lara', N'juan@gmail.com', N'12345', 2, N'Activo')
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK891skrt52jp908oyi43efyaap]    Script Date: 25/04/2025 14:12:00 ******/
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [UK891skrt52jp908oyi43efyaap] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__298336B6B03ADB32]    Script Date: 25/04/2025 14:12:00 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Movimientos] ADD  DEFAULT (getdate()) FOR [fechaMovimiento]
GO
ALTER TABLE [dbo].[Productos] ADD  DEFAULT ((0)) FOR [cantidad]
GO
ALTER TABLE [dbo].[Productos] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [fkIdProducto_Productos] FOREIGN KEY([fkIdProducto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [fkIdProducto_Productos]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [fkIdUsuario_Usuarios] FOREIGN KEY([fkIdUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [fkIdUsuario_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [fkIdRol] FOREIGN KEY([fkIdRol])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [fkIdRol]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD CHECK  (([tipoMovimiento]='Salida' OR [tipoMovimiento]='Entrada'))
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD CHECK  (([estatus]='Inactivo' OR [estatus]='Activo'))
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [CK__Usuarios__estatu__4222D4EF] CHECK  (([estatus]='Inactivo' OR [estatus]='Activo'))
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [CK__Usuarios__estatu__4222D4EF]
GO
