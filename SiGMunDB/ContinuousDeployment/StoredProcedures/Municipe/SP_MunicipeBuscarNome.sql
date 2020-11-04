CREATE PROCEDURE [dbo].[SP_MunicipeBuscarNome]
@MunicipeNm VARCHAR(20)
AS
BEGIN
	SELECT MunicipeNomeCompleto FROM TB_Municipes tm
  WHERE tm.MunicipeNM=@MunicipeNm
END
	