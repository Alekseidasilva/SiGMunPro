CREATE PROCEDURE [dbo].[SP_VelocipedesCarregarPeloId]
	@Id int
as
begin 
SELECT
  tv.VelocipedeId,
  tv.VelocipedeMunicipeNM,
  tv.VelocipedeNLivrete,
  tv.VelocipedeNChapa,
  tv.VelocipedeMarca,
  tv.VelocipeModelo,
  tv.VelocipedeNQuadro,
  tv.VelocipedeCom_S_Motor,
  tv.VelocipedeNMotor,
  tv.VelocipedeDestinadoServico,
  tv.VelocipedeCilindragem,
  tv.VelocipedeCor,
  tv.VelocipedeEstado,
  tv.VelocipeDataCadastro,
  tv.IdCadastrador
	 FROM TB_Velocipedes tv
		  WHERE
               tv.VelocipedeId=@id
End