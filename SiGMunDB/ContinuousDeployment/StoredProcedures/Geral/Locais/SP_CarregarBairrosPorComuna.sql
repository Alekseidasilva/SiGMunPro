﻿CREATE PROCEDURE [dbo].[SP_CarregarBairrosPorComuna]
	@id int
AS
BEGIN
	SELECT tb.BairroId,tb.BairroNome,tb.BairroComunaId FROM TB_Bairros tb WHERE tb.BairroComunaId=@Id ORDER BY tb.BairroNome ASC 
END
