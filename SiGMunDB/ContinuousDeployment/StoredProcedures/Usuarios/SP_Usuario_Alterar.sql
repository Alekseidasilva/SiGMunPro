CREATE PROCEDURE [dbo].[SP_Usuario_Alterar]
	@UsuId int,
	@UsuNomeCompleto varchar(100),
	@UsuEmail varchar(200),
	@UsuSenha varchar(200),
	@UsuPerfilId int,
	@UsuDataCadastro DATE,
	@UsuIdUsuario int,
	@UsuEstado bit
AS
	BEGIN
	    UPDATE dbo.TB_Usuarios SET		
	UsuNomeCompleto=@UsuNomeCompleto,
	UsuEmail=@UsuEmail,
	UsuSenha=@UsuSenha,
	UsuPerfilId=@UsuPerfilId,
	UsuDataCadastro=@UsuDataCadastro,
	UsuIdUsuario=@UsuIdUsuario,
	UsuEstado=@UsuEstado
	WHERE 
	UsuId=@UsuId
	END