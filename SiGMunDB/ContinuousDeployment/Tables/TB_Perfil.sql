CREATE TABLE dbo.TB_Perfil (
  Id int IDENTITY,
  Estado bit NOT NULL,
  DataCadastro datetime NOT NULL,
  Name nvarchar(256) NOT NULL,
  IdCadastrador INT NOT NULL,
  CONSTRAINT [PK_dbo.TB_Perfil] PRIMARY KEY CLUSTERED (Id),
    --CONSTRAINT FK_UsuarioQCadastraOPerfil FOREIGN KEY(IdCadastrador) REFERENCES dbo.TB_Usuarios(id)
)
ON [PRIMARY]
