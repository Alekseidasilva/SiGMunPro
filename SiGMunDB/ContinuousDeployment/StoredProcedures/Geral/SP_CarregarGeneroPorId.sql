CREATE PROCEDURE dbo.SP_CarregarGeneroPorId
@Id int
	AS
BEGIN
    SELECT  generoNome FROM dbo.TB_Generos
	WHERE GeneroId=@Id
END