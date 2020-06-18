CREATE PROCEDURE [dbo].[SP_Banco_Alterar]
	@BancoId int,
	@BancoNome VARCHAR(50),
	@BancoSigla VARCHAR(10),
	@BancoEstado bit,
	@BancoUsuarioid int
AS
BEGIN
    UPDATE dbo.TB_Bancos SET
    
	BancoNome=@BancoNome,
	BancoSigla=@BancoSigla,
	BancoEstado=@BancoEstado,
	BancoUsuarioid=@BancoUsuarioid
	WHERE
	BancoId =@BancoId
END
