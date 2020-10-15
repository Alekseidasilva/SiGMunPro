CREATE TABLE [dbo].[TB_Moradas]
(
	MoradaId int identity(1,1) not null,
	MoradaMunicuipeNM bigint NOT NULL,
	MoradaRua VARCHAR(200)NOT NULL,
	MoradaZona INT not NULL,
	MoradaBairroId INT NOT NULL,
	MoradaDataCadastro DATE NOT NULL,

	CONSTRAINT PK_MoradaMunicipeNM PRIMARY KEY(MoradaId),
	CONSTRAINT FK_MoradaQPertenceOMunicipe FOREIGN KEY(MoradaMunicuipeNM)REFERENCES dbo.TB_Municipes,
	CONSTRAINT FK_BairroQPertenceAMorada FOREIGN KEY(MoradaBairroId)REFERENCES dbo.TB_Bairros

)
