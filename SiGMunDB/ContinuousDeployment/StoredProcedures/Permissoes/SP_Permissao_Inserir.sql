CREATE PROCEDURE [dbo].[SP_Permissao_Inserir]
	@UserId int,
	@RoleId int
AS
	BEGIN
	    INSERT dbo.TB_Permissoes (UserId, RoleId)  VALUES (@UserId, @RoleId)
	END
