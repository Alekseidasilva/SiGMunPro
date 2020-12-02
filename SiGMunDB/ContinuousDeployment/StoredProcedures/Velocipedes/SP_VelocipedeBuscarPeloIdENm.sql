CREATE PROCEDURE [dbo].[SP_VelocipedeBuscarPeloIdENm]
	@id int,
	@Nm varchar(20)
AS
	BEGIN
  	SELECT 
      VelocipedeMunicipeNM,
VelocipedeNLivrete,
VelocipedeNChapa,
VelocipedeMarca,
VelocipeModelo,
VelocipedeNQuadro,
VelocipedeCom_S_Motor,
VelocipedeNMotor,
VelocipedeDestinadoServico,
VelocipedeCilindragem,
VelocipedeCor,
VelocipedeEstado,
VelocipeDataCadastro,
IdCadastrador
      FROM TB_Velocipedes
      WHERE VelocipedeId=@id AND VelocipedeMunicipeNM=@Nm
  END
