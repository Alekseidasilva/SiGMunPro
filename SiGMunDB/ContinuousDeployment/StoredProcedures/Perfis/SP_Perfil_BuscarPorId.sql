CREATE PROCEDURE [dbo].[SP_Perfil_BuscarPorId]
	@Id int
AS
begin
SELECT Id, Name,Estado, DataCadastro FROM dbo.TB_Perfil where Id=@Id
end
	
