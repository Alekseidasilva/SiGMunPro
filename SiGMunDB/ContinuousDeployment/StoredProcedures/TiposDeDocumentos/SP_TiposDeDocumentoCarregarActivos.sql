CREATE PROCEDURE [dbo].[SP_TiposDeDocumentoCarregarActivos]
AS
begin
SELECT 
  ttd.DocumentoId,
  ttd.DocumentoNome,
  ttd.DocumentoEstado,
  ttd.DocumentoUsuarioId 
  FROM TB_TiposDocumentos ttd 
  WHERE ttd.DocumentoEstado=1
end
