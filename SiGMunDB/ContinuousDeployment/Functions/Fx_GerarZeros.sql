CREATE FUNCTION [dbo].[Fx_GerarZeros]
(
	@Numero int	
)
RETURNS VARCHAR(20)
AS
BEGIN
DECLARE @@zeros VARCHAR(20)
SELECT 
  @@zeros=CASE 
    WHEN @Numero >0 AND @Numero < 10 THEN '0000'             
    WHEN @Numero >10 AND @Numero < 100 THEN '000'         
    WHEN @Numero >100 AND @Numero < 1000 THEN '00'
    WHEN @Numero >1000 AND @Numero < 10000 THEN '0'
    WHEN @Numero >10000  THEN ''
    
END
	RETURN @@zeros
END
--------------<0000 
--1--         10-000
--2--        100--00
--3--      1.000---0
--4--     10.000




--AABA10000
