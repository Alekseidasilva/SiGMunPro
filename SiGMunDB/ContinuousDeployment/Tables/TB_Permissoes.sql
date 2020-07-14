CREATE TABLE dbo.TB_Permissoes (
  UserId int NOT NULL,
  RoleId int NOT NULL,
  CONSTRAINT [PK_dbo.TB_PerfilUsuario] PRIMARY KEY CLUSTERED (UserId, RoleId)
)
ON [PRIMARY]
