CREATE PROCEDURE [dbo].[SP_Banco_Inserir]
	
	@BancoNome VARCHAR(50),
	@BancoSigla VARCHAR(10),
	@BancoEstado bit,
	@BancoUsuarioid int
AS
DECLARE @@IdAuto int
SELECT @@IdAuto=MAX(BancoId) FROM dbo.TB_Bancos
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
   
    INSERT INTO dbo.TB_Bancos
    (
	BancoId,
	BancoNome,
	BancoSigla,
	BancoEstado,
	BancoUsuarioid
)
VALUES
(
@@IdAuto,
@BancoNome,
@BancoSigla,
@BancoEstado,
@BancoUsuarioid
)
END
