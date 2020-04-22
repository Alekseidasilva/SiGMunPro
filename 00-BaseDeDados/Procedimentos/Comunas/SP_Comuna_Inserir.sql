CREATE PROCEDURE [dbo].[SP_Comuna_Inserir]
@ComunaNome VARCHAR(50),	
@ComunaMunicipioId INT,
@ComunaUsuarioId int
AS
DECLARE @@IdAuto int
SELECT @@IdAuto=MAX(ComunaId) FROM dbo.TB_Comunas
IF @@IdAuto IS NULL
BEGIN
    SET @@IdAuto=0
    set @@IdAuto=@@IdAuto+1
END
ELSE
BEGIN
SET @@IdAuto=@@IdAuto+1
END
BEGIN
    INSERT dbo.TB_Comunas
    (
    ComunaId,	
	ComunaNome,	
	ComunaMunicipioId,	
	ComunaUsuarioId
    )
    VALUES
    (
    @@IdAuto,	
	@ComunaNome,	
	@ComunaMunicipioId,	
	@ComunaUsuarioId
    )
END
