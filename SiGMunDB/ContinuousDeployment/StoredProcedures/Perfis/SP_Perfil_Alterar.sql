CREATE PROCEDURE dbo.SP_Perfil_Alterar
	@Id int ,
	@Name NVARCHAR(256),
	@Estado BIT	
AS
BEGIN
    UPDATE dbo.TB_Perfil 
	SET 
	Name=@Name,
	Estado=@Estado
	
	WHERE 
	Id=@Id
	select @Name as retorno
END
