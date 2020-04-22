CREATE PROCEDURE [dbo].[SP_Morada_Alterar]
	@MoradaMunicuipeNM	INT,
	@MoradaRua	varchar(100),	
	@MoradaZona	varchar(20),	
	@MoradaBairroId	INT	

AS
	BEGIN
	    UPDATE dbo.TB_Moradas 
		SET MoradaRua=@MoradaRua,
			MoradaZona=@MoradaZona,
			MoradaBairroId=@MoradaBairroId
		WHERE MoradaMunicuipeNM=@MoradaMunicuipeNM
	END
