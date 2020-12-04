CREATE PROC SP_MunicipeBuscarPeloNMBarcodeQr
@Txt VARCHAR(MAX)
  AS
  BEGIN
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
  FROM TB_Municipes tm
  WHERE tm.MunicipeNM=@Txt
  END
