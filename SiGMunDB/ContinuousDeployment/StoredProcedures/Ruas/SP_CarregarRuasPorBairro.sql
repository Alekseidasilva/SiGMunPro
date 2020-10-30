CREATE PROCEDURE [dbo].[SP_CarregarRuasPorBairro]
	@BairroID INT
	
AS
BEGIN
SELECT tr.RuaId,tr.RuaNome,tr.RuaBairroId FROM dbo.TB_Ruas tr
WHERE tr.RuaBairroId=@BairroID
END
