CREATE PROCEDURE [dbo].[SP_Morada_Excluir]
	@MoradaMunicuipeNM BIGINT
AS
	BEGIN
	    DELETE FROM dbo.TB_Moradas 
		WHERE MoradaMunicuipeNM=@MoradaMunicuipeNM
	END
