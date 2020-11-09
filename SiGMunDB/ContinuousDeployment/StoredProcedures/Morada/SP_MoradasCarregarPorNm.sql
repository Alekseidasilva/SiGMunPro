CREATE PROCEDURE [dbo].[SP_MoradasCarregarPorNm]
	@MunicipeNm VARCHAR(20)
AS
BEGIN
	SELECT 
	MoradaMunicuipeNM,
	MoradaCasaNumero,	
	MoradaZona,
	MoradaRuaId,
	MoradaDataCadastro,
	MoradaEstado, 
    IdCadastrador  FROM dbo.TB_Moradas
	WHERE MoradaMunicuipeNM=@MunicipeNm
END
	
