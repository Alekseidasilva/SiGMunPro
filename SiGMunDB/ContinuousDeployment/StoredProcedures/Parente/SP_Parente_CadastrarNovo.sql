﻿CREATE PROCEDURE [dbo].[SP_Parente_CadastrarNovo]
@Titular varchar(20),
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
---------------Parente---------------------
@MunicipeGrauParentescoId int,
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
@MunicipeEmail, 1, GETDATE(), @Titular, @MunicipeGrauParentescoId, @MunicipeFoto, @IdCadastrador);
END
	BEGIN
    	INSERT INTO dbo.TB_Moradas 
        (MoradaMunicuipeNM, MoradaCasaNumero,  MoradaZona, MoradaRuaId, MoradaDataCadastro, MoradaEstado, IdCadastrador)
	VALUES (@@NM, @MoradaCasaNumero, @MoradaZona, @MoradaRuaId, GETDATE(), 1, @IdCadastrador);
    END  
---------------------------------------Verificação do Grau Parentesco-----------------------------------------------------
--if @MunicipeGrauParentescoId=1
--begin
--INSERT TB_Municipes 
--(MunicipeId,MunicipeNM, MunicipeNomeCompleto, MunicipeDataNascimento, MunicipeNDocIdent,
--MunicipeTipoDocIdentificacao, MunicipeDocDataEmissao, MunicipeDocDataValidade,
--MunicipeNIF, MunicipeGenero, MunicipeEstadoCivil, MunicipeTelefone1, MunicipeTelefone2,
--MunicipeEmail, MunicipeEstado, MunicipeDataCadastro, MunicipeParenteNM, MunicipeGrauParentescoId,
--MunicipeFoto, IdCadastrador
--)	VALUES 
--(@@IdAuto,@@NM, @MunicipeNomeCompleto, @MunicipeDataNascimento, @MunicipeNDocIdent,
--@MunicipeTipoDocIdentificacao, @MunicipeDocDataEmissao, @MunicipeDocDataValidade,
--@MunicipeNIF, @MunicipeGenero, @MunicipeEstadoCivil, @MunicipeTelefone1, @MunicipeTelefone2,
--@MunicipeEmail, 1, GETDATE(), @Titular, @MunicipeGrauParentescoId, @MunicipeFoto, @IdCadastrador);
--END
--	BEGIN
--    	INSERT INTO dbo.TB_Moradas 
--        (MoradaMunicuipeNM, MoradaCasaNumero,  MoradaZona, MoradaRuaId, MoradaDataCadastro, MoradaEstado, IdCadastrador)
--	VALUES (@@NM, @MoradaCasaNumero, @MoradaZona, @MoradaRuaId, GETDATE(), 1, @IdCadastrador);
--    END  
--end




 SELECT @@NM AS retorno
 IF @@NM IS NOT NULL BEGIN  
    	COMMIT
    END
    ELSE
    ROLLBACK
END


--(1,'AVÓ(MATERNO)'),
--(2,'AVÓ(PATERNO)'),
--(3,'MÃE'),
--(4,'PAI'),
--(5,'FILHO(A)'),
--(7,'NETO(A)'),
--(8,'BISNETO(A)'),
--(9,'TIO(A)'),
--(10,'PRIMO(A)'),
--(11,'IRMÃO(Ã)'),
--(12,'ESPOSO(A)'),
--(13,'SOGRO(A)'),
--(14,'CUNHADO(A)'),
--(15,'CONCUNHADO(A)'),
--(16,'PRÓPRIO')