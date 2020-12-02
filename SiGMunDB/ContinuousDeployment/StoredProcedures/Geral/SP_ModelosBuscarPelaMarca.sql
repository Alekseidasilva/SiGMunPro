CREATE PROCEDURE [dbo].[SP_ModelosBuscarPelaMarca]
	@MarcaId int	
AS
begin 
SELECT tm.ModeloId, tm.ModeloDescricao, tm.ModeloMarcaId FROM TB_Modelos tm WHERE tm.ModeloMarcaId=@MarcaId
End
