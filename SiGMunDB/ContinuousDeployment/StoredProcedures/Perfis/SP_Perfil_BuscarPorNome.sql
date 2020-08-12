CREATE PROCEDURE [dbo].[SP_Perfil_BuscarPorNome]
	@Name nvarchar(256)
	
AS
begin
SELECT Id, Name,Estado, DataCadastro FROM dbo.TB_Perfil where name like '%'+@Name+'%' 
end
