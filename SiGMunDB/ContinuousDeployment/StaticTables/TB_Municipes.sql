﻿CREATE TABLE [dbo].[TB_Municipes]
(
    MunicipeId INT IDENTITY(1,1),
	MunicipeNM bigint NOT NULL,
	MunicipeNomeCompleto varchar(100) NOT NULL,
	MunicipeDataNascimento date NOT NULL,
	MunicipeNDocIdent varchar(50) NOT NULL,
	MunicipeTipoDocIdentificacao int NOT NULL,
	MunicipeDocDataEmissao date NOT NULL,
	MunicipeDocDataValidade date NOT NULL,
	MunicipeNIF varchar(50) NOT NULL,
	MunicipeGenero int NOT NULL,
	MunicipeEstadoCivil int NOT NULL,
	MunicipeTelefone1 VARCHAR(15) NOT NULL,
	MunicipeTelefone2 VARCHAR(15) NULL,
	MunicipeEmail varchar(50) NULL,
	MunicipeEstado bit NOT NULL,
	MunicipeDataCadastro DATETIME NOT NULL,

	MunicipeParenteNM bigint NOT NULL,
	MunicipeGrauParentescoId int not null, 
	MunicipeFoto VARCHAR(MAX) NULL,

	IdCadastrador int NOT NULL
	CONSTRAINT PK_MunicipenNumero PRIMARY KEY([MunicipeNM]),
	CONSTRAINT FK_TipoDocIdentificacaoDoMunicipe FOREIGN KEY (MunicipeTipoDocIdentificacao)REFERENCES dbo.TB_TipoDocIdentificacao(Id),
	CONSTRAINT FK_GeneroDoMunicipe FOREIGN KEY (MunicipeGenero)REFERENCES dbo.TB_Generos(GeneroId),
	CONSTRAINT FK_EstadoCivilDoMunicipe FOREIGN KEY (MunicipeEstadoCivil)REFERENCES dbo.TB_EstadoCivil(EstadoCivilId),	
	CONSTRAINT FK_NMdoParenteDoMunicipe FOREIGN KEY (MunicipeParenteNM) REFERENCES dbo.TB_Municipes(MunicipeNM),
	CONSTRAINT FK_GrauParentescoDoParenteDoMunicipe FOREIGN KEY(MunicipeGrauParentescoId) REFERENCES dbo.TB_GrauParentesco(GrauParentescoId),

	CONSTRAINT FK_UsuarioQCadastraOMunicipe FOREIGN KEY (IdCadastrador)REFERENCES dbo.TB_Usuarios(Id),
)
