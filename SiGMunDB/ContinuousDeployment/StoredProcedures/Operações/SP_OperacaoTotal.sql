CREATE PROCEDURE [dbo].[SP_OperacaoTotal]
as
begin
SELECT COUNT(op.OperacaoId) Qtde FROM dbo.TB_Operacao op
end
