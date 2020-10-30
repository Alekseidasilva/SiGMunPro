CREATE PROCEDURE [dbo].[SP_Morada_Alterar]
	@MoradaMunicuipeNM VARCHAR(20),
	@MoradaCasaNumero VARCHAR(10),	
	@MoradaZona VARCHAR(20),
	@MoradaRuaId int,
	@MoradaEstado bit
AS
	BEGIN
	    UPDATE dbo.TB_Moradas 
		SET	
	MoradaCasaNumero=@MoradaMunicuipeNM,	
	MoradaZona=@MoradaZona,
	MoradaRuaId=@MoradaRuaId,	
	MoradaEstado=@MoradaEstado     
		WHERE MoradaMunicuipeNM=@MoradaMunicuipeNM
	END
	 
     