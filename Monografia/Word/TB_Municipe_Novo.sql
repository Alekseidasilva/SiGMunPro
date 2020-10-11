
IF OBJECT_ID('dbo.TB_TesteMunicipe', 'U') IS NOT NULL
	DROP TABLE dbo.TB_TesteMunicipe
GO
IF OBJECT_ID('dbo.SP_TesteMunicipeAdd') IS NOT NULL
	DROP PROCEDURE dbo.SP_TesteMunicipeAdd
GO



CREATE TABLE dbo.TB_TesteMunicipe
(
  MunicipeId INT IDENTITY(1,1) NOT NULL,
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

  MunicipeAgregadoNM BIGINT NOT NULL,
  MunicipeGrauParentesco INT NOT NULL,

	MunicipeEstado bit NOT NULL,
	MunicipeDataCadastro DATETIME NOT NULL,
  IdCadastrador INT NOT NULL

	CONSTRAINT PK_MunicipenNumeroNovo PRIMARY KEY([MunicipeNM]),
	CONSTRAINT FK_TipoDocIdentificacaoDoMunicipeNovo FOREIGN KEY (MunicipeTipoDocIdentificacao)REFERENCES dbo.TB_TipoDocIdentificacao(Id),
	CONSTRAINT FK_GeneroDoMunicipeNovo FOREIGN KEY (MunicipeGenero)REFERENCES dbo.TB_Generos(GeneroId),
	CONSTRAINT FK_EstadoCivilDoMunicipeNovo FOREIGN KEY (MunicipeEstadoCivil)REFERENCES dbo.TB_EstadoCivil(EstadoCivilId),
  CONSTRAINT FK_NMDosAgregadosNovo FOREIGN KEY (MunicipeAgregadoNM) REFERENCES TB_TesteMunicipe (MunicipeNM),
  CONSTRAINT FK_GrauParentescoDoAgregadoNovo FOREIGN KEY (MunicipeGrauParentesco) REFERENCES TB_GrauParentesco(GrauParentescoId),
	
	CONSTRAINT FK_UsuarioQCadastraOMunicipeNovo FOREIGN KEY (IdCadastrador)REFERENCES dbo.TB_Usuarios(Id),
	
)
  GO
CREATE PROCEDURE dbo.SP_TesteMunicipeAdd
  
	@MunicipeNomeCompleto varchar(100),
	@MunicipeDataNascimento date,
	@MunicipeNDocIdent varchar(50),
	@MunicipeTipoDocIdentificacao int,
	@MunicipeDocDataEmissao date,
	@MunicipeDocDataValidade date,
	@MunicipeNIF varchar(50),
	@MunicipeGenero int,
	@MunicipeEstadoCivil int,
	@MunicipeTelefone1 VARCHAR(15),
	@MunicipeTelefone2 VARCHAR(15),
	@MunicipeEmail varchar(50),
  @MunicipeAgregadoNM BIGINT,
  @MunicipeGrauParentesco INT,
	@MunicipeEstado bit,
	@MunicipeDataCadastro DATETIME,
  @IdCadastrador INT
  AS
  DECLARE @@NMGerado BIGINT
      
  SELECT @@NMGerado=MAX(MunicipeNM) FROM TB_TesteMunicipe
  IF @@NMGerado IS NULL
    BEGIN  
  	SET @@NMGerado=1000000000000000
    END
  ELSE
    BEGIN
    	SET @@NMGerado=@@NMGerado+1
    END
  
  BEGIN
    
  	INSERT INTO TB_TesteMunicipe (MunicipeNM, MunicipeNomeCompleto, MunicipeDataNascimento, MunicipeNDocIdent,
      MunicipeTipoDocIdentificacao, MunicipeDocDataEmissao, MunicipeDocDataValidade, MunicipeNIF, MunicipeGenero,
      MunicipeEstadoCivil, MunicipeTelefone1, MunicipeTelefone2, MunicipeEmail, MunicipeAgregadoNM, MunicipeGrauParentesco,
      MunicipeEstado, MunicipeDataCadastro, IdCadastrador)
  VALUES (@@NMGerado, @MunicipeNomeCompleto, @MunicipeDataNascimento, @MunicipeNDocIdent,
    @MunicipeTipoDocIdentificacao, @MunicipeDocDataEmissao, @MunicipeDocDataValidade, @MunicipeNIF, 1,
    2, @MunicipeTelefone1, @MunicipeTelefone2, @MunicipeEmail, @MunicipeAgregadoNM, 1, 0, GETDATE(), 1);
  END