CREATE PROCEDURE [dbo].[SP_DocsFinalidades_Alterar]
@FinalidadeId INT,
@FinalidadeNome VARCHAR(max),
@FinalidadeEstado BIT,
@FinalidadeUsuarioId int
AS
BEGIN
    UPDATE dbo.TB_DocsFinalidades SET
    FinalidadeNome=@FinalidadeNome,
    FinalidadeEstado=@FinalidadeEstado,
    FinalidadeUsuarioId=@FinalidadeUsuarioId
    WHERE
    FinalidadeId=@FinalidadeId
END