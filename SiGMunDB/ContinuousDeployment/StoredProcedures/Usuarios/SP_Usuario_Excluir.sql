CREATE PROCEDURE [dbo].[SP_Usuario_Excluir]
@UsuId int
AS
BEGIN
    DELETE dbo.TB_Usuarios
	WHERE UsuId=@UsuId
END