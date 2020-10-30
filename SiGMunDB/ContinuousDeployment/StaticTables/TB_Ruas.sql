CREATE TABLE [dbo].[TB_Ruas]
(
	RuaId INT NOT NULL,
	RuaNome VARCHAR(200) NOT NULL, 
	RuaBairroId INT ,
	IdCadastrador INT

	CONSTRAINT PK_RuaId PRIMARY KEY(RuaId),
	CONSTRAINT FK_BairroQARuaPertence FOREIGN KEY(RuaBairroId) REFERENCES TB_Bairros,
	CONSTRAINT FK_UsuarioQCadastraARua FOREIGN KEY (IdCadastrador) REFERENCES TB_Usuarios
	)
