CREATE PROCEDURE [dbo].[SP_OperacaoOrdenarPeloNM]
as
begin
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
    ORDER BY OperacaoMunicipeNM
end