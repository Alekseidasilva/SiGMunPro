CREATE PROCEDURE [dbo].[SP_Usuario_BuscarPorId]
	@UsuId VARCHAR(200)	
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
	where Id=@UsuId
	
END