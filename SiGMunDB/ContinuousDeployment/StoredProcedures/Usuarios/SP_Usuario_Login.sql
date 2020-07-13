CREATE PROCEDURE [dbo].[SP_Usuario_Login]
	@Email VARCHAR(200),
	@Senha VARCHAR(200)
AS
BEGIN
    SELECT 
	UsuId,
	UsuNomeCompleto,
	UsuEmail,UsuSenha,
	UsuPerfilId,
	UsuDataCadastro,
	UsuIdUsuario,
	UsuEstado 
	FROM dbo.TB_Usuarios
	WHERE UsuEmail=@Email AND UsuSenha=@Senha 
	--AND UsuEstado=1
	
END
