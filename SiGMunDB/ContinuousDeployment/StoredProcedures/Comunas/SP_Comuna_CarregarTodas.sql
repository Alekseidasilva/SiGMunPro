CREATE PROCEDURE [dbo].[SP_Comuna_CarregarTodas]
AS
BEGIN
    SELECT
	ComunaId,	
	ComunaNome,	
	ComunaMunicipioId	
	
	FROM dbo.TB_Comunas
END


