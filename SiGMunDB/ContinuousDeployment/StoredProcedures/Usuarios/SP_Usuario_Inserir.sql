CREATE PROCEDURE dbo.SP_Usuario_Inserir
  
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
--DECLARE @@IdAuto int
--SELECT @@IdAuto=MAX(Id) FROM dbo.TB_Usuarios
--IF @@IdAuto IS NULL
--BEGIN
--    SET @@IdAuto=0
--    set @@IdAuto=@@IdAuto+1
--END
--else
--begin
--SET @@IdAuto=@@IdAuto+1
--end


BEGIN

    INSERT INTO TB_Usuarios
(
  
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
    )
    VALUES
    (
    
  @NomeCompleto ,
  @Estado ,
  @DataCadastro,
  @Email,
  @EmailConfirmed ,
  @PasswordHash ,
  @SecurityStamp,
  @PhoneNumber ,
  @PhoneNumberConfirmed,
  @TwoFactorEnabled ,
  @LockoutEndDateUtc,
  @LockoutEnabled ,
  @AccessFailedCount,
  @UserName  
    
    )

    SELECT 'True' AS retorno
END

