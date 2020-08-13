CREATE PROCEDURE [dbo].[SP_Usuario_Sessao]
	@Email VARCHAR(200),
	@Senha VARCHAR(200)
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
  tp.Id  PerfilId,
  tp.Name PerfilNome
	FROM dbo.TB_Usuarios tu
  JOIN dbo.TB_Permissoes tperm ON tu.Id = tperm.UserId
  JOIN dbo.TB_Perfil tp ON tperm.RoleId=tp.Id
	WHERE tu.Email=@Email AND tu.PasswordHash=@Senha 
	--AND UsuEstado=1
END
