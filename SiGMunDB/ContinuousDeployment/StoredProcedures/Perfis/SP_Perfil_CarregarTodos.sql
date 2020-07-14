CREATE PROCEDURE [dbo].SP_Perfil_CarregarTodos
AS
BEGIN
    	SELECT Id, Name,Estado, DataCadastro FROM dbo.TB_Perfil
END


