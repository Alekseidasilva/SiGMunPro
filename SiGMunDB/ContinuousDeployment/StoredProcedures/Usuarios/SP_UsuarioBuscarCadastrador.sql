CREATE PROCEDURE [dbo].[SP_UsuarioBuscarCadastrador]
	@UsuId int
AS
BEGIN
	SELECT UserName FROM dbo.TB_Usuarios
	WHERE IdCadastrador=@UsuId
END
