CREATE PROCEDURE [dbo].[SP_Bairro_CarregarTodos]
AS
BEGIN
    SELECT
    BairroId,
    BairroComunaId,
    BairroNome
    
    from dbo.TB_Bairros
END
