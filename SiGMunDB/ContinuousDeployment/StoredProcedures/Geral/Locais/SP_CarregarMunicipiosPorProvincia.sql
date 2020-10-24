CREATE PROCEDURE [dbo].[SP_CarregarMunicipiosPorProvincia]
	@id int	
AS
BEGIN
	SELECT MunicipioId
		 ,MunicipioNome
		 ,MunicipioProvinciaId FROM TB_Municipios
		 WHERE MunicipioProvinciaId=@Id
END
