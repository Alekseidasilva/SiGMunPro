CREATE PROCEDURE [dbo].[SP_Perfil_Inserir]	
	
    @Name NVARCHAR(256),
    @Estado bit,
    @DataCadastro date
AS

BEGIN
    INSERT dbo.TB_Perfil(Name,Estado,DataCadastro)
    VALUES (@Name,@Estado,@DataCadastro)
END
