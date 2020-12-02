CREATE PROCEDURE [dbo].[SP_OperacaoOrdenarPeloTipoDeDocumento]
AS
begin
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
      ORDER BY ttd.DocumentoNome
end
