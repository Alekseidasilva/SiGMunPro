CREATE PROCEDURE [dbo].[SP_ParenteBuscarPeloNm]
	@nM varchar(20)	
AS
BEGIN
	SELECT	
		MunicipeId,
		MunicipeNm,
		MunicipeNomeCompleto,
		MunicipeDataNascimento,
		MunicipeNDocIdent,
		MunicipeTipoDocIdentificacao,
		MunicipeDocDataEmissao,
		MunicipeDocDataValidade,
		MunicipeNif,
		MunicipeGenero,
		MunicipeEstadoCivil,
		MunicipeTelefone1,
		MunicipeTelefone2,
		MunicipeEmail,
		MunicipeDataCadastro,
		MunicipeFoto,
		MunicipeEstado,
		MunicipeGrauParentescoId, 
		Idcadastrador
	FROM TB_Municipes WHERE MunicipeNm=@nM
end
