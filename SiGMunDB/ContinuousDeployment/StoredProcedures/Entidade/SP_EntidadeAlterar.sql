CREATE PROCEDURE [dbo].[SP_EntidadeAlterar]
@EntidadeId INt ,
@EntidadeRuaId INT,
@EntidadeCasaN VARCHAR(20)
  AS
  BEGIN
  	UPDATE dbo.TB_Entidade 
SET EntidadeRuaId = @EntidadeRuaId
   ,EntidadeCasaN = @EntidadeCasaN
WHERE EntidadeId = @EntidadeId;
  END
