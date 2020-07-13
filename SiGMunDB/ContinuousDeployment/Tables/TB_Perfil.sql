CREATE TABLE dbo.TB_Perfil (
  Id int IDENTITY,
  Estado bit NOT NULL,
  DataCadastro datetime NOT NULL,
  Name nvarchar(256) NOT NULL,
  CONSTRAINT [PK_dbo.TB_Perfil] PRIMARY KEY CLUSTERED (Id)
)
ON [PRIMARY]
