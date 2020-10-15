CREATE PROCEDURE [dbo].[SP_DocsFinalidades_CarregarTodos]
AS
	BEGIN
	    SELECT
		FinalidadeId,
		FinalidadeNome,
		FinalidadeEstado,
		IdCadastrador 
		FROM dbo.TB_DocsFinalidades
	END
