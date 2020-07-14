CREATE PROCEDURE [dbo].[SP_Perfil_Excluir]
	@Id int	
AS	
BEGIN
    SELECT Id,Name,Estado,DataCadastro FROM dbo.TB_Perfil
END
