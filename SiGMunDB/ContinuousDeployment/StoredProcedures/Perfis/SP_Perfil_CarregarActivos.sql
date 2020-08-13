CREATE PROCEDURE [dbo].[SP_Perfil_CarregarActivos]
	
AS
BEGIN
SELECT Id, Name,Estado, DataCadastro FROM dbo.TB_Perfil WHERE Estado=1
END
