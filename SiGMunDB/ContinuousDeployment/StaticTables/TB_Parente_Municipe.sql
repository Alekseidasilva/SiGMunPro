CREATE TABLE [dbo].[TB_Parente_Municipe]
(
    ParenteId int identity(1,1) not null,
	ParenteMunicipeNM BIGINT NOT NULL,
	ParenteMunicipeNomeCompleto VARCHAR(100)NOT NULL,
	ParenteNM BIGINT NULL,
	ParenteGrauParentescoId INT NOT NULL,
	ParenteTelefone1 int NULL,
	Parentetelefone2 INT NULL,
	ParenteEmail VARCHAR(50)NULL,
	ParenteUsuarioId int NOT NULL

	CONSTRAINT PK_ParenteId PRIMARY KEY (ParenteId),
	CONSTRAINT FK_ParenteMunicipeNM FOREIGN KEY (ParenteMunicipeNM) REFERENCES dbo.TB_Municipes(MunicipeNM),
	CONSTRAINT FK_BancoAssociadoFormaPagamento FOREIGN KEY (ParenteGrauParentescoId) REFERENCES dbo.TB_GrauParentesco,
	CONSTRAINT FK_UsuarioQCadastraOParente FOREIGN KEY (ParenteUsuarioId) REFERENCES dbo.TB_Usuarios

)
