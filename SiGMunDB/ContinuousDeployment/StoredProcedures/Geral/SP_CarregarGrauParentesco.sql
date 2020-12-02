CREATE PROCEDURE [dbo].[SP_CarregarGrauParentesco]
as
begin
SELECT tgp.GrauParentescoId,tgp.GrauParentescoIdNome FROM TB_GrauParentesco tgp where tgp.GrauParentescoId<>16
end
