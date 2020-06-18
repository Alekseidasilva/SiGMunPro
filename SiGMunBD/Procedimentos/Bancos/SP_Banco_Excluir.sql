CREATE PROCEDURE [dbo].[SP_Banco_Excluir]
	@BancoId int
	
AS
BEGIN
    DELETE FROM dbo.TB_Bancos WHERE BancoId=@BancoId
END
