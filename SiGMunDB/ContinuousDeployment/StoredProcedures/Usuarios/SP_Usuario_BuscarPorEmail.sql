CREATE PROCEDURE [dbo].[SP_Usuario_BuscarPorEmail]
	@UsuEmail VARCHAR(200)	
AS
BEGIN
    SELECT 	
	UsuId,
	UsuEmail,
	UsuNomeCompleto,
	UsuEmail,UsuSenha,
	UsuPerfilId,
	UsuDataCadastro,
	UsuIdUsuario,
	UsuEstado  FROM dbo.TB_Usuarios	
	where UsuEmail=@UsuEmail
	
END