CREATE PROCEDURE [dbo].[SP_Municipe_CarregarTodos]
AS
BEGIN
    SELECT 
MunicipeId,
MunicipeNM,
MunicipeNomeCompleto,
MunicipeDataNascimento,
MunicipeNDocIdent,
MunicipeDocDataEmissao,
MunicipeDocDataValidade,
MunicipeNIF,
MunicipeGenero,
MunicipeEstadoCivil,
MunicipeTelefone1,
MunicipeTelefone2,
MunicipeEmail,
MunicipeMorada,
MunicipeEstado,
MunicipeUsuarioId
FROM dbo.TB_Municipes
END
