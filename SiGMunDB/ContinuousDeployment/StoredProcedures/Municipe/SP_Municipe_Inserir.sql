CREATE PROCEDURE [dbo].[SP_Municipe_Inserir]
@MunicipeNomeCompleto VARCHAR(100),
@MunicipeDataNascimento date,
@MunicipeNDocIdent VARCHAR(20),
@MunicipeTipoDocIdentificacao int,
@MunicipeDocDataEmissao date,
@MunicipeDocDataValidade date,
@MunicipeNIF VARCHAR(20),
@MunicipeGenero int,
@MunicipeEstadoCivil int,
@MunicipeTelefone1 VARCHAR(15),
@MunicipeTelefone2 VARCHAR(15),
@MunicipeEmail VARCHAR(100),
@MunicipeEstado bit,
@MunicipeDataCadastro date,
@MunicipeParenteNM bigint,
@MunicipeGrauParentescoId int,
@MunicipeFoto VARCHAR(max),
@IdCadastrador int
	
AS
DECLARE @@IdAuto INT
SELECT @@IdAuto=3985451415
--SELECT @@IdAuto=MAX(MunicipeId) FROM dbo.TB_Municipes
--IF @@IdAuto IS NULL
--BEGIN
--    SET @@IdAuto=0
--    set @@IdAuto=@@IdAuto+1
--END
--ELSE
--BEGIN
--SET @@IdAuto=@@IdAuto+1
--END
BEGIN
    INSERT dbo.TB_Municipes
    (
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
MunicipeEstado,
MunicipeDataCadastro,
MunicipeParenteNM,
MunicipeGrauParentescoId,
MunicipeFoto,
IdCadastrador	
) VALUES(

@@IdAuto,
@MunicipeNomeCompleto,
@MunicipeDataNascimento,
@MunicipeNDocIdent,
@MunicipeTipoDocIdentificacao,
@MunicipeDocDataEmissao,
@MunicipeDocDataValidade,
@MunicipeNIF,
@MunicipeGenero,
@MunicipeEstadoCivil,
@MunicipeTelefone1,
@MunicipeTelefone2,
@MunicipeEmail,
@MunicipeEstado,
@MunicipeDataCadastro,
@MunicipeParenteNM,
@MunicipeGrauParentescoId,
@MunicipeFoto,
@IdCadastrador
)
SELECT @@IdAuto AS retorno
END






