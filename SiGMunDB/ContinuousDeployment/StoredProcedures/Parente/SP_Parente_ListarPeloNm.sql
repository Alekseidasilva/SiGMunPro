CREATE PROCEDURE [dbo].[SP_Parente_ListarPeloNm]
@MunicipeNm varchar(20)
AS
begin
SELECT 
tm.MunicipeId,
tm.MunicipeNM,
tm.MunicipeNomeCompleto,
tm.MunicipeDataNascimento,
tm.MunicipeNDocIdent,
tm.MunicipeTipoDocIdentificacao,
tm.MunicipeDocDataEmissao,
tm.MunicipeDocDataValidade,
tm.MunicipeNIF,
tm.MunicipeGenero,
tm.MunicipeEstadoCivil,
tm.MunicipeTelefone1,
tm.MunicipeTelefone2,
tm.MunicipeEmail,
tm.MunicipeEstado,
tm.MunicipeDataCadastro,
tm.MunicipeParenteNM,
tm.MunicipeGrauParentescoId,
tm.MunicipeFoto,
tm.IdCadastrador 
FROM TB_Municipes tm where MunicipeParenteNM=@MunicipeNm AND tm.MunicipeGrauParentescoId!=16
End
