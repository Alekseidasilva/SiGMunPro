CREATE PROCEDURE [dbo].[SP_CarregarTipoDocIdentPorId]
	@TipoDocId int
AS
BEGIN
	SELECT Nome FROM dbo.TB_TipoDocIdentificacao where Id=@TipoDocId
END