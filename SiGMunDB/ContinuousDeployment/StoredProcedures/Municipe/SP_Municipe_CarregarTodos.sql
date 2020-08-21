CREATE PROCEDURE [dbo].[SP_Municipe_CarregarTodos]
AS
BEGIN
    SELECT 
MunicipeId,
MunicipeNM ,
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
MunicipeEstado,
IdCadastrador
FROM dbo.TB_Municipes
END

