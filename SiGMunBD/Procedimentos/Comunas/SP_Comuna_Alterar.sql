CREATE PROCEDURE [dbo].[SP_Comuna_Alterar]
@ComunaId INT,	
@ComunaNome VARCHAR(50),	
@ComunaMunicipioId INT,		
@ComunaUsuarioId INT
AS
BEGIN
    UPDATE dbo.TB_Comunas
    SET ComunaNome=@ComunaNome,	
        ComunaMunicipioId=@ComunaMunicipioId,	
        ComunaUsuarioId=@ComunaUsuarioId
        WHERE @ComunaId=@ComunaId
END