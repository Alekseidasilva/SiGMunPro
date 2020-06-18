CREATE PROCEDURE [dbo].[SP_Municipe_Excluir]
	@MunicipeNM BIGINT
AS
	BEGIN
	    DELETE dbo.TB_Municipes WHERE MunicipeNM=@MunicipeNM
	END
