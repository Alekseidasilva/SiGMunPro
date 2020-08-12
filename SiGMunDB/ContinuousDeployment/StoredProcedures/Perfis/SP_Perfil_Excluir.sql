CREATE PROCEDURE [dbo].[SP_Perfil_Excluir]
	@Id int	
AS	
BEGIN
SELECT Name AS retorno FROM dbo.TB_Perfil   where Id=@Id	
delete from dbo.TB_Perfil where Id=@Id
   
   
END
