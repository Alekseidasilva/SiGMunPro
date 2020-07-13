CREATE PROCEDURE [dbo].[SP_Perfil_Usuario_Alterar]
	@PerfilId int ,
	@PerfilNome int
AS
BEGIN
    UPDATE dbo.TB_Perfil_Usuario 
	SET PerfilNome=@PerfilNome
	WHERE PerfilId=@PerfilId
END
