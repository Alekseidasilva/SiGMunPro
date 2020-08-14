CREATE PROCEDURE [dbo].[SP_Perfil_UsuarioInativos]
	@PerfilId int	
AS
BEGIN
    SELECT COUNT(tu.Id) Qtde  FROM dbo.TB_Perfil tp
  JOIN dbo.TB_Permissoes tp1 ON tp.Id = tp1.RoleId
  JOIN dbo.TB_Usuarios tu ON tp1.UserId = tu.Id
  WHERE tp.Id=@PerfilId AND  tu.Estado=0
END