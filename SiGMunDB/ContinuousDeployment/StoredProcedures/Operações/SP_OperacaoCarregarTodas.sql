CREATE PROCEDURE [dbo].[SP_OperacaoCarregarTodas]
  AS
  BEGIN
  	SELECT 
      OperacaoId,
      OperacaoMunicipeNM, 
      OperacaoTipoDocumentoId,
      OperacaoDocsFinalidadeId,
      OperacaoFormaPagamentoId,
      OperacaoValorTotal,
      OperacaoData,
      IdCadastrador
      FROM TB_Operacao 
  END
