CREATE PROC SP_TiposDeDocumentosBuscarNomePeloId
  @id INT
  AS
  BEGIN
  	SELECT 
      ttd.DocumentoNome  
    FROM TB_TiposDocumentos ttd
WHERE ttd.DocumentoId=@id
  END
