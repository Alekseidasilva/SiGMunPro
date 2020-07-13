CREATE PROCEDURE [dbo].[SP_Banco_CarregarTodos]
	
AS
BEGIN
    SELECT 
	BancoId,
	BancoNome,
	BancoSigla,
	BancoEstado,
	BancoUsuarioid
	FROM dbo.TB_Bancos
END
	