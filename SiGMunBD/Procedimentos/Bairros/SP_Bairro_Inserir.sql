CREATE PROCEDURE [dbo].[SP_Bairro_Inserir]

@BairroComunaId INT,
@BairroNome VARCHAR(50),
@BairroUsuarioId INT,
@BairroDataCadastro DATE,
@BairroEstado BIT
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
    BairroNome,
    BairroUsuarioId,
    BairroDataCadastro,
    BairroEstado    
    )
    VALUES
    (
    @@IdAuto,
    @BairroComunaId,
    @BairroNome,
    @BairroUsuarioId,
    @BairroDataCadastro,
    @BairroEstado
    )
END
