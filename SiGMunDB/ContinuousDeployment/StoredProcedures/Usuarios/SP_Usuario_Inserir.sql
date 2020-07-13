CREATE PROCEDURE dbo.SP_Usuario_Inserir
@UsuNomeCompleto varchar(100),
@UsuEmail varchar(200),
@UsuSenha VARCHAR(200),
@UsuPerfilId INT,
@UsuDataCadastro date,
@UsuIdUsuario INt,
@UsuEstado BIT 
AS
DECLARE @@IdAuto int
SELECT @@IdAuto=MAX(UsuId) FROM dbo.TB_Usuarios
IF @@IdAuto IS NULL
BEGIN
    SET @@IdAuto=0
    set @@IdAuto=@@IdAuto+1
END
else
begin
SET @@IdAuto=@@IdAuto+1
end


BEGIN

    INSERT INTO TB_Usuarios(UsuId,UsuNomeCompleto,UsuEmail,UsuSenha,UsuPerfilId,UsuDataCadastro,UsuIdUsuario,UsuEstado)
    VALUES (@@IdAuto,@UsuNomeCompleto,@UsuEmail, @UsuSenha,@UsuPerfilId,@UsuDataCadastro,@UsuIdUsuario,@UsuEstado)

    SELECT 'True' AS retorno
END