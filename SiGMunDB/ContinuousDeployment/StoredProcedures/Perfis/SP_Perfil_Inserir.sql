CREATE PROCEDURE dbo.SP_Perfil_Inserir	
    @Name NVARCHAR(256),
    @Estado bit,
    @DataCadastro date,
	@Idcadastrador int
AS

BEGIN
    INSERT dbo.TB_Perfil(Name,Estado,DataCadastro,Idcadastrador)
    VALUES (@Name,@Estado,@DataCadastro,@Idcadastrador)
    SELECT @Name as retorno
END
