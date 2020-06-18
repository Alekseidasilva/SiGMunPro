CREATE PROCEDURE [dbo].[SP_DocsFinalidades_Excluir]
	@FinalidadeId int
	
AS
BEGIN
    DELETE FROM dbo.TB_DocsFinalidades WHERE FinalidadeId=@FinalidadeId
END

