CREATE PROCEDURE SP_Municipe_Inserir
@MunicipeNomeCompleto VARCHAR(200),
@MunicipeDataNascimento DATE,
@MunicipeNDocIdent VARCHAR(50),
@MunicipeTipoDocIdentificacao INT,
@MunicipeDocDataEmissao DATE,
@MunicipeDocDataValidade DATE,
@MunicipeNIF VARCHAR,
@MunicipeGenero INT,
@MunicipeEstadoCivil int,
@MunicipeTelefone1 VARCHAR(15),
@MunicipeTelefone2 VARCHAR(15),
@MunicipeEmail VARCHAR(50),
@MunicipeFoto VARCHAR(MAX),

--------------Morada------------------------
@MoradaCasaNumero VARCHAR(20),
@MoradaZona varchar(20),
@MoradaRuaId int,

---------------Usuário---------------------
@IdCadastrador int 
AS
BEGIN TRANSACTION   

DECLARE @@zeros VARCHAR(20)
DECLARE @@NM VARCHAR(20)
DECLARE @@IdAuto INT
DECLARE @@IdMunicipio INT
DECLARE @@IdComuna INT
DECLARE @@LetraMunicipio CHAR
DECLARE @@LetraComuna VARCHAR(2)
  BEGIN     
      SELECT @@IdComuna=tc.ComunaId, @@IdMunicipio=tm.MunicipioId FROM TB_Ruas tr
             JOIN TB_Bairros tb ON tb.BairroId=tr.RuaBairroId
             JOIN TB_Comunas tc ON tb.BairroComunaId = tc.ComunaId
             JOIN TB_Municipios tm ON tc.ComunaMunicipioId = tm.MunicipioId
              WHERE tr.RuaId=@MoradaRuaId

SELECT @@Idauto=MAX(MunicipeId) FROM dbo.TB_Municipes
IF @@IdAuto IS NULL
BEGIN
    SET @@IdAuto=0
    set  @@IdAuto=@@IdAuto+1
END
ELSE
BEGIN
SET @@IdAuto=@@IdAuto+1
END


 

SELECT @@zeros=dbo.Fx_GerarZeros(@@IdAuto)
SELECT @@LetraMunicipio=dbo.Fx_GerarLetraMunicipio(@@IdMunicipio)
SELECT @@LetraComuna=dbo.Fx_GerarLetraComuna(@@IdComuna)
BEGIN
   SELECT @@NM =CONCAT(@@LetraMunicipio,@@LetraComuna,@@zeros,@@IdAuto)
END
END
BEGIN
BEGIN
	INSERT TB_Municipes 
(MunicipeId,MunicipeNM, MunicipeNomeCompleto, MunicipeDataNascimento, MunicipeNDocIdent,
MunicipeTipoDocIdentificacao, MunicipeDocDataEmissao, MunicipeDocDataValidade,
MunicipeNIF, MunicipeGenero, MunicipeEstadoCivil, MunicipeTelefone1, MunicipeTelefone2,
MunicipeEmail, MunicipeEstado, MunicipeDataCadastro, MunicipeParenteNM, MunicipeGrauParentescoId,
MunicipeFoto, IdCadastrador
)	VALUES 
(@@IdAuto,@@NM, @MunicipeNomeCompleto, @MunicipeDataNascimento, @MunicipeNDocIdent,
@MunicipeTipoDocIdentificacao, @MunicipeDocDataEmissao, @MunicipeDocDataValidade,
@MunicipeNIF, @MunicipeGenero, @MunicipeEstadoCivil, @MunicipeTelefone1, @MunicipeTelefone2,
@MunicipeEmail, 1, GETDATE(), @@NM, 16, @MunicipeFoto, @IdCadastrador);
END
	BEGIN
    	INSERT INTO dbo.TB_Moradas 
        (MoradaMunicuipeNM, MoradaCasaNumero,  MoradaZona, MoradaRuaId, MoradaDataCadastro, MoradaEstado, IdCadastrador)
	VALUES (@@NM, @MoradaCasaNumero, @MoradaZona, @MoradaRuaId, GETDATE(), 1, @IdCadastrador);
    END    
 SELECT @@NM AS retorno
 IF @@NM IS NOT NULL BEGIN  
    	COMMIT
    END
    ELSE
    ROLLBACK
END