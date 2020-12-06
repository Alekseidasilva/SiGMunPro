CREATE PROCEDURE [dbo].[SP_UsuarioBuscarEstado]
	@UserName VARCHAR(200)
AS
BEGIN
  SELECT Estado FROM TB_Usuarios tu
	 WHERE UserName=@UserName		
END
