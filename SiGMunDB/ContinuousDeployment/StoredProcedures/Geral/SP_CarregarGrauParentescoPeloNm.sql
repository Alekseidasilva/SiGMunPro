CREATE PROCEDURE [dbo].[SP_CarregarGrauParentescoPeloNm]
	@MunicipenM varchar(20)	
AS
begin
SELECT tgp.GrauParentescoIdNome FROM TB_GrauParentesco tgp
  JOIN TB_Municipes tm ON tgp.GrauParentescoId = tm.MunicipeGrauParentescoId
  WHERE tm.MunicipeParenteNM=@MunicipenM
end
