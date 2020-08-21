CREATE PROCEDURE dbo.SP_Usuario_Alterar
 @Id INT,
 @NomeCompleto NVARCHAR(MAX),
 @Estado bit,
 @DataCadastro DATE,
 @Email NVARCHAR(256),
 @EmailConfirmed bit,
 @PasswordHash NVARCHAR(MAX),
 @SecurityStamp NVARCHAR(MAX),
 @PhoneNumber NVARCHAR(MAX), 
 @PhoneNumberConfirmed bit,
 @TwoFactorEnabled bit,
 @LockoutEndDateUtc DATE,
 @LockoutEnabled BIT,
 @AccessFailedCount INT,
 @UserName NVARCHAR(MAX),
 @PerfilId INT
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
      WHERE id=@Id
      SELECT @UserName AS retorno
  END
  BEGIN  
  UPDATE dbo.TB_Permissoes SET
  RoleId=@PerfilId WHERE UserId=@Id  
  END 
