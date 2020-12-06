CREATE PROCEDURE [dbo].[SP_Usuario_Tentativas]
	@UserName VARCHAR(200),	
	@Tentativas int
AS
BEGIN
if @Tentativas=3
begin
  update 
	 dbo.TB_Usuarios set
	 Estado=0
end
    update 
	 dbo.TB_Usuarios set
	 AccessFailedCount=@Tentativas
	 WHERE UserName=@UserName	 
		
END
