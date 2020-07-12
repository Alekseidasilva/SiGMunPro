CREATE TABLE [dbo].[TB_Operacao]
(
	OperacaoId INT NOT NULL,
	OperacaoMunicipeNM BIGINT NOT NULL,
	OperacaoTipoDocumentoId INT NOT NULL,
	OperacaoDocsFinalidadeId INT NOT NULL,
	OperacaoFormaPagamentoId INT NOT NULL,
	OperacaoValorTotal DECIMAL(18,2) NOT NULL,
	OperacaoData DATE NOT NULL,
	OperacaoUsuarioId INT NOT NULL

	
	CONSTRAINT PK_OperacaoId PRIMARY KEY(OperacaoId)
	CONSTRAINT FK_MunicipeQSolicitaAOpercao FOREIGN  KEY(OperacaoMunicipeNM) REFERENCES dbo.TB_Municipes(MunicipeNM),
	CONSTRAINT FK_TipoDeDocumentoOperacao FOREIGN  KEY(OperacaoTipoDocumentoId) REFERENCES dbo.TB_TiposDocumentos,
	CONSTRAINT FK_FinalidadeDoDocumentoOperacao FOREIGN  KEY(OperacaoDocsFinalidadeId) REFERENCES dbo.TB_DocsFinalidades,
	CONSTRAINT FK_FormaPagamentoDaOperacao FOREIGN  KEY(OperacaoFormaPagamentoId) REFERENCES dbo.TB_FormasPagamento,
    CONSTRAINT FK_UsuarioQEfectouAOperacao FOREIGN  KEY(OperacaoUsuarioId) REFERENCES dbo.TB_Usuarios,

	
)
