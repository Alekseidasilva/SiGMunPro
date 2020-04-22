CREATE TABLE [dbo].[TB_Municipes]
(
    MunicipeId INT NOT NULL,
	MunicipeNM bigint NOT NULL,
	MunicipeNomeCompleto varchar(100) NOT NULL,
	MunicipeDataNascimento date NOT NULL,
	MunicipeNDocIdent varchar(50) NOT NULL,
	MunicipeDocDataEmissao date NOT NULL,
	MunicipeDocDataValidade date NOT NULL,
	MunicipeNIF varchar(50) NOT NULL,
	MunicipeGenero int NOT NULL,
	MunicipeEstadoCivil int NOT NULL,
	MunicipeTelefone1 int NULL,
	MunicipeTelefone2 int NULL,
	MunicipeEmail varchar(50) NULL,
	MunicipeMorada INT NOT NULL,
	[MunicipeEstado] bit NOT NULL,
	MunicipeUsuarioId int NOT NULL
	CONSTRAINT PK_MunicipenNumero PRIMARY KEY(MunicipeNM),
	CONSTRAINT FK_GeneroDoMunicipe FOREIGN KEY (MunicipeGenero)REFERENCES dbo.TB_Generos,
	CONSTRAINT FK_EstadoCivilDoMunicipe FOREIGN KEY (MunicipeEstadoCivil)REFERENCES dbo.TB_EstadoCivil,
	CONSTRAINT FK_MoradaDoMunicipe FOREIGN KEY (MunicipeMorada)REFERENCES dbo.TB_Moradas,
	--CONSTRAINT FK_usuarioQCadastraOMunicipe FOREIGN KEY (MunicipeUsuarioId)REFERENCES dbo.TB_Usuarios,
)
