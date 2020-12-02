CREATE PROC SP_FormasDePagamentoBuscarNomePeloId
  @id INT
  AS
  BEGIN
  	SELECT 
      tfp.FormaPagamentoNome  
    FROM TB_FormasPagamento tfp
WHERE tfp.FormaPagamentoId=@id
  END
