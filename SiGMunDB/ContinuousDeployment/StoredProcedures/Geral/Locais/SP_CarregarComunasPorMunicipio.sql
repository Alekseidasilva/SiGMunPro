CREATE PROCEDURE [dbo].[SP_CarregarComunasPorMunicipio]
	@id int
AS
BEGIN
	SELECT tc.ComunaId,tc.ComunaNome,tc.ComunaMunicipioId FROM TB_Comunas tc WHERE tc.ComunaMunicipioId=@Id ORDER BY tc.ComunaNome ASC
END
