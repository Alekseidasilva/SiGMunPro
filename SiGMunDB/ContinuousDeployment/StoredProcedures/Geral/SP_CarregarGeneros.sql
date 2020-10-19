CREATE PROCEDURE dbo.SP_CarregarGeneros	
AS
BEGIN
    SELECT GeneroId, GeneroNome FROM dbo.TB_Generos
END

