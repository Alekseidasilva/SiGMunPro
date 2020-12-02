CREATE PROCEDURE [dbo].[SP_Municipe_Alterar]
@MunicipeNm varchar(20),
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
@MunicipeFoto VARCHAR(max)
AS
BEGIN
    UPDATE dbo.TB_Municipes SET
	MunicipeNomeCompleto=@MunicipeNomeCompleto,
MunicipeDataNascimento=@MunicipeDataNascimento,
MunicipeNDocIdent=@MunicipeNDocIdent,
MunicipeTipoDocIdentificacao=@MunicipeTipoDocIdentificacao,
MunicipeDocDataEmissao=@MunicipeDocDataEmissao,
MunicipeDocDataValidade=@MunicipeDocDataValidade,
MunicipeNIF=@MunicipeNIF,
MunicipeGenero=@MunicipeGenero,
MunicipeEstadoCivil=@MunicipeEstadoCivil, 
MunicipeTelefone1=@MunicipeTelefone1,
MunicipeTelefone2=@MunicipeTelefone2, 
MunicipeEmail=@MunicipeEmail,
MunicipeEstado=@MunicipeEstado,
MunicipeFoto=@MunicipeFoto
WHERE MunicipeNm=@MunicipeNm
select @MunicipeNm as retorno
END
