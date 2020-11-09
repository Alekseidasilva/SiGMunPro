CREATE PROCEDURE [dbo].[SP_Morada_Alterar]
	@MoradaMunicuipeNM VARCHAR(20),
	@MoradaCasaNumero VARCHAR(10),	
	@MoradaZona VARCHAR(20),
	@MoradaRuaId int
	
AS
	BEGIN
	    UPDATE dbo.TB_Moradas 
		SET	
	MoradaCasaNumero=@MoradaMunicuipeNM,	
	MoradaZona=@MoradaZona,
	MoradaRuaId=@MoradaRuaId
	    
		WHERE MoradaMunicuipeNM=@MoradaMunicuipeNM AND MoradaEstado=1
	END
	 
     