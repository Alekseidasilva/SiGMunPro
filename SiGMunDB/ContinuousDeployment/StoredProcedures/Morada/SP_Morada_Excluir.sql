CREATE PROCEDURE [dbo].[SP_Morada_Excluir]
	@MoradaMunicuipeNM BIGINT
AS
	BEGIN
	    DELETE dbo.TB_Moradas 
		WHERE MoradaMunicuipeNM=@MoradaMunicuipeNM
	END
