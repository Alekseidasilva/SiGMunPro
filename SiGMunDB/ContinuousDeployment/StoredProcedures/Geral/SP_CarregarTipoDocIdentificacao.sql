CREATE PROCEDURE dbo.SP_CarregarTipoDocIdentificacao
AS
BEGIN
    SELECT Id, Nome FROM dbo.TB_TipoDocIdentificacao 
END

