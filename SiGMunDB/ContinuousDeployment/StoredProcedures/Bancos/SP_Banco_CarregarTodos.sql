CREATE PROCEDURE [dbo].[SP_Banco_CarregarTodos]
	
AS
BEGIN
    SELECT 
	BancoId,
	BancoNome,
	BancoSigla,
	BancoEstado
	
	FROM dbo.TB_Bancos
END
	