CREATE TABLE [dbo].[TB_Bancos]
(
	BancoId INT NOT NULL,
	BancoNome VARCHAR(50)NOT NULL,
	BancoSigla VARCHAR(10) NOT NULL,
	BancoEstado bit NOT NULL,
	BancoUsuarioid INT NOT NULL
	CONSTRAINT PK_BancoId PRIMARY KEY (BancoId)
	CONSTRAINT FK_UsuarioQCadastraOBanco FOREIGN KEY (BancoUsuarioid) REFERENCES dbo.TB_Usuarios

)