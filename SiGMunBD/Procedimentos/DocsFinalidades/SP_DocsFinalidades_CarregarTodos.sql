CREATE PROCEDURE [dbo].[SP_DocsFinalidades_CarregarTodos]
AS
	BEGIN
	    SELECT
		FinalidadeId,
		FinalidadeNome,
		FinalidadeEstado,
		FinalidadeUsuarioId 
		FROM dbo.TB_DocsFinalidades
	END
