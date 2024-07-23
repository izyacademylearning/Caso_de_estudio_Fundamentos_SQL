USE [master]
GO
/****** Object:  Database [DBDientesFelices]    Script Date: 19/07/2024 9:01:02 a. m. ******/
CREATE DATABASE [DBDientesFelices]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBDientesFelices', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DBDientesFelices.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBDientesFelices_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DBDientesFelices_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBDientesFelices] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBDientesFelices].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBDientesFelices] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBDientesFelices] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBDientesFelices] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBDientesFelices] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBDientesFelices] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBDientesFelices] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBDientesFelices] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBDientesFelices] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBDientesFelices] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBDientesFelices] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBDientesFelices] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBDientesFelices] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBDientesFelices] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBDientesFelices] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBDientesFelices] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBDientesFelices] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBDientesFelices] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBDientesFelices] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBDientesFelices] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBDientesFelices] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBDientesFelices] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBDientesFelices] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBDientesFelices] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBDientesFelices] SET  MULTI_USER 
GO
ALTER DATABASE [DBDientesFelices] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBDientesFelices] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBDientesFelices] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBDientesFelices] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBDientesFelices] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBDientesFelices] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBDientesFelices] SET QUERY_STORE = OFF
GO
USE [DBDientesFelices]
GO
/****** Object:  Table [dbo].[Citas]    Script Date: 19/07/2024 9:01:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citas](
	[idCitas] [int] IDENTITY(1,1) NOT NULL,
	[FechaHora] [datetime] NULL,
	[idPaciente] [int] NULL,
	[idOdontologo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCitas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 19/07/2024 9:01:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[idEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Costo] [int] NULL,
	[idOdontologo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odontologos]    Script Date: 19/07/2024 9:01:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odontologos](
	[idOdontologo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Telefono] [varchar](20) NULL,
	[CorreoElectronico] [varchar](50) NULL,
	[idEspecialidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idOdontologo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 19/07/2024 9:01:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[idPaciente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[FechaNacimiento] [date] NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL,
	[CorreoElectronico] [varchar](50) NULL,
 CONSTRAINT [PK__Paciente__3214EC275E5FC04C] PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Citas] ON 
GO
INSERT [dbo].[Citas] ([idCitas], [FechaHora], [idPaciente], [idOdontologo]) VALUES (1, CAST(N'2024-07-20T09:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Citas] ([idCitas], [FechaHora], [idPaciente], [idOdontologo]) VALUES (2, CAST(N'2024-07-20T10:00:00.000' AS DateTime), 2, 1)
GO
INSERT [dbo].[Citas] ([idCitas], [FechaHora], [idPaciente], [idOdontologo]) VALUES (3, CAST(N'2024-07-21T09:00:00.000' AS DateTime), 3, 2)
GO
INSERT [dbo].[Citas] ([idCitas], [FechaHora], [idPaciente], [idOdontologo]) VALUES (4, CAST(N'2024-07-21T10:00:00.000' AS DateTime), 4, 2)
GO
INSERT [dbo].[Citas] ([idCitas], [FechaHora], [idPaciente], [idOdontologo]) VALUES (5, CAST(N'2024-07-22T09:00:00.000' AS DateTime), 5, 3)
GO
INSERT [dbo].[Citas] ([idCitas], [FechaHora], [idPaciente], [idOdontologo]) VALUES (6, CAST(N'2024-07-22T10:00:00.000' AS DateTime), 6, 3)
GO
INSERT [dbo].[Citas] ([idCitas], [FechaHora], [idPaciente], [idOdontologo]) VALUES (7, CAST(N'2024-07-23T09:00:00.000' AS DateTime), 7, 4)
GO
INSERT [dbo].[Citas] ([idCitas], [FechaHora], [idPaciente], [idOdontologo]) VALUES (8, CAST(N'2024-07-23T10:00:00.000' AS DateTime), 8, 4)
GO
INSERT [dbo].[Citas] ([idCitas], [FechaHora], [idPaciente], [idOdontologo]) VALUES (9, CAST(N'2024-07-24T09:00:00.000' AS DateTime), 9, 5)
GO
INSERT [dbo].[Citas] ([idCitas], [FechaHora], [idPaciente], [idOdontologo]) VALUES (10, CAST(N'2024-07-24T10:00:00.000' AS DateTime), 10, 5)
GO
INSERT [dbo].[Citas] ([idCitas], [FechaHora], [idPaciente], [idOdontologo]) VALUES (11, CAST(N'2024-07-25T09:00:00.000' AS DateTime), 11, 6)
GO
INSERT [dbo].[Citas] ([idCitas], [FechaHora], [idPaciente], [idOdontologo]) VALUES (12, CAST(N'2024-07-25T10:00:00.000' AS DateTime), 12, 6)
GO
SET IDENTITY_INSERT [dbo].[Citas] OFF
GO
SET IDENTITY_INSERT [dbo].[Especialidad] ON 
GO
INSERT [dbo].[Especialidad] ([idEspecialidad], [Nombre], [Costo], [idOdontologo]) VALUES (1, N'Ortodoncia', 500, 1)
GO
INSERT [dbo].[Especialidad] ([idEspecialidad], [Nombre], [Costo], [idOdontologo]) VALUES (2, N'Endodoncia', 300, 2)
GO
INSERT [dbo].[Especialidad] ([idEspecialidad], [Nombre], [Costo], [idOdontologo]) VALUES (3, N'Periodoncia', 200, 3)
GO
INSERT [dbo].[Especialidad] ([idEspecialidad], [Nombre], [Costo], [idOdontologo]) VALUES (4, N'Odontopediatría', 250, 4)
GO
INSERT [dbo].[Especialidad] ([idEspecialidad], [Nombre], [Costo], [idOdontologo]) VALUES (5, N'Cirugía Oral', 400, 5)
GO
INSERT [dbo].[Especialidad] ([idEspecialidad], [Nombre], [Costo], [idOdontologo]) VALUES (6, N'Implantología', 600, 6)
GO
SET IDENTITY_INSERT [dbo].[Especialidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Odontologos] ON 
GO
INSERT [dbo].[Odontologos] ([idOdontologo], [Nombre], [Apellido], [Telefono], [CorreoElectronico], [idEspecialidad]) VALUES (1, N'Ana', N'Gómez', N'555-1010', N'ana.gomez@example.com', 1)
GO
INSERT [dbo].[Odontologos] ([idOdontologo], [Nombre], [Apellido], [Telefono], [CorreoElectronico], [idEspecialidad]) VALUES (2, N'Luis', N'Martínez', N'555-2020', N'luis.martinez@example.com', 2)
GO
INSERT [dbo].[Odontologos] ([idOdontologo], [Nombre], [Apellido], [Telefono], [CorreoElectronico], [idEspecialidad]) VALUES (3, N'Carlos', N'Rodríguez', N'555-3030', N'carlos.rodriguez@example.com', 3)
GO
INSERT [dbo].[Odontologos] ([idOdontologo], [Nombre], [Apellido], [Telefono], [CorreoElectronico], [idEspecialidad]) VALUES (4, N'María', N'López', N'555-4040', N'maria.lopez@example.com', 4)
GO
INSERT [dbo].[Odontologos] ([idOdontologo], [Nombre], [Apellido], [Telefono], [CorreoElectronico], [idEspecialidad]) VALUES (5, N'Javier', N'Sánchez', N'555-5050', N'javier.sanchez@example.com', 5)
GO
INSERT [dbo].[Odontologos] ([idOdontologo], [Nombre], [Apellido], [Telefono], [CorreoElectronico], [idEspecialidad]) VALUES (6, N'Lucía', N'Fernández', N'555-6060', N'lucia.fernandez@example.com', 6)
GO
SET IDENTITY_INSERT [dbo].[Odontologos] OFF
GO
SET IDENTITY_INSERT [dbo].[Pacientes] ON 
GO
INSERT [dbo].[Pacientes] ([idPaciente], [Nombre], [Apellido], [FechaNacimiento], [Direccion], [Telefono], [CorreoElectronico]) VALUES (1, N'Juan', N'Pérez', CAST(N'1985-04-12' AS Date), N'Calle Falsa 123', N'555-1234', N'juan.perez@example.com')
GO
INSERT [dbo].[Pacientes] ([idPaciente], [Nombre], [Apellido], [FechaNacimiento], [Direccion], [Telefono], [CorreoElectronico]) VALUES (2, N'María', N'Gómez', CAST(N'1990-07-19' AS Date), N'Avenida Siempre Viva 456', N'555-5678', N'maria.gomez@example.com')
GO
INSERT [dbo].[Pacientes] ([idPaciente], [Nombre], [Apellido], [FechaNacimiento], [Direccion], [Telefono], [CorreoElectronico]) VALUES (3, N'Carlos', N'Rodríguez', CAST(N'1982-09-15' AS Date), N'Calle Luna 789', N'555-8765', N'carlos.rodriguez@example.com')
GO
INSERT [dbo].[Pacientes] ([idPaciente], [Nombre], [Apellido], [FechaNacimiento], [Direccion], [Telefono], [CorreoElectronico]) VALUES (4, N'Ana', N'López', CAST(N'1995-01-25' AS Date), N'Calle Sol 321', N'555-4321', N'ana.lopez@example.com')
GO
INSERT [dbo].[Pacientes] ([idPaciente], [Nombre], [Apellido], [FechaNacimiento], [Direccion], [Telefono], [CorreoElectronico]) VALUES (5, N'Luis', N'Martínez', CAST(N'1978-05-30' AS Date), N'Avenida Estrella 654', N'555-6789', N'luis.martinez@example.com')
GO
INSERT [dbo].[Pacientes] ([idPaciente], [Nombre], [Apellido], [FechaNacimiento], [Direccion], [Telefono], [CorreoElectronico]) VALUES (6, N'Lucía', N'Hernández', CAST(N'1988-11-02' AS Date), N'Calle Viento 987', N'555-2345', N'lucia.hernandez@example.com')
GO
INSERT [dbo].[Pacientes] ([idPaciente], [Nombre], [Apellido], [FechaNacimiento], [Direccion], [Telefono], [CorreoElectronico]) VALUES (7, N'Miguel', N'González', CAST(N'1983-03-18' AS Date), N'Avenida Mar 741', N'555-7890', N'miguel.gonzalez@example.com')
GO
INSERT [dbo].[Pacientes] ([idPaciente], [Nombre], [Apellido], [FechaNacimiento], [Direccion], [Telefono], [CorreoElectronico]) VALUES (8, N'Sofía', N'Díaz', CAST(N'1992-08-08' AS Date), N'Calle Río 258', N'555-3456', N'sofia.diaz@example.com')
GO
INSERT [dbo].[Pacientes] ([idPaciente], [Nombre], [Apellido], [FechaNacimiento], [Direccion], [Telefono], [CorreoElectronico]) VALUES (9, N'Diego', N'Pérez', CAST(N'1986-12-24' AS Date), N'Calle Bosque 147', N'555-8901', N'diego.perez@example.com')
GO
INSERT [dbo].[Pacientes] ([idPaciente], [Nombre], [Apellido], [FechaNacimiento], [Direccion], [Telefono], [CorreoElectronico]) VALUES (10, N'Elena', N'Morales', CAST(N'1991-04-01' AS Date), N'Avenida Colina 369', N'555-4567', N'elena.morales@example.com')
GO
INSERT [dbo].[Pacientes] ([idPaciente], [Nombre], [Apellido], [FechaNacimiento], [Direccion], [Telefono], [CorreoElectronico]) VALUES (11, N'Javier', N'Ramos', CAST(N'1980-10-05' AS Date), N'Calle Lago 963', N'555-9012', N'javier.ramos@example.com')
GO
INSERT [dbo].[Pacientes] ([idPaciente], [Nombre], [Apellido], [FechaNacimiento], [Direccion], [Telefono], [CorreoElectronico]) VALUES (12, N'Patricia', N'Sánchez', CAST(N'1987-06-11' AS Date), N'Avenida Montaña 753', N'555-5670', N'patricia.sanchez@example.com')
GO
SET IDENTITY_INSERT [dbo].[Pacientes] OFF
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD FOREIGN KEY([idOdontologo])
REFERENCES [dbo].[Odontologos] ([idOdontologo])
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Pacientes] ([idPaciente])
GO
ALTER TABLE [dbo].[Especialidad]  WITH CHECK ADD FOREIGN KEY([idOdontologo])
REFERENCES [dbo].[Odontologos] ([idOdontologo])
GO
ALTER TABLE [dbo].[Odontologos]  WITH CHECK ADD  CONSTRAINT [FK_Especialidad] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[Especialidad] ([idEspecialidad])
GO
ALTER TABLE [dbo].[Odontologos] CHECK CONSTRAINT [FK_Especialidad]
GO
USE [master]
GO
ALTER DATABASE [DBDientesFelices] SET  READ_WRITE 
GO
