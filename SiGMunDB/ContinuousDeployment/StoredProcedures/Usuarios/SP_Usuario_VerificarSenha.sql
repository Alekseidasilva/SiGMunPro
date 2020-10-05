CREATE PROCEDURE [dbo].[SP_Usuario_VerificarSenha]

    @UserName VARCHAR(200),
	@Senha VARCHAR(200)
AS

BEGIN
    SELECT id FROM dbo.TB_Usuarios
	WHERE Username=@UserName AND PasswordHash=@Senha 
	
END
