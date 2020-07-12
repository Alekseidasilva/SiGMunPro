CREATE TABLE dbo.TB_UsuarioLogin (
  LoginProvider nvarchar(128) NOT NULL,
  ProviderKey nvarchar(128) NOT NULL,
  UserId int NOT NULL,
  Email nvarchar(max) NULL,
  Senha nvarchar(max) NULL,
  CONSTRAINT [PK_dbo.TB_UsuarioLogin] PRIMARY KEY CLUSTERED (LoginProvider, ProviderKey, UserId)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
