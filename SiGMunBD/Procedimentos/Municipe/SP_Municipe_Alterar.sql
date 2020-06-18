CREATE PROCEDURE [dbo].[SP_Municipe_Alterar]
@MunicipeNM BIGINT,
@MunicipeNomeCompleto varchar(100),
@MunicipeDataNascimento date,
@MunicipeNDocIdent varchar(50),
@MunicipeDocDataEmissao date,
@MunicipeDocDataValidade date,
@MunicipeNIF varchar(50),
@MunicipeGenero int,
@MunicipeEstadoCivil int,
@MunicipeTelefone1 int,
@MunicipeTelefone2 int,
@MunicipeEmail varchar(50),
@MunicipeMorada INT,
@MunicipeEstado bit,
@MunicipeUsuarioId INT
AS
BEGIN
    UPDATE dbo.TB_Municipes SET
MunicipeNomeCompleto=@MunicipeNomeCompleto,
MunicipeDataNascimento=@MunicipeDataNascimento,
MunicipeNDocIdent=@MunicipeNDocIdent,
MunicipeDocDataEmissao=@MunicipeDocDataEmissao,
MunicipeDocDataValidade=@MunicipeDocDataValidade,
MunicipeNIF=@MunicipeNIF,
MunicipeGenero=@MunicipeGenero,
MunicipeEstadoCivil=@MunicipeEstadoCivil,
MunicipeTelefone1=@MunicipeTelefone1,
MunicipeTelefone2=@MunicipeTelefone2,
MunicipeEmail=@MunicipeEmail,
MunicipeMorada=@MunicipeMorada,
MunicipeEstado=@MunicipeEstado,
MunicipeUsuarioId=@MunicipeUsuarioId
WHERE MunicipeNM=@MunicipeNM
END
