CREATE PROCEDURE [dbo].[SP_MunicipeTotalCadastrados]
AS
BEGIN
	SELECT COUNT(tm.MunicipeNM) Qtde FROM TB_Municipes tm
END

