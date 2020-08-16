CREATE PROCEDURE [dbo].[SP_Usuario_Login]
	@UserName VARCHAR(200),
	@Senha VARCHAR(200)
AS
BEGIN
    SELECT 
	Id,
  NomeCompleto,
  Estado,
  DataCadastro,
  Email,
  EmailConfirmed,
  PasswordHash,
  SecurityStamp,
  PhoneNumber,
  PhoneNumberConfirmed,
  TwoFactorEnabled,
  LockoutEndDateUtc,
  LockoutEnabled,
  AccessFailedCount,
  UserName
	FROM dbo.TB_Usuarios
	WHERE Username=@UserName AND PasswordHash=@Senha 
	--AND UsuEstado=1
	
END
