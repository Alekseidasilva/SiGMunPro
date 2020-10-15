CREATE TABLE [dbo].[TB_DocsFinalidades]
(
	FinalidadeId INT IDENTITY(1,1),
	FinalidadeNome VARCHAR(MAX)NOT NULL,
	FinalidadeValor DECIMAL(18,2)NOT NULL,
	FinalidadeEstado bit NOT NULL,
	IdCadastrador INT NOT NULL,

	CONSTRAINT PK_FinalidadeId PRIMARY KEY (FinalidadeId),
	CONSTRAINT FK_UsuarioQCadastraAFinalidade FOREIGN KEY (IdCadastrador) REFERENCES dbo.TB_Usuarios
)
