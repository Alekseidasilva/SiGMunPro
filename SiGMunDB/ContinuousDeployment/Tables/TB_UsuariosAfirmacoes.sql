CREATE TABLE dbo.TB_UsuariosAfirmacoes (
  Id int IDENTITY,
  UserId int NOT NULL,
  ClaimType nvarchar(max) NULL,
  ClaimValue nvarchar(max) NULL,
  CONSTRAINT [PK_dbo.TB_UsuariosAfirmacoes] PRIMARY KEY CLUSTERED (Id)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
