CREATE PROCEDURE [dbo].[SP_CarregarComunasPorMunicipio]
	@id int
AS
BEGIN
	SELECT tc.ComunaId,tc.ComunaNome,tc.ComunaMunicipioId FROM TB_Comunas tc WHERE tc.ComunaMunicipioId=@id ORDER BY tc.ComunaNome ASC
END
