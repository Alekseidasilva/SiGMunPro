CREATE PROCEDURE [dbo].[SP_Perfil_Usuario_CarregarTodos]
AS
BEGIN
    	SELECT PerfilId,PerfilNome FROM dbo.TB_Perfil_Usuario
END


