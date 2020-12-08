CREATE PROCEDURE [dbo].[SP_ParenteBuscarPeloNm]
	@nM varchar(20)	
AS
BEGIN
	SELECT	
		MunicipeId,
		MunicipeNM,
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
		IdCadastrador
	FROM TB_Municipes WHERE MunicipeNM=@nM
end
