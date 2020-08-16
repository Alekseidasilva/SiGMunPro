CREATE PROCEDURE [dbo].[SP_Usuario_BuscarNomeCadastrador]
	@UserId int	
AS
DECLARE @@idCadastrador int
	BEGIN	 
     SELECT @@idCadastrador=IdCadastrador FROM dbo.TB_Usuarios tu WHERE tu.Id= @UserId
	 END
	 BEGIN
	     SELECT username FROM dbo.TB_Usuarios tu WHERE id=@@idCadastrador
	 END
     
	
