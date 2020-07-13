CREATE PROCEDURE [dbo].[SP_Usuario_AlterarSenha]
	@Id INT,
	@NovaSenha VARCHAR(200)
    
AS
BEGIN
    UPDATE dbo.TB_Usuarios 
	SET PasswordHash=@NovaSenha
	WHERE Id=@Id
	select 'true' as retorno
END
