CREATE TABLE [dbo].[TB_Moradas]
(
	MoradaId int identity(1,1) not null,
	MoradaMunicuipeNM bigint NOT NULL,
	MoradaRua VARCHAR(200)NULL,
	MoradaZona VARCHAR(20) NULL,
	MoradaBairroId INT NOT NULL,
	MoradaDataCadastro DATE NOT NULL,
	MoradaEstado BIT NOT NULL, 
    IdCadastrador INT NOT NULL, 
    CONSTRAINT PK_MoradaMunicipeNM PRIMARY KEY(MoradaId),
	CONSTRAINT FK_MoradaQPertenceOMunicipe FOREIGN KEY(MoradaMunicuipeNM)REFERENCES dbo.TB_Municipes,
	CONSTRAINT FK_BairroQPertenceAMorada FOREIGN KEY(MoradaBairroId)REFERENCES dbo.TB_Bairros,
	CONSTRAINT FK_UsuarioQCadastraAMorada FOREIGN KEY(IdCadastrador)REFERENCES dbo.TB_Usuarios

)
