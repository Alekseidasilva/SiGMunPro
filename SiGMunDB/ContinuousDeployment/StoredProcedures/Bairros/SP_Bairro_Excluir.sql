CREATE PROCEDURE [dbo].[SP_Bairro_Excluir]
	@BairroId INT
AS
BEGIN
    DELETE dbo.TB_Bairros WHERE BairroId=@BairroId
END
