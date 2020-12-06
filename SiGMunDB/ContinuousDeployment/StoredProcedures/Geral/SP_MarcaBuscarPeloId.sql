CREATE PROCEDURE [dbo].[SP_MarcaBuscarPeloId]
@MarcaId int
as
begin 
select Marcadescricao from dbo.TB_Marcas where MarcaId=@MarcaId
end
