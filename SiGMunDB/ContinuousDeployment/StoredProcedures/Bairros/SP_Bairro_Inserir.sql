CREATE PROCEDURE [dbo].[SP_Bairro_Inserir]

@BairroComunaId INT,
@BairroNome VARCHAR(50)

AS
DECLARE @@IdAuto int
SELECT @@IdAuto=MAX(BairroId) FROM dbo.TB_Bairros
IF @@IdAuto IS NULL
BEGIN
    SET @@IdAuto=0
    set  @@IdAuto=@@IdAuto+1
END
ELSE
BEGIN
SET @@IdAuto=@@IdAuto+1
END
BEGIN
    INSERT dbo.TB_Bairros
    (
    BairroId,
    BairroComunaId,
    BairroNome
      
    )
    VALUES
    (
    @@IdAuto,
    @BairroComunaId,
    @BairroNome
   
    )
END
