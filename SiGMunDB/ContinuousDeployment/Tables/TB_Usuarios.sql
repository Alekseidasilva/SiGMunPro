CREATE TABLE dbo.TB_Usuarios (
  Id int IDENTITY,
  NomeCompleto nvarchar(max) NULL,
  Estado bit NOT NULL,
  DataCadastro datetime NOT NULL,
  Email nvarchar(256) NULL,
  EmailConfirmed bit NOT NULL,
  PasswordHash nvarchar(max) NULL,
  SecurityStamp nvarchar(max) NULL,
  PhoneNumber nvarchar(max) NULL,
  PhoneNumberConfirmed bit NOT NULL,
  TwoFactorEnabled bit NOT NULL,
  LockoutEndDateUtc datetime NULL,
  LockoutEnabled bit NOT NULL,
  AccessFailedCount int NOT NULL,
  UserName nvarchar(256) NOT NULL,
  IdCadastrador INT NOT NULL, 
    CONSTRAINT [PK_dbo.TB_Usuarios] PRIMARY KEY CLUSTERED (Id),
    CONSTRAINT FK_UsuarioQCadastraOUsuario FOREIGN KEY(IdCadastrador) REFERENCES dbo.TB_Usuarios(id)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
