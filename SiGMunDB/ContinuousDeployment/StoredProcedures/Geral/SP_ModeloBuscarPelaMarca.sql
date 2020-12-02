CREATE PROCEDURE [dbo].[SP_ModeloBuscarPelaMarca]
	@MarcaId int	
AS
begin 
SELECT  tm.ModeloDescricao FROM TB_Modelos tm WHERE tm.ModeloMarcaId=@MarcaId
End
