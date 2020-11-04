CREATE PROCEDURE [dbo].[SP_MoradaCarregarNomesLocais]
	@RuaId int 
	AS
	BEGIN
    	SELECT tr.RuaNome,tb.BairroNome,tc.ComunaNome,tm.MunicipioNome FROM TB_Ruas tr
  JOIN TB_Bairros tb ON tr.RuaBairroId = tb.BairroId
  JOIN TB_Comunas tc ON tb.BairroComunaId = tc.ComunaId
  JOIN TB_Municipios tm ON tc.ComunaMunicipioId = tm.MunicipioId
  WHERE tr.RuaId=@RuaId
    END

