CREATE PROCEDURE [dbo].[SP_Municipe_Inserir]
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
DECLARE @@IdAuto INT
SELECT @@IdAuto=MAX(MunicipeId) FROM dbo.TB_Municipes
IF @@IdAuto IS NULL
BEGIN
    SET @@IdAuto=0
    set @@IdAuto=@@IdAuto+1
END
ELSE
BEGIN
SET @@IdAuto=@@IdAuto+1
END
BEGIN
    INSERT dbo.TB_Municipes
    (
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
)
    VALUES
(
@@IdAuto,
3985451,
@MunicipeNomeCompleto,
@MunicipeDataNascimento,
@MunicipeNDocIdent,
@MunicipeDocDataEmissao,
@MunicipeDocDataValidade,
@MunicipeNIF,
@MunicipeGenero,
@MunicipeEstadoCivil,
@MunicipeTelefone1,
@MunicipeTelefone2,
@MunicipeEmail,
@MunicipeMorada,
@MunicipeEstado,
@MunicipeUsuarioId
)
SELECT @@IdAuto AS retorno
END






