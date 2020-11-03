CREATE PROCEDURE [dbo].[SP_CarregarTipoDocIdentPorId]
	@TipoDocId int
AS
BEGIN
	SELECT Id,Nome FROM dbo.TB_TipoDocIdentificacao
END