CREATE PROCEDURE dbo.SP_Bairro_Alterar
@BairroId int,
@BairroComunaId int,
@BairroNome VARCHAR(50),
@BairroUsuarioId INT,
@BairroDataCadastro DATE,
@BairroEstado bit
AS
	BEGIN
	    UPDATE dbo.TB_Bairros
		SET  
    BairroComunaId=@BairroComunaId,
    BairroNome=@BairroNome
    
    WHERE BairroId=@BairroId
	END
