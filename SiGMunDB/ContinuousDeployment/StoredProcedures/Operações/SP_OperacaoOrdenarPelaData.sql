CREATE PROCEDURE [dbo].[SP_OperacaoOrdenarPelaData]	
AS
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
    ORDER BY OperacaoData
End

