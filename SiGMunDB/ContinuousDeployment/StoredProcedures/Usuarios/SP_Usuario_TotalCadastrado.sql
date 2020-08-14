CREATE PROCEDURE [dbo].[SP_Usuario_TotalCadastrado]
AS
BEGIN
    SELECT COUNT(Id) qtde FROM dbo.TB_Usuarios
END


	

