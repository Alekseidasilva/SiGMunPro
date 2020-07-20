CREATE PROCEDURE [dbo].[SP_PerfilDoUsuario]
@UserId int
AS
BEGIN
    SELECT tp1.Name FROM dbo.TB_Permissoes tp
  JOIN dbo.TB_Usuarios tu ON  tu.Id=tp.UserId
  JOIN dbo.TB_Perfil tp1 ON tp.RoleId=tp1.Id
END