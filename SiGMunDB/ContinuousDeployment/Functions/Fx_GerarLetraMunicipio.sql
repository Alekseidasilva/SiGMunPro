CREATE FUNCTION [dbo].[Fx_GerarLetraMunicipio]
(
	@IdMunicipio int	
)
RETURNS VARCHAR(20)
AS
BEGIN
DECLARE @@Letra VARCHAR(20)
SELECT 
  @@Letra=CASE 
    WHEN @IdMunicipio=113 THEN 'A'
    WHEN @IdMunicipio=114 THEN 'B'
    WHEN @IdMunicipio=115 THEN 'C'
    WHEN @IdMunicipio=116 THEN 'D'
    WHEN @IdMunicipio=117 THEN 'E'
    WHEN @IdMunicipio=118 THEN 'F'
    WHEN @IdMunicipio=119 THEN 'G'
    WHEN @IdMunicipio=120 THEN 'H'
    WHEN @IdMunicipio=121 THEN 'I'
    WHEN @IdMunicipio=122 THEN 'J'
    WHEN @IdMunicipio=123 THEN 'K'
    WHEN @IdMunicipio=124 THEN 'L'
    WHEN @IdMunicipio=125 THEN 'M'
    WHEN @IdMunicipio=126 THEN 'N'  	
END
	RETURN @@Letra
END