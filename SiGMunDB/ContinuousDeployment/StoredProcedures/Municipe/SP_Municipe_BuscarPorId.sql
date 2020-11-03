CREATE PROCEDURE [dbo].[SP_Municipe_BuscarPorId]
	@Id INT	
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
Idcadastrador
FROM TB_Municipes WHERE MunicipeId=@Id
END
