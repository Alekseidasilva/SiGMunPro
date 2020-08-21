CREATE PROCEDURE dbo.SP_CarregarGeneros	
AS
BEGIN
    SELECT GeneroId, generoNome FROM dbo.TB_Generos
END

