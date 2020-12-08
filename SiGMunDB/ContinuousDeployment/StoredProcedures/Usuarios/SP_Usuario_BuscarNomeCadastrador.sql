CREATE PROCEDURE dbo.SP_Usuario_BuscarNomeCadastrador
	@UserId int	
AS
BEGIN
  DECLARE @@idCadastrador int
	BEGIN	 
     SELECT @@idCadastrador=IdCadastrador FROM dbo.TB_Usuarios tu WHERE tu.Id= @UserId
	 END
	 BEGIN
	     SELECT UserName FROM dbo.TB_Usuarios tu WHERE Id=@@idCadastrador
	 END  
END

     
	
