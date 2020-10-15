CREATE PROCEDURE [dbo].[SP_DocsFinalidades_Alterar]
@FinalidadeId INT,
@FinalidadeNome VARCHAR(max),
@FinalidadeEstado BIT,
@IdCadastrador int
AS
BEGIN
    UPDATE dbo.TB_DocsFinalidades SET
    FinalidadeNome=@FinalidadeNome,
    FinalidadeEstado=@FinalidadeEstado,
    IdCadastrador=@IdCadastrador
    WHERE
    FinalidadeId=@FinalidadeId
END