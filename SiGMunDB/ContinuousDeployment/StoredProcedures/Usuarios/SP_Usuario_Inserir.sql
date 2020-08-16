CREATE PROCEDURE SP_Usuario_Inserir
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
      @PerfilId INT,
      @Idcadastrador int
  AS
  DECLARE @@UserId INT
  DECLARE @@UserIdNoPerfil INT
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
      UserName,
	  Idcadastrador
      )
  VALUES 
      (      
      @NomeCompleto,
      @Estado ,
      @DataCadastro ,
      @Email,
      @EmailConfirmed,
      @PasswordHash ,
      @SecurityStamp ,
      @PhoneNumber , 
      @PhoneNumberConfirmed ,
      @TwoFactorEnabled,
      @LockoutEndDateUtc ,
      @LockoutEnabled ,
      @AccessFailedCount,
      @UserName, 
      @Idcadastrador);
      SELECT @@UserId=@@IDENTITY
      SELECT @UserName AS retorno
  END
  BEGIN  
  SELECT @@UserIdNoPerfil=UserId FROM dbo.TB_Permissoes tp WHERE tp.UserId=@@UserId AND tp.RoleId=@PerfilId
    IF @@UserIdNoPerfil IS NULL OR @@UserIdNoPerfil>0
      BEGIN  
    	INSERT INTO dbo.TB_Permissoes (UserId, RoleId)VALUES (@@UserId, @PerfilId);
    END 
END


  ----DECLARE @@IdAuto int
----SELECT @@IdAuto=MAX(Id) FROM dbo.TB_Usuarios
----IF @@IdAuto IS NULL
----BEGIN
----    SET @@IdAuto=0
----    set @@IdAuto=@@IdAuto+1
----END
----else
----begin
----SET @@IdAuto=@@IdAuto+1
----end