 CREATE PROCEDURE [dbo].[SP_Usuario_CarregarTodos]
	
AS
BEGIN
    SELECT
	UsuId,
	UsuNomeCompleto,
	UsuEmail,UsuSenha,
	UsuPerfilId,
	UsuDataCadastro,
	UsuIdUsuario,
	UsuEstado  FROM dbo.TB_Usuarios
END
