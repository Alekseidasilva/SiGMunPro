CREATE PROCEDURE [dbo].[SP_CarregarGrauParentesco]
as
begin
SELECT tgp.GrauParentescoId,tgp.GrauParentescoIdNome FROM TB_GrauParentesco tgp
end
