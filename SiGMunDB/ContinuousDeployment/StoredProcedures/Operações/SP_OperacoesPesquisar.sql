CREATE PROC dbo.SP_OperacoesPesquisar
  @txtPesquisar VARCHAR(50)
  AS
  BEGIN
  	SELECT OperacaoId,
  OperacaoMunicipeNM,
  OperacaoTipoDocumentoId,
  OperacaoDocsFinalidadeId,
  OperacaoFormaPagamentoId,
  OperacaoValorTotal,
  OperacaoData,
 TB_Operacao.IdCadastrador
  FROM TB_Operacao 
  JOIN TB_DocsFinalidades tdf ON TB_Operacao.OperacaoDocsFinalidadeId = tdf.FinalidadeId
  JOIN TB_TiposDocumentos ttd ON tdf.FinalidadeTipoDocumento = ttd.DocumentoId
  JOIN TB_Municipes tm ON TB_Operacao.OperacaoMunicipeNM = tm.MunicipeNM
  JOIN TB_FormasPagamento tfp ON TB_Operacao.OperacaoFormaPagamentoId = tfp.FormaPagamentoId

  WHERE OperacaoMunicipeNM LIKE '%'+@txtPesquisar+'%'
  OR ttd.DocumentoNome LIKE '%'+@txtPesquisar+'%'
  OR tdf.FinalidadeNome LIKE '%'+@txtPesquisar+'%' 
  OR tfp.FormaPagamentoNome LIKE '%'+@txtPesquisar+'%' 
  END

