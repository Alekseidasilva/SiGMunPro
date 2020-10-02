CREATE TABLE [dbo].[TB_Moradas]
(
	MoradaMunicuipeNM INT NOT NULL,
	MoradaRua VARCHAR(200)NOT NULL,
	MoradaZona INTNULL,
	MoradaBairroId INT NOT NULL,

	CONSTRAINT PK_MoradaMunicipeNM PRIMARY KEY(MoradaMunicuipeNM),
	CONSTRAINT FK_BairroQPertenceAMorada FOREIGN KEY(MoradaBairroId)REFERENCES dbo.TB_Bairros

)
