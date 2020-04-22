CREATE PROCEDURE [dbo].[SP_Bairro_CarregarTodos]
AS
BEGIN
    SELECT
    BairroId,
    BairroComunaId,
    BairroNome,
    BairroUsuarioId,
    BairroDataCadastro,
    BairroEstado
    from dbo.TB_Bairros
END
