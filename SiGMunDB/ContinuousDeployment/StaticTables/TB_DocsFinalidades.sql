CREATE TABLE [dbo].[TB_DocsFinalidades]
(
	FinalidadeId INT NOT NULL,
	FinalidadeNome VARCHAR(MAX)NOT NULL,
	FinalidadeValor DECIMAL(18,2)NOT NULL,
	FinalidadeEstado bit NOT NULL,
	FinalidadeUsuarioId INT

	CONSTRAINT PK_FinalidadeId PRIMARY KEY (FinalidadeId)
	CONSTRAINT FK_UsuarioQCadastraAFinalidade FOREIGN KEY ([FinalidadeUsuarioId]) REFERENCES dbo.TB_Usuarios
)
