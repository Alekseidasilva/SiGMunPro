CREATE TABLE [dbo].[TB_Moradas]
(
	MoradaId int identity(1,1) not null,
	MoradaMunicuipeNM VARCHAR(20) NOT NULL,
	MoradaCasaNumero VARCHAR(20) NULL,	
	MoradaZona VARCHAR(20) NULL,
	MoradaRuaId INT NOT NULL,
	MoradaDataCadastro DATE NOT NULL,
	MoradaEstado BIT NOT NULL, 
    IdCadastrador INT NOT NULL, 
    CONSTRAINT PK_MoradaMunicipeNM PRIMARY KEY(MoradaId),
	CONSTRAINT FK_MoradaQPertenceOMunicipe FOREIGN KEY(MoradaMunicuipeNM)REFERENCES dbo.TB_Municipes,
	CONSTRAINT FK_RuaQPertenceAMorada FOREIGN KEY(MoradaRuaId) REFERENCES dbo.TB_Ruas,
	CONSTRAINT FK_UsuarioQCadastraAMorada FOREIGN KEY(IdCadastrador)REFERENCES dbo.TB_Usuarios

)
