CREATE PROCEDURE dbo.SP_Usuario_Alterar
 @Id INT,
 @NomeCompleto NVARCHAR(MAX),
 @Estado bit,
 @DataCadastro DATETIME,
 @Email NVARCHAR(256),
 @EmailConfirmed bit,
 @PasswordHash NVARCHAR(MAX),
 @SecurityStamp NVARCHAR(MAX),
 @PhoneNumber NVARCHAR(MAX), 
 @PhoneNumberConfirmed bit,
 @TwoFactorEnabled bit,
 @LockoutEndDateUtc DATETIME,
 @LockoutEnabled BIT,
 @AccessFailedCount INT,
 @UserName NVARCHAR(256),
 @PerfilId INT,
 @IdCadastrador int
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
      UserName=@UserName,
	  IdCadastrador=@IdCadastrador
      WHERE Id=@Id
      SELECT @UserName AS retorno
  END
  BEGIN  
  UPDATE dbo.TB_Permissoes SET RoleId=@PerfilId
  WHERE UserId=@Id  
  END 
