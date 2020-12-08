CREATE PROCEDURE [dbo].[SP_FinalidadeCarregarValor]
	@id int	
AS
BEGIN
	SELECT FinalidadeValor FROM dbo.TB_DocsFinalidades 	 
	 WHERE FinalidadeId = @id
END