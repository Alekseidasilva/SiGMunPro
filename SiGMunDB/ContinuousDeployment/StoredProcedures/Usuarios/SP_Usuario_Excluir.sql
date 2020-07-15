CREATE PROCEDURE [dbo].[SP_Usuario_Excluir]
@Id int
AS
BEGIN
    DELETE dbo.TB_Usuarios
	WHERE Id=@Id

	--SELECT UserName AS retorno
	
END

  