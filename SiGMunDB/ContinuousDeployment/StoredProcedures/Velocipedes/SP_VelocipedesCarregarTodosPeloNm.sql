CREATE PROCEDURE [dbo].[SP_VelocipedesCarregarTodosPeloNm]
@MunicipeNm varchar(20)
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
              tv.VelocipedeMunicipeNM=@MunicipeNm
End