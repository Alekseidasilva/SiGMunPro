CREATE PROCEDURE [dbo].[SP_Comuna_Excluir]
	@ComunaId int	
AS
BEGIN
    DELETE dbo.TB_Comunas 
	WHERE ComunaId=@ComunaId
END