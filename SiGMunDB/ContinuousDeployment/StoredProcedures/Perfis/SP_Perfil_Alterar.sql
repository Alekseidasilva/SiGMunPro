CREATE PROCEDURE [dbo].[SP_Perfil_Alterar]
	@Id int ,
	@Name NVARCHAR(256),
	@Estado BIT,
	@DataCadastro date
AS
BEGIN
    UPDATE dbo.TB_Perfil 
	SET 
	name=@Name,
	Estado=@Estado,
	DataCadastro=@DataCadastro
	WHERE 
	Id=@Id
	select @Name as retorno
END
