 CREATE PROCEDURE [dbo].[SP_Usuario_BuscarPorNome]
	@nome NVARCHAR(256)
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
	WHERE NomeCompleto LIKE '%'+@nome+'%'
END
