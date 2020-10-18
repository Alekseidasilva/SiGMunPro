CREATE TABLE [dbo].[TB_Bancos]
(
	BancoId INT NOT NULL,
	BancoNome VARCHAR(100)NOT NULL,
	BancoSigla VARCHAR(20) NOT NULL,
	BancoEstado bit NOT NULL,	
	CONSTRAINT PK_BancoId PRIMARY KEY (BancoId)
	

)