CREATE PROCEDURE [dbo].[SP_Permissao_CarregarPorPerfil]
	@Perfil int	
AS
BEGIN
    SELECT 
	PermissaoId,	
	PermissaoNome,
	PermissaEstado
	FROM dbo.TB_Permissao_Por_Perfil pp
	JOIN dbo.TB_Perfil_Usuario pu ON pp.PermissaoPerfilId=pu.PerfilId
	WHERE PermissaoPerfilId=@Perfil
END
