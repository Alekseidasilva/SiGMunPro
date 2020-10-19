CREATE PROCEDURE dbo.SP_CarregarEstadoCivilPorId
@Id int
	AS
BEGIN
  SELECT  EstadoCivilNome FROM dbo.TB_EstadoCivil
	WHERE EstadoCivilId=@Id
END