CREATE PROCEDURE [dbo].[SP_MoradaCarregarPorNm]
	@MunicipeNm int
AS
BEGIN
	SELECT 
	MoradaCasaNumero,	
	MoradaZona,
	MoradaRuaId,
	MoradaDataCadastro,
	MoradaEstado, 
    IdCadastrador  FROM dbo.TB_Moradas
	WHERE MoradaMunicuipeNM=@MunicipeNm
END
	
