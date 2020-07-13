CREATE PROCEDURE [dbo].[SP_Usuario_BuscarPorId]
	@UsuId VARCHAR(200)	
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
	where UsuId=@UsuId
	
END