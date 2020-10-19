CREATE PROCEDURE dbo.SP_CarregarEstadoCivil
AS
BEGIN
    SELECT EstadoCivilId, EstadoCivilNome FROM dbo.TB_EstadoCivil
END

