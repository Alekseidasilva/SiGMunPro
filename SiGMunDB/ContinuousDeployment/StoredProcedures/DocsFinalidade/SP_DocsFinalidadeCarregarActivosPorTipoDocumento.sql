CREATE PROCEDURE [dbo].[SP_DocsFinalidadeCarregarActivosPorTipoDocumento]
@TipoDocumentoId INT
  AS
  BEGIN
  	SELECT
  tdf.FinalidadeId,
  tdf.FinalidadeNome, 
  tdf.FinalidadeTipoDocumento,
  tdf.FinalidadeValor,
  tdf.FinalidadeEstado, 
  tdf.IdCadastrador 
  FROM TB_DocsFinalidades tdf
  JOIN TB_TiposDocumentos ttd ON tdf.FinalidadeTipoDocumento = ttd.DocumentoId
  WHERE ttd.DocumentoId=@TipoDocumentoId AND tdf.FinalidadeEstado=1

  END
