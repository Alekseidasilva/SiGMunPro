CREATE PROCEDURE [dbo].[SP_Municipe_BuscarPorId]
	@Id INT	
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
MunicipeNIF,
MunicipeGenero,
MunicipeEstadoCivil,
MunicipeTelefone1,
MunicipeTelefone2,
MunicipeEmail,
MunicipeDataCadastro,
MunicipeFoto,
MunicipeEstado,
IdCadastrador
FROM TB_Municipes WHERE MunicipeId=@Id
END
