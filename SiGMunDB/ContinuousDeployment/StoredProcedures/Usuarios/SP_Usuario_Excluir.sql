CREATE PROCEDURE [dbo].[SP_Usuario_Excluir]
@UserId int
AS
BEGIN
	
	SELECT UserName AS retorno FROM dbo.TB_Usuarios	WHERE Id=@UserId
	DELETE FROM dbo.TB_Permissoes WHERE UserId=@UserId
	DELETE dbo.TB_Usuarios	WHERE Id=@UserId
END

  