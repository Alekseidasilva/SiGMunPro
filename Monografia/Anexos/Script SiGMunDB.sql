USE [master]
GO
/****** Object:  Database [SiGMunDB]    Script Date: 18/10/2020 16:30:30 ******/
CREATE DATABASE [SiGMunDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SiGMunDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SiGMunDB_Primary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SiGMunDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SiGMunDB_Primary.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SiGMunDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SiGMunDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SiGMunDB] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [SiGMunDB] SET ANSI_NULLS ON 
GO
ALTER DATABASE [SiGMunDB] SET ANSI_PADDING ON 
GO
ALTER DATABASE [SiGMunDB] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [SiGMunDB] SET ARITHABORT ON 
GO
ALTER DATABASE [SiGMunDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SiGMunDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SiGMunDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SiGMunDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SiGMunDB] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [SiGMunDB] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [SiGMunDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SiGMunDB] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [SiGMunDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SiGMunDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SiGMunDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SiGMunDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SiGMunDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SiGMunDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SiGMunDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SiGMunDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SiGMunDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SiGMunDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SiGMunDB] SET  MULTI_USER 
GO
ALTER DATABASE [SiGMunDB] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [SiGMunDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SiGMunDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SiGMunDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SiGMunDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SiGMunDB', N'ON'
GO
ALTER DATABASE [SiGMunDB] SET QUERY_STORE = OFF
GO
USE [SiGMunDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__MigrationLog]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationLog](
	[SqlHash] [binary](64) NOT NULL,
	[StartTime] [datetime2](7) NOT NULL,
	[EndTime] [datetime2](7) NULL,
	[SqlText] [nvarchar](max) NOT NULL,
	[WasSuccessful] [bit] NOT NULL,
	[Error] [nvarchar](max) NULL,
	[Author] [nvarchar](250) NULL,
	[Build] [nvarchar](50) NULL,
 CONSTRAINT [PK_MigrationLog] PRIMARY KEY CLUSTERED 
(
	[SqlHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Bairros]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Bairros](
	[BairroId] [int] NOT NULL,
	[BairroNome] [varchar](50) NOT NULL,
	[BairroComunaId] [int] NOT NULL,
 CONSTRAINT [PK_BairroId] PRIMARY KEY CLUSTERED 
(
	[BairroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Bancos]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Bancos](
	[BancoId] [int] NOT NULL,
	[BancoNome] [varchar](100) NOT NULL,
	[BancoSigla] [varchar](20) NOT NULL,
	[BancoEstado] [bit] NOT NULL,
 CONSTRAINT [PK_BancoId] PRIMARY KEY CLUSTERED 
(
	[BancoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Comunas]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Comunas](
	[ComunaId] [int] IDENTITY(1,1) NOT NULL,
	[ComunaNome] [varchar](50) NOT NULL,
	[ComunaMunicipioId] [int] NOT NULL,
 CONSTRAINT [PK_ComunaId] PRIMARY KEY CLUSTERED 
(
	[ComunaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_DocsFinalidades]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_DocsFinalidades](
	[FinalidadeId] [int] IDENTITY(1,1) NOT NULL,
	[FinalidadeNome] [varchar](max) NOT NULL,
	[FinalidadeValor] [decimal](18, 2) NOT NULL,
	[FinalidadeEstado] [bit] NOT NULL,
	[IdCadastrador] [int] NOT NULL,
 CONSTRAINT [PK_FinalidadeId] PRIMARY KEY CLUSTERED 
(
	[FinalidadeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_EstadoCivil]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_EstadoCivil](
	[EstadoCivilId] [int] NOT NULL,
	[EstadoCivilNome] [varchar](20) NOT NULL,
 CONSTRAINT [PK_EstadoCivilId] PRIMARY KEY CLUSTERED 
(
	[EstadoCivilId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_FormasPagamento]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_FormasPagamento](
	[FormaPagamentoId] [int] NOT NULL,
	[FormaPagamentoNome] [varchar](50) NOT NULL,
	[FormaPagamentoBancoId] [int] NOT NULL,
	[FormaPagamentoUsuarioId] [int] NOT NULL,
 CONSTRAINT [PK_FormaPagamentoId] PRIMARY KEY CLUSTERED 
(
	[FormaPagamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Generos]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Generos](
	[GeneroId] [int] NOT NULL,
	[GeneroNome] [varchar](20) NOT NULL,
 CONSTRAINT [PK_GeneroId] PRIMARY KEY CLUSTERED 
(
	[GeneroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_GrauParentesco]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_GrauParentesco](
	[GrauParentescoId] [int] NOT NULL,
	[GrauParentescoIdNome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GrauParentescoId] PRIMARY KEY CLUSTERED 
(
	[GrauParentescoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_GrausAcademicos]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_GrausAcademicos](
	[GrauAcademicoId] [int] IDENTITY(1,1) NOT NULL,
	[GrauMunicipeNM] [bigint] NULL,
	[GrauNivelAcademicoId] [int] NOT NULL,
	[GrauAcademicoIdAnoConclusao] [int] NOT NULL,
	[IdCadastrador] [int] NOT NULL,
 CONSTRAINT [PK_GrauAcademicoId] PRIMARY KEY CLUSTERED 
(
	[GrauAcademicoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Moradas]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Moradas](
	[MoradaId] [int] IDENTITY(1,1) NOT NULL,
	[MoradaMunicuipeNM] [bigint] NOT NULL,
	[MoradaCasaNumero] [varchar](20) NULL,
	[MoradaRua] [varchar](200) NULL,
	[MoradaZona] [varchar](20) NULL,
	[MoradaBairroId] [int] NOT NULL,
	[MoradaDataCadastro] [date] NOT NULL,
	[MoradaEstado] [bit] NOT NULL,
	[IdCadastrador] [int] NOT NULL,
 CONSTRAINT [PK_MoradaMunicipeNM] PRIMARY KEY CLUSTERED 
(
	[MoradaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Municipes]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Municipes](
	[MunicipeId] [int] IDENTITY(1,1) NOT NULL,
	[MunicipeNM] [bigint] NOT NULL,
	[MunicipeNomeCompleto] [varchar](100) NOT NULL,
	[MunicipeDataNascimento] [date] NOT NULL,
	[MunicipeNDocIdent] [varchar](50) NOT NULL,
	[MunicipeTipoDocIdentificacao] [int] NOT NULL,
	[MunicipeDocDataEmissao] [date] NOT NULL,
	[MunicipeDocDataValidade] [date] NOT NULL,
	[MunicipeNIF] [varchar](50) NOT NULL,
	[MunicipeGenero] [int] NOT NULL,
	[MunicipeEstadoCivil] [int] NOT NULL,
	[MunicipeTelefone1] [varchar](15) NOT NULL,
	[MunicipeTelefone2] [varchar](15) NULL,
	[MunicipeEmail] [varchar](50) NULL,
	[MunicipeEstado] [bit] NOT NULL,
	[MunicipeDataCadastro] [datetime] NOT NULL,
	[MunicipeParenteNM] [bigint] NOT NULL,
	[MunicipeGrauParentescoId] [int] NOT NULL,
	[IdCadastrador] [int] NOT NULL,
 CONSTRAINT [PK_MunicipenNumero] PRIMARY KEY CLUSTERED 
(
	[MunicipeNM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Municipios]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Municipios](
	[MunicipioId] [int] IDENTITY(1,1) NOT NULL,
	[MunicipioNome] [varchar](50) NOT NULL,
	[MunicipioProvinciaId] [int] NULL,
 CONSTRAINT [PK_MunicipioId] PRIMARY KEY CLUSTERED 
(
	[MunicipioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_NiveisAcademicos]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_NiveisAcademicos](
	[NivelAcademicoId] [int] IDENTITY(1,1) NOT NULL,
	[NivelAcademicoNome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_NivelAcademicoId] PRIMARY KEY CLUSTERED 
(
	[NivelAcademicoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Operacao]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Operacao](
	[OperacaoId] [int] NOT NULL,
	[OperacaoMunicipeNM] [bigint] NOT NULL,
	[OperacaoTipoDocumentoId] [int] NOT NULL,
	[OperacaoDocsFinalidadeId] [int] NOT NULL,
	[OperacaoFormaPagamentoId] [int] NOT NULL,
	[OperacaoValorTotal] [decimal](18, 2) NOT NULL,
	[OperacaoData] [date] NOT NULL,
	[IdCadastrador] [int] NOT NULL,
 CONSTRAINT [PK_OperacaoId] PRIMARY KEY CLUSTERED 
(
	[OperacaoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Perfil]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Perfil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [bit] NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[IdCadastrador] [int] NOT NULL,
 CONSTRAINT [PK_dbo.TB_Perfil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Permissoes]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Permissoes](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.TB_PerfilUsuario] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Provincias]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Provincias](
	[ProvinciaId] [int] NOT NULL,
	[ProvinciaNome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProvinciaId] PRIMARY KEY CLUSTERED 
(
	[ProvinciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_TipoDocIdentificacao]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_TipoDocIdentificacao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_TiposDocumentos]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_TiposDocumentos](
	[DocumentoId] [int] NOT NULL,
	[DocumentoNome] [varchar](max) NOT NULL,
	[DocumentoUsuarioId] [int] NOT NULL,
 CONSTRAINT [PK_DocumentoId] PRIMARY KEY CLUSTERED 
(
	[DocumentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_UsuarioLogin]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_UsuarioLogin](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [int] NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Senha] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.TB_UsuarioLogin] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Usuarios]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomeCompleto] [nvarchar](max) NULL,
	[Estado] [bit] NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
	[Email] [nvarchar](256) NULL,
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
	[IdCadastrador] [int] NOT NULL,
 CONSTRAINT [PK_TB_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_UsuariosAfirmacoes]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_UsuariosAfirmacoes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.TB_UsuariosAfirmacoes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Velocipedes]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Velocipedes](
	[VelocipedeId] [int] IDENTITY(1,1) NOT NULL,
	[VelocipedeMunicipeNM] [bigint] NOT NULL,
	[VelocipedeNLivrete] [int] NOT NULL,
	[VelocipedeNChapa] [varchar](30) NOT NULL,
	[VelocipedeMarca] [int] NOT NULL,
	[VelocipedeNQuadro] [varchar](30) NOT NULL,
	[VelocipedeCom_S_Motor] [bit] NOT NULL,
	[VelocipedeNMotor] [varchar](50) NULL,
	[VelocipedeDestinadoServico] [varchar](100) NULL,
	[VelocipedeCilindragem] [varchar](10) NULL,
	[VelocipedeCor] [varchar](30) NULL,
	[IdCadastrador] [int] NOT NULL,
 CONSTRAINT [PK_VelocipeId] PRIMARY KEY CLUSTERED 
(
	[VelocipedeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 18/10/2020 16:30:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[TB_Perfil]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 18/10/2020 16:30:30 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[TB_Permissoes]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 18/10/2020 16:30:30 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[TB_Permissoes]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 18/10/2020 16:30:30 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[TB_UsuarioLogin]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 18/10/2020 16:30:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[TB_Usuarios]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 18/10/2020 16:30:30 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[TB_UsuariosAfirmacoes]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[__MigrationLog] ADD  DEFAULT ((0)) FOR [WasSuccessful]
GO
ALTER TABLE [dbo].[TB_Bairros]  WITH CHECK ADD  CONSTRAINT [FK_ComunaQPertenceOBairro] FOREIGN KEY([BairroComunaId])
REFERENCES [dbo].[TB_Comunas] ([ComunaId])
GO
ALTER TABLE [dbo].[TB_Bairros] CHECK CONSTRAINT [FK_ComunaQPertenceOBairro]
GO
ALTER TABLE [dbo].[TB_Comunas]  WITH CHECK ADD  CONSTRAINT [FK_MunicipioQPertenceAComuna] FOREIGN KEY([ComunaMunicipioId])
REFERENCES [dbo].[TB_Municipios] ([MunicipioId])
GO
ALTER TABLE [dbo].[TB_Comunas] CHECK CONSTRAINT [FK_MunicipioQPertenceAComuna]
GO
ALTER TABLE [dbo].[TB_DocsFinalidades]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioQCadastraAFinalidade] FOREIGN KEY([IdCadastrador])
REFERENCES [dbo].[TB_Usuarios] ([Id])
GO
ALTER TABLE [dbo].[TB_DocsFinalidades] CHECK CONSTRAINT [FK_UsuarioQCadastraAFinalidade]
GO
ALTER TABLE [dbo].[TB_FormasPagamento]  WITH CHECK ADD  CONSTRAINT [FK_BancoAssociadoAformaDePagamento] FOREIGN KEY([FormaPagamentoBancoId])
REFERENCES [dbo].[TB_Bancos] ([BancoId])
GO
ALTER TABLE [dbo].[TB_FormasPagamento] CHECK CONSTRAINT [FK_BancoAssociadoAformaDePagamento]
GO
ALTER TABLE [dbo].[TB_FormasPagamento]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioQCadastraAFormaPagamento] FOREIGN KEY([FormaPagamentoUsuarioId])
REFERENCES [dbo].[TB_Usuarios] ([Id])
GO
ALTER TABLE [dbo].[TB_FormasPagamento] CHECK CONSTRAINT [FK_UsuarioQCadastraAFormaPagamento]
GO
ALTER TABLE [dbo].[TB_GrausAcademicos]  WITH CHECK ADD  CONSTRAINT [FK_GrauAcademicoDoMunicipe] FOREIGN KEY([GrauMunicipeNM])
REFERENCES [dbo].[TB_Municipes] ([MunicipeNM])
GO
ALTER TABLE [dbo].[TB_GrausAcademicos] CHECK CONSTRAINT [FK_GrauAcademicoDoMunicipe]
GO
ALTER TABLE [dbo].[TB_GrausAcademicos]  WITH CHECK ADD  CONSTRAINT [FK_GrauNivelAcademico] FOREIGN KEY([GrauNivelAcademicoId])
REFERENCES [dbo].[TB_NiveisAcademicos] ([NivelAcademicoId])
GO
ALTER TABLE [dbo].[TB_GrausAcademicos] CHECK CONSTRAINT [FK_GrauNivelAcademico]
GO
ALTER TABLE [dbo].[TB_GrausAcademicos]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioQCadastraOGrauAcademico] FOREIGN KEY([IdCadastrador])
REFERENCES [dbo].[TB_Usuarios] ([Id])
GO
ALTER TABLE [dbo].[TB_GrausAcademicos] CHECK CONSTRAINT [FK_UsuarioQCadastraOGrauAcademico]
GO
ALTER TABLE [dbo].[TB_Moradas]  WITH CHECK ADD  CONSTRAINT [FK_BairroQPertenceAMorada] FOREIGN KEY([MoradaBairroId])
REFERENCES [dbo].[TB_Bairros] ([BairroId])
GO
ALTER TABLE [dbo].[TB_Moradas] CHECK CONSTRAINT [FK_BairroQPertenceAMorada]
GO
ALTER TABLE [dbo].[TB_Moradas]  WITH CHECK ADD  CONSTRAINT [FK_MoradaQPertenceOMunicipe] FOREIGN KEY([MoradaMunicuipeNM])
REFERENCES [dbo].[TB_Municipes] ([MunicipeNM])
GO
ALTER TABLE [dbo].[TB_Moradas] CHECK CONSTRAINT [FK_MoradaQPertenceOMunicipe]
GO
ALTER TABLE [dbo].[TB_Moradas]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioQCadastraAMorada] FOREIGN KEY([IdCadastrador])
REFERENCES [dbo].[TB_Usuarios] ([Id])
GO
ALTER TABLE [dbo].[TB_Moradas] CHECK CONSTRAINT [FK_UsuarioQCadastraAMorada]
GO
ALTER TABLE [dbo].[TB_Municipes]  WITH CHECK ADD  CONSTRAINT [FK_EstadoCivilDoMunicipe] FOREIGN KEY([MunicipeEstadoCivil])
REFERENCES [dbo].[TB_EstadoCivil] ([EstadoCivilId])
GO
ALTER TABLE [dbo].[TB_Municipes] CHECK CONSTRAINT [FK_EstadoCivilDoMunicipe]
GO
ALTER TABLE [dbo].[TB_Municipes]  WITH CHECK ADD  CONSTRAINT [FK_GeneroDoMunicipe] FOREIGN KEY([MunicipeGenero])
REFERENCES [dbo].[TB_Generos] ([GeneroId])
GO
ALTER TABLE [dbo].[TB_Municipes] CHECK CONSTRAINT [FK_GeneroDoMunicipe]
GO
ALTER TABLE [dbo].[TB_Municipes]  WITH CHECK ADD  CONSTRAINT [FK_GrauParentescoDoParenteDoMunicipe] FOREIGN KEY([MunicipeGrauParentescoId])
REFERENCES [dbo].[TB_GrauParentesco] ([GrauParentescoId])
GO
ALTER TABLE [dbo].[TB_Municipes] CHECK CONSTRAINT [FK_GrauParentescoDoParenteDoMunicipe]
GO
ALTER TABLE [dbo].[TB_Municipes]  WITH CHECK ADD  CONSTRAINT [FK_NMdoParenteDoMunicipe] FOREIGN KEY([MunicipeParenteNM])
REFERENCES [dbo].[TB_Municipes] ([MunicipeNM])
GO
ALTER TABLE [dbo].[TB_Municipes] CHECK CONSTRAINT [FK_NMdoParenteDoMunicipe]
GO
ALTER TABLE [dbo].[TB_Municipes]  WITH CHECK ADD  CONSTRAINT [FK_TipoDocIdentificacaoDoMunicipe] FOREIGN KEY([MunicipeTipoDocIdentificacao])
REFERENCES [dbo].[TB_TipoDocIdentificacao] ([Id])
GO
ALTER TABLE [dbo].[TB_Municipes] CHECK CONSTRAINT [FK_TipoDocIdentificacaoDoMunicipe]
GO
ALTER TABLE [dbo].[TB_Municipes]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioQCadastraOMunicipe] FOREIGN KEY([IdCadastrador])
REFERENCES [dbo].[TB_Usuarios] ([Id])
GO
ALTER TABLE [dbo].[TB_Municipes] CHECK CONSTRAINT [FK_UsuarioQCadastraOMunicipe]
GO
ALTER TABLE [dbo].[TB_Municipios]  WITH CHECK ADD  CONSTRAINT [FK_ProvinciaQPertenceOMunicipio] FOREIGN KEY([MunicipioProvinciaId])
REFERENCES [dbo].[TB_Provincias] ([ProvinciaId])
GO
ALTER TABLE [dbo].[TB_Municipios] CHECK CONSTRAINT [FK_ProvinciaQPertenceOMunicipio]
GO
ALTER TABLE [dbo].[TB_Operacao]  WITH CHECK ADD  CONSTRAINT [FK_FinalidadeDoDocumentoOperacao] FOREIGN KEY([OperacaoDocsFinalidadeId])
REFERENCES [dbo].[TB_DocsFinalidades] ([FinalidadeId])
GO
ALTER TABLE [dbo].[TB_Operacao] CHECK CONSTRAINT [FK_FinalidadeDoDocumentoOperacao]
GO
ALTER TABLE [dbo].[TB_Operacao]  WITH CHECK ADD  CONSTRAINT [FK_FormaPagamentoDaOperacao] FOREIGN KEY([OperacaoFormaPagamentoId])
REFERENCES [dbo].[TB_FormasPagamento] ([FormaPagamentoId])
GO
ALTER TABLE [dbo].[TB_Operacao] CHECK CONSTRAINT [FK_FormaPagamentoDaOperacao]
GO
ALTER TABLE [dbo].[TB_Operacao]  WITH CHECK ADD  CONSTRAINT [FK_MunicipeQSolicitaAOpercao] FOREIGN KEY([OperacaoMunicipeNM])
REFERENCES [dbo].[TB_Municipes] ([MunicipeNM])
GO
ALTER TABLE [dbo].[TB_Operacao] CHECK CONSTRAINT [FK_MunicipeQSolicitaAOpercao]
GO
ALTER TABLE [dbo].[TB_Operacao]  WITH CHECK ADD  CONSTRAINT [FK_TipoDeDocumentoOperacao] FOREIGN KEY([OperacaoTipoDocumentoId])
REFERENCES [dbo].[TB_TiposDocumentos] ([DocumentoId])
GO
ALTER TABLE [dbo].[TB_Operacao] CHECK CONSTRAINT [FK_TipoDeDocumentoOperacao]
GO
ALTER TABLE [dbo].[TB_Operacao]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioQEfectouAOperacao] FOREIGN KEY([IdCadastrador])
REFERENCES [dbo].[TB_Usuarios] ([Id])
GO
ALTER TABLE [dbo].[TB_Operacao] CHECK CONSTRAINT [FK_UsuarioQEfectouAOperacao]
GO
ALTER TABLE [dbo].[TB_Permissoes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TB_Permissoes_dbo.TB_Perfil_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[TB_Perfil] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TB_Permissoes] CHECK CONSTRAINT [FK_dbo.TB_Permissoes_dbo.TB_Perfil_RoleId]
GO
ALTER TABLE [dbo].[TB_Permissoes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TB_Permissoes_dbo.TB_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[TB_Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TB_Permissoes] CHECK CONSTRAINT [FK_dbo.TB_Permissoes_dbo.TB_Usuarios_UserId]
GO
ALTER TABLE [dbo].[TB_TiposDocumentos]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioQCadastraODocumento] FOREIGN KEY([DocumentoUsuarioId])
REFERENCES [dbo].[TB_Usuarios] ([Id])
GO
ALTER TABLE [dbo].[TB_TiposDocumentos] CHECK CONSTRAINT [FK_UsuarioQCadastraODocumento]
GO
ALTER TABLE [dbo].[TB_UsuarioLogin]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TB_UsuarioLogin_dbo.TB_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[TB_Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TB_UsuarioLogin] CHECK CONSTRAINT [FK_dbo.TB_UsuarioLogin_dbo.TB_Usuarios_UserId]
GO
ALTER TABLE [dbo].[TB_Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioQCadastraOUsuario] FOREIGN KEY([IdCadastrador])
REFERENCES [dbo].[TB_Usuarios] ([Id])
GO
ALTER TABLE [dbo].[TB_Usuarios] CHECK CONSTRAINT [FK_UsuarioQCadastraOUsuario]
GO
ALTER TABLE [dbo].[TB_UsuariosAfirmacoes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TB_UsuariosAfirmacoes_dbo.TB_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[TB_Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TB_UsuariosAfirmacoes] CHECK CONSTRAINT [FK_dbo.TB_UsuariosAfirmacoes_dbo.TB_Usuarios_UserId]
GO
ALTER TABLE [dbo].[TB_Velocipedes]  WITH CHECK ADD  CONSTRAINT [FK_MunicipeQPertenceOVelocipede] FOREIGN KEY([VelocipedeMunicipeNM])
REFERENCES [dbo].[TB_Municipes] ([MunicipeNM])
GO
ALTER TABLE [dbo].[TB_Velocipedes] CHECK CONSTRAINT [FK_MunicipeQPertenceOVelocipede]
GO
ALTER TABLE [dbo].[TB_Velocipedes]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioQCadastraVelocipede] FOREIGN KEY([IdCadastrador])
REFERENCES [dbo].[TB_Usuarios] ([Id])
GO
ALTER TABLE [dbo].[TB_Velocipedes] CHECK CONSTRAINT [FK_UsuarioQCadastraVelocipede]
GO
/****** Object:  StoredProcedure [dbo].[SP_Bairro_Alterar]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Bairro_Alterar]
@BairroId int,
@BairroComunaId int,
@BairroNome VARCHAR(50),
@BairroUsuarioId INT,
@BairroDataCadastro DATE,
@BairroEstado bit
AS
	BEGIN
	    UPDATE dbo.TB_Bairros
		SET  
    BairroComunaId=@BairroComunaId,
    BairroNome=@BairroNome
    
    WHERE BairroId=@BairroId
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bairro_CarregarTodos]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Bairro_CarregarTodos]
AS
BEGIN
    SELECT
    BairroId,
    BairroComunaId,
    BairroNome
    
    from dbo.TB_Bairros
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bairro_Excluir]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Bairro_Excluir]
	@BairroId INT
AS
BEGIN
    DELETE dbo.TB_Bairros WHERE BairroId=@BairroId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Bairro_Inserir]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Bairro_Inserir]

@BairroComunaId INT,
@BairroNome VARCHAR(50)

AS
DECLARE @@IdAuto int
SELECT @@IdAuto=MAX(BairroId) FROM dbo.TB_Bairros
IF @@IdAuto IS NULL
BEGIN
    SET @@IdAuto=0
    set  @@IdAuto=@@IdAuto+1
END
ELSE
BEGIN
SET @@IdAuto=@@IdAuto+1
END
BEGIN
    INSERT dbo.TB_Bairros
    (
    BairroId,
    BairroComunaId,
    BairroNome
      
    )
    VALUES
    (
    @@IdAuto,
    @BairroComunaId,
    @BairroNome
   
    )
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Banco_Alterar]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Banco_Alterar]
	@BancoId int,
	@BancoNome VARCHAR(50),
	@BancoSigla VARCHAR(10),
	@BancoEstado bit
	
AS
BEGIN
    UPDATE dbo.TB_Bancos SET
    
	BancoNome=@BancoNome,
	BancoSigla=@BancoSigla,
	BancoEstado=@BancoEstado	
	WHERE
	BancoId =@BancoId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Banco_CarregarTodos]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Banco_CarregarTodos]
	
AS
BEGIN
    SELECT 
	BancoId,
	BancoNome,
	BancoSigla,
	BancoEstado
	
	FROM dbo.TB_Bancos
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Banco_Excluir]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Banco_Excluir]
	@BancoId int
	
AS
BEGIN
    DELETE FROM dbo.TB_Bancos WHERE BancoId=@BancoId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Banco_Inserir]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Banco_Inserir]
	
	@BancoNome VARCHAR(50),
	@BancoSigla VARCHAR(10),
	@BancoEstado bit
	
AS
DECLARE @@IdAuto int
SELECT @@IdAuto=MAX(BancoId) FROM dbo.TB_Bancos
IF @@IdAuto IS NULL
BEGIN
    SET @@IdAuto=0
	set @@IdAuto=@@IdAuto+1
END
ELSE
BEGIN
SET @@IdAuto=@@IdAuto+1
END
BEGIN
   
    INSERT INTO dbo.TB_Bancos
    (
	BancoId,
	BancoNome,
	BancoSigla,
	BancoEstado
	
)
VALUES
(
@@IdAuto,
@BancoNome,
@BancoSigla,
@BancoEstado

)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarPerfilDoUsuario]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BuscarPerfilDoUsuario]
@UserName NVARCHAR(25)
AS
BEGIN
    SELECT  tp1.Name FROM dbo.TB_Permissoes tp
  JOIN dbo.TB_Usuarios tu ON  tu.Id=tp.UserId
  JOIN dbo.TB_Perfil tp1 ON tp.RoleId=tp1.Id
  WHERE tu.UserName=@UserName
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CarregarGeneroPorId]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CarregarGeneroPorId]
@Id int
	AS
BEGIN
    SELECT  GeneroNome FROM dbo.TB_Generos
	WHERE GeneroId=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CarregarGeneros]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CarregarGeneros]	
AS
BEGIN
    SELECT GeneroId, generoNome FROM dbo.TB_Generos
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Comuna_Alterar]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Comuna_Alterar]
@ComunaId INT,	
@ComunaNome VARCHAR(50),	
@ComunaMunicipioId INT		

AS
BEGIN
    UPDATE dbo.TB_Comunas
    SET ComunaNome=@ComunaNome,	
        ComunaMunicipioId=@ComunaMunicipioId	
       
        WHERE @ComunaId=@ComunaId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Comuna_CarregarTodas]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Comuna_CarregarTodas]
AS
BEGIN
    SELECT
	ComunaId,	
	ComunaNome,	
	ComunaMunicipioId	
	
	FROM dbo.TB_Comunas
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Comuna_Excluir]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Comuna_Excluir]
	@ComunaId int	
AS
BEGIN
    DELETE dbo.TB_Comunas 
	WHERE ComunaId=@ComunaId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Comuna_Inserir]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Comuna_Inserir]
@ComunaNome VARCHAR(50),	
@ComunaMunicipioId INT

AS
--DECLARE @@IdAuto int
--SELECT @@IdAuto=MAX(ComunaId) FROM dbo.TB_Comunas
--IF @@IdAuto IS NULL
--BEGIN
--    SET @@IdAuto=0
--    set @@IdAuto=@@IdAuto+1
--END
--ELSE
--BEGIN
--SET @@IdAuto=@@IdAuto+1
--END
BEGIN
    INSERT dbo.TB_Comunas
    (   	
	ComunaNome,	
	ComunaMunicipioId	
	
    )
    VALUES
    (   
	@ComunaNome,	
	@ComunaMunicipioId	
	
    )
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DocsFinalidades_Alterar]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DocsFinalidades_Alterar]
@FinalidadeId INT,
@FinalidadeNome VARCHAR(max),
@FinalidadeEstado BIT,
@IdCadastrador int
AS
BEGIN
    UPDATE dbo.TB_DocsFinalidades SET
    FinalidadeNome=@FinalidadeNome,
    FinalidadeEstado=@FinalidadeEstado,
    IdCadastrador=@IdCadastrador
    WHERE
    FinalidadeId=@FinalidadeId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DocsFinalidades_CarregarTodos]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DocsFinalidades_CarregarTodos]
AS
	BEGIN
	    SELECT
		FinalidadeId,
		FinalidadeNome,
		FinalidadeEstado,
		IdCadastrador 
		FROM dbo.TB_DocsFinalidades
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_DocsFinalidades_Excluir]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DocsFinalidades_Excluir]
	@FinalidadeId int
	
AS
BEGIN
    DELETE FROM dbo.TB_DocsFinalidades WHERE FinalidadeId=@FinalidadeId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DocsFinalidades_Inserir]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DocsFinalidades_Inserir]

@FinalidadeNome VARCHAR(max),
@FinalidadeEstado BIT,
@IdCadastrador int
AS
DECLARE @@IdAuto int
SELECT @@IdAuto=MAX(FinalidadeId) FROM dbo.TB_DocsFinalidades
IF @@IdAuto IS NULL
BEGIN
    SET @@IdAuto=0
END
ELSE
BEGIN
SET @@IdAuto=@@IdAuto+1
END
BEGIN
    INSERT INTO dbo.TB_DocsFinalidades
    (
FinalidadeId,
FinalidadeNome,
FinalidadeEstado,
IdCadastrador
    )
    VALUES
    (
@@IdAuto,
@FinalidadeNome,
@FinalidadeEstado,
@IdCadastrador
    )
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Morada_Alterar]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Morada_Alterar]
	@MoradaMunicuipeNM	INT,
	@MoradaRua	varchar(100),	
	@MoradaZona	varchar(20),	
	@MoradaBairroId	INT	

AS
	BEGIN
	    UPDATE dbo.TB_Moradas 
		SET MoradaRua=@MoradaRua,
			MoradaZona=@MoradaZona,
			MoradaBairroId=@MoradaBairroId
		WHERE MoradaMunicuipeNM=@MoradaMunicuipeNM
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_Morada_Excluir]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Morada_Excluir]
	@MoradaMunicuipeNM BIGINT
AS
	BEGIN
	    DELETE dbo.TB_Moradas 
		WHERE MoradaMunicuipeNM=@MoradaMunicuipeNM
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_MoradaCarregarPorNm]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MoradaCarregarPorNm]
	@MunicipeNm int
AS
BEGIN
	SELECT * FROM dbo.TB_Moradas
	WHERE MoradaMunicuipeNM=@MunicipeNm
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MoradaInserir]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MoradaInserir]
    @MoradaMunicuipeNM int,
	@MoradaCasaNumero VARCHAR(20),
	@MoradaRua varchar(100),
	@MoradaZona varchar(20),
	@MoradaBairroId int,
	@MoradaDataCadastro datetime,
	@MoradaEstado bit, 
    @IdCadastrador int 
AS

BEGIN
    INSERT dbo.TB_Moradas
    (
    MoradaMunicuipeNM,
	MoradaCasaNumero,
	MoradaRua,
	MoradaZona,
	MoradaBairroId,
	MoradaDataCadastro,
	MoradaEstado, 
    IdCadastrador 
    )
    VALUES
    (
    @MoradaMunicuipeNM,
	@MoradaCasaNumero,
    @MoradaRua,
    @MoradaZona,
    @MoradaBairroId,
    @MoradaDataCadastro,
    @MoradaEstado,
    @IdCadastrador
    )
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Municipe_Alterar]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Municipe_Alterar]
@MunicipeNM BIGINT,
@MunicipeNomeCompleto varchar(100),
@MunicipeDataNascimento date,
@MunicipeNDocIdent varchar(50),
@MunicipeDocDataEmissao date,
@MunicipeDocDataValidade date,
@MunicipeNIF varchar(50),
@MunicipeGenero int,
@MunicipeEstadoCivil int,
@MunicipeTelefone1 int,
@MunicipeTelefone2 int,
@MunicipeEmail varchar(50),
@MunicipeEstado bit
AS
BEGIN
    UPDATE dbo.TB_Municipes SET
MunicipeNomeCompleto=@MunicipeNomeCompleto,
MunicipeDataNascimento=@MunicipeDataNascimento,
MunicipeNDocIdent=@MunicipeNDocIdent,
MunicipeDocDataEmissao=@MunicipeDocDataEmissao,
MunicipeDocDataValidade=@MunicipeDocDataValidade,
MunicipeNIF=@MunicipeNIF,
MunicipeGenero=@MunicipeGenero,
MunicipeEstadoCivil=@MunicipeEstadoCivil,
MunicipeTelefone1=@MunicipeTelefone1,
MunicipeTelefone2=@MunicipeTelefone2,
MunicipeEmail=@MunicipeEmail,
MunicipeEstado=@MunicipeEstado

WHERE MunicipeNM=@MunicipeNM
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Municipe_CarregarTodos]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Municipe_CarregarTodos]
AS
BEGIN
    SELECT 
MunicipeId,
MunicipeNM ,
MunicipeNomeCompleto,
MunicipeDataNascimento, 
MunicipeNDocIdent,
MunicipeTipoDocIdentificacao,
MunicipeDocDataEmissao,
MunicipeDocDataValidade,
MunicipeNIF,
MunicipeGenero,
MunicipeEstadoCivil,
MunicipeTelefone1,
MunicipeTelefone2,
MunicipeEmail,
MunicipeEstado,
IdCadastrador
FROM dbo.TB_Municipes
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Municipe_Excluir]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Municipe_Excluir]
	@MunicipeNM BIGINT
AS
	BEGIN
	    DELETE dbo.TB_Municipes WHERE MunicipeNM=@MunicipeNM
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_Municipe_Inserir]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Municipe_Inserir]
@MunicipeNomeCompleto varchar(100),
@MunicipeDataNascimento date,
@MunicipeNDocIdent varchar(50),
@MunicipeDocDataEmissao date,
@MunicipeDocDataValidade date,
@MunicipeNIF varchar(50),
@MunicipeGenero int,
@MunicipeEstadoCivil int,
@MunicipeTelefone1 int,
@MunicipeTelefone2 int,
@MunicipeEmail varchar(50),
@MunicipeEstado bit,
@IdCadastrador INT
AS
DECLARE @@IdAuto INT
SELECT @@IdAuto=MAX(MunicipeId) FROM dbo.TB_Municipes
IF @@IdAuto IS NULL
BEGIN
    SET @@IdAuto=0
    set @@IdAuto=@@IdAuto+1
END
ELSE
BEGIN
SET @@IdAuto=@@IdAuto+1
END
BEGIN
    INSERT dbo.TB_Municipes
    (
MunicipeId,
MunicipeNM,
MunicipeNomeCompleto,
MunicipeDataNascimento,
MunicipeNDocIdent,
MunicipeDocDataEmissao,
MunicipeDocDataValidade,
MunicipeNIF,
MunicipeGenero,
MunicipeEstadoCivil,
MunicipeTelefone1,
MunicipeTelefone2,
MunicipeEmail,
MunicipeEstado,
IdCadastrador
)
    VALUES
(
@@IdAuto,
3985451,
@MunicipeNomeCompleto,
@MunicipeDataNascimento,
@MunicipeNDocIdent,
@MunicipeDocDataEmissao,
@MunicipeDocDataValidade,
@MunicipeNIF,
@MunicipeGenero,
@MunicipeEstadoCivil,
@MunicipeTelefone1,
@MunicipeTelefone2,
@MunicipeEmail,
@MunicipeEstado,
@IdCadastrador
)
SELECT @@IdAuto AS retorno
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Perfil_Alterar]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Perfil_Alterar]
	@Id int ,
	@Name NVARCHAR(256),
	@Estado BIT	
AS
BEGIN
    UPDATE dbo.TB_Perfil 
	SET 
	name=@Name,
	Estado=@Estado
	
	WHERE 
	Id=@Id
	select @Name as retorno
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Perfil_BuscarPorId]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Perfil_BuscarPorId]
	@Id int
AS
begin
SELECT Id, Name,Estado, DataCadastro FROM dbo.TB_Perfil where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Perfil_BuscarPorNome]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Perfil_BuscarPorNome]
	@Name nvarchar(256)
	
AS
begin
SELECT Id, Name,Estado, DataCadastro FROM dbo.TB_Perfil where name like '%'+@Name+'%' 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Perfil_CarregarActivos]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Perfil_CarregarActivos]
	
AS
BEGIN
SELECT Id, Name,Estado, DataCadastro FROM dbo.TB_Perfil WHERE Estado=1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Perfil_CarregarTodos]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Perfil_CarregarTodos]
AS
BEGIN
    	SELECT Id, Name,Estado, DataCadastro FROM dbo.TB_Perfil
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Perfil_Excluir]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Perfil_Excluir]
	@Id int	
AS	
BEGIN
SELECT Name AS retorno FROM dbo.TB_Perfil   where Id=@Id	
delete from dbo.TB_Perfil where Id=@Id
   
   
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Perfil_Inserir]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Perfil_Inserir]	
    @Name NVARCHAR(256),
    @Estado bit,
    @DataCadastro date,
	@Idcadastrador int
AS

BEGIN
    INSERT dbo.TB_Perfil(Name,Estado,DataCadastro,Idcadastrador)
    VALUES (@Name,@Estado,@DataCadastro,@Idcadastrador)
    SELECT @Name as retorno
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Perfil_UsuarioAtivos]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Perfil_UsuarioAtivos]
	@PerfilId int	
AS
BEGIN
    SELECT COUNT(tu.Id) Qtde  FROM dbo.TB_Perfil tp
  JOIN dbo.TB_Permissoes tp1 ON tp.Id = tp1.RoleId
  JOIN dbo.TB_Usuarios tu ON tp1.UserId = tu.Id
  WHERE tp.Id=@PerfilId AND  tu.Estado=1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Perfil_UsuarioInativos]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Perfil_UsuarioInativos]
	@PerfilId int	
AS
BEGIN
    SELECT COUNT(tu.Id) Qtde  FROM dbo.TB_Perfil tp
  JOIN dbo.TB_Permissoes tp1 ON tp.Id = tp1.RoleId
  JOIN dbo.TB_Usuarios tu ON tp1.UserId = tu.Id
  WHERE tp.Id=@PerfilId AND  tu.Estado=0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PerfilDoUsuario]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PerfilDoUsuario]
@UserId int
AS
BEGIN
    SELECT tp1.Id, tp1.Name FROM dbo.TB_Permissoes tp
  JOIN dbo.TB_Usuarios tu ON  tu.Id=tp.UserId
  JOIN dbo.TB_Perfil tp1 ON tp.RoleId=tp1.Id
  WHERE tp.UserId=@UserId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Permissao_Inserir]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Permissao_Inserir]
	@UserId int,
	@RoleId int
AS
	BEGIN
	    INSERT dbo.TB_Permissoes (UserId, RoleId)  VALUES (@UserId, @RoleId)
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_Alterar]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Usuario_Alterar]
 @Id INT,
 @NomeCompleto NVARCHAR(MAX),
 @Estado bit,
 @DataCadastro DATETIME,
 @Email NVARCHAR(256),
 @EmailConfirmed bit,
 @PasswordHash NVARCHAR(MAX),
 @SecurityStamp NVARCHAR(MAX),
 @PhoneNumber NVARCHAR(MAX), 
 @PhoneNumberConfirmed bit,
 @TwoFactorEnabled bit,
 @LockoutEndDateUtc DATETIME,
 @LockoutEnabled BIT,
 @AccessFailedCount INT,
 @UserName NVARCHAR(256),
 @PerfilId INT,
 @IdCadastrador int
  AS  
  BEGIN
  	UPDATE dbo.TB_Usuarios SET           
      NomeCompleto=@NomeCompleto,
      Estado=@Estado,
      DataCadastro=@DataCadastro,
      Email=@Email,
      EmailConfirmed=@EmailConfirmed,
      PasswordHash=@PasswordHash,
      SecurityStamp=@SecurityStamp,
      PhoneNumber=@PhoneNumber, 
      PhoneNumberConfirmed=@PhoneNumberConfirmed,
      TwoFactorEnabled=@TwoFactorEnabled,
      LockoutEndDateUtc=@LockoutEndDateUtc,
      LockoutEnabled=@LockoutEnabled,
      AccessFailedCount=@AccessFailedCount,
      UserName=@UserName,
	  IdCadastrador=@IdCadastrador
      WHERE id=@Id
      SELECT @UserName AS retorno
  END
  BEGIN  
  UPDATE dbo.TB_Permissoes SET RoleId=@PerfilId
  WHERE UserId=@Id  
  END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_AlterarSenha]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Usuario_AlterarSenha]
	@Id INT,
	@NovaSenha VARCHAR(200)
    
AS
BEGIN
    UPDATE dbo.TB_Usuarios 
	SET PasswordHash=@NovaSenha
	WHERE Id=@Id
	select 'true' as retorno
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_BuscarNomeCadastrador]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Usuario_BuscarNomeCadastrador]
	@UserId int	
AS
BEGIN
  DECLARE @@idCadastrador int
	BEGIN	 
     SELECT @@idCadastrador=IdCadastrador FROM dbo.TB_Usuarios tu WHERE tu.Id= @UserId
	 END
	 BEGIN
	     SELECT username FROM dbo.TB_Usuarios tu WHERE id=@@idCadastrador
	 END  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_BuscarPorEmail]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Usuario_BuscarPorEmail]
	@Email VARCHAR(200)	
AS
BEGIN
    SELECT 	
	Id,
  NomeCompleto,
  Estado,
  DataCadastro,
  Email,
  EmailConfirmed,
  PasswordHash,
  SecurityStamp,
  PhoneNumber,
  PhoneNumberConfirmed,
  TwoFactorEnabled,
  LockoutEndDateUtc,
  LockoutEnabled,
  AccessFailedCount,
  UserName  FROM dbo.TB_Usuarios	
	where Email=@Email
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_BuscarPorId]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Usuario_BuscarPorId]
	@UsuId VARCHAR(200)	
AS
BEGIN
    SELECT 
  tu.Id,
  tu.NomeCompleto,
  tu.Estado,
  tu.DataCadastro,
  tu.Email,
  tu.EmailConfirmed,
  tu.PasswordHash,
  tu.SecurityStamp,
  tu.PhoneNumber,
  tu.PhoneNumberConfirmed,
  tu.TwoFactorEnabled,
  tu.LockoutEndDateUtc,
  tu.LockoutEnabled,
  tu.AccessFailedCount,
  tu.UserName,
      tpf.Id PerfilId,
      tu.IdCadastrador
     
	FROM dbo.TB_Usuarios tu
      JOIN dbo.TB_Permissoes tp ON tu.Id = tp.UserId
      JOIN dbo.TB_Perfil tpf ON tp.RoleId = tpf.Id	
	where tu.Id=@UsuId
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_BuscarPorNome]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SP_Usuario_BuscarPorNome]
	@nome NVARCHAR(256)
AS
BEGIN
    SELECT
	Id,
  NomeCompleto,
  Estado,
  DataCadastro,
  Email,
  EmailConfirmed,
  PasswordHash,
  SecurityStamp,
  PhoneNumber,
  PhoneNumberConfirmed,
  TwoFactorEnabled,
  LockoutEndDateUtc,
  LockoutEnabled,
  AccessFailedCount,
  UserName
	FROM dbo.TB_Usuarios
	WHERE NomeCompleto LIKE '%'+@nome+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_BuscarTentativas]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Usuario_BuscarTentativas]
		@UserName VARCHAR(200)
	
AS
BEGIN
    SELECT 

  AccessFailedCount
 
	FROM dbo.TB_Usuarios
	WHERE Username=@UserName 
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_CarregarTodos]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SP_Usuario_CarregarTodos]
	
AS
BEGIN
    SELECT
	Id,
  NomeCompleto,
  Estado,
  DataCadastro,
  Email,
  EmailConfirmed,
  PasswordHash,
  SecurityStamp,
  PhoneNumber,
  PhoneNumberConfirmed,
  TwoFactorEnabled,
  LockoutEndDateUtc,
  LockoutEnabled,
  AccessFailedCount,
  UserName
	FROM dbo.TB_Usuarios
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_CarregarTodosComPerfilId]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SP_Usuario_CarregarTodosComPerfilId]
	
AS
BEGIN
    SELECT   
  tu.Id,
  tu.NomeCompleto,
  tu.Estado,
  tu.DataCadastro,
  tu.Email,
  tu.EmailConfirmed,
  tu.PasswordHash,
  tu.SecurityStamp,
  tu.PhoneNumber,
  tu.PhoneNumberConfirmed,
  tu.TwoFactorEnabled,
  tu.LockoutEndDateUtc,
  tu.LockoutEnabled,
  tu.AccessFailedCount,
  tu.UserName,
      tpf.Id PerfilId
     
	FROM dbo.TB_Usuarios tu
      JOIN dbo.TB_Permissoes tp ON tu.Id = tp.UserId
      JOIN dbo.TB_Perfil tpf ON tp.RoleId = tpf.Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_Excluir]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Usuario_Excluir]
@UserId int
AS
BEGIN
	
	SELECT UserName AS retorno FROM dbo.TB_Usuarios	WHERE Id=@UserId
	DELETE FROM dbo.TB_Permissoes WHERE UserId=@UserId
	DELETE dbo.TB_Usuarios	WHERE Id=@UserId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_Inserir]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Usuario_Inserir]
      @NomeCompleto NVARCHAR(MAX),
      @Estado bit,
      @DataCadastro DATE,
      @Email NVARCHAR(256),
      @EmailConfirmed bit,
      @PasswordHash NVARCHAR(MAX),
      @SecurityStamp NVARCHAR(MAX),
      @PhoneNumber NVARCHAR(MAX), 
      @PhoneNumberConfirmed bit,
      @TwoFactorEnabled bit,
      @LockoutEndDateUtc DATE,
      @LockoutEnabled BIT,
      @AccessFailedCount INT,
      @UserName NVARCHAR(MAX),
      @PerfilId INT,
      @Idcadastrador int
  AS
  DECLARE @@UserId INT
  DECLARE @@UserIdNoPerfil INT
  BEGIN
  	INSERT INTO TB_Usuarios
       (      
      NomeCompleto,
      Estado,
      DataCadastro,
      Email,
      EmailConfirmed,
      PasswordHash,
      SecurityStamp,
      PhoneNumber, 
      PhoneNumberConfirmed,
      TwoFactorEnabled,
      LockoutEndDateUtc,
      LockoutEnabled,
      AccessFailedCount,
      UserName,
	  Idcadastrador
      )
  VALUES 
      (      
      @NomeCompleto,
      @Estado ,
      @DataCadastro ,
      @Email,
      @EmailConfirmed,
      @PasswordHash ,
      @SecurityStamp ,
      @PhoneNumber , 
      @PhoneNumberConfirmed ,
      @TwoFactorEnabled,
      @LockoutEndDateUtc ,
      @LockoutEnabled ,
      @AccessFailedCount,
      @UserName, 
      @Idcadastrador);
      SELECT @@UserId=@@IDENTITY
      SELECT @UserName AS retorno
  END
  BEGIN  
  SELECT @@UserIdNoPerfil=UserId FROM dbo.TB_Permissoes tp WHERE tp.UserId=@@UserId AND tp.RoleId=@PerfilId
    IF @@UserIdNoPerfil IS NULL OR @@UserIdNoPerfil>0
      BEGIN  
    	INSERT INTO dbo.TB_Permissoes (UserId, RoleId)VALUES (@@UserId, @PerfilId);
    END 
END


  ----DECLARE @@IdAuto int
----SELECT @@IdAuto=MAX(Id) FROM dbo.TB_Usuarios
----IF @@IdAuto IS NULL
----BEGIN
----    SET @@IdAuto=0
----    set @@IdAuto=@@IdAuto+1
----END
----else
----begin
----SET @@IdAuto=@@IdAuto+1
----end
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_Login]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Usuario_Login]
		@UserName VARCHAR(200),
	@Senha VARCHAR(200)
AS
BEGIN
    SELECT 
	Id,
  NomeCompleto,
  Estado,
  DataCadastro,
  Email,
  EmailConfirmed,
  PasswordHash,
  SecurityStamp,
  PhoneNumber,
  PhoneNumberConfirmed,
  TwoFactorEnabled,
  LockoutEndDateUtc,
  LockoutEnabled,
  AccessFailedCount,
  UserName
	FROM dbo.TB_Usuarios
	WHERE Username=@UserName AND PasswordHash=@Senha 
	--AND UsuEstado=1
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_Sessao]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Usuario_Sessao]
	@UserName VARCHAR(200),
	@Senha VARCHAR(200)
AS
BEGIN
 SELECT 
tu.Id,
 tu.NomeCompleto,
 tu.Estado,
 tu.DataCadastro,
 tu.Email,
 tu.EmailConfirmed,
 tu.PasswordHash,
 tu.SecurityStamp,
 tu.PhoneNumber,
 tu.PhoneNumberConfirmed,
 tu.TwoFactorEnabled,
 tu.LockoutEndDateUtc,
 tu.LockoutEnabled,
 tu.AccessFailedCount,
 tu.UserName,
  tp.Id  PerfilId,
  tp.Name PerfilNome
	FROM dbo.TB_Usuarios tu
  JOIN dbo.TB_Permissoes tperm ON tu.Id = tperm.UserId
  JOIN dbo.TB_Perfil tp ON tperm.RoleId=tp.Id
	WHERE tu.UserName=@UserName AND tu.PasswordHash=@Senha 
	--AND UsuEstado=1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_Tentativas]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Usuario_Tentativas]
	@UserName VARCHAR(200),	
	@Tentativas int
AS
BEGIN
if @Tentativas=3
begin
  update 
	 dbo.TB_Usuarios set
	 Estado=0
end
    update 
	 dbo.TB_Usuarios set
	 AccessFailedCount=@Tentativas
	 WHERE Username=@UserName	 
		
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_TotalCadastrado]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Usuario_TotalCadastrado]
AS
BEGIN
    SELECT COUNT(Id) qtde FROM dbo.TB_Usuarios
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_VerificarLogin]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Usuario_VerificarLogin]
	@UserName VARCHAR(200)	
AS
BEGIN
    SELECT
    Id
	FROM dbo.TB_Usuarios
	WHERE Username=@UserName	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_VerificarSenha]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Usuario_VerificarSenha]

    @UserName VARCHAR(200),
	@Senha VARCHAR(200)
AS

BEGIN
    SELECT id FROM dbo.TB_Usuarios
	WHERE Username=@UserName AND PasswordHash=@Senha 
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UsuarioBuscarCadastrador]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UsuarioBuscarCadastrador]
	@UsuId int
AS
BEGIN
	SELECT UserName FROM dbo.TB_Usuarios
	WHERE IdCadastrador=@UsuId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UsuarioBuscarEstado]    Script Date: 18/10/2020 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UsuarioBuscarEstado]
	@UserName VARCHAR(200)
AS
BEGIN
  SELECT Estado FROM TB_Usuarios tu
	 WHERE Username=@UserName		
END
GO
USE [master]
GO
ALTER DATABASE [SiGMunDB] SET  READ_WRITE 
GO
