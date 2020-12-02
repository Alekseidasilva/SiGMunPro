CREATE PROC SP_FinalidadesBuscarNomePeloId
  @id INT
  AS
  BEGIN
  	SELECT   
  tdf.FinalidadeNome   FROM TB_DocsFinalidades tdf
WHERE tdf.FinalidadeId=@id
  END
