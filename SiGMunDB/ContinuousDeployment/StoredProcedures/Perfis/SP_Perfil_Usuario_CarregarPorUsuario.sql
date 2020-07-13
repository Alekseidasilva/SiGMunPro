CREATE PROCEDURE [dbo].[SP_Perfil_Usuario_CarregarPorUsuario]
AS
BEGIN
    	SELECT PerfilId,PerfilNome FROM dbo.TB_Perfil_Usuario pu
        JOIN dbo.TB_Usuarios  u ON u.UsuPerfilId=pu.PerfilId
END


