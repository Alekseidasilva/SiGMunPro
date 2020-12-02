CREATE PROCEDURE [dbo].[SP_MarcasCarregarTodas]
as
begin 
SELECT tm.MarcaId,tm.Marcadescricao FROM TB_Marcas tm
end