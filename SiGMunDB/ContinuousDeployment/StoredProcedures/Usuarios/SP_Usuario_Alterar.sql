CREATE PROCEDURE [dbo].[SP_Usuario_Alterar]
  @Id INT,
  @NomeCompleto VARCHAR(max),
  @Estado bit,
  @DataCadastro date,
  @Email VARCHAR(max),
  @EmailConfirmed bit,
  @PasswordHash VARCHAR(max),
  @SecurityStamp VARCHAR(max),
  @PhoneNumber VARCHAR(MAX),
  @PhoneNumberConfirmed bit,
  @TwoFactorEnabled bit,
  @LockoutEndDateUtc DATE,
  @LockoutEnabled bit,
  @AccessFailedCount int,
  @UserName VARCHAR(max) 
AS
	BEGIN
	    UPDATE dbo.TB_Usuarios SET		
	
  NomeCompleto=@NomeCompleto,
  Estado=@Estado,
  DataCadastro=@DataCadastro,
  Email=@Email,
  EmailConfirmed=@EmailConfirmed,
  PasswordHash=@PasswordHash,
  SecurityStamp=@SecurityStamp,
  PhoneNumber=@PhoneNumber,
  PhoneNumberConfirmed=@PhoneNumberConfirmed,
  TwoFactorEnabled=@TwoFactorEnabled,
  LockoutEndDateUtc=@LockoutEndDateUtc,
  LockoutEnabled=@LockoutEnabled,
  AccessFailedCount=@AccessFailedCount,
  UserName=@UserName
	WHERE 
	Id=@Id
	END
