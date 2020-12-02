CREATE PROCEDURE [dbo].[SP_MarcaBuscarPeloId]
@MarcaId int
as
begin 
select MarcaDescricao from dbo.TB_Marcas where MarcaId=@MarcaId
end
