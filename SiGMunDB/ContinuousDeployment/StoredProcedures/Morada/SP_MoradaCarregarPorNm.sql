CREATE PROCEDURE [dbo].[SP_MoradaCarregarPorNm]
	@MunicipeNm int
AS
BEGIN
	SELECT * FROM dbo.TB_Moradas
	WHERE MoradaMunicuipeNM=@MunicipeNm
END
	
