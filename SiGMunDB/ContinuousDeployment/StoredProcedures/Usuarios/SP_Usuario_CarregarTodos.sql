 CREATE PROCEDURE [dbo].[SP_Usuario_CarregarTodos]
	
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
END
