CREATE PROCEDURE [dbo].[SP_VeiculosTotalCadastrados]
AS
  BEGIN
  	SELECT COUNT(tv.VelocipedeId) Qtde FROM TB_Velocipedes tv
  END
