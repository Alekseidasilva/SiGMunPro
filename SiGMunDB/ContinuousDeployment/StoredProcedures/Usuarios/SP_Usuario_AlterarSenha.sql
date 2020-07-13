CREATE PROCEDURE [dbo].[SP_Usuario_AlterarSenha]
	@UsuId INT,
	@UsuNovaSenha VARCHAR(200)
    
AS
BEGIN
    UPDATE dbo.TB_Usuarios 
	SET UsuSenha=@UsuNovaSenha
	WHERE UsuId=@UsuId
	select 'true' as retorno
END
