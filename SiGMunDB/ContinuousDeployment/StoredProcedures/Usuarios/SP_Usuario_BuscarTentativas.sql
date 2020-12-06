CREATE PROCEDURE SP_Usuario_BuscarTentativas
		@UserName VARCHAR(200)
	
AS
BEGIN
    SELECT 

  AccessFailedCount
 
	FROM dbo.TB_Usuarios
	WHERE UserName=@UserName 
	
	
END
