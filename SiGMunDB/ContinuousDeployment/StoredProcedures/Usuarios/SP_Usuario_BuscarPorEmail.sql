CREATE PROCEDURE [dbo].[SP_Usuario_BuscarPorEmail]
	@Email VARCHAR(200)	
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
  UserName  FROM dbo.TB_Usuarios	
	where Email=@Email
	
END