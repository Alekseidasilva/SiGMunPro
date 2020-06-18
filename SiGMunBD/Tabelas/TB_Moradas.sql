CREATE TABLE [dbo].[TB_Moradas]
(
	MoradaMunicuipeNM INT NOT NULL,
	MoradaRua VARCHAR(100)NOT NULL,
	MoradaZona VARCHAR(20)NULL,
	MoradaBairroId INT NOT NULL,

	CONSTRAINT PK_MoradaMunicipeNM PRIMARY KEY(MoradaMunicuipeNM),
	CONSTRAINT FK_BairroQPertenceAMorada FOREIGN KEY(MoradaBairroId)REFERENCES dbo.TB_Bairros

)
