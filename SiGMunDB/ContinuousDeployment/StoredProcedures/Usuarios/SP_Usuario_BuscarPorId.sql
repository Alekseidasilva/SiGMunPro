CREATE PROCEDURE [dbo].[SP_Usuario_BuscarPorId]
	@UsuId VARCHAR(200)	
AS
BEGIN
    SELECT 
  tu.Id,
  tu.NomeCompleto,
  tu.Estado,
  tu.DataCadastro,
  tu.Email,
  tu.EmailConfirmed,
  tu.PasswordHash,
  tu.SecurityStamp,
  tu.PhoneNumber,
  tu.PhoneNumberConfirmed,
  tu.TwoFactorEnabled,
  tu.LockoutEndDateUtc,
  tu.LockoutEnabled,
  tu.AccessFailedCount,
  tu.UserName,
      tpf.Id PerfilId,
      tu.IdCadastrador
     
	FROM dbo.TB_Usuarios tu
      JOIN dbo.TB_Permissoes tp ON tu.Id = tp.UserId
      JOIN dbo.TB_Perfil tpf ON tp.RoleId = tpf.Id	
	where tu.Id=@UsuId
	
END